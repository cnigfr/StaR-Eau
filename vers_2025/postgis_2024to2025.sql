/*
 * postgis_2024to2025 - 2025-02-14
 * // Created: 2024/07/01 05:48:52
 * // Last modified: 2025/06/27 10:48:33
 * ETALABV2 - Alain pour Astee / CNIG-2025
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

---modification table ass_regard
ALTER TABLE stareau_ass.ass_regard ADD cunette text NOT NULL;
COMMENT ON COLUMN stareau_ass.ass_regard.cunette IS '*équipé d''une cunette*';
ALTER TABLE stareau_ass.ass_regard ADD decantation text DEFAULT 'non' NOT NULL;
COMMENT ON COLUMN stareau_ass.ass_regard.decantation IS '*équipé d''une décantation*';

ALTER TABLE stareau_ass.ass_regard ADD CONSTRAINT ass_regard_cunette_fk FOREIGN KEY (cunette) REFERENCES stareau_valeur.com_oui_non(code) ON UPDATE CASCADE;
ALTER TABLE stareau_ass.ass_regard ADD CONSTRAINT ass_regard_decantation_fk FOREIGN KEY (decantation) REFERENCES stareau_valeur.com_oui_non(code) ON UPDATE CASCADE;
---

---creation liste et champs pour aep_regulation
ALTER TABLE stareau_aep.aep_regulation ADD grandeur_consigne text NOT NULL;
COMMENT ON COLUMN stareau_aep.aep_regulation.grandeur_consigne IS '*propriété mesurée et mise en consigne*';

CREATE TABLE stareau_valeur.aep_grandeur_consigne (code text NOT NULL,valeur text NOT NULL,description text NOT NULL,
	CONSTRAINT aep_grandeur_consigne_pk PRIMARY KEY (code));
insert into stareau_valeur.aep_grandeur_consigne (code,valeur,description) values
	 ('debit','débit','volume traversant une surface par unité de temps, exprimé en m³/s'),
	 ('pression','pression',' force exercée par un fluide sur une surface en bar'),
	 ('niveau','niveau','position sur une échelle de mesure en m'),
	 ('non_renseigne','non renseigné(e)','information en recherche ou disponible mais non saisie'),
	 ('non_concerne','non concerné(e)','information non possible ou non pertinente pour l''élément décrit'),
	 ('non_valide','non validé(e)','information existe mais n''est pas officiellement validée'),
	 ('non_determine','non déterminé(e)','information inconnue ou non disponible et ne peut pas l''être'),
	 ('autre','autre','ne figure pas dans la liste ci-dessus. cf. commentaire');

ALTER TABLE stareau_aep.aep_regulation ADD CONSTRAINT aep_regulation_aep_grandeur_consigne_fk FOREIGN KEY (grandeur_consigne) REFERENCES stareau_valeur.aep_grandeur_consigne(code) ON UPDATE CASCADE;

--- uniformisation des termes cote_
ALTER TABLE stareau_ass_brcht.ass_canalisation_branchement RENAME COLUMN altitude_fil_eau_amont TO cote_fil_eau_amont;
ALTER TABLE stareau_ass_brcht.ass_canalisation_branchement RENAME COLUMN altitude_fil_eau_aval TO cote_fil_eau_aval;
ALTER TABLE stareau_ass_brcht.ass_point_collecte RENAME COLUMN z_tampon TO cote_tampon;
ALTER TABLE stareau_ass_brcht.ass_point_collecte RENAME COLUMN z_radier TO cote_radier;
ALTER TABLE stareau_ass_brcht.ass_point_collecte RENAME COLUMN profondeur TO profondeur_mesure;
ALTER TABLE stareau_ass.ass_canalisation RENAME COLUMN altitude_fil_eau_amont TO cote_fil_eau_amont;
ALTER TABLE stareau_ass.ass_canalisation RENAME COLUMN altitude_fil_eau_aval TO cote_fil_eau_aval;

