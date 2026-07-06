# Phase 4 – Schéma du SGBD

## 4.1. Objectif
Construire un schéma minimal permettant d’intégrer :
- les populations des communes déléguées,
- les résidences principales.

## 4.2 – Définition des tables du SGBD

Le SGBD est construit à partir des deux jeux de données réellement disponibles :

- `donnees_communes_deleguees.csv` (INSEE – populations)
- `DS_RP_LOGEMENT_PRINC_2023_data.csv` (INSEE – résidences principales)

Deux tables suffisent pour un observatoire minimal : **communes** et **logements**.

---

### Table : communes

| Colonne           | Type        | Description                           |
|-------------------|-------------|---------------------------------------|
| code_insee        | VARCHAR(10) | Code INSEE de la commune (CODCOM)     |
| nom_commune       | VARCHAR(255)| Nom de la commune (COM)               |
| population_mun    | INTEGER     | Population municipale (PMUN)          |
| population_tot    | INTEGER     | Population totale (PTOT)              |

**Clé primaire :** `code_insee`

---

### Table : logements

Cette table est construite à partir du fichier logement INSEE RP 2023, filtré sur :

- `RP_MEASURE = DW_MAIN` (résidences principales)
- `TIME_PERIOD = 2023`

| Colonne             | Type        | Description                           |
|---------------------|-------------|---------------------------------------|
| code_insee          | VARCHAR(10) | Code INSEE (CODGEO)                   |
| nb_res_principales  | INTEGER     | Nombre de résidences principales (OBS_VALUE) |
| annee               | INTEGER     | Année de référence (TIME_PERIOD)      |

**Clé étrangère :** `code_insee` → `communes(code_insee)`

---

### Relation entre les tables

COMMUNES (1) ───────────< LOGEMENTS (N)

Une commune peut avoir plusieurs enregistrements de logements (plusieurs années), mais dans ce projet nous utilisons uniquement l’année **2023**, ce qui donne une relation 1‑à‑1 dans la pratique.

## 4.3 – Schéma physique SQL (PostgreSQL)

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

-- code SQL ici
```

