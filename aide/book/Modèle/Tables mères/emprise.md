---
name: emprise
index: 1
---
# Emprise

Table mère des autres tables surfaciques.

:::alert{warn}
**NE PAS INSCRIRE D’ÉLÉMENTS DIRECTEMENT DANS CETTE TABLE**
:::

Cette table n'a pas vocation à être chargée dans les projets.

Elle comprend les champs communs à toutes les emprises.

# visible

L'emprise est-elle visible, si c'est celle-ci est enterrée ou virtuelle, elle ne sera pas visible. Ceci évite les recherches éventuelles d'ouvrage en surface.

# Relations avec les éléments ponctuels

Une table de relation est prévue entre les emprises (éléments surfaciques) et les nœuds (éléments ponctuels). Les ouvrages sont représentés dans le modèle par une éléments ponctuels afin de garder une cohérence topologique réseau, toutefois, ils peuvent être relié à une emprise afin de matérialiser leur surface réelle. Cette table de relation permet la jointure entre 1 ou plusieurs éléments ponctuels et une surface.
