#
#// Created: 2024/07/01 05:48:52
#// Last modified: 2024/11/19 18:32:34
#

import os
import psycopg
import csv
from pathlib import Path

# Script permettent de s'affranchir des permissions de lecture serveur de postgresql / nécessite psycopg3

# Informations de connexion à la base de données PostgreSQL
conn_params = {
    'dbname': 'stareau',
    'user': '****',
    'password': '*****',
    'host': '******',
    'port': '5432'
}

# Chemin vers le répertoire contenant les fichiers CSV
script_path = Path(__file__).resolve()
script_directory = script_path.parent
relative_path_to_csv = '../listes valeurs/brutes_avant_import/'
# Combiner le répertoire du script avec le chemin relatif
repertoire_csv = (script_directory / relative_path_to_csv).resolve()


# Connexion à la base de données PostgreSQL
conn = psycopg.connect(**conn_params)

# Commentaires des tables
commentaires_tables = {
    "aep_contenu_canalisation": "aep_contenu_canalisation",
    "aep_etat_ouverture": "aep_etat_ouverture",
    "aep_fonction_branchement": "aep_fonction_branchement",
    "aep_fonction_canalisation": "aep_fonction_canalisation",
    "aep_fonction_point_mesure": "aep_fonction_point_mesure",
    "aep_fonction_pompage": "aep_fonction_pompage",
    "aep_fonction_traitement": "aep_fonction_traitement",
    "aep_fonction_vanne": "aep_fonction_vanne",
    "aep_installation_pompage": "aep_installation_pompage",
    "aep_sens_fermeture": "aep_sens_fermeture",
    "aep_type_appareillage": "aep_type_appareillage",
    "aep_type_captage": "aep_type_captage",
    "aep_type_consigne": "aep_type_consigne",
    "aep_type_desinfection": "aep_type_desinfection",
    "aep_type_piece": "aep_type_piece",
    "aep_type_point_livraison": "aep_type_point_livraison",
    "aep_type_point_mesure": "aep_type_point_mesure",
    "aep_type_pression": "aep_type_pression",
    "aep_type_regulation": "aep_type_regulation",
    "aep_type_reservoir": "aep_type_reservoir",
    "aep_type_ressource": "aep_type_ressource",
    "aep_type_vanne": "aep_type_vanne",
    "ass_code_sandre": "ass_code_sandre",
    "ass_contenu_canalisation": "ass_contenu_canalisation",
    "ass_destination": "ass_destination",
    "ass_fonction_bassin": "ass_fonction_bassin",
    "ass_fonction_branchement": "ass_fonction_branchement",
    "ass_fonction_canalisation": "ass_fonction_canalisation",
    "ass_fonction_equipement": "ass_fonction_equipement",
    "ass_fonction_gestion_epl": "ass_fonction_gestion_epl",
    "ass_fonction_pompage": "ass_fonction_pompage",
    "ass_position": "ass_position",
    "ass_structure_bassin": "ass_structure_bassin",
    "ass_techno_traitement": "ass_techno_traitement",
    "ass_type_bassin": "ass_type_bassin",
    "ass_type_chambre": "ass_type_chambre",
    "ass_type_descente": "ass_type_descente",
    "ass_type_engouffrement": "ass_type_engouffrement",
    "ass_type_equipement": "ass_type_equipement",
    "ass_type_gestion_epl": "ass_type_gestion_epl",
    "ass_type_ouvrage_special": "ass_type_ouvrage_special",
    "ass_type_piece": "ass_type_piece",
    "ass_type_point_collecte": "ass_type_point_collecte",
    "ass_type_point_mesure": "ass_type_point_mesure",
    "ass_type_point_prelevement": "ass_type_point_prelevement",
    "ass_type_pompage": "ass_type_pompage",
    "ass_type_pretraitement": "ass_type_pretraitement",
    "ass_type_raccord": "ass_type_raccord",
    "ass_type_regard": "ass_type_regard",
    "com_etat_service": "com_etat_service",
    "com_forme": "com_forme",
    "com_mode_circulation": "com_mode_circulation",
    "com_mode_lever": "com_mode_lever",
    "com_origine": "com_origine",
    "com_oui_non": "com_oui_non",
    "com_precision": "com_precision",
    "com_raison_pose": "com_raison_pose",
    "com_reference_z": "com_reference_z",
    "com_revetement_interieur": "com_revetement_interieur",
    "com_type_acces": "com_type_acces",
    "com_type_affleurant": "com_type_affleurant",
    "com_type_perimetre": "com_type_perimetre",
    "com_type_pluviometre": "com_type_pluviometre",
    "com_type_pose": "com_type_pose",
    "com_type_protection": "com_type_protection",
    "com_type_reseau": "com_type_reseau",
    "com_type_usager": "com_type_usager",
}

