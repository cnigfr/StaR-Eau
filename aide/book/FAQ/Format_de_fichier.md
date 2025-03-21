---
name: Format des fichiers
index: 1
hide: true
---

# Pourquoi ne pas fournir de gabarit ou le modèle en .shp ?

La réponse est fourni directement par ESRI sur les limitations du format .shp

https://desktop.arcgis.com/fr/arcmap/latest/manage-data/shapefiles/geoprocessing-considerations-for-shapefile-output.htm

>Quand utiliser un autre format (que le .shp) ?
>
>A l'exception des cas notés ci-dessous, les fichiers de formes sont acceptables pour le stockage de géométries d'entité simples. Ils entraînent toutefois des problèmes graves avec les attributs. Par exemple : ils ne peuvent pas stocker de valeurs Null, ils arrondissent les nombres, ils présentent une prise en charge médiocre des chaînes de caractères Unicode, ils restreignent les noms de champ à 10 caractères et ils ne peuvent pas stocker l'heure dans un champ de date. Il s'agit là uniquement des problèmes principaux. Ils ne prennent par ailleurs pas en charge certaines fonctionnalités qui figurent dans les géodatabases, comme les domaines et les sous-types. 
>
>**Il est donc recommandé de ne pas utiliser de fichiers de formes, sauf en cas d'attributs très simples n'exigeant pas de fonctionnalités de géodatabase.**