---
name: Pièce
index: 10
---

# Type de Pièces dans les Réseaux de Canalisations

Dans les réseaux de canalisations, les pièces jouent un rôle crucial en tant qu'éléments de liaison entre les canalisations ou les ouvrages.

Elles comprennent divers accessoires tels que les coudes, les raccords, les cônes, les tés, et les bouchons. Ces pièces peuvent être classées en deux catégories : **topologiques** et **non topologiques**.

# Table de Classification des Pièces

Deux tables sont disponibles pour classer les pièces, notamment la table **aep/ass_piece_hors_topo** qui n'est pas une sous-catégorie de la couche noeud_reseau contrairement à **aep/ass_piece**. 

Cette distinction permet de différencier les pièces qui influent sur le tracé ou l'écoulement des eaux (topologiques) de celles qui n'ont pas d'influence sur ces aspects, en vue de la modélisation ou de la simplification des tracés.

Il est important de noter que le rattachement à un nœud dépend des bases existantes, des pratiques et de la taille des pièces, ce qui explique l'existence et la similarité des 2 tables.

Exemple de Classification des Pièces :
| pièce | plutôt topologique |  |
| ------ | ------ | ------ |
|   coude   | non     |      |
|   raccord   |  non    |      |
|   té  |  oui    |   est forcément à un noeud car 3 canalisations   |
|   cône   |  oui    |  induit un changement de diamètre   |
|   bouchon   |   oui   |   bloque la circulation de l'eau   |

# Rattachement à la Canalisation
Pour les **pièces hors-topologie**, un seul champ permet d'affecter un identifiant de canalisation principale à la pièce. Ce champ est spécifiquement utile pour les pièces hors-topologie qui ne sont reliées à aucun nœud.

En cas de **topologie**, c'est l'identifiant du nœud qui permet les relations. Ainsi, pour les pièces hors-topologie, l'identification de la canalisation à laquelle elles sont rattachées est essentielle pour retrouver toutes les pièces sur cette canalisation.

En résumé, la classification des pièces dans les réseaux de canalisations en tant que topologiques ou non topologiques, ainsi que leur rattachement à la canalisation, sont des éléments clés pour la modélisation et la gestion efficace des réseaux de canalisations.