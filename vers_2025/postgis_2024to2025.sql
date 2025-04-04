/*
 * postgis_2024to2025 - 2025-02-14
 * // Created: 2024/07/01 05:48:52
 * // Last modified: 2025/04/04 17:40:50
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

CREATE TABLE stareau_valeur.aep_grandeur_consigne (code text NOT NULL,valeur text NOT NULL,description text NOT NULL
	CONSTRAINT aep_grandeur_consigne_pk PRIMARY KEY (code));
INSERT INTO stareau_valeur.aep_grandeur_consigne (code,valeur,description) VALUES
	 ('debit','débit','volume traversant une surface par unité de temps, exprimé en m³/s'),
	 ('pression','pression',' force exercée par un fluide sur une surface en bar'),
	 ('niveau','niveau','position sur une échelle de mesure en m'),
     ('vitesse','vitesse','distance parcourue par une masse de fluide par unité de temps en m/s');

ALTER TABLE stareau_aep.aep_regulation ADD CONSTRAINT aep_regulation_aep_grandeur_consigne_fk FOREIGN KEY (grandeur_consigne) REFERENCES stareau_valeur.aep_grandeur_consigne(code) ON UPDATE CASCADE;

---