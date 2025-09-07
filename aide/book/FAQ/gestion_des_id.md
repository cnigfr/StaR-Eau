---
name: Gestion des identifiants
index: 1
hide: true
---

# Pourquoi autant d'ID et comment cela fonctionne ?

Il existe plusieurs champs d'identifiant dans le modèle.

Le modèle développé pour PostGIS fonctionne en héritage. Cette fonction n'est pas gérée par toutes les bases de données. 

Toutefois, le modèle se veut ouvert à d'autres bases ou fichiers, des identifiants ont donc été créés sur chaque table afin de pouvoir être exportés dans des bases de données ou fichiers qui gèrent en relation les tables. Il a donc été choisi de garder les identifiants des tables filles.

# Dans postgresql/postgis

Aucune autre relation n'est nécessaire. les identifiants spécifiques aux tables filles ne sont donc pas nécessaires. Une table en héritage reçoit l'identifiant de sa table mère.

![relation_heritage](https://github.com/user-attachments/assets/05163017-5a11-4889-a3c2-c6b59eb41962){.rounded width="300"}
![table_fille_heritage](https://github.com/user-attachments/assets/16384ab2-1659-431f-89a9-f72aa2eaa402){.rounded width="300"}

# Dans une base sans héritage disponible
Il y a  trois manières différentes de traduire une relation d’héritage :

* L’héritage par référence ;
* L’héritage par classe mère ;
* L’héritage par classes filles.

## Héritage par référence

Dans notre cas, il faut que chaque table fille contienne les identifiants des tables mères. On voit ici l’intérêt de conserver les identifiants, le choix a été fait de les proposer dans le standard afin de normaliser leur noms.

exemple avec les canalisation AEP (_à titre d'exemple, les champs et tables peuvent varier dans le modèle réel_)
![modele_avec_pk](https://github.com/user-attachments/assets/7d86758e-7e74-4154-bba6-abfe569439dd){.rounded width="300"}

## Héritage par classe mère

Tous les attributs de la table fille sont reportées dans la classe mère.

Dans le modèle présent, cela voudrait dire que la classe noeud récupère les attributs de toutes les tables. Ceci est juste impossible à gérer dans notre cas de figure. Exemple d'une table noeud avec quelques tables filles !!

![table_mere_avectousattributs](https://github.com/user-attachments/assets/1f1f1382-8ff9-42b7-93e6-ebdc0704247f){.rounded width="300"}

## Héritage par classe fille

Ici les attributs des classes mères sont ajoutés à la table fille. C'est ce qui se passe lors de l'export en geopackage (ou autre) des tables de la base. Les identifiants sont aussi sauvegardés.

> [!important]
> Une modification des geopackage est possible pour ne fournir qu'une seul identifiant (fid ou id_canalisation dans l'exemple suivant)

![heritage_des_tables](https://github.com/user-attachments/assets/92c1c568-b339-439b-ba5e-f386cedf6b28){.rounded width="300"}

# Conservation des id_nom_table

Ainsi, chaque table conserve un id_nom_table afin de

- permettre un identifiant métier
 de la table
- permettre la gestion d'une relation entre les éléments
- permettre de conserver les identifiants existants des bases déjà en place
- certains logiciels n'acceptent pas de table sans clé primaire.
- il faut penser aux relations avec d'éventuelles autres bases de données non SIG.

# gestion numérique ou ?
Par ailleurs, dans les scripts SQL POSTGRESQL/POSTGIS, les identifiants sont rédigés de 3 façons afin de laisser les administrateur de base choisir (commenter ou dé-commenter la ligne dans le script).
En geopackage, un FID entier est ajouté par défaut.

**Pour d'autres bases, merci de laisser votre contribution.**

> id_xxxxx text NOT NULL DEFAULT gen_random_uuid(), 
> pour POSTGRESQL >= version 13 créé un uuid par défaut
>
>id_xxxxx text NULL
> permet de récupérer un identifiant d'une base existante, peut mis en integer si besoin. Pensez à modifier la séquence de numérotation si voulez le conserver en numérotation automatique.
>
>id_xxxxx INT GENERATED ALWAYS AS IDENTITY, 
> id numerique à numérotation auto partant de 1 (pour création d'une base vierge par exemple)