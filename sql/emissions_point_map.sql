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
