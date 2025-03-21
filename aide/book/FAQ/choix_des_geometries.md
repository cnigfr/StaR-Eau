---
name: Choix des géométries
index: 1
hide: true
---

# Pourquoi des géométries simples ?

Choix des types "simples" au lieu de géométries "multi". Exemple avec les polygones, valable aussi pour **point/multipoint, ligne/multipligne**

## Polygones

Un polygone est une forme géométrique fermée à deux dimensions définie par un ensemble ordonné de coordonnées x,y[1].

**Avantages :**

- Représentation simple d'une zone continue unique
- Facile à manipuler et à éditer
- Chargement et affichage plus rapides
- Topologie plus propre

**Inconvénients :**

- Ne peut représenter qu'une seule zone continue
- Limité pour des géométries complexes ou discontinues

## Multipolygones

Un multipolygone est une collection de plusieurs polygones, qui peuvent être disjoints, se chevaucher ou être imbriqués[1][3].

**Avantages :**

- Peut représenter des géométries complexes et discontinues
- Utile pour des entités composées de plusieurs zones séparées
- Plus flexible pour modéliser certains types d'objets du monde réel

**Inconvénients :**

- Plus difficile à manipuler et éditer
- Chargement et affichage plus lents
- Peut compliquer certaines analyses spatiales

## Quel type choisir ?

Le choix dépend principalement de la nature des données à représenter :

- Utilisez des polygones simples pour des zones continues uniques comme des parcelles, des lacs ou des bâtiments[1].
- Optez pour des multipolygones dans les cas suivants :

  - Entités composées de plusieurs zones non contiguës (ex: archipel)
  - Objets avec des trous ou des enclaves
  - Besoin de regrouper logiquement plusieurs polygones[2][3]

En règle générale, privilégiez les polygones simples quand c'est possible pour des raisons de performance et de simplicité. N'utilisez les multipolygones que lorsque c'est nécessaire pour représenter fidèlement la géométrie[4].

Il est important de noter que depuis QGIS 3, les shapefiles sont par défaut considérés comme pouvant contenir des géométries multi-parties, même si ce n'est pas explicitement spécifié[4]. Cela peut avoir un impact sur certains outils d'analyse, il faut donc en tenir compte lors du choix du format et du type de géométrie.

Citations:
[1] https://mapscaping.com/polygons-vs-multipolygons-in-gis/
[2] https://3dstudio.co/fr/low-and-high-poly-modeling/
[3] https://learn.microsoft.com/fr-fr/sql/relational-databases/spatial/multipolygon?view=sql-server-ver16
[4] https://georezo.net/forum/viewtopic.php?id=114689
[5] http://www.postgis.fr/chrome/site/docs/workshop-foss4g/doc/geometries.html
[6] https://stackoverflow.com/questions/42420762/what-are-the-pros-and-cons-of-multiple-rows-of-polygon-vs-one-multipolygon-field
[7] https://learn.microsoft.com/fr-fr/kusto/query/geo-polygon-simplify-function?preserve-view=true&view=azure-data-explorer
