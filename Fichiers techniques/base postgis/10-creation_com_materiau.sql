/*
 * 10-creation_com_materiau.sql
 *
 * // Created: 2024/07/01 05:48:52
 * // Last modified: 2025/11/12 18:30:23
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


-- DROP TABLE stareau_valeur.com_materiau;

CREATE TABLE stareau_valeur.com_materiau (
  code text NOT NULL,
  valeur text NULL,
  description text NULL,
  categorie text NULL,
  stardt text NULL,
  ref13508 text NULL,
  CONSTRAINT com_materiau_unique UNIQUE (code)
);
COMMENT ON TABLE stareau_valeur.com_materiau IS 'liste des matériaux';
COMMENT ON COLUMN stareau_valeur.com_materiau.code IS 'identifiant métier';
COMMENT ON COLUMN stareau_valeur.com_materiau.valeur IS 'valeur';
COMMENT ON COLUMN stareau_valeur.com_materiau.description IS 'description longue';
COMMENT ON COLUMN stareau_valeur.com_materiau.categorie IS 'catégorie ou famille de matériau';
COMMENT ON COLUMN stareau_valeur.com_materiau.stardt IS 'référence à STAR-DT';
COMMENT ON COLUMN stareau_valeur.com_materiau.ref13508 IS 'référence à la Norme ITV NF EN 13508';

----valeurs

INSERT INTO stareau_valeur.com_materiau (code,valeur,description,categorie,stardt,ref13508) VALUES
	 ('acier','Acier','acier','métal','steel','AP'),
	 ('amci','Amiante-Ciment','amiante-ciment','composite','asbestos','AA'),
	 ('autre','Autre','autre','autre','other','Z'),
	 ('ba','Béton Armé','béton armé','assemblage','','AH'),
	 ('beton','Béton inconnu','type non identifié de béton','assemblage','concrete','AG'),
	 ('bitum','Bitume','bitume','composite','','AB'),
	 ('bois','Bois','bois','autre','wood',''),
	 ('briq','Briquetage','briquetage','assemblage','','AD'),
	 ('btat','Béton Âme Tôle','béton âme tôle','assemblage','',''),
	 ('btcp','Béton Composite','béton composite','assemblage','compositeConcrete',''),
	 ('btfb','Béton Fibré','béton fibré','assemblage','reinforcedConcrete',''),
	 ('btna','Béton Non Armé','béton non armé','assemblage','',''),
	 ('btpc','Béton Précontraint','béton précontraint','assemblage','prestressedReinforcedConcrete',''),
	 ('btpj','Béton Projeté','béton projeté','assemblage','','AI'),
	 ('cu','Cuivre','cuivre','métal','',''),
	 ('epx','Époxy','époxy','plastique','','AT'),
	 ('fbpj','Fibre Projetées','fibre projetées','composite','','AC'),
	 ('fbro','Fibres Ciment','fibres ciment ou fibro-ciment','composite','','AK'),
	 ('fbvr','Fibre De Verre','fibre de verre','composite','',''),
	 ('fd','Fonte Ductile','fonte ductile','métal','','AO'),
	 ('fg','Fonte Grise','fonte grise','métal','','AN'),
	 ('fonte','Fonte','type non identifié de fonte','métal','','AM'),
	 ('gres','Grès','grès','autre','','AE'),
	 ('inc','Inconnu','matériau non identifié','autre','','AZ'),
	 ('mac','Maçonné','maçonné','assemblage','masonry',''),
	 ('maca','Maçonnerie Appareillée','maçonnerie appareillée','assemblage','','AR'),
	 ('macna','Maçonnerie Non Appareillée','maçonnerie non appareillée','assemblage','','AS'),
	 ('metal','Métal Inconnu','type non identifié fer ou acier','métal','','AQ'),
	 ('meul','Meulière','pierre meulière','assemblage','',''),
	 ('mrtc','Mortier De Ciment','mortier de ciment','composite','','AF');
INSERT INTO stareau_valeur.com_materiau (code,valeur,description,categorie,stardt,ref13508) VALUES
	 ('pb','Plomb','plomb','métal','',''),
	 ('pbu','Polybutylène (PB)','polybutylène (PB)','plastique','PB',''),
	 ('pe','Polyéthylène','polyéthylène','plastique','PE','AV'),
	 ('pebd','Pebd','Pebd','plastique','',''),
	 ('pehd','Pehd','Pehd Lisse / type non identifié de Pehd','plastique','',''),
	 ('pehda','Pehd Annelé','pehd Annelé','plastique','',''),
	 ('pex','Polyéthylène Réticulé','polyéthylène réticulé à haute densité (PEX)','plastique','PEX',''),
	 ('plast','Plastique Inconnu','type non identifié de plastiques','plastique','','AY'),
	 ('pp','Polypropylène','polypropylène Lisse','plastique','PP','AW'),
	 ('ppa','Polypropylène Annelé','polypropylène Annelé','plastique','',''),
	 ('prv','Plastiques Renforcé Fibres','plastiques renforcé fibres','plastique','FRP','AL'),
	 ('pu','Polyester','polyester','plastique','','AU'),
	 ('pvc','Pvc','polychlorure de vinyle U rigide tuyaux lisses / type non identifié de PVC','plastique','PVC','AX'),
	 ('pvca','Pvc Annelé','polychlorure de vinyle U rigide tuyaux annelés','plastique','',''),
	 ('pvcbo','Pvc Bi-orienté','polychlorure de vinyle bi-orienté','plastique','',''),
	 ('pvcc','Pvc C','polychlorure de vinyle surchloré','plastique','CPVC',''),
	 ('rpmp','Mortier Renforcé','mortier renforcé de polymères(RPMP)','composite','RPMP',''),
	 ('sgbt','Segment De Béton','segment de béton','assemblage','','AJ'),
	 ('tole','Tôle Galvanisée','tôle galvanisée','métal','galvanizedSteel',''),
	 ('trct','Terre Cuite','terre Cuite','autre','terracota',''),
	 ('nr','Non renseigné(e)','information en recherche ou disponible mais non saisie','autre','','AZ');

