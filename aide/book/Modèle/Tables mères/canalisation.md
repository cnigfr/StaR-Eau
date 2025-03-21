---
name: canalisation
index: 1
---
# canalisation

Table mère des autres tables linéaires. Elle a gardé son nom du RAEPA V1.

:::alert{warn}
**NE PAS INSCRIRE D’ÉLÉMENTS DIRECTEMENT DANS CETTE TABLE**
:::

Cette table n'a pas vocation à être chargée dans les projets.

Elle comprend les champs communs à toutes les canalisations.

## nœud initial et nœud terminal

Ces champs doivent comporter l'identifiant unique noeud_reseau, ceci permet de vérifier la topologie et permettre sa reconstruction si nécessaire.

## matériau

Voir la [page dédiée](/Modèle/materiau)

## mode de circulation

Le mode de circulation détermine comment les eaux se déplace dans la conduite.

Ceci s'applique au conduite d'eau potable et d'assainissement.Dans tous les cas, le mode gravitaire est un déplacement des masses liquides uniquement par la force de la gravité, sans utiliser de machines pour mettre l’eau en pression. Il a toutefois un sens différent suivi le type de réseau.

Le terme refoulement est ici employé pour toute canalisation dont le liquide est mis en pression par un appareil.

Le schéma suivant :

![mode_circulation](https://github.com/user-attachments/assets/ff242bab-0125-4497-9b5e-4514b087ed11)

## type de pose

La liste proposée est issue de France Sans Tranchée Technologies [FSTT](https://www.fstt.org/le-sans-tranchee/#18e031320a5ef347c), à laquelle a été ajouté le type de pose en tranchée ouverte.

Elle recoupe aussi bien les travaux de pose de réseaux neufs, que les travaux de réhabilitation.

## raison de pose

La raison de pose est comme son nom l'indique le "pourquoi" de la pose. Ceci est important pour le calcul des indicateurs et permet de différencier les extensions de réseaux de la réhabilitation ou renouvellement.

## diamètre équivalent

Ce diamètre équivalent ou nominale permet de fixer une seule dimension de conduite, de manière courante et pour faciliter la compréhension, l'exploitation ou le dimensionnement. Ainsi, ici peuvent indiqué indifféremment le diamètre intérieur ou extérieur : on parlera d'un 400 béton ou d'un 200 PVC…

Ce champs sert aussi pour la modélisation ou les calculs, notamment dans le cas d'ovoïde, ou le diamètre équivalent sera le diamètre d'une section circulaire équivalente.

à titre d'exemple ([source](https://travaux-publics.blogspot.com/2012/03/correspondance-des-sections-ovoide_09.html))

| Norme | Diamètre équivalent (mm) |
| :---- | :----------------------- |
| T 100 | 798                      |
| T 130 | 1027                     |
| T 150 | 1161                     |
| T 180 | 1392                     |
| T 200 | 1547                     |

## revêtement intérieur

Le revêtement intérieur correspond soit :

- au revêtement d'un tuyau neuf ayant une couche intérieure. Exemple : tuyaux fonte avec revêtement mortier de ciment
- au revêtement après réhabilitation par technique sans tranchée. Exemple : époxy après chemisage
