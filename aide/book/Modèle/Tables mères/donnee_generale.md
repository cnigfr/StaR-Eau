---
name: donnees_generales
index: 4
---
# Données générales

Table mère des données communes à toutes les tables.

:::alert{warn}
**NE PAS INSCRIRE D’ÉLÉMENTS DIRECTEMENT DANS CETTE TABLE**
:::

Cette table n'a pas vocation à être chargée dans les projets.

---

# Champ fictif

Ce champ présent dans toutes les tables permet d'établir si l'élément est fictif ou virtuel. Cela peut être le cas pour un cheminement complexe de canalisation dans une installation, mais dont la représentation est symbolique et permet la continuité hydraulique. voir aussi [déversoir d'orage](/FAQ/deversoir_orage)

![cana fictive dans un ouvrage](images/modele/cana_fictive1.png)

---

# Gestion des dates

![gestion des dates](images/modele/gestion_des_dates.png)

---

# localisation

Ce champ, volontairement large, permet de stocker une information de localisation, il est conseillé de saisir :
* le nom de la rue, 
* le [code TOPO] (https://data.economie.gouv.fr/explore/dataset/topo-fichier-des-entites-topographiques/)
* le [code FANTOIR ou appelé encore code RIVOLI](https://adresse.data.gouv.fr/fantoir), _(le code TOPO doit être privilégié)_
* une [adresse précise (ou une référence BAN)](https://adresse.data.gouv.fr/donnees-nationales) dans le cas d'un ouvrage ou d'un élément ponctuel situé dans un lieu avec adresse.
* une autre idée peut-être d'utiliser un geocodage type [open location](https://fr.wikipedia.org/wiki/Open_Location_Code) ou [geohash](https://fr.wikipedia.org/wiki/Geohash) mais la lecture directe n'est pas possible.

On évitera les éléments du type : en façade, sous voirie… dans ce champ.

---

# Maître d'ouvrage, exploitant et entreprise

Il vous appartient de dresser vos propres listes. Il est toutefois conseillé d'utiliser le **code siren ou siret** pour un tracé plus précis.

Avec le code SIREN ou SIRET, vous pouvez interroger directement la [base SIRENE de l'INSEE](https://www.sirene.fr/sirene/public/recherche) en bénéficiant des informations depuis 1973. Le siret sera plus précis, notamment pour les entreprises.

exemple :

- 242600314 - identifie Brest Métropole
- 24290031400087 - identifie précisément le service assainissement de Brest Métropole
- 24290031400095 - identifie précisément le service d'eau de Brest Métropole

La base est, de plus, téléchargeable pour constituer une liste de valeurs.

---

# Origine création ou mise à jour

**Cette liste est en discussion**
Elle a été établie sur 2 critères : source de la donnée et méthode de collecte et suivant 3 critères : **fiable**, **peu fiable**, **non fiable** ou inexistant(e)

| code                | valeurs                    | description                                     | source                           | collecte                           |
| ------------------- | -------------------------- | ----------------------------------------------- | -------------------------------- | ---------------------------------- |
| recolement_certifie | récolement certifié        | Récolement certifié – géomètre                  | source fiable                    | collecte fiable                    |
| recolement_ancien   | Récolement ancien          | Récolement sans lever topo ou ancien            | source fiable                    | collecte peu fiable                |
| projet_certifie     | Projet vérifié ou certifié | Plan ou projet -réalisé et vérifié              | source peu fiable                | collecte fiable                    |
| plan_realisation    | Plan réalisation           | Récolement, plan, projet vérifié mais non lever | source fiable                    | collecte non fiable ou inexistante |
| croquis_certifie    | Croquis vérifié            | Croquis/mémoire – fait immédiatement et vérifié | source non fiable ou inexistante | collecte fiable                    |
| plan_non_verifie    | Plan non vérifié           | Plan ou projet non vérifié ou connu             | source peu fiable                | collecte non fiable ou inexistante |
| croquis             | Croquis                    | Croquis/mémoire – à posteriori                  | source non fiable ou inexistante | collecte peu fiable                |
| non_fiable          | Source non vérifiée        | Source inconnue et non vérifiée                 | source non fiable ou inexistante | collecte non fiable ou inexistante |
