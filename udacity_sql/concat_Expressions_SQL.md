
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# CONCAT, LEFT, RIGHT, and SUBSTR  exercices

Suppose the company wants to assess the performance of all the sales representatives. Each sales representative is assigned to work in a particular region. To make it easier to understand for the HR team, display the concatenated sales_reps.id, ‘_’ (underscore), and region.name as EMP_ID_REGION for each sales representative.
```
SELECT
   CONCAT(id, '_', name) EMP_ID_REGION
FROM sales_reps
```
From the accounts table, display the name of the client, the coordinate as concatenated (latitude, longitude), email id of the primary point of contact as <first letter of the primary_poc><last letter of the primary_poc>@<extracted name and domain from the website>.
```
SELECT name,
   CONCAT(lat, ', ', long) coordinate,
   CONCAT(LEFT(primary_poc,1), RIGHT(primary_poc,1), '@', SUBSTR(website,5)) email
FROM accounts
```
From the web_events table, display the concatenated value of account_id, '_' , channel, '_', count of web events of the particular channel.
```
with t1 AS (
  SELECT
	account_id,channel, count(*) num_event
  FROM web_events
  group by 1,2
  order by 1
 )
 select concat(account_id, '_' , channel, '_',
              num_event)
 FROM t1
```
