# PHASE 3 — Analyse des données

## 1. Analyse des données population

### Nombre de lignes
Le fichier `donnees_communes_deleguees.csv` contient :

- **`r nrow(pop)` lignes** (communes déléguées)

### Variables importantes
- **CODCOM** : code commune déléguée  
- **PMUN** : population municipale  
- **PTOT** : population totale  
- **NOMCOM** : nom de la commune  
- **DEP** : département  
- **EPCI** : intercommunalité (si présent)

### Observations
- La population municipale varie fortement selon les communes.  
- La population totale est très proche de la population municipale (écarts faibles).  
- Les données sont adaptées à la construction d’indicateurs population (top/bottom, classes, histogrammes).

---

## 2. Analyse des données logements

### Nombre de lignes
Le fichier `DS_RP_LOGEMENT_PRINC_2023_data.csv` contient :

- **`r nrow(log)` lignes** (logements principaux)

### Variables importantes
- **CODCOM** : code commune  
- **NB_LOG** : nombre de logements  
- **NB_RP** : résidences principales  
- **NB_RSEC** : résidences secondaires  
- **NB_VAC** : logements vacants  
- **NB_MAISON / NB_APPART** : typologie des logements  
- **NB_PIECES** : nombre de pièces

### Observations
- Les données permettent d’étudier la structure du parc de logements.  
- Elles sont adaptées à la construction d’indicateurs logement (vacance, typologie, résidences principales).

---

## 3. Limites des données

### Population
- Pas de géométrie (pas de polygones de communes).  
- Pas de données DVF (transactions immobilières).  
- Pas de données IRIS (niveau infra-communal).

### Logements
- Pas de géométrie.  
- Pas de données sur les loyers ou prix immobiliers.  
- Pas de données sur les caractéristiques énergétiques.

---

## 4. Conclusion

Cette phase d’analyse confirme que :

- Les données population et logements sont **propres**, **exploitables**, **structurées**.  
- Elles permettent de construire les indicateurs nécessaires aux phases suivantes.  
- Les limites identifiées seront compensées par l’ajout futur de données géographiques (IGN, EPCI, communes) et éventuellement DVF.

