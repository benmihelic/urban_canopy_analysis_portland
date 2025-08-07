# Urban Tree Canopy Analysis: Portland, Oregon

## Objective
To analyze and visualize the percentage of urban tree canopy coverage across Portland neighborhoods using raster data from the National Land Cover Database (NLCD) and vector boundary data.

## 🛠Tools & Technologies
- **QGIS** – for raster processing, spatial data cleanup, and map layout
- **PostgreSQL + PostGIS** – for advanced spatial joins and SQL aggregation
- **NLCD Canopy Dataset (2019)** – for tree canopy percentage values
- **City of Portland Neighborhood Boundaries** – for geographic aggregation

## Workflow Overview

1. **Data Preparation in QGIS**
   - Downloaded NLCD Canopy raster (GeoTIFF) and Portland neighborhood boundaries (GeoJSON).
   ![Example Map Screenshot](Screenshots/Multnomah_Canopy_Raster_Unclipped.png)
   - Clipped the national canopy raster to a county-sized area of interest around Portland using QGIS.
   ![Example Map Screenshot](Screenshots/multnomah_neighborhood_canopy_raster.png)
   - Converted the clipped raster into polygons using to enable vector-based analysis.
   ![Example Map Screenshot](Screenshots/multnomah_neighborhood_canopy_vectors.png)

2. **Spatial Analysis (PostGIS)**
   - Imported the canopy polygons and neighborhood boundaries into a PostGIS database.
   - Reprojected all layers to EPSG:5070 (NAD83 / Conus Albers) to ensure accurate area calculations.
   - Used `ST_Intersects` and `ST_Area` to calculate average canopy percentage per neighborhood.
   ![Example Map Screenshot](Screenshots/multnomah_neighborhood_canopy_vectors.png)

3. **Data Aggregation**
   - Grouped results by neighborhood, calculating:
     - Total area of intersection
     - Weighted average tree canopy percentage

4. **Visualization**
   - Styled the aggregated neighborhood layer in QGIS using graduated symbology.
   - Created a print layout with a title, legend, scale bar, and data attribution.

## Final Map
_![Example Map Screenshot](Outputs/Canopy_By_Neighborhood.png)_

## Key Results
- Tree canopy coverage varied significantly by neighborhood.
- Spatial disparities in coverage suggest potential for targeted urban forestry efforts in underserved areas.

## Skills Demonstrated
- Raster-to-vector conversion
- Spatial SQL with PostGIS
- Coordinate reference system alignment
- Spatial joins and aggregation
- Cartographic design in QGIS

## Outputs
- [`canopy_by_neighborhood.gpkg`](./Outputs/canopy_by_neighborhood.gpkg)
- [`Canopy_By_Neighborhood.png`](./Outputs/Canopy_By_Neighborhood.png)
- SQL query files in `/Scripts`
- Project summary and documentation (this README)

## Next Steps
- Add census or demographic data to explore environmental equity implications.
- Expand project to include temporal change using historic NLCD data (e.g., 2001–2019).

---

*Project by [Ben Mihelic] – August 2025*
