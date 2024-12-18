> [!caution]
> Vous utilisez ces fichiers à vos risques et périls

# Liste de valeurs
Les listes commençant par :

 - **ass** concernent les tables ASSAINISSEMENT et EAUX PLUVIALES
 - **aep** concernent les tables EAU POTABLE
 - **com** concernent les tables communes ou des valeurs communes à ASS et AEP
Le nom est ensuite celui du champ concerné dans la table. :joy:

# Répertoire des listes de valeurs

- en .csv
- UTF-8
- sans en-tête (compatible QGIS) --> dans liste complète (avec les champs communs de renseignements)

# Schéma de création de liste dans les répertoires
Les listes "brutes_avant_import" servent de base aux imports Postgis grâce au script présent dans [base postgis - utilitaire](https://github.com/cnigfr/StaR-Eau/tree/main/Standard%20StaR-Eau/base%20postgis/utilitaire)

> [!important]
> **Les listes à modifier en priorité sont celles de «brutes_avant_import»**

1. «brutes_avant_import» --> script import Postgis (prend le répertoire brutes_avant_import, ajoutes les valeurs "autres" et import dans Postgresql directement (paramètres à régler dans le fichier)
2. listes complètes sont un export de Postgresql

# création __sans python__

il existe un script .sql qui crée les tables vides des listes dans postgresql (création générée par script depuis le répertoire «brutes_avant_import"), il faut ensuite importer les valeurs depuis les .csv «listes complètes» dans la base.
