# Changelog - Journal des modifications - liste de valeurs
// Last modified: 2025/11/12 18:31:41

Tous les changements notables dans **les listes de valeurs** sont listés ici. Merci de respecter la format.
Le format de ce fichier est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/)

Les modifications de liste s'appliquent dans le répertoire "brutes avant import", les listes complètes seront générées aux releases.

## [Unreleased] - En cours

### Added - Ajouté
- Dans la liste __aep_fonction_point_mesure__ : prélèvement
- Dans la liste __aep_fonction_branchement__ : fourniture
- création de la liste __aep_grandeur_consigne__ : pression, débit, vitesse, niveau
- création de la liste __aep_position_vanne__ : verticale, horizontale

### Changed - Changé
- Dans la liste __aep_fonction_branchement__ : purge -> purge/vidange
- Dans la liste __aep_fonction_vanne__ : purge -> purge/vidange
- Dans la liste __aep_type_appareillage__ : purge -> purge automatique
- suppression de la référence **ACD** dans les codes materiau norme de __com_materiau__ pour une meilleure compatibilité avec les fichiers ITV.

### Removed - Retiré
- Dans la liste __aep_fonction_branchement__ :vidange, livraison
- Dans la liste __aep_fonction_vanne__ : sans fonction

## [V2024] - 2024-12-10
Version de base (ou 1.0.0). Point de départ du changelog.

[unreleased]: https://github.com/cnigfr/StaR-Eau/compare/v2024...HEAD
[V2024]: https://github.com/cnigfr/StaR-Eau/compare/V2024...AC_juin_2024
