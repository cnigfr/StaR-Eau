/*
 * 07-creation branchement eau potable.sql
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

--- AEP ---

--CANALISATION BRANCHEMENT

CREATE TABLE "stareau_aep_brcht".aep_canalisation_branchement (
  id_aep_canalisation_branchement text null,
  fonction_canalisation text NOT NULL, -- >fonction du branchement
  contenu_canalisation text NOT NULL, -- >type d'eau transportée
  protection_cathodique BOOL DEFAULT false NULL, -- >presence protection cathodique
  cote_debut float4 NULL, -- cote de la génératrice superieure
  cote_fin float4 NULL, -- cote génératrice supérieure
  CONSTRAINT pk_aep_cana_brcht PRIMARY KEY (id_canalisation)
)
INHERITS ("stareau_principale".canalisation,"stareau_principale".dimension);
COMMENT ON TABLE "stareau_aep_brcht".aep_canalisation_branchement IS 'conduite et accessoire mis en oeuvre pour amener l''eau du réseau de desserte jusqu''au point de livraison à l''usager, à l''exception des conduites et accessoires privés des immeubles collectifs';

-- Column comments
COMMENT ON COLUMN "stareau_aep_brcht".aep_canalisation_branchement.id_aep_canalisation_branchement IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep_brcht".aep_canalisation_branchement.fonction_canalisation IS '*fonction du branchement*';
COMMENT ON COLUMN "stareau_aep_brcht".aep_canalisation_branchement.contenu_canalisation IS '*type d''eau transportée*';
COMMENT ON COLUMN "stareau_aep".aep_canalisation_branchement.protection_cathodique IS '*présence protection cathodique*';
COMMENT ON COLUMN "stareau_aep_brcht".aep_canalisation_branchement.cote_debut IS 'cote NGF de la génératrice supérieure';
COMMENT ON COLUMN "stareau_aep_brcht".aep_canalisation_branchement.cote_fin IS 'cote NGF génératrice supérieure';

--POINT LIVRAISON

CREATE TABLE "stareau_aep_brcht".aep_point_livraison (
  id_point_livraison text NULL,
  type_point_livraison text NOT NULL, -- >type point livraison
  type_usager text NOT NULL, -- >type usager desservis
  ref_externe text NULL, -- référence externe (sdis, exploitation...)
  ref_client text NULL, -- référence client
  CONSTRAINT pk_aep_point_livraison PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep_brcht".aep_point_livraison IS 'point de livraison';

-- Column comments

COMMENT ON COLUMN "stareau_aep_brcht".aep_point_livraison.id_point_livraison IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep_brcht".aep_point_livraison.type_point_livraison IS '*type point livraison*';
COMMENT ON COLUMN "stareau_aep_brcht".aep_point_livraison.ref_externe IS 'référence externe (sdis, exploitation...)';
COMMENT ON COLUMN "stareau_aep_brcht".aep_point_livraison.ref_client IS 'référence client';
COMMENT ON COLUMN "stareau_aep_brcht".aep_point_livraison.type_usager IS '*type usager desservis*';

--RACCORD BRANCHEMENT

CREATE TABLE stareau_aep_brcht.aep_raccord (
  id_raccord text null,
--type_raccord text NULL, -- > type de raccord
  ref_canalisation text NOT NULL, -- lien vers canalisation
  CONSTRAINT pk_aep_raccord_brcht PRIMARY KEY (id_noeud_reseau)
)
INHERITS (stareau_principale.noeud_reseau);
COMMENT ON TABLE stareau_aep_brcht.aep_raccord IS 'Point de raccordement entre le branchement et la canalisation (non sécant)';

-- Column comments

--COMMENT ON COLUMN stareau_aep_brcht.aep_raccord.type_raccord IS '*type de raccord*';
COMMENT ON COLUMN stareau_aep_brcht.aep_raccord.id_raccord IS 'identifiant métier';
COMMENT ON COLUMN stareau_aep_brcht.aep_raccord.ref_canalisation IS 'lien vers canalisation principale';

---- PIECE BRANCHEMENT

CREATE TABLE stareau_aep_brcht.aep_piece_branchement (
  id_piece_branchement text NULL,
  type_piece_branchement text NOT NULL, -- >type de pièce
  CONSTRAINT pk_aep_piece_brcht PRIMARY KEY (id_noeud_reseau)
)
INHERITS (stareau_principale.noeud_reseau);
COMMENT ON TABLE stareau_aep_brcht.aep_piece_branchement IS 'Pièces de branchement qui impactent le modèle hydraulique, et donc associées à des noeuds';

-- Column comments
COMMENT ON COLUMN stareau_aep_brcht.aep_piece_branchement.id_piece_branchement IS 'identifiant métier';
COMMENT ON COLUMN stareau_aep_brcht.aep_piece_branchement.type_piece_branchement IS '*type de pièce*';

---VANNE BRANCHEMENT

CREATE TABLE stareau_aep_brcht.aep_vanne_branchement (
  id_vanne_branchement text null,
  type_vanne_branchement text NOT NULL, -- >type de vanne
  diametre float4 NULL, -- diamètre nominale de la vanne
  etat_ouverture text NOT NULL, -- >état d'ouverture
  sens_fermeture text NOT NULL, -- >sens de fermeture
  CONSTRAINT pk_aep_vanne_brcht PRIMARY KEY (id_noeud_reseau)
)
INHERITS (stareau_principale.noeud_reseau);
COMMENT ON TABLE stareau_aep_brcht.aep_vanne_branchement IS 'élément de coupure sur le branchement';
-- Column comments

COMMENT ON COLUMN stareau_aep_brcht.aep_vanne_branchement.id_vanne_branchement IS 'identifiant métier';
COMMENT ON COLUMN stareau_aep_brcht.aep_vanne_branchement.type_vanne_branchement IS '*type de vanne*';
COMMENT ON COLUMN stareau_aep_brcht.aep_vanne_branchement.diametre IS 'diamètre nominal de la vanne';
COMMENT ON COLUMN stareau_aep_brcht.aep_vanne_branchement.sens_fermeture IS '*sens de fermeture*';
COMMENT ON COLUMN stareau_aep_brcht.aep_vanne_branchement.etat_ouverture IS '*état d''ouverture*';


