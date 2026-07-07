library(ggplot2)
library(dplyr)

# ============================================================
# 1. Chargement des données population
# ============================================================

pop <- read.csv("data/raw/insee_population/donnees_communes_deleguees.csv",
                sep = ";",
                header = TRUE,
                stringsAsFactors = FALSE)

# Renommage correct selon TON fichier
pop <- pop %>% 
  rename(
    code_insee = CODCOM,
    nom_commune = Commune,
    population_mun = PMUN,
    population_tot = PTOT
  )

# ============================================================
# 2. Création des dossiers de sortie
# ============================================================

dir.create("outputs", showWarnings = FALSE)
dir.create("outputs/graphiques", showWarnings = FALSE)

# ============================================================
# 3. Graphique 1 — Histogramme population municipale
# ============================================================

g1 <- ggplot(pop, aes(population_mun)) +
  geom_histogram(bins = 30, fill = "#2C7BB6", color = "white") +
  labs(title = "Histogramme de la population municipale",
       x = "Population municipale",
       y = "Nombre de communes") +
  theme_minimal()

ggsave("outputs/graphiques/hist_population_mun.png", g1, width = 8, height = 6)

# ============================================================
# 4. Graphique 2 — Histogramme population totale
# ============================================================

g2 <- ggplot(pop, aes(population_tot)) +
  geom_histogram(bins = 30, fill = "#D7191C", color = "white") +
  labs(title = "Histogramme de la population totale",
       x = "Population totale",
       y = "Nombre de communes") +
  theme_minimal()

ggsave("outputs/graphiques/hist_population_tot.png", g2, width = 8, height = 6)

# ============================================================
# 5. Graphique 3 — Top 10 des communes les plus peuplées
# ============================================================

top10 <- pop %>% 
  arrange(desc(population_tot)) %>% 
  slice(1:10)

g3 <- ggplot(top10, aes(x = reorder(nom_commune, population_tot), y = population_tot)) +
  geom_col(fill = "#FDAE61") +
  coord_flip() +
  labs(title = "Top 10 des communes les plus peuplées",
       x = "Commune",
       y = "Population totale") +
  theme_minimal()

ggsave("outputs/graphiques/top10_population.png", g3, width = 8, height = 6)

# ============================================================
# 6. Graphique 4 — Nuage de points population municipale vs totale
# ============================================================

g4 <- ggplot(pop, aes(population_mun, population_tot)) +
  geom_point(color = "#ABD9E9") +
  labs(title = "Population municipale vs Population totale",
       x = "Population municipale",
       y = "Population totale") +
  theme_minimal()

ggsave("outputs/graphiques/scatter_population.png", g4, width = 8, height = 6)

# ============================================================
# 7. Message final
# ============================================================

print("Graphiques population générés avec succès.")
