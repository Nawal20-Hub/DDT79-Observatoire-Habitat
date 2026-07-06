# 07 – Export des résultats du projet DDT79-Observatoire-Habitat

## 1. Objectif de la phase
Cette phase décrit comment exporter les résultats produits par :
- les scripts R,
- les analyses SQL,
- les tableaux issus du SGBD,
- les fichiers finaux destinés à la DDT.

L’objectif est de fournir des exports reproductibles, organisés et faciles à transmettre.

---

## 2. Structure des exports

Les exports sont stockés dans le dossier :

outputs/
│
├── tables/
├── graphiques/
└── indicateurs/


### Détails :
- `tables/` → export CSV des tables communes + logements  
- `graphiques/` → graphiques générés dans R  
- `indicateurs/` → fichiers contenant les indicateurs calculés (densité, taux de résidences principales, etc.)

---

## 3. Export des résultats depuis R

Les exports R sont réalisés via les fonctions :

```r
write.csv(objet, "outputs/tables/nom_du_fichier.csv", row.names = FALSE)
```

Exemples :

3.1 Export de la table population
write.csv(pop, "outputs/tables/population.csv", row.names = FALSE)

3.2 Export de la table logements
write.csv(log, "outputs/tables/logements.csv", row.names = FALSE)

3.3 Export d’un indicateur (exemple : densité)
write.csv(indicateurs, "outputs/indicateurs/indicateurs_communes.csv", row.names = FALSE)

4. Export des résultats SQL
Les exports SQL se font via la commande PostgreSQL :

COPY nom_table
TO '/chemin/vers/fichier.csv'
DELIMITER ';'
CSV HEADER;

Exemples :

4.1 Export de la table communes
COPY communes
TO '/chemin/vers/outputs/tables/communes.csv'
DELIMITER ';'
CSV HEADER;

4.2 Export de la table logements
COPY logements
TO '/chemin/vers/outputs/tables/logements.csv'
DELIMITER ';'
CSV HEADER;

5. Export des graphiques
Les graphiques générés dans R sont exportés via :


ggsave("outputs/graphiques/nom_du_graphique.png", width = 8, height = 6)

Exemples :

5.1 Histogramme population
ggsave("outputs/graphiques/hist_population.png")

5.2 Graphique logements
ggsave("outputs/graphiques/logements.png")

6. Export final pour la DDT
Le dossier final transmis doit contenir :

outputs/
│
├── tables/
│   ├── population.csv
│   ├── logements.csv
│   └── indicateurs_communes.csv
│
├── graphiques/
│   ├── hist_population.png
│   └── logements.png
│
└── indicateurs/
    └── indicateurs_communes.csv
    
7. Conclusion
Cette phase garantit :

- des exports propres,

- des fichiers organisés,

- une reproductibilité totale,

- une transmission simple à la DDT.

Les exports constituent la base pour les phases suivantes : visualisation, rapport final, ou intégration dans un tableau de bord.