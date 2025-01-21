#
#// Created: 2024/07/01 05:48:52
#// Last modified: 2024/11/19 18:32:34
#

import os
import psycopg
import csv

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
repertoire_csv = '/*********/Reseaux-eaux/Standard StaR-Eau/listes valeurs/brutes_avant_import/'

# Connexion à la base de données PostgreSQL
conn = psycopg.connect(**conn_params)

# Parcours des fichiers dans le répertoire
for fichier in os.listdir(repertoire_csv):
    if fichier.endswith('.csv'):
        chemin_fichier = os.path.join(repertoire_csv, fichier)
        nom_table = os.path.splitext(fichier)[0]

        with conn.cursor() as cursor:
            # Création de la table -- ATTENTION le schema stareau_valeur doit exister!
            create_table_sql = f"""
            CREATE TABLE IF NOT EXISTS stareau_valeur.{nom_table} (
                code TEXT NOT NULL,
                valeur TEXT NULL,
                description TEXT,
                CONSTRAINT {nom_table}_pk PRIMARY KEY (code)
            );
            """
            cursor.execute(create_table_sql)

            # Importation des données depuis le fichier CSV
            with open(chemin_fichier, 'r', encoding="utf-8") as f:
                with cursor.copy(f"COPY stareau_valeur.{nom_table} (code, valeur, description) FROM STDIN WITH (FORMAT csv, HEADER false)") as copy:
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