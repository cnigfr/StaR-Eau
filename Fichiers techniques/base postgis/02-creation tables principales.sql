/*
 * 02-creation tables principales.sql
 *
 * // Created: 2024/07/01 05:48:52
 * // Last modified: 2024/12/02 23:13:55
 *
 * ETALABV2 - Alain pour Astee / CNIG-2024
 *
 * Ce fichier est un document libre ; vous pouvez le redistribuer et/ou le modifier selon les termes de la
 * Licence Publique LICENCE OUVERTE / OPEN LICENCE Version 2.0 telle que publiée par ETALAB
 *
 * Le « Réutilisateur » est libre de réutiliser l’« Information » :
 *
 * de la communiquer, la reproduire, la copier ;
 * de l’adapter, la modifier, l’extraire et la transformer, notamment pour créer des « Informations dérivées » ;
 * de la diffuser, la redistribuer, la publier et la transmettre, de l’exploiter à titre commercial, par exemple en la combinant avec d’autres informations, ou en l’incluant dans votre propre produit ou application.
 * Sous réserve de :
 *
 * mentionner la paternité de l’«Information» : sa source (a minima le nom du « Concédant ») et la date de la dernière mise à jour de l’« Information » réutilisée.
 *
 * Ce fichier est distribué dans l'espoir qu'il sera utile, mais SANS AUCUNE GARANTIE ; sans même la garantie implicite de
 * COMMERCIALISATION ou d'ADAPTATION À UN USAGE PARTICULIER.  Voir la Licence publique générale GNU pour plus de détails.
 *
 * La licence, à date de ce fichier, est disponible sur
 * https://www.etalab.gouv.fr/wp-content/uploads/2017/04/ETALAB-Licence-Ouverte-v2.0.pdf
 */


---tables principales

--DIMENSIONS

CREATE TABLE stareau_principale.dimension (
  forme text DEFAULT 'circulaire'::text NOT NULL, -- *forme générale de l'objet*
  --unite text DEFAULT 'mm'::text NOT NULL, -- *unité des mesures*
  lien_detail text NULL,
  hauteur_interieure float8 NULL, -- hauteur max intérieure
  hauteur_exterieure float8 NULL, -- hauteur max extérieure
  largeur_interieure float8 NULL, -- largeur max intérieure
  largeur_exterieure float8 NULL, -- largeur max extérieure
  longueur_interieure float8 NULL, -- longueur max intérieure
  longueur_exterieure float8 NULL -- longueur max extérieure
);
COMMENT ON TABLE stareau_principale.dimension IS 'table mère des dimensions des éléments';

-- Column comments

COMMENT ON COLUMN stareau_principale.dimension.forme IS '*forme générale de l''objet*';
--COMMENT ON COLUMN stareau_principale.dimension.unite IS '*unité des mesures*';
COMMENT ON COLUMN stareau_principale.dimension.lien_detail IS 'lien vers fichier descriptif des formes complexes';
COMMENT ON COLUMN stareau_principale.dimension.hauteur_interieure IS 'hauteur max intérieure';
COMMENT ON COLUMN stareau_principale.dimension.hauteur_exterieure IS 'hauteur max extérieure';
COMMENT ON COLUMN stareau_principale.dimension.largeur_interieure IS 'largeur max intérieure';
COMMENT ON COLUMN stareau_principale.dimension.largeur_exterieure IS 'largeur max extérieure';
COMMENT ON COLUMN stareau_principale.dimension.longueur_interieure IS 'longueur max intérieure';
COMMENT ON COLUMN stareau_principale.dimension.longueur_exterieure IS 'longueur max extérieure';


--DONNÉES GÉNÉRALES

