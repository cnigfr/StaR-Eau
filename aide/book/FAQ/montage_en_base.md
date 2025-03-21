---
name: Différents montages en base
index: 1
hide: true
---
# Comment utiliser les tables 'mère' et monter différentes bases de données ?

# Les différentes façons de concevoir la base "StaR-Eau"

Suivant les gestions techniques ou politiques de gestion de base des différents maîtres d'ouvrage ou gestionnaires, le montage en base de données peut revêtir plusieurs possibilités que le standard tente de satisfaire.
Le découpage des fichiers sql d'aide à la création d'une base Postgis doivent permettre les différentes solutions.

# Gestion différenciée
## Eau Potable seule
### Service sans la gestion des branchements
ou avec une gestion différenciée des branchements
Le montage ne comporte alors que les tables mères, communes, et les schéma assainissement

![d_montage_base](images/modele/d_montage_base.png)

On peut aussi faire la même chose pour un service qui ne gère que les branchements

![c_montage_base](images/modele/c_montage_base.png)

### Service AEP réseau et branchements
Sans doute le plus courant, il existe toutefois 2 possibilités :
1. reprendre les montages ci-dessus en créant 2 bases, ou en renommant les tables mères (exemple : noeud_reseau --> noeud_branchement ou noeud_reseau_brcht...).
2. utiliser les mêmes tables mères.

![b_montage_base](images/modele/b_montage_base.png)

## Assainissement seul
Comme pour l'AEP
### Service sans la gestion des branchements
ou avec une gestion différenciée des branchements

![g_montage_base](images/modele/g_montage_base.png)

que les branchements :

![f_montage_base](images/modele/f_montage_base.png)

### Service ASS réseau et branchements

![e_montage_base](images/modele/e_montage_base.png)

# gestion combinée

Il peut exister aussi la possibilité de créer un service complet eau et assainissement, qui combine les possibilités ci-dessus, tout en permettant aussi d'avoir des tables mères totalement communes. Le modèle dans base_postgis est monté comme cela pour ne pas surcharger les possibilités dans les fichiers et pour des facilités de modification du modèle.

Les tables mères peuvent être communes à toutes les tables.

![a_montage_base](images/modele/a_montage_base.png)

On peut aussi réaliser toutes les combinaisons intermédiaires (que réseau avec tables mères communes, que branchement avec table communes, tables mère communes pour réseau et autre tables mère pour les branchements...).

# avantages et inconvénients des montages
Le montage incluant les tables mères identiques permet de mieux gérer les relations entre les éléments hors topographie, cela crée des tables plus légères, facilite l'exportation. Cela peut nécessité la redondance des listes de valeurs communes.

Toutefois, les montages incluant les mêmes tables mères pour toutes les tables peut créer une surcharge, un requêtage et une extraction moins simple.

Il n'y a toutefois aucune obligation et le choix reste de la responsabilités du gestionnaire de la base ou des possibilités techniques.

