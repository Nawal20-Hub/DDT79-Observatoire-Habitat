-- Import théorique des données INSEE dans PostgreSQL

-- 1. Import des communes
-- Le fichier source est : data/raw/insee_population/donnees_communes_deleguees.csv

COPY communes(code_insee, nom_commune, population_mun, population_tot)
FROM 'C:\Users\HP\Desktop\DDT79-Observatoire-Habitat\DDT79-Observatoire-Habitat\DDT79-Observatoire-Habitat\data\raw\insee_population'
DELIMITER ';'
CSV
HEADER;

-- 2. Import des logements
-- Le fichier source est : data/raw/insee_logements/DS_RP_LOGEMENT_PRINC_2023_data.csv
-- On importe uniquement les résidences principales (DW_MAIN) pour l'année 2023

COPY logements(code_insee, nb_res_principales, annee)
FROM 'C:\Users\HP\Desktop\DDT79-Observatoire-Habitat\DDT79-Observatoire-Habitat\DDT79-Observatoire-Habitat\data\raw\insee_logements'
DELIMITER ';'
CSV
HEADER;
