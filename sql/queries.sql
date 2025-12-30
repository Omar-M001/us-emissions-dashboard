-- Map query
SELECT
  latitude,
  longitude,
  SUM(
    CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)
  ) AS emissions_mtons
FROM emissions.default.emissions_data
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL
GROUP BY latitude, longitude
ORDER BY emissions_mtons DESC
LIMIT 1000;



-- Scatter Plot query
SELECT county_state_name,
       population,
       CAST(
         replace(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE
       ) / NULLIF(
         CAST(replace(population, ',', '') AS DOUBLE), 0
       ) AS Emissions_per_person
FROM emissions_data
ORDER BY Emissions_per_person DESC;


-- Pie Chart query
SELECT state_abbr,
       SUM(
         CAST(
           replace(`GHG emissions mtons CO2e`,',') AS DOUBLE)
       ) AS total_emissions
FROM emissions_data
GROUP BY state_abbr
ORDER BY total_emissions DESC
LIMIT 10;


-- Bar Chart query
SELECT county_state_name,
       population,
       CAST(
         replace(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE) as Total_Emissions
FROM emissions_data
ORDER BY Total_Emissions DESC
LIMIT 10;

