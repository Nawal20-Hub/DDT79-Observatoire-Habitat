
# ------------------------------------------------------------
# PHASE 3 — Analyse des données population
# Objectif : explorer les données INSEE population
# ------------------------------------------------------------

# Chargement des données population
pop <- read.csv("data/raw/insee_population/donnees_communes_deleguees.csv", sep = ";")

# Structure du dataset
str(pop)

# Résumé des variables principales
summary(pop$PMUN)   # Population municipale
summary(pop$PTOT)   # Population totale

# Nombre de lignes
nrow(pop)

# Aperçu des premières lignes
head(pop)
