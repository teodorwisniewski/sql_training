To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](user_data.JPG)

# Final Exercise: Data Manipulation


Due to some obscure privacy regulations, all users from California and New York must be removed from the data set.
```
\set AUTOCOMMIT off
BEGIN;
SELECT * FROM "user_data" WHERE "state" = 'CA' OR "state" = 'NY';
DELETE FROM "user_data" WHERE "state" = 'CA' OR "state" = 'NY';
```
For the remaining users, we want to split up the name column into two new columns: first_name and last_name.
```
SELECT split_part("name", ' ', 1) FROM "user_data";
SELECT split_part("name", ' ', 2) FROM "user_data";

ALTER TABLE "user_data"
ADD COLUMN "first_name"  VARCHAR,
ADD COLUMN "last_name" VARCHAR;

UPDATE "user_data"
SET
"first_name" = split_part("name", ' ', 1),
"last_name" = split_part("name", ' ', 2);

SELECT * FROM "user_data" LIMIT 5;

```
Finally, we want to simplify the data by changing the state column to a state_id column.
First create a states table with an automatically generated id and state abbreviation.
```
CREATE TABLE "states" (
  "state_id" SERIAL,
  "state" VARCHAR(2)
  );

INSERT INTO "states" ("state") VALUES
SELECT "state" FROM "user_data";

```
