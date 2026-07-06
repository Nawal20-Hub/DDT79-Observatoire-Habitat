-- ============================================================
-- 03_analyses.sql
-- Analyses SQL pour le projet DDT79-Observatoire-Habitat
-- ============================================================

---------------------------------------------------------------
-- 1. Vérification des données
---------------------------------------------------------------

-- Nombre de communes
SELECT COUNT(*) AS nb_communes
FROM communes;

-- Nombre de logements (résidences principales)
SELECT COUNT(*) AS nb_logements
FROM logements;

-- Vérifier les codes INSEE présents dans les deux tables
SELECT l.code_insee
FROM logements l
LEFT JOIN communes c ON l.code_insee = c.code_insee
WHERE c.code_insee IS NULL;

---------------------------------------------------------------
-- 2. Jointure communes + logements
---------------------------------------------------------------

SELECT 
    c.code_insee,
    c.nom_commune,
    c.population_mun,
    c.population_tot,
    l.nb_res_principales,
    l.annee
FROM communes c
LEFT JOIN logements l ON c.code_insee = l.code_insee
ORDER BY c.code_insee;

---------------------------------------------------------------
-- 3. Indicateurs : taux de résidences principales
---------------------------------------------------------------

SELECT
    c.code_insee,
    c.nom_commune,
    c.population_tot,
    l.nb_res_principales,
    ROUND( (l.nb_res_principales::numeric / c.population_tot) * 100 , 2 ) 
        AS taux_residences_principales
FROM communes c
LEFT JOIN logements l ON c.code_insee = l.code_insee
ORDER BY taux_residences_principales DESC;

---------------------------------------------------------------
-- 4. Indicateurs : densité de population
-- (population municipale / population totale)
---------------------------------------------------------------

SELECT
    code_insee,
    nom_commune,
    population_mun,
    population_tot,
    ROUND( (population_mun::numeric / population_tot) * 100 , 2 ) 
        AS densite_population
FROM communes
ORDER BY densite_population DESC;

---------------------------------------------------------------
-- 5. Top 10 communes les plus peuplées
---------------------------------------------------------------

SELECT
    code_insee,
    nom_commune,
    population_tot
FROM communes
ORDER BY population_tot DESC
LIMIT 10;

---------------------------------------------------------------
-- 6. Top 10 communes avec le plus de résidences principales
---------------------------------------------------------------

SELECT
    c.code_insee,
    c.nom_commune,
    l.nb_res_principales
FROM communes c
JOIN logements l ON c.code_insee = l.code_insee
ORDER BY l.nb_res_principales DESC
LIMIT 10;

---------------------------------------------------------------
-- 7. Communes avec plus de résidences principales que d’habitants
---------------------------------------------------------------

SELECT
    c.code_insee,
    c.nom_commune,
    c.population_tot,
    l.nb_res_principales
FROM communes c
JOIN logements l ON c.code_insee = l.code_insee
WHERE l.nb_res_principales > c.population_tot
ORDER BY l.nb_res_principales - c.population_tot DESC;

---------------------------------------------------------------
-- 8. Export des indicateurs (si PostgreSQL installé)
---------------------------------------------------------------

-- Exemple d’export :
-- COPY (
--     SELECT
--         c.code_insee,
--         c.nom_commune,
--         c.population_tot,
--         l.nb_res_principales,
--         ROUND( (l.nb_res_principales::numeric / c.population_tot) * 100 , 2 ) 
--             AS taux_residences_principales
--     FROM communes c
--     JOIN logements l ON c.code_insee = l.code_insee
-- ) TO '/chemin/vers/outputs/indicateurs/indicateurs_communes.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- (Ne pas exécuter si PostgreSQL n’est pas installé)
