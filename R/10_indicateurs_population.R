library(dplyr)

# 1. Chargement des données
pop <- read.csv("data/raw/insee_population/donnees_communes_deleguees.csv",
                sep = ";",
                header = TRUE,
                stringsAsFactors = FALSE)

pop <- pop %>% 
  rename(
    code_insee = CODCOM,
    nom_commune = Commune,
    population_mun = PMUN,
    population_tot = PTOT
  )

# 2. Indicateurs statistiques
indicateurs <- list(
  moyenne_population_mun = mean(pop$population_mun, na.rm = TRUE),
  mediane_population_mun = median(pop$population_mun, na.rm = TRUE),
  min_population_mun = min(pop$population_mun, na.rm = TRUE),
  max_population_mun = max(pop$population_mun, na.rm = TRUE),
  moyenne_population_tot = mean(pop$population_tot, na.rm = TRUE),
  mediane_population_tot = median(population_tot <- pop$population_tot, na.rm = TRUE),
  ratio_mun_tot_moyen = mean(pop$population_mun / pop$population_tot, na.rm = TRUE)
)

# 3. Top 10 / Bottom 10
top10 <- pop %>% arrange(desc(population_tot)) %>% slice(1:10)
bottom10 <- pop %>% arrange(population_tot) %>% slice(1:10)

# 4. Classes de population
pop <- pop %>% 
  mutate(
    classe_population = cut(
      population_tot,
      breaks = c(0, 500, 1000, 5000, 10000, 20000, 50000, Inf),
      labels = c("0-500", "500-1000", "1000-5000", "5000-10000",
                 "10000-20000", "20000-50000", "50000+"),
      right = FALSE
    )
  )

# 5. Exports
dir.create("outputs/indicateurs", showWarnings = FALSE)

write.csv(as.data.frame(indicateurs),
          "outputs/indicateurs/indicateurs_population.csv",
          row.names = FALSE)

write.csv(top10,
          "outputs/indicateurs/top10_population.csv",
          row.names = FALSE)

write.csv(bottom10,
          "outputs/indicateurs/bottom10_population.csv",
          row.names = FALSE)

write.csv(pop,
          "outputs/indicateurs/population_classes.csv",
          row.names = FALSE)

print("Indicateurs population générés avec succès.")
