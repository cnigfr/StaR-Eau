---
name: Affleurants
index: 1
style:
    -style.css
---

# affleurants

Les tables sont identiques pour AEP et ASS.

## placement des affleurants
 Cette table permet de répondre à la problématique du **placement de affleurants au dessus des ouvrages**.

_Exemple :_ En assainissement, le tampon d'un regard est rarement à la vertical du nœud de réseau. Ceci implique pour les ouvrages importants, une différence notable (>40cm) entre le tracé du réseau et les affleurants, notamment pour le classement en classe de précision A. Idem en eau potable.

![regard non axial](/images/modele/regard_non_axial.png)

![vertice_affleurant400](/images/modele/affleurants_point.png)

![symbole_affleurant400](/images/modele/affleurants_symbole.png)

Idem en eau potable.

## identifiant PCRS
Les affleurants sont à lier au PCRS, si possible. Peut être basé sur l'identifiant idObjet de la classe ObjetVecteurPCRS, dans le cadre d'un PCRS vecteur.

:::alert{info}

Rappel du PCRS : Les affleurants figurent dans la nomenclature du PCRS en tant qu’objet affleurant. Cette modélisation n’implique pas de lien avec l’objet métier
sous-jacent, cependant elle permet de représenter l’affleurant, et sa géométrie, pour permettre de se localiser sur le terrain. Dans le cadre des
réponses aux DT DICT, les responsabilités respectives des gestionnaires de PCRS et des exploitants de réseaux sont fixés par la réglementation adhoc.

:::

## liens avec les ouvrages
Des liens peuvent être créés avec les ouvrages situés sous l'affleurant. 
- id_emprise : liaison vers la table mère surfacique
- id_canalisation : liaison vers la table mère linéaire
_ id_noeud_reseau : liaiosn vers la table mère ponctuel

# [type]

## plaque
![plaque](https://tpdemain.com/wp-content/uploads/2023/02/031feb9a-10de-4b21-92e0-2b90f69acd16.jpeg)

## tampon
![tampon](https://tpdemain.com/wp-content/uploads/2023/02/d61ef44c-9936-42b6-90eb-1d9d1ab2b12d.jpeg)

## tampon ajouré
![tampon](https://www.soval.fr/wp-content/uploads/2024/07/kantum_grille_d400.jpg) :copyright: source soval

## bouche à clé
![bac](https://tpdemain.com/wp-content/uploads/2023/02/769a033d-b34c-481b-bc20-41e4d2dbfcf6.jpeg)

## engouffrement

![avaloir](https://tpdemain.com/wp-content/uploads/2023/02/a8e3daea-95b6-4d0e-94da-630ec3a1f1e8.jpeg)
![grille](https://tpdemain.com/wp-content/uploads/2023/02/e1f3c908-68fe-4982-a879-3a79925d89a2.jpeg)


source : https://tpdemain.com/module/lidentification-des-affleurants-des-reseaux/
