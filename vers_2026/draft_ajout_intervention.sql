
---creation des tables interventions point ligne surface - suite travail groupe exploitation aep ass
CREATE TABLE stareau_ass.ass_intervention_point (
	id_ass_intervention_point text DEFAULT gen_random_uuid() NOT NULL, -- identifiant métier
	nature_intervention text NOT NULL, -- nature de l'intervention
	type_patrimoine text NOT NULL -- type de patrimoine associé,
	intervention_programmee text NOT NULL, -- intervention programée
	type_intervention text NOT NULL, -- *type d'intervention*
	date_debut_intervention timestamp DEFAULT now() NOT NULL -- début intervention,
	date_fin_intervention timestamp NULL, -- fin intervention
	description_intervention text NOT NULL, -- description de l'intervention
	intervenant text NULL -- *intervenant*,
	duree_intervention float4 NULL, -- durée intervention (en h)
	statut_intervention text NOT NULL, -- *statut de l'intervention*
	geom public.geometry(point, 2154) NOT NULL,
	ref_canalisation text NULL, -- référence à la conduite de rattachement(id_canalisation)
	ref_noeud_reseau text NULL, -- référence à l'ouvrage de rattachement(id_noeud_reseau)
	ref_emprise text NULL -- référence à l'identifiant d'ouvrage surfacique (id_emprise),
	CONSTRAINT ass_intervention_point_pkey PRIMARY KEY (id_ass_intervention_point)
);

-- Column comments

COMMENT ON COLUMN stareau_ass.ass_intervention_point.id_ass_intervention_point IS 'identifiant métier';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.nature_intervention IS 'nature de l''intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.type_patrimoine IS 'type de patrimoine associé';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.intervention_programmee IS 'intervention programée';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.type_intervention IS '*type d''intervention*';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.date_debut_intervention IS 'début intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.date_fin_intervention IS 'fin intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.description_intervention IS 'description de l''intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.intervenant IS '*intervenant*';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.duree_intervention IS 'durée intervention (en h)';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.statut_intervention IS '*statut de l''intervention*';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.ref_canalisation IS 'référence à la conduite de rattachement(id_canalisation)';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.ref_noeud_reseau IS 'référence à l''ouvrage de rattachement(id_noeud_reseau)';
COMMENT ON COLUMN stareau_ass.ass_intervention_point.ref_emprise IS 'référence à l''identifiant d''ouvrage surfacique (id_emprise)';


---ligne
CREATE TABLE stareau_ass.ass_intervention_ligne (
	id_ass_intervention_ligne text DEFAULT gen_random_uuid() NOT NULL, -- identifiant métier
	nature_intervention text NOT NULL, -- nature de l'intervention
	type_patrimoine text NOT NULL -- type de patrimoine associé,
	intervention_programmee text NOT NULL, -- intervention programée
	type_intervention text NOT NULL, -- *type d'intervention*
	date_debut_intervention timestamp DEFAULT now() NOT NULL -- début intervention,
	date_fin_intervention timestamp NULL, -- fin intervention
	description_intervention text NOT NULL, -- description de l'intervention
	intervenant text NULL -- *intervenant*,
	duree_intervention float4 NULL, -- durée intervention (en h)
	statut_intervention text NOT NULL, -- *statut de l'intervention*
	geom public.geometry(linestring, 2154) NOT NULL,
	ref_canalisation text NULL, -- référence à la conduite de rattachement(id_canalisation)
	ref_noeud_reseau text NULL, -- référence à l'ouvrage de rattachement(id_noeud_reseau)
	ref_emprise text NULL -- référence à l'identifiant d'ouvrage surfacique (id_emprise),
	CONSTRAINT ass_intervention_ligne_pkey PRIMARY KEY (id_ass_intervention_ligne)
);

-- Column comments

COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.id_ass_intervention_ligne IS 'identifiant métier';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.nature_intervention IS 'nature de l''intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.type_patrimoine IS 'type de patrimoine associé';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.intervention_programmee IS 'intervention programée';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.type_intervention IS '*type d''intervention*';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.date_debut_intervention IS 'début intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.date_fin_intervention IS 'fin intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.description_intervention IS 'description de l''intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.intervenant IS '*intervenant*';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.duree_intervention IS 'durée intervention (en h)';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.statut_intervention IS '*statut de l''intervention*';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.ref_canalisation IS 'référence à la conduite de rattachement(id_canalisation)';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.ref_noeud_reseau IS 'référence à l''ouvrage de rattachement(id_noeud_reseau)';
COMMENT ON COLUMN stareau_ass.ass_intervention_ligne.ref_emprise IS 'référence à l''identifiant d''ouvrage surfacique (id_emprise)';


---surface

CREATE TABLE stareau_ass.ass_intervention_surface (
	id_ass_intervention_surface text DEFAULT gen_random_uuid() NOT NULL, -- identifiant métier
	nature_intervention text NOT NULL, -- nature de l'intervention
	type_patrimoine text NOT NULL -- type de patrimoine associé,
	intervention_programmee text NOT NULL, -- intervention programée
	type_intervention text NOT NULL, -- *type d'intervention*
	date_debut_intervention timestamp DEFAULT now() NOT NULL -- début intervention,
	date_fin_intervention timestamp NULL, -- fin intervention
	description_intervention text NOT NULL, -- description de l'intervention
	intervenant text NULL -- *intervenant*,
	duree_intervention float4 NULL, -- durée intervention (en h)
	statut_intervention text NOT NULL, -- *statut de l'intervention*
	geom public.geometry(polygon, 2154) NOT NULL,
	ref_canalisation text NULL, -- référence à la conduite de rattachement(id_canalisation)
	ref_noeud_reseau text NULL, -- référence à l'ouvrage de rattachement(id_noeud_reseau)
	ref_emprise text NULL -- référence à l'identifiant d'ouvrage surfacique (id_emprise),
	CONSTRAINT ass_intervention_surface_pkey PRIMARY KEY (id_ass_intervention_surface)
);

-- Column comments

COMMENT ON COLUMN stareau_ass.ass_intervention_surface.id_ass_intervention_surface IS 'identifiant métier';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.nature_intervention IS 'nature de l''intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.type_patrimoine IS 'type de patrimoine associé';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.intervention_programmee IS 'intervention programée';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.type_intervention IS '*type d''intervention*';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.date_debut_intervention IS 'début intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.date_fin_intervention IS 'fin intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.description_intervention IS 'description de l''intervention';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.intervenant IS '*intervenant*';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.duree_intervention IS 'durée intervention (en h)';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.statut_intervention IS '*statut de l''intervention*';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.ref_canalisation IS 'référence à la conduite de rattachement(id_canalisation)';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.ref_noeud_reseau IS 'référence à l''ouvrage de rattachement(id_noeud_reseau)';
COMMENT ON COLUMN stareau_ass.ass_intervention_surface.ref_emprise IS 'référence à l''identifiant d''ouvrage surfacique (id_emprise)';

