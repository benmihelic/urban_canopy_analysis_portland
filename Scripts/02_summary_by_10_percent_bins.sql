-- Groups canopy polygons into 10% bins and counts polygons per bin
SELECT
  FLOOR("DN" / 10.0) * 10 AS canopy_bin,
  COUNT(*) AS polygon_count
FROM neighborhood_canopy_polygons
GROUP BY canopy_bin
ORDER BY canopy_bin;