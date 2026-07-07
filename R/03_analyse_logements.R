# ------------------------------------------------------------
# PHASE 3 — Analyse des données logements
# Objectif : explorer les données INSEE logements
# ------------------------------------------------------------

# Chargement des données logements
log <- read.csv("data/raw/insee_logements/DS_RP_LOGEMENT_PRINC_2023_data.csv", sep = ";")

# Structure du dataset
str(log)

# Résumé global
summary(log)

# Nombre de lignes
nrow(log)

# Aperçu des premières lignes
head(log)
