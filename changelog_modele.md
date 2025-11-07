# Changelog - Journal des modifications

// Last modified: 2025/11/08 00:10:21

Tous les changements notables du modèle sont listés ici. Merci de respecter la format.
Le format de ce fichier est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/)

## [Unreleased] - En cours

### Added - Ajouté

- ajout des champs cunette et decantation dans **ASS_REGARD**
- ajout d'un champ grandeur_consigne et de la liste associée dans **AEP_REGULATION**
- ajout dans la table aep_vanne_branchement du champ position et liste associée **AEP_POSITION_VANNE**

### fixed - Corrigé

### Changed - Changé

- modification pour uniformisation des termes incluant les cotes NGF de points : remplacement de *z_* par *cote_* dans **ass_canalisation**,**ass_regard**,**ass_canalisation_branchement**,**ass_point_collecte**
- modification pour cohérence du terme *profondeur* dans **ass_point_collecte**
- *ref_reservoir* de **aep_canalisation** devient NULLABLE

### Removed - Retiré

### deprecated - déprécié

## [V2024] - 2024-12-10

Version de base (ou 1.0.0). Point de départ du changelog.

[unreleased]: https://github.com/cnigfr/StaR-Eau/compare/v2024...HEAD
[V2024]: https://github.com/cnigfr/StaR-Eau/compare/V2024...AC_juin_2024
