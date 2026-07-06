# Structure finale du dépôt — Phase‑12

DDT79-Observatoire-Habitat/
│
├── data/                       # Données sources
│   ├── insee/
│   ├── ign/
│   └── communales/
│
├── R/                          # Scripts R
│   ├── 01_import_clean.R
│   ├── 02_jointures.R
│   ├── 03_indicateurs_population.R
│   ├── 04_graph_population.R
│   └── utils.R
│
├── sql/                        # Requêtes SQL
│   ├── population.sql
│   ├── logements.sql
│   └── indicateurs.sql
│
├── outputs/
│   ├── indicateurs/            # CSV indicateurs
│   └── graphiques/             # PNG graphiques
│
├── docs/
│   ├── 11_rapport_population.Rmd
│   ├── 11_rapport_population.html
│   └── 12_livrable_final.md
│
└── README.md