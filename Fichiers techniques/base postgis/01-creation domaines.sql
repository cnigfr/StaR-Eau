/*
 * 01-creation domaines.sql
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

--creation domaine pour type particulier
-- si pas besoin de ces domaines, modifier les types dans les fichiers de création des tables.

CREATE DOMAIN public.c_insee AS TEXT CHECK(VALUE ~ '^([013-9]\d|2[AB1-9])\d{3}$'); --check si Insee valide
CREATE DOMAIN public.c_annee AS int CHECK ((VALUE::TEXT ~ '^[1|2][0|8-9]\d{2}$') OR VALUE IN (-9999,-8888,-7777,-6666)); --check annee entre 1800 et 2099 + autres valeurs
--CREATE DOMAIN public.c_sirent AS TEXT ((VALUE::text ~ '^(?:\d{9}|\d{14})$')); - vérifie si SIREN ou SIRET a bien 9 ou 14 chiffres
