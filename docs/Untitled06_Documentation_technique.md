# 06 – Documentation technique du projet DDT79-Observatoire-Habitat

## 1. Structure du projet

Le projet est organisé selon une architecture standard pour les projets Data :

DDT79-Observatoire-Habitat/
│
├── data/
│   ├── raw/
│   │   ├── insee_population/
│   │   └── insee_logements/
│   └── metadata/
│
├── docs/
│   ├── 01_Analyse_du_besoin.md
│   ├── 03_Analyse_des_donnees.md
│   ├── 04_Schema_SGBD.md
│   └── 06_Documentation_technique.md
│
├── R/
│   ├── 03_analyse_population.R
│   └── 03_analyse_logements.R
│
├── sql/
│   ├── 01_create_tables.sql
│   └── 02_import_theorique.sql
│
└── README.md


---

## 2. Jeux de données utilisés

### 2.1 Population (INSEE)
Fichier : `donnees_communes_deleguees.csv`  
Colonnes principales :
- `CODCOM` : code INSEE  
- `COM` : nom de la commune  
- `PMUN` : population municipale  
- `PTOT` : population totale  

### 2.2 Logements (INSEE RP 2023)
Fichier : `DS_RP_LOGEMENT_PRINC_2023_data.csv`  
Colonnes principales :
- `CODGEO` : code INSEE  
- `OBS_VALUE` : nombre de résidences principales  
- `TIME_PERIOD` : année  
- `RP_MEASURE = DW_MAIN` : résidences principales  

---

## 3. Scripts R utilisés

### 3.1 Analyse population
Fichier : `R/03_analyse_population.R`  
Fonctions principales :
- `read.csv()`  
- `str()`  
- `summary()`  
- `nrow()`  
- `colSums(is.na())`

### 3.2 Analyse logements
Fichier : `R/03_analyse_logements.R`  
Fonctions principales :
- `read.csv()`  
- `str()`  
- `summary()`  
- `nrow()`  
- `colSums(is.na())`

---

## 4. Schéma SGBD

### 4.1 Table communes
| Colonne | Type | Description |
|--------|------|-------------|
| code_insee | VARCHAR(10) | Code INSEE |
| nom_commune | VARCHAR(255) | Nom |
| population_mun | INTEGER | PMUN |
| population_tot | INTEGER | PTOT |

Clé primaire : `code_insee`

### 4.2 Table logements
| Colonne | Type | Description |
|--------|------|-------------|
| code_insee | VARCHAR(10) | Code INSEE |
| nb_res_principales | INTEGER | OBS_VALUE |
| annee | INTEGER | TIME_PERIOD |

Clé étrangère : `code_insee → communes(code_insee)`

---

## 5. Schéma physique SQL

```sql
CREATE TABLE communes (
    code_insee VARCHAR(10) PRIMARY KEY,
    nom_commune VARCHAR(255),
    population_mun INTEGER,
    population_tot INTEGER
);

CREATE TABLE logements (
    code_insee VARCHAR(10),
    nb_res_principales INTEGER,
    annee INTEGER,
    FOREIGN KEY (code_insee) REFERENCES communes(code_insee)
);
```

## 6. Import théorique PostgreSQL

COPY communes(code_insee, nom_commune, population_mun, population_tot)
FROM '/chemin/vers/donnees_communes_deleguees.csv'
DELIMITER ';'
CSV
HEADER;

COPY logements(code_insee, nb_res_principales, annee)
FROM '/chemin/vers/DS_RP_LOGEMENT_PRINC_2023_data.csv'
DELIMITER ';'
CSV
HEADER;

## 7. Conclusion technique

Le projet est structuré pour permettre :

une analyse R reproductible,

un schéma SGBD minimal mais cohérent,

un import PostgreSQL simple,

une documentation claire pour tout nouveau collaborateur.
