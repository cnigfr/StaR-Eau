/*
 * 00-creation schemas.sql - 2024-05-17
 * // Created: 2024/07/01 05:48:52
 * // Last modified: 2025/05/04 11:14:07
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
 * https://www.etalab.gouv.fr/wp-content/uploads/2017/04/ETALAB-Licence-Ouverte-v2.0.pdf*/

-- PASSAGE EN 3D, avec prise en compte d'une projection gérant la hauteur (EPSG:5698 (RGF93 / Lambert-93 + NGF-IGN69 height)

ALTER TABLE stareau_principale.emprise ALTER COLUMN geom TYPE public.geometry(polygonz, 5698);
ALTER TABLE stareau_principale.canalisation ALTER COLUMN geom TYPE public.geometry(linestringz, 5698);
ALTER TABLE stareau_principale.noeud_reseau ALTER COLUMN geom TYPE public.geometry(pointz, 5698);

ALTER TABLE stareau_aep.aep_affleurant ALTER COLUMN geom TYPE public.geometry(pointz, 5698);
ALTER TABLE stareau_ass.ass_affleurant ALTER COLUMN geom TYPE public.geometry(pointz, 5698);

ALTER TABLE stareau_aep.aep_protection_mecanique ALTER COLUMN geom TYPE public.geometry(linestringz, 5698);
ALTER TABLE stareau_ass.ass_protection_mecanique ALTER COLUMN geom TYPE public.geometry(linestringz, 5698);

ALTER TABLE stareau_commun.pluviometre ALTER COLUMN geom TYPE public.geometry(pointz, 5698);
ALTER TABLE stareau_commun.piezometre ALTER COLUMN geom TYPE public.geometry(pointz, 5698);
ALTER TABLE stareau_commun.point_geolocalisation ALTER COLUMN geom TYPE public.geometry(pointz, 5698);

ALTER TABLE stareau_ass.ass_gestion_epl_point ALTER COLUMN geom TYPE public.geometry(pointz, 5698);
ALTER TABLE stareau_ass.ass_gestion_epl_ligne ALTER COLUMN geom TYPE public.geometry(linestringz, 5698);
ALTER TABLE stareau_ass.ass_gestion_epl_surface ALTER COLUMN geom TYPE public.geometry(polygonz, 5698);
ALTER TABLE stareau_ass.ass_point_mesure ALTER COLUMN geom TYPE public.geometry(pointz, 5698);
ALTER TABLE stareau_ass.ass_piece_hors_topo ALTER COLUMN geom TYPE public.geometry(pointz, 5698);

ALTER TABLE stareau_aep.aep_station_alerte ALTER COLUMN geom TYPE public.geometry(pointz, 5698);
ALTER TABLE stareau_aep.aep_piece_hors_topo ALTER COLUMN geom TYPE public.geometry(pointz, 5698);

