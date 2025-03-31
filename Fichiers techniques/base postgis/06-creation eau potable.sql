/*
 * 06-creation eau potable.sql
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


---CANALISATION

CREATE TABLE "stareau_aep".aep_canalisation (
  id_aep_canalisation text null, -- pour id_existant
  fonction_canalisation text NOT NULL, -- >fonction canalisation dans le réseau
  contenu_canalisation text NOT NULL, -- >type d'eau transportée
  protection_cathodique BOOL DEFAULT false NULL, -- >presence protection cathodique
  etage_pression text NULL, -- reference etage de pression
  type_pression text NOT NULL, -- >pression de distribution
  secteur_hydraulique text NULL, -- secteur ou ilot de distribution
  ref_udi text NULL, -- référence unité de distribution (référence ARS)
  cote_debut float4 NULL, -- cote de la génératrice superieure
  cote_fin float4 NULL, -- cote génératrice supérieure
  -- id_aep_reservoir : lien vers réservoir créer dans le fichier 200
  CONSTRAINT pk_aep_canalisation PRIMARY KEY (id_canalisation)
)
INHERITS ("stareau_principale".canalisation,"stareau_principale".dimension);
COMMENT ON TABLE "stareau_aep".aep_canalisation IS 'assemblage de tuyau, de leurs pièces et des ouvrages qui permet le transport des eaux entre deux points';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_canalisation.id_aep_canalisation IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.fonction_canalisation IS '*fonction canalisation dans le réseau*';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.contenu_canalisation IS '*type d''eau transportée*';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.protection_cathodique IS '*présence protection cathodique*';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.etage_pression IS 'référence étage de pression';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.secteur_hydraulique IS 'secteur ou îlot de distribution';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.ref_udi IS 'référence unité de distribution (référence ARS)';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.cote_debut IS 'cote NGF de la génératrice supérieure';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.cote_fin IS 'cote NGF génératrice supérieure';
COMMENT ON COLUMN "stareau_aep".aep_canalisation.type_pression IS '*type de pression de distribution*';

--CAPTAGE

CREATE TABLE "stareau_aep".aep_captage (
  id_aep_captage TEXT NULL,
  nom_usuel text NULL, -- nom d'usage
  type_captage text NOT NULL, -- type de captage
  nom_ressource text NULL, -- nom ressource
  type_ressource text NOT NULL, -- type de ressource
  ref_aac text NULL, -- reference aire alimentation captage
  ref_dup text NULL, -- référence arrêté autorisation
  ref_bss text NULL, -- référence Banque Sous Sol -brgm
  debit_max_autorise text NULL,-- Débit max autorisé mentionné dans la DUP, accompagné de son unité
  CONSTRAINT pk_aep_captage PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep".aep_captage IS 'Ouvrage de prélèvement exploitant une ressource en eau, que ce soit en surface (prise d''eau en rivière) ou dans le sous-sol (forage ou puits atteignant un aquifère';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_captage.id_aep_captage IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_captage.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN "stareau_aep".aep_captage.type_captage IS '*type de captage*';
COMMENT ON COLUMN "stareau_aep".aep_captage.nom_ressource IS 'nom ressource';
COMMENT ON COLUMN "stareau_aep".aep_captage.type_ressource IS '*type de ressource*';
COMMENT ON COLUMN "stareau_aep".aep_captage.ref_aac IS 'reference aire alimentation captage';
COMMENT ON COLUMN "stareau_aep".aep_captage.ref_dup IS 'référence arrêté autorisation - préfecture ';
COMMENT ON COLUMN "stareau_aep".aep_captage.ref_bss IS 'référence Banque Sous Sol - brgm';
COMMENT ON COLUMN "stareau_aep".aep_captage.debit_max_autorise IS 'Débit max autorisé mentionné dans la DUP, accompagné de son unité';


--- RESERVOIR

CREATE TABLE "stareau_aep".aep_reservoir (
  id_aep_reservoir TEXT NULL,
  nom_usuel text NULL, -- nom d'usage
  type_reservoir text NOT NULL, -- >type réservoir
  nb_cuves int2 NOT NULL DEFAULT 1, -- nombre de cuves
  volume_utile int2 NULL, -- volume total utile m3
  cote_sol float4 NULL, -- cote NGF sol du reservoir
  cote_radier float4 NULL, -- cote NGF du fond de cuve la plus basse
  cote_trop_plein float4 NULL, -- cote NGF du trop-plein
  telegestion text NOT NULL,-- >présence d'une gestion à distance
  CONSTRAINT pk_aep_reservoir PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau,"stareau_principale".dimension);
COMMENT ON TABLE "stareau_aep".aep_reservoir IS 'installation destinée au stockage de l''eau';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_reservoir.id_aep_reservoir IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.type_reservoir IS '*type réservoir*';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.nb_cuves IS 'nombre de cuves';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.volume_utile IS 'volume total utile m3';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.cote_sol IS 'cote NGF sol du reservoir';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.cote_radier IS 'cote NGF du fond de cuve la plus basse';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.cote_trop_plein IS 'cote NGF du trop-plein';
COMMENT ON COLUMN "stareau_aep".aep_reservoir.telegestion IS '*présence d''une gestion à distance*';


--TRAITEMENT (UP)

CREATE TABLE "stareau_aep".aep_traitement (
  id_aep_traitement TEXT NULL,
  nom_usuel text NULL, -- nom d'usage
  fonction_traitement text NOT NULL, -- >fonction traitement
  type_desinfection text NOT NULL, -- >type désinfection
  capacite float4 NULL, -- capacité de traitement m3/j
  debit_ref float4 NULL, -- débit de référence m3/j
  telegestion text NOT NULL, -- >présence d'une gestion à distance
  CONSTRAINT pk_aep_traitement PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep".aep_traitement IS 'ensemble des installations chargées de traiter les eaux brutes en vue de leur potabilisation et distribution';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_traitement.id_aep_traitement IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_traitement.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN "stareau_aep".aep_traitement.fonction_traitement IS '*fonction traitement*';
COMMENT ON COLUMN "stareau_aep".aep_traitement.type_desinfection IS '*type désinfection*';
COMMENT ON COLUMN "stareau_aep".aep_traitement.capacite IS 'capacité de traitement m3/j';
COMMENT ON COLUMN "stareau_aep".aep_traitement.debit_ref IS 'débit de référence m3/j';
COMMENT ON COLUMN "stareau_aep".aep_traitement.telegestion IS '*présence d''une gestion à distance*';

--POINT DE MESURE

CREATE TABLE stareau_aep.aep_point_mesure (
  id_aep_point_mesure TEXT NULL,
  nom_usuel text NULL,
  type_point_mesure text NOT NULL, -- *type point de mesure*
  fonction_point_mesure text NOT NULL, -- *fonction point de mesure*
  calibre float4 NULL, -- calibre/diametre
  annee_fabrication int4 NULL, -- année fabrication
  marque text NULL, -- marque compteur
  numero_serie text NULL, -- numéro série
  telegestion text NOT NULL,-- >présence d'une gestion à distance
  CONSTRAINT pk_aep_point_mesure PRIMARY KEY (id_noeud_reseau)
)
INHERITS (stareau_principale.noeud_reseau);
COMMENT ON TABLE stareau_aep.aep_point_mesure IS 'table des point de mesure (compteurs) sur réseaux';

COMMENT ON COLUMN stareau_aep.aep_point_mesure.id_aep_point_mesure IS 'identifiant métier';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.type_point_mesure IS '*type point de mesure*';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.fonction_point_mesure IS '*fonction point de mesure*';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.calibre IS 'calibre/diamètre';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.annee_fabrication IS 'année fabrication';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.marque IS 'marque compteur';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.numero_serie IS 'numéro série';
COMMENT ON COLUMN stareau_aep.aep_point_mesure.telegestion IS '*présence d''une gestion à distance*';

--- VANNE

CREATE TABLE "stareau_aep".aep_vanne (
  id_aep_vanne TEXT NULL,
  type_vanne text NOT NULL, -- type_vanne
  fonction_vanne text NOT NULL, -- fonction vanne
  diametre float4 NULL, -- diametre nominal
  sens_fermeture text NOT NULL, -- sens fermeture
  etat_ouverture text NOT NULL, -- état ouverture
  blocage text NOT NULL, --vanne bloquée
  motorisation text NOT NULL, -- motorisation
  telegestion text NOT NULL,-- Présence d'une gestion à distance
  CONSTRAINT pk_aep_vanne PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep".aep_vanne IS 'Appareillage capable d''intercepter ou laisser libre le passage de l''eau dans le réseau, hors régulation.';


COMMENT ON TABLE "stareau_aep".aep_vanne IS 'vanne réseau';
COMMENT ON COLUMN "stareau_aep".aep_vanne.id_aep_vanne IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_vanne.type_vanne IS '*type_vanne*';
COMMENT ON COLUMN "stareau_aep".aep_vanne.fonction_vanne IS '*fonction vanne*';
COMMENT ON COLUMN "stareau_aep".aep_vanne.diametre IS 'diamètre nominal en mm';
COMMENT ON COLUMN "stareau_aep".aep_vanne.sens_fermeture IS '*sens fermeture*';
COMMENT ON COLUMN "stareau_aep".aep_vanne.blocage IS '*vanne bloquée*';
COMMENT ON COLUMN "stareau_aep".aep_vanne.etat_ouverture IS '*état ouverture en fonctionnement normal*';
COMMENT ON COLUMN "stareau_aep".aep_vanne.motorisation IS '*motorisation*';
COMMENT ON COLUMN "stareau_aep".aep_vanne.telegestion IS '*présence d''une gestion à distance*';

--REGULATION

CREATE TABLE "stareau_aep".aep_regulation (
  id_aep_regulation TEXT NULL,
  nom_usuel text NULL, -- nom usage
  type_regulation text NOT NULL, -- type régulation*
  type_consigne text NOT NULL, -- type consigne*
  consigne_amont float4 NULL, -- consigne en amont
  consigne_aval float4 NULL, -- consigne en aval
  marque text NULL, -- marque de l'appareil
  diametre float4 NULL, -- diametre nominal
  annee_fabrication int2 NULL, -- année de fabrication
  telegestion text NOT NULL,-- telegestion/telereleve*
  CONSTRAINT pk_aep_regulation PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);

COMMENT ON TABLE "stareau_aep".aep_regulation IS 'appareil de régulation du débit ou de la pression';
COMMENT ON COLUMN "stareau_aep".aep_regulation.id_aep_regulation IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_regulation.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN "stareau_aep".aep_regulation.type_regulation IS '*type régulation*';
COMMENT ON COLUMN "stareau_aep".aep_regulation.type_consigne IS '*type consigne*';
COMMENT ON COLUMN "stareau_aep".aep_regulation.consigne_amont IS 'consigne en amont';
COMMENT ON COLUMN "stareau_aep".aep_regulation.consigne_aval IS 'consigne en aval';
COMMENT ON COLUMN "stareau_aep".aep_regulation.marque IS 'marque de l''appareil';
COMMENT ON COLUMN "stareau_aep".aep_regulation.diametre IS 'diametre nominal';
COMMENT ON COLUMN "stareau_aep".aep_regulation.annee_fabrication IS 'année de fabrication';
COMMENT ON COLUMN "stareau_aep".aep_regulation.telegestion IS '*présence d''une gestion à distance*';

--POMPAGE

CREATE TABLE "stareau_aep".aep_pompage (
  id_aep_pompage TEXT NULL, -- identifiant
  nom_usuel text NULL, -- nom d'usage
  fonction_pompage text NOT NULL, -- >fonction du pompage
  installation_pompage text NOT NULL, -- >mode installation
  nb_pompes int2 null default 1, -- nombre de pompes
  capacite float4 NULL, -- capacite nominale de pompage m3/j
  telegestion text NOT NULL,-- Présence d'une gestion à distance
  CONSTRAINT pk_aep_pompage PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep".aep_pompage IS 'ensemble des dispositifs permettant d''aspirer, de refouler ou de comprimer des eaux';

-- Column comments
COMMENT ON COLUMN "stareau_aep".aep_pompage.id_aep_pompage IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_pompage.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN "stareau_aep".aep_pompage.fonction_pompage IS '*fonction du pompage*';
COMMENT ON COLUMN "stareau_aep".aep_pompage.installation_pompage IS '*mode installation*';
COMMENT ON COLUMN "stareau_aep".aep_pompage.nb_pompes IS 'nombre de pompes';
COMMENT ON COLUMN "stareau_aep".aep_pompage.capacite IS 'capacité nominale de pompage m3/j';
COMMENT ON COLUMN "stareau_aep".aep_pompage.telegestion IS '*présence d''une gestion à distance*';

--APPAREILLAGE
CREATE TABLE "stareau_aep".aep_appareillage (
  id_aep_appareillage TEXT NULL,
  type_appareillage text NOT NULL, -- >type d'appariellage
  diametre float4 NULL, -- diametre nominal
  telegestion text NOT NULL, -- Présence d'une gestion à distance
  CONSTRAINT pk_noeud_reseau PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep".aep_appareillage IS 'Équipements divers sur le réseau d''eau potable non pris en compte dans les autres classes d''entités';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_appareillage.id_aep_appareillage IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_appareillage.type_appareillage IS '*type d''appareillage*';
COMMENT ON COLUMN "stareau_aep".aep_appareillage.diametre IS 'diametre nominal';
COMMENT ON COLUMN "stareau_aep".aep_appareillage.telegestion IS '*Présence d''une gestion à distance*';

--STATION D'ALERTE (hors topologie)

CREATE TABLE stareau_aep.aep_station_alerte (
  id_aep_station_alerte TEXT NULL, -- identifiant
  nom_usuel text NULL, -- nom d'usage
  telegestion text NOT NULL,
  geom public.geometry(point, 2154) NOT NULL,
  CONSTRAINT pk_aep_station_alerte PRIMARY KEY (id_aep_station_alerte)
)
INHERITS (stareau_principale.champ_commun);
COMMENT ON TABLE stareau_aep.aep_station_alerte IS 'Équipement permettant de déclencher une alerte en cas de pollution ou de dépassement de seuils';

-- Column comments

COMMENT ON COLUMN stareau_aep.aep_station_alerte.id_aep_station_alerte IS 'identifiant métier';
COMMENT ON COLUMN stareau_aep.aep_station_alerte.nom_usuel IS 'nom d''usage';
COMMENT ON COLUMN stareau_aep.aep_station_alerte.telegestion IS '*Présence d''une gestion à distance*';

--- PIECE

CREATE TABLE "stareau_aep".aep_piece (
  id_aep_piece TEXT NULL,
  type_piece text NOT NULL, -- > type de pièce
  CONSTRAINT pk_aep_piece PRIMARY KEY (id_noeud_reseau)
)
INHERITS ("stareau_principale".noeud_reseau);
COMMENT ON TABLE "stareau_aep".aep_piece IS 'Pièces sur canalisation principale';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_piece.id_aep_piece IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_piece.type_piece IS '*type de pièce*';

--- PIECE (HORS TOPOLOGIE)

CREATE TABLE "stareau_aep".aep_piece_hors_topo (
  id_aep_pieceht text NOT NULL DEFAULT gen_random_uuid(), ---- >=PG13 uuid par défaut peut-être retirer pour autre identifiant
  --id_aep_pieceht INT GENERATED ALWAYS AS IDENTITY, -- id numerique à numérotation auto
  --id_aep_pieceht TEXT NOT NULL,  -- ou INT -- pour personnalisation ou récupération de l'id existant
  type_piece text NOT NULL, -- > type de pièce
  ref_canalisation text NULL, -- référence à la conduite de rattachement
  geom public.geometry(point, 2154) NOT NULL,
  CONSTRAINT aep_piece_ht_pk PRIMARY KEY (id_aep_pieceht)
)
INHERITS (stareau_principale.champ_commun);
COMMENT ON TABLE "stareau_aep".aep_piece_hors_topo IS 'Pièces sur canalisations principales HORS TOPOLOGIE (pas sur un noeud réseau)';

-- Column comments

COMMENT ON COLUMN "stareau_aep".aep_piece_hors_topo.id_aep_pieceht IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep".aep_piece_hors_topo.type_piece IS '*type de pièce*';
COMMENT ON COLUMN "stareau_aep".aep_piece_hors_topo.ref_canalisation  IS 'référence à la conduite de rattachement(id_canalisation)';
