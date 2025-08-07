-- Calculates weighted average tree canopy % for each neighborhood
SELECT 
  n."NAME" AS neighborhood_name,
  ROUND(AVG(c."DN"), 2) AS avg_canopy_pct
FROM neighborhood_boundaries n
JOIN canopy_polygons c
  ON ST_Intersects(n.geom, c.geom)
GROUP BY n."NAME"
ORDER BY avg_canopy_pct DESC;