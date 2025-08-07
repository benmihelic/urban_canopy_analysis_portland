-- Creates a new table for exporting joined data (optional)
CREATE TABLE canopy_by_neighborhood AS
SELECT
  n.name AS neighborhood,
  ROUND(SUM(ST_Area(ST_Intersection(n.geom, c.geom)) * c.dn) / SUM(ST_Area(ST_Intersection(n.geom, c.geom))), 2) AS avg_canopy_pct,
  n.geom
FROM neighborhoods n
JOIN canopy_polygons c
  ON ST_Intersects(n.geom, c.geom)
GROUP BY n.name, n.geom;