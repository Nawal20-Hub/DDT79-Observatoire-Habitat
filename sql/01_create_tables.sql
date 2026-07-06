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
