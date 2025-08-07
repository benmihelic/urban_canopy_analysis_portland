-- Manually sets geometry CRS
ALTER TABLE canopy_by_neighborhood_tbl
ALTER COLUMN geom TYPE geometry(MultiPolygon, 5070)
USING ST_SetSRID(geom, 5070);