CREATE TABLE "stareau_principale".champ_commun(
   id_champ_commun TEXT NOT NULL DEFAULT gen_random_uuid(), ---- >=PG13 uuid par défaut peut-être retirer pour autre identifiant
   --id_champ_commun INT GENERATED ALWAYS AS IDENTITY, -- id numerique à numérotation auto
   --id_champ_commun TEXT NOT NULL,  -- pour personnalisation ou récupération de l'id existant
   type_reseau TEXT NOT NULL, --type de réseau (com_type_reseau)
   fictif BOOL DEFAULT false NULL,
   etat_service TEXT NOT NULL, --etat de service (com_etat_service)
   --insee_commune varchar(5) NOT NULL, --Insee de la commune
   insee_commune c_insee NOT NULL, --Insee de la commune
   localisation TEXT NULL, --adresse, nom de la rue principale, ou localisation relative du patrimoine
   maitre_ouvrage TEXT NOT NULL, --propriétaire de patrimoine
   exploitant TEXT NOT NULL, --exploitant actuel du patrimoine
   entreprise_pose TEXT, --entreprise ayant effectué les travaux de mise en place
   precision_xy VARCHAR(1) NOT NULL,
   precision_z VARCHAR(1) NOT NULL,
   an_pose_sup c_annee NOT NULL, --Année marquant la fin de la période de pose
   an_pose_inf c_annee, --Année marquant la début de la période de pose
   an_service_sup c_annee, --Année marquant la fin de la période de mise en service
   an_service_inf c_annee, --Année marquant le début de la période de mise en service
   an_abandon_sup c_annee,--Année marquant la fin de la période d'arrêt définitif
   an_abandon_inf c_annee,--Année marquant le début de la période d'arrêt définitif
   an_rehab_sup c_annee,--Année marquant la fin de la période de réhabilitation
   an_rehab_inf c_annee,--Année marquant le début de la période de mise en service
   date_creation TIMESTAMP NOT NULL,
   origine_creation TEXT NOT NULL,
   date_maj TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
   origine_maj TEXT NULL,
   lien_doc1 TEXT,
   lien_doc2 TEXT,
   commentaire TEXT
   --,CONSTRAINT PK_champ_commun PRIMARY KEY(id_champ_commun)
);
COMMENT ON TABLE stareau_principale.champ_commun IS 'table des champs communs à toutes les tables';

COMMENT ON COLUMN stareau_principale.champ_commun.type_reseau IS '*type de réseau*';
COMMENT ON COLUMN stareau_principale.champ_commun.etat_service IS '*état de service*';
COMMENT ON COLUMN stareau_principale.champ_commun.insee_commune IS 'insee de la commune';
COMMENT ON COLUMN stareau_principale.champ_commun.localisation IS 'adresse, nom de la rue principale, ou localisation relative du patrimoine';
COMMENT ON COLUMN stareau_principale.champ_commun.maitre_ouvrage IS 'maître d''ouvrage';
COMMENT ON COLUMN stareau_principale.champ_commun.exploitant IS 'exploitant actuel';
COMMENT ON COLUMN stareau_principale.champ_commun.entreprise_pose IS 'entreprise de pose';
COMMENT ON COLUMN stareau_principale.champ_commun.an_pose_sup IS 'année marquant la fin de la période de pose';
COMMENT ON COLUMN stareau_principale.champ_commun.an_pose_inf IS 'année marquant le début de la période de pose';
COMMENT ON COLUMN stareau_principale.champ_commun.an_service_sup IS 'année marquant la fin de la période de mise en service';
COMMENT ON COLUMN stareau_principale.champ_commun.an_service_inf IS 'année marquant le début de la période de mise en service';
COMMENT ON COLUMN stareau_principale.champ_commun.an_abandon_sup IS 'année marquant la fin de la période d''arrêt définitif';
COMMENT ON COLUMN stareau_principale.champ_commun.an_abandon_inf IS 'année marquant le début de la période d''arrêt définitif';
COMMENT ON COLUMN stareau_principale.champ_commun.an_rehab_sup IS 'année marquant la fin de la période de réhabilitation';
COMMENT ON COLUMN stareau_principale.champ_commun.an_rehab_inf IS 'année marquant le début de la période de mise en service';
COMMENT ON COLUMN stareau_principale.champ_commun.date_creation IS 'date de la création de l''objet sig';
COMMENT ON COLUMN stareau_principale.champ_commun.origine_creation IS '*document source de la création*';
COMMENT ON COLUMN stareau_principale.champ_commun.date_maj IS 'date de mise à jour de l''objet sig';
COMMENT ON COLUMN stareau_principale.champ_commun.origine_maj IS '*document source de la mise à jour*';
COMMENT ON COLUMN stareau_principale.champ_commun.lien_doc1 IS 'lien vers document';
COMMENT ON COLUMN stareau_principale.champ_commun.lien_doc2 IS 'lien 2 vers document';
COMMENT ON COLUMN stareau_principale.champ_commun.precision_xy IS '*classe de précision XY*';
COMMENT ON COLUMN stareau_principale.champ_commun.precision_z IS '*classe de précision Z*';
COMMENT ON COLUMN stareau_principale.champ_commun.fictif IS 'élément fictif';
COMMENT ON COLUMN stareau_principale.champ_commun.commentaire IS 'commentaire ou remarque';


--ÉLÉMENTS PONCTUELS - NOEUDS-RÉSEAU

