---
name: piezometre
index: 10
---
# Piézomètre

## référence BSS

La référence vient du BRGM, est de type : 
* BSS000VHWC

ou

* 02761X0032/PZ.

Ceci permet l'accès aux fiches, par exemple :
* dossier infoterre
	* http://ficheinfoterre.brgm.fr/InfoterreFiche/ficheBss.action?id=BSS000VHWC

* fiche ADES
	* https://ades.eaufrance.fr/Fiche/PtEau?Code=02761X0032/PZ

* ou au mesure de nappe
	* https://ades.eaufrance.fr/Fiche/PtEau?Code=02761X0032/PZ#mesures

***

:::alert{tinfo}
Une [action QGIS](https://docs.qgis.org/3.34/fr/docs/user_manual/working_with_vector/vector_properties.html#defining-actions) peut être créée pour ouvrir automatiquement les fiches grâce aux liens du type : 

`https://ades.eaufrance.fr/Fiche/PtEau?Code=[%ref_bss%]` si du type 02761X0032/PZ

`http://ficheinfoterre.brgm.fr/InfoterreFiche/ficheBss.action?id=[%ref_bss%]` si du type BSS000VHWC
:::
