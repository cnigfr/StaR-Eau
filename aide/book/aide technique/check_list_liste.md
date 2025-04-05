---
name: modifier Liste de valeurs
index: 1
---

# Check-list en cas de modification des listes de valeurs

## créer
- [ ] dans le répertoire "liste brute", créer un fichier .csv : nom conforme au standard, pas d'entête, UTF-8. Vous pouvez aussi utilisez Libreoffice Calc, ou utilisez un fichier existant comme exemple.
```
"code","valeur","description"
```
- [ ] importer la liste avec le script **/Fichiers techniques/base postgis/09-script_creation_liste_valeurs.py**(attention toutes les listes sont réimportées)
- [ ] exporter la table de la base en csv dans les listes complètes (via PgAdmin ou Dbeaver...) **NOTA** : si vous partez d'une liste complète comme fichier source, sautez cette étape.
- [ ] modifier le [changelog_liste_valeurs.md](https://github.com/cnigfr/StaR-Eau/blob/fabe2ca649438047938589cb866bf66f0aad9066/changelog_liste_valeurs.md) - __Ajouté__

## ajouter/modifier
- [ ] Dans le fichier à modifier du répertoire "liste brute", ajouter la ligne à l'endroit désiré
```
"code","valeur","description"
```
- [ ] importer la liste avec le script **/Fichiers techniques/base postgis/09-script_creation_liste_valeurs.py**(attention toutes les listes sont réimportées)
- [ ] exporter la table de la base en csv dans les listes complètes (via PgAdmin ou Dbeaver...) **NOTA** : si vous partez d'une liste complète comme fichier source, sautez cette étape.
- [ ] modifier le [changelog_liste_valeurs.md](https://github.com/cnigfr/StaR-Eau/blob/fabe2ca649438047938589cb866bf66f0aad9066/changelog_liste_valeurs.md)- __Ajouté__ ou __changé__

## supprimer
- [ ] Dans le fichier à modifier du répertoire "liste brute", couper (ctrl+x) la ligne à supprimer. Attention à ne pas laisser de ligne vide.
- [ ] importer la liste avec le script **/Fichiers techniques/base postgis/09-script_creation_liste_valeurs.py**(attention toutes les listes sont réimportées)
- [ ] exporter la table de la base en csv dans les listes complètes (via PgAdmin ou Dbeaver...) **NOTA** : si vous partez d'une liste complète comme fichier source, sautez cette étape.
- [ ] modifier le [changelog_liste_valeurs.md](https://github.com/cnigfr/StaR-Eau/blob/fabe2ca649438047938589cb866bf66f0aad9066/changelog_liste_valeurs.md) - __retiré__ coller la ligne supprimée pour mémoire.
