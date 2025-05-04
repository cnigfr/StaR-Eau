---
name: Passage en données 3d
index: 5
---

# Information sur le passage en données 3d

:::alert{warn}

Assurez-vous que la modification ne présente pas cde rupture radicale avant toutes modications.

:::

## Choix du système de projection

La différence entre **EPSG:4965** et **EPSG:5698** réside dans leur structure, leur utilisation et la nature des coordonnées qu'ils représentent. Voici une comparaison détaillée :

---

### **1. EPSG:4965 (RGF93-3D)**
- **Type de système** : **Système géographique 3D** (lat/lon/hauteur ellipsoïdale).
- **Composition** :
  - **Horizontal** : Coordonnées géographiques (latitude, longitude) basées sur le référentiel **RGF93** (Réseau Géodésique Français 1993).
  - **Vertical** : Hauteur exprimée par rapport à l'**ellipsoïde GRS80** (hauteur ellipsoïdale).
- **Utilisation principale** :
  - Projets nécessitant des coordonnées 3D précises pour la modélisation géospatiale (ex. SIG, BIM, drones).
  - Compatibilité avec les données GNSS (GPS) qui fournissent des hauteurs ellipsoïdales.
- **Exemple d'applications** :
  - Modélisation de bâtiments en 3D avec des hauteurs issues de levés GPS.
  - Calculs géodésiques précis (distances, angles) sur l'ellipsoïde.

---

### **2. EPSG:5698 (RGF93 / Lambert-93 + NGF-IGN69 height)**
- **Type de système** : **Système composé** (horizontal projeté + vertical gravitaire).
- **Composition** :
  - **Horizontal** : Projection **Lambert-93** (EPSG:2154), un système planimétrique basé sur RGF93.
  - **Vertical** : Altitude orthométrique (hauteur par rapport au géoïde) dans le système **NGF-IGN69**, qui est un référentiel altimétrique français basé sur le niveau moyen de la mer à Marseille.
- **Utilisation principale** :
  - Projets nécessitant des coordonnées planes (X, Y) et des altitudes "réelles" (par rapport au niveau de la mer).
  - Applications topographiques, cartographiques ou techniques (ex. routes, bâtiments, hydraulique).
- **Exemple d'applications** :
  - Cartographie des altitudes en France métropolitaine.
  - Projets d'ingénierie civile où les hauteurs sont mesurées par rapport au géoïde.

---

### **Différences clés**
| Critère | EPSG:4965 | EPSG:5698 |
|--------|------------|------------|
| **Type de coordonnées** | Géographiques 3D (lat/lon/hauteur ellipsoïdale) | Planimétriques (Lambert-93) + altitudes orthométriques (NGF-IGN69) |
| **Référentiel vertical** | Ellipsoïde GRS80 | Géoïde (NGF-IGN69) |
| **Compatibilité** | Systèmes géodésiques globaux (GNSS) | Systèmes locaux français (IGN, cadastre) |
| **Transformation** | Directe avec d'autres systèmes géographiques 3D | Nécessite un modèle de géoïde (ex. RGE Alti) pour convertir les hauteurs |
| **Précision** | Précision géodésique (centimétrique) | Précision topographique (décimétrique) |

---

### **Quand utiliser l'un ou l'autre ?**
- **EPSG:4965** :
  - Pour des projets en 3D nécessitant des hauteurs ellipsoïdales (ex. drones, modélisation 3D).
  - Lorsque vous travaillez avec des données GNSS ou des logiciels de calcul géodésique.
- **EPSG:5698** :
  - Pour des applications topographiques ou cartographiques en France.
  - Lorsque les altitudes doivent être exprimées par rapport au niveau de la mer (ex. hydrologie, urbanisme).

---

### **Conversion entre les deux**
Pour passer de **EPSG:4965** à **EPSG:5698**, il faut :
1. Convertir les coordonnées géographiques 3D (RGF93-3D) en coordonnées Lambert-93 (EPSG:2154).
2. Transformer la hauteur ellipsoïdale en altitude orthométrique via un **modèle de géoïde** (ex. **RGE Alti** de l'IGN).

---

### **Exemple concret**
- **Données GNSS** → EPSG:4965 (hauteurs ellipsoïdales) → Conversion en EPSG:5698 via RGE Alti → Altitudes NGF pour un projet de construction.

En résumé, **EPSG:4965** est un système géographique 3D pur, tandis que **EPSG:5698** est un système composite combinant une projection plane et un référentiel altimétrique local. Le choix dépend des besoins en précision verticale et de la compatibilité avec les données existantes.

__généré par IA__