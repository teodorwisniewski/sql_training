
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


# Deforestation Project

Create a View called “forestation” by joining all three tables - forest_area, land_area and regions in the workspace.


The forest_area and land_area tables join on both country_code AND year.
The regions table joins these based on only country_code.

In the ‘forestation’ View, include the following:

  All of the columns of the origin tables
  A new column that provides the percent of the land area that is designated as forest.

Keep in mind that the column forest_area_sqkm in the forest_area table and the land_area_sqmi in the land_area table are in different units (square kilometers and square miles, respectively), so an adjustment will need to be made in the calculation you write (1 sq mi = 2.59 sq km).

```
DROP VIEW IF EXISTS forestation;
CREATE VIEW forestation AS
SELECT
  f.country_code code,
  f.country_name country,
  f.year "year",
  f.forest_area_sqkm forest_area_sqkm,
  l.total_area_sq_mi total_area_sq_mi,
  r.region region,
  r.income_group income_group,
  100.0*(f.forest_area_sqkm /
  (l.total_area_sq_mi * 2.59)) AS perc_for_land
FROM forest_area f
JOIN land_area l ON (f.country_code = l.country_code
AND f.year = l.year)
INNER JOIN regions r ON (f.country_code = r.country_code);
```


```
SELECT * FROM forestation
```

## Global Situation
a. What was the total forest area (in sq km) of the world in 1990? Please keep in mind that you can use the country record denoted as “World" in the region table.
```
SELECT forest_area_sqkm FROM forest_area f
WHERE f.country_name = 'World' AND f.year = 1990
```
41282694.9 sqkm
b. What was the total forest area (in sq km) of the world in 2016? Please keep in mind that you can use the country record in the table is denoted as “World.”
```
SELECT forest_area_sqkm FROM forest_area f
WHERE f.country_name = 'World' AND f.year = 2016
```
39958245.9 km2

c. What was the change (in sq km) in the forest area of the world from 1990 to 2016?,
```
WITH forest_1990 AS
(
  SELECT forest_area_sqkm
  FROM forest_area f
  WHERE f.country_name = 'World' AND f.year = 1990
),forest_2016 AS
(
  SELECT forest_area_sqkm
  FROM forest_area f
  WHERE f.country_name = 'World' AND f.year = 2016
)

SELECT (SELECT COALESCE(forest_area_sqkm, 0) FROM forest_1990) - (SELECT COALESCE(forest_area_sqkm, 0) FROM forest_2016) AS difference_in_km
```
d. What was the percent change in forest area of the world between 1990 and 2016?
difference_in_km
```
WITH forest_1990 AS
(
  SELECT forest_area_sqkm
  FROM forest_area f
  WHERE f.country_name = 'World' AND f.year = 1990
),forest_2016 AS
(
  SELECT forest_area_sqkm
  FROM forest_area f
  WHERE f.country_name = 'World' AND f.year = 2016
)

SELECT 100*((SELECT COALESCE(forest_area_sqkm, 0) FROM forest_1990) - (SELECT COALESCE(forest_area_sqkm, 0) FROM forest_2016))/(SELECT COALESCE(forest_area_sqkm, 0) FROM forest_1990) AS difference_in_perc
```
3.2 %
e. If you compare the amount of forest area lost between 1990 and 2016, to which country's total area in 2016 is it closest to?
```
SELECT country, (total_area_sq_mi * 2.59) AS total_area_sqkm
FROM forestation
WHERE year = 2016
ORDER BY total_area_sqkm DESC;
```
Peru	1279999.9891
## Regional Outlook
Instructions:

    Answering these questions will help you add information into the template.
    Use these questions as guides to write SQL queries.

    Use the output from the query to answer these questions.

    Create a table that shows the Regions and their percent forest area (sum of forest area divided by sum of land area) in 1990 and 2016. (Note that 1 sq mi = 2.59 sq km).
    Based on the table you created, ....
    ```
    SELECT
    	region,
    	perc_for_land,
        f.*
    FROM forestation f
    WHERE year = 2016 OR year = 1990
    ```
a. What was the percent forest of the entire world in 2016? Which region had the HIGHEST percent forest in 2016, and which had the LOWEST, to 2 decimal places?
```
SELECT
	region,
	ROUND(perc_for_land::numeric, 2) percentage
FROM forestation f
WHERE year = 2016 and country = 'World'

SELECT
	region,
	ROUND(perc_for_land::numeric, 2) percentage
FROM forestation f
WHERE year = 2016
ORDER BY 2 DESC
```
31.38% </br>
Latin America & Caribbean	98.26 </br>
Europe & Central Asia	0.00

b. What was the percent forest of the entire world in 1990? Which region had the HIGHEST percent forest in 1990, and which had the LOWEST, to 2 decimal places?
```
SELECT
	region,
	ROUND(perc_for_land::numeric, 2) percentage
FROM forestation f
WHERE year = 1990
ORDER BY 2 DESC
```
World	32.42% </br>
Latin America & Caribbean	98.91% </br>
Europe & Central Asia	0.00% </br>
c. Based on the table you created, which regions of the world DECREASED in forest area from 1990 to 2016?
```
SELECT ROUND(CAST((region_forest_1990/ region_area_1990) * 100 AS NUMERIC), 2)
  AS forest_percent_1990,
  ROUND(CAST((region_forest_2016 / region_area_2016) * 100 AS NUMERIC), 2)
  AS forest_percent_2016,
  region  
FROM (SELECT SUM(a.forest_area_sqkm) region_forest_1990,
  SUM(a.total_area_sqkm) region_area_1990, a.region,
  SUM(b.forest_area_sqkm) region_forest_2016,
  SUM(b.total_area_sqkm)  region_area_2016
FROM  forestation a, forestation b
WHERE  a.year = '1990'
AND a.country != 'World'
AND b.year = '2016'
AND b.country != 'World'
AND a.region = b.region
GROUP  BY a.region) region_percent
ORDER  BY forest_percent_1990 DESC;

```
## Country-Level Detail
Instructions:

    Answering these questions will help you add information into the template.
    Use these questions as guides to write SQL queries.
    Use the output from the query to answer these questions.

a. Which 5 countries saw the largest amount decrease in forest area from 1990 to 2016? What was the difference in forest area for each?

b. Which 5 countries saw the largest percent decrease in forest area from 1990 to 2016? What was the percent change to 2 decimal places for each?

c. If countries were grouped by percent forestation in quartiles, which group had the most countries in it in 2016?

d. List all of the countries that were in the 4th quartile (percent forest > 75%) in 2016.

e. How many countries had a percent forestation higher than the United States in 2016?
## Recommendations
## Appendix: SQL queries used
