CREATE OR REPLACE FUNCTION public.trg_intervention_set_ref_patrimoine()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    v_id        bigint;
    v_type      text;
BEGIN
    -- sécurité minimale
    IF NEW.geom IS NULL THEN
        RAISE EXCEPTION 'La géométrie de intervention est NULL, impossible de déterminer la référence patrimoine';
    END IF;
    /*
      Recherche avec priorité métier :
      1 = noeud
      2 = canalisation
      3 = emprise

      On filtre d'abord à 0.50 m avec ST_DWithin,
      puis on départage par priorité, puis par distance,
      puis par identifiant pour garantir un résultat déterministe.
    */
    SELECT q.id_obj, q.type_obj, q.dist_m
    INTO v_id, v_type
    FROM (
        SELECT
            n.id_noeud AS id_obj,
            'noeud'::text AS type_obj,
            1 AS priorite,
            ST_Distance(NEW.geom, n.geom) AS dist_m
        FROM stareau_commun.noeud_reseau n
        WHERE ST_DWithin(NEW.geom, n.geom, 0.50)
        UNION ALL
        SELECT
            c.id_canalisation AS id_obj,
            'canalisation'::text AS type_obj,
            2 AS priorite,
            ST_Distance(NEW.geom, c.geom) AS dist_m
        FROM stareau_commun.canalisation c
        WHERE ST_DWithin(NEW.geom, c.geom, 0.50)
        UNION ALL
        SELECT
            e.id_emprise AS id_obj,
            'emprise'::text AS type_obj,
            3 AS priorite,
            ST_Distance(NEW.geom, e.geom) AS dist_m
        FROM stareau_commun.emprise e
        WHERE ST_DWithin(NEW.geom, e.geom, 0.50)
    ) AS q
    ORDER BY q.priorite, q.dist_m, q.id_obj
    LIMIT 1;
    -- aucun objet trouvé dans le rayon de 50 cm
    IF v_id IS NULL THEN
        RAISE EXCEPTION
            'Aucun objet trouvé à moins de 0,50 m du point intervention'
            USING ERRCODE = 'P0001',
                  HINT = 'Vérifier la position du point saisi ou la tolérance spatiale.';
    END IF;
    -- alimentation des champs de la table inter
    NEW.ref_patrimoine := v_id;
    NEW.type_patrimoine := v_type;
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS biu_inter_set_ref_patrimoine ON intervention;

CREATE TRIGGER biu_inter_set_ref_patrimoine
BEFORE INSERT OR UPDATE OF geom
ON intervention
FOR EACH ROW
EXECUTE FUNCTION public.trg_inter_set_ref_patrimoine();