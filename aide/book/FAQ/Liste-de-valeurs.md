---
name: Gestion listes de valeurs
index: 1
hide: true
---

# Comment fonctionnent les listes de valeurs ?

## Liste ou domaine de valeurs[^1]

Les listes sont établies suivant 3 entrées.

code | valeur | description

- **code** : le code est l'identifiant de la liste. Il n'a pas été choisi de coder numériquement les listes de valeurs pour 2 raisons :

  * Il est plus lisible, même sans avoir les métadonnées, de lire les données des tables. Dans le cadre d'un échange incomplet, les valeurs peuvent être déduites des codes.
  * la maintenance des listes, l'ajout, suppression ou la personnalisation de liste est facilitée. Exemple, si vous ajoutez une valeur dans la liste, il n'y a pas besoin de se demander si le 12 ou 58 existe déjà, ou de réserver des chiffres pour les modifications futures.
    Si une valeur est retirée, le fait qu'il manque un code, ne vous fait pas vous demander s'il s'agit d'un saut voulu, d'une erreur, de le réutiliser par mégarde, ou être obligé d'indiquer une valeur "supprimée" ou "gelée" dans la valeur et la description
- **valeur** : la valeur est la description courte de la valeur, peut servir pour affichage
- **description** : il s'agit de la définition ou de la description longue de la valeur.

## Personnalisation des listes

Sur la base des listes fournies, vous pouvez personnaliser les listes afin de mieux répondre à vos attentes.

Par exemple, si vous êtes gestionnaire d'eau potable uniquement, vous pouvez retirer des listes communes tous les éléments qui concernent l'assainissement.

Vous pouvez ajouter des valeurs qui sont propres à votre collectivité. Il est toutefois demandé de ne pas modifier les descriptions existantes pour que lors d'échanges, les termes restent identiques. **Ne pas supprimer ou substituer de code avec vos propres valeurs**.

Par ailleurs, si une valeur de portée nationale vient à manquer, merci de nous soumettre votre proposition (question en haut de page) d'ajout en indiquant la valeur, sa description longue, son contexte et son usage.

## Qualification de l'inconnu

Les listes (sauf [com_materiau](Communs/materiau) et com_precision) sont systématiquement complétées avec des valeurs permettant de qualifier l'absence de d'attributs. On évitera de laisser des valeurs vide (NULL) pour éviter le questionnement sur l'existence ou non de la donnée.

Pour cela, sur la base des pratiques IGN, 4 lignes sont systématiquement ajoutées :


|     code     |       valeur       |                             description                             |                                                 _commentaire_                                                 |
| :-------------: | :------------------: | :-------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------: |
| non_renseigne | Non renseigné(e) |       information en recherche ou disponible mais non saisie       |                                     Information est connue mais non saisie                                     |
| non_concerne |  Non concerné(e)  | information non possible ou non pertinente pour l'élément décrit |                                                                                                               |
|  non_valide  |   Non validé(e)   |      information existe mais n'est pas officiellement validée      |                   Information est connue mais doit être validée ou confirmer avant saisie                   |
| non_determine | Non déterminé(e) |    information inconnue ou non disponible et ne peut pas l'être    | Information définitivement inconnue' ceci permet d'éviter la recherche de cette valeur qui n'est atteignable |
|     autre     |       Autre       |       ne figure pas dans la liste ci-dessus. cf. commentaire       |           Sous réserve de place dans le commentaire et pour une valeur vraiment unique ou atypique           |

## Inconvénients des valeurs NULL

* **Complexité des requêtes** : Les comparaisons avec NULL nécessitent l'utilisation de IS NULL ou IS NOT NULL au lieu des opérateurs classiques[3](https://use-the-index-luke.com/fr/sql/la-clause-where/null-dans-la-base-de-donnees-oracle).
* **Impact sur les performances** : L'indexation et le traitement des valeurs NULL peuvent parfois affecter les performances des requêtes.
* **Risques d'erreurs** : Une mauvaise gestion des NULL peut conduire à des résultats inattendus dans les calculs ou les jointures.


[^1]: La liste de valeurs est considérée comme un type simple de domaine, le concept de domaine dans les bases de données est plus riche et offre plus de fonctionnalités pour assurer l'intégrité et la cohérence des données.