CREATE TABLE "stareau_principale".noeud_reseau (
  id_noeud_reseau text NOT NULL DEFAULT gen_random_uuid(), ---- >=PG13 uuid par défaut peut-être retirer pour autre identifiant
  --id_noeud_reseau INT GENERATED ALWAYS AS IDENTITY, -- id numerique à numérotation auto
  --id_noeud_reseau TEXT NOT NULL,  -- pour personnalisation ou récupération de l'id existant
  geom public.geometry(point, 2154) NOT NULL,
  CONSTRAINT pk_noeud_reseau PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".champ_commun);
CREATE INDEX sidx_noeud_geom ON stareau_principale.noeud_reseau USING gist (geom);  ---indexation

COMMENT ON TABLE "stareau_principale".noeud_reseau IS 'table mère des éléments ponctuels';
COMMENT ON COLUMN "stareau_principale".noeud_reseau.id_noeud_reseau IS 'identifiant noeud';

--ÉLÉMENTS LINÉAIRES - CANALISATION--

CREATE TABLE "stareau_principale".canalisation (
  id_canalisation text NOT NULL DEFAULT gen_random_uuid(),  ---- >=PG13 uuid par défaut peut-être retirer pour autre identifiant
  --id_canalisation INT GENERATED ALWAYS AS IDENTITY, -- id numerique à numérotation auto
  --id_canalisation TEXT NOT NULL, -- pour personnalisation ou récupération de l'id existant
  geom public.geometry(linestring, 2154) NOT NULL,
  mode_circulation text NOT NULL, -- mode de circulation
  type_pose text NOT NULL, -- type de pose
  raison_pose text NOT NULL, -- raison de la pose
  materiau text NOT NULL, -- materiau
  revetement_interieur text NOT NULL, -- revêtement intérieur
  diametre_equivalent int2 NOT NULL, -- diametre nominal
  longueur_terrain real NULL, -- longueur réelle terrain
  sensible BOOL DEFAULT false NULL,
  noeudterminal text NOT NULL, -- noeud terminal
  noeudinitial text NOT NULL, -- noeud initial
  CONSTRAINT pk_canalisation PRIMARY KEY (id_canalisation)
)
INHERITS ("stareau_principale".champ_commun);
CREATE INDEX sidx_canalisation_geom ON stareau_principale.canalisation USING gist (geom); --- indexation

COMMENT ON TABLE "stareau_principale".canalisation IS 'table mère des éléments linéaire';
COMMENT ON COLUMN "stareau_principale".canalisation.id_canalisation IS 'identifiant canalisation';
COMMENT ON COLUMN "stareau_principale".canalisation.mode_circulation IS '*mode de circulation*';
COMMENT ON COLUMN "stareau_principale".canalisation.type_pose IS '*type de pose*';
COMMENT ON COLUMN "stareau_principale".canalisation.raison_pose IS '*raison de la pose*';
COMMENT ON COLUMN "stareau_principale".canalisation.materiau IS '*matériau constitutif*';
COMMENT ON COLUMN "stareau_principale".canalisation.revetement_interieur IS '*revêtement intérieur*';
COMMENT ON COLUMN "stareau_principale".canalisation.diametre_equivalent IS 'diamètre nominal ou équivalent';
COMMENT ON COLUMN "stareau_principale".canalisation.longueur_terrain IS 'longueur réelle terrain';
COMMENT ON COLUMN "stareau_principale".canalisation.sensible IS 'ouvrage sensible DT-DICT';

-- ÉLÉMENTS SURFACIQUES - EMPRISE--

CREATE TABLE "stareau_principale".emprise (
  id_emprise text NOT NULL DEFAULT gen_random_uuid(), -- >=PG13 uuid par défaut peut-être retirer pour autre identifiant
  --id_emprise INT GENERATED ALWAYS AS IDENTITY, -- id numerique à numérotation auto
  --id_emprise text NOT NULL, -- pour personnalisation ou récupération de l'id existant
  visible TEXT NOT NULL, -- visible de la surface ?
  geom public.geometry(polygon, 2154) NOT NULL,
  --geom public.geometry(polygonZ, 2154) NOT NULL,
  CONSTRAINT pk_emprise PRIMARY KEY (id_emprise)
)
INHERITS ("stareau_principale".champ_commun);
CREATE INDEX sidx_emprise_geom ON stareau_principale.emprise USING gist (geom);  ---indexation

COMMENT ON TABLE "stareau_principale".emprise IS 'table mère des éléments ayant une surface réelle ou projetée au sol';
COMMENT ON COLUMN stareau_principale.emprise.id_emprise IS 'identifiant emprise';
COMMENT ON COLUMN stareau_principale.emprise.visible IS '*visible de la surface ?*';

--- TABLE DE RELATION NOEUD-EMPRISE
--- /!\ changer le type de donnée si identifiant numerique
CREATE TABLE stareau_principale.mm_emprise_ponctuel (
  id_emprise text NOT NULL,
  id_noeud_reseau text NOT NULL
);
COMMENT ON TABLE stareau_principale.mm_emprise_ponctuel IS 'table many-many entre éléments surfaciques et éléments ponctuels';


