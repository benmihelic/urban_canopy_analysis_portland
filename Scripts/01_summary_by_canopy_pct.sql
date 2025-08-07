-- Groups canopy polygons by raw canopy percentage value
SELECT "DN" AS canopy_pct, COUNT(*) AS polygon_count
FROM neighborhood_canopy_polygons
GROUP BY "DN"
ORDER BY "DN";