# Parcours des fichiers dans le répertoire
for fichier in os.listdir(repertoire_csv):
    if fichier.endswith('.csv'):
        chemin_fichier = os.path.join(repertoire_csv, fichier)
        nom_table = os.path.splitext(fichier)[0]

        print(' Table : ' + nom_table)

        with conn.cursor() as cursor:
            # Création de la table -- ATTENTION le schema stareau_valeur doit exister!
            if nom_table == "com_materiau":
                create_table_sql = f"""
                CREATE TABLE IF NOT EXISTS stareau_valeur.com_materiau (
                    code TEXT NOT NULL,
                    valeur TEXT NULL,
                    description TEXT NULL,
                    categorie TEXT NULL,
                    stardt TEXT NULL,
                    ref13508 TEXT NULL,
                    CONSTRAINT com_materiau_unique UNIQUE (code)
                );
                COMMENT ON TABLE stareau_valeur.com_materiau IS 'liste des matériaux';
                COMMENT ON COLUMN stareau_valeur.com_materiau.code IS 'identifiant métier';
                COMMENT ON COLUMN stareau_valeur.com_materiau.valeur IS 'valeur';
                COMMENT ON COLUMN stareau_valeur.com_materiau.description IS 'description longue';
                COMMENT ON COLUMN stareau_valeur.com_materiau.categorie IS 'catégorie ou famille de matériau';
                COMMENT ON COLUMN stareau_valeur.com_materiau.stardt IS 'référence à STAR-DT';
                COMMENT ON COLUMN stareau_valeur.com_materiau.ref13508 IS 'référence à la Norme ITV NF EN 13508';
                """
                cursor.execute(create_table_sql)
            else:
                # creation de la table
                create_table_sql = f"""
                CREATE TABLE IF NOT EXISTS stareau_valeur.{nom_table} (
                    code TEXT NOT NULL,
                    valeur TEXT NULL,
                    description TEXT NULL,
                    CONSTRAINT {nom_table}_pk PRIMARY KEY (code)
                );
                """
                cursor.execute(create_table_sql)
                # ajout commentaire de la table
                commentaire = commentaires_tables.get(nom_table,f"Liste de valeurs : {nom_table}")
                cursor.execute(f'COMMENT ON TABLE stareau_valeur."{nom_table}" IS \'{commentaire.replace("'", "''")}\'')

            # Nettoyage de la table en cas de rejeu du script
            clean_table_sql = f"""
            DELETE FROM stareau_valeur.{nom_table};
            """
            cursor.execute(clean_table_sql)

            # Importation des données depuis le fichier CSV

            with open(chemin_fichier, 'r', encoding="utf-8") as f:
                if nom_table == "com_materiau":
                    with cursor.copy(f"""COPY stareau_valeur.{nom_table} (code, valeur, description, categorie, stardt, ref13508)
                        FROM STDIN WITH (FORMAT csv, HEADER false)""") as copy:
                        copy.write(f.read())
                else:
                    with cursor.copy(f"""COPY stareau_valeur.{nom_table} (code, valeur, description) FROM STDIN WITH (FORMAT csv, HEADER false)""") as copy:
                        copy.write(f.read())

                    # Insertion des valeurs supplémentaires
                    additional_values = [
                        ('non_renseigne', 'Non renseigné(e)', 'information en recherche ou disponible mais non saisie'),
                        ('non_concerne', 'Non concerné(e)', 'information non possible ou non pertinente pour l\'élément décrit'),
                        ('non_valide', 'Non validé(e)', 'information existe mais n\'est pas officiellement validée'),
                        ('non_determine', 'Non déterminé(e)', 'information inconnue ou non disponible et ne peut pas l\'être'),
                        ('autre', 'Autre', 'ne figure pas dans la liste ci-dessus. cf. commentaire')
                    ]
                    cursor.executemany(
                        f"INSERT INTO stareau_valeur.{nom_table} (code, valeur, description) VALUES (%s, %s, %s) ON CONFLICT (code) DO NOTHING",
                        additional_values
                    )

        conn.commit()

# Fermeture de la connexion à la base de données
conn.close()
