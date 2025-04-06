---
name: modifier une table
index: 2
---

# Check-list en cas de modification d'une table de la base
:::alert{warn}

Assurez-vous que la modification ne présente pas changement radical avant toutes modications (breaking change). Vérifier les héritages et clés étrangères !!

:::


## créer
- [ ] après discussion, créer la table en vous servant des héritages nécessaires : champ_commun, dimension (optionnel), canalisation, emprise ou noeud_reseau pour la géométrie. SI la table n'est pas fille d'une géométrie ne pas oublier la colonne geom
```
CREATE TABLE ....utiliser un modèle de table existant, en n'oubliant pas les commentaires, le INHERITS
```
:::alert{info}
Vous pouvez aussi créer la table de façon brute directement dans PGAdmin ou Dbeaver, puis ajouter les commentaires, et les clés étrangères (notamment vers les listes de valeurs éventuelles), puis sortir le DDL
:::
- [ ] ajouter le code au fichier sql de développement (actuellement vers_2025).
- [ ] modifier le [changelog_modele.md](https://github.com/cnigfr/StaR-Eau/blob/fabe2ca649438047938589cb866bf66f0aad9066/changelog_modele.md) - __Ajouté__ inidqué la table et les ajouts

## ajouter/modifier
- [ ] pour ajouter un champs, ou modifier un champs
- [ ] modifier dans la base , soit directement dans PgAdmin ou Dbeaver, puis copier les instructions.
```
ALTER TABLE ...
```
- [ ] AJouter des instructions dans le fichier de sql de developpement
- [ ] - [ ] modifier le [changelog_modele.md](https://github.com/cnigfr/StaR-Eau/blob/fabe2ca649438047938589cb866bf66f0aad9066/changelog_modele.md) - __Ajouté__ ou __modifié__ indiqué la table et les ajouts/modifications

## supprimer
- [ ] Assurez-vous que cette table est bien à éliminer, cela peut représenter un **changement radical** et bloqué certains utilisateurs.
- [ ] 

# Dans tous les cas et pour la release

- Exporter les tables en GPKG, modifier les styles QGIS.