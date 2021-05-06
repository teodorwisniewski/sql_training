
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# DISTINCT exercices

Use DISTINCT to test if there are any accounts associated with more than one region.
```
SELECT DISTINCT a.name, r.name region
FROM accounts a
JOIN sales_reps s ON a.sales_rep_id = s.id
JOIN region r ON r.id = s.region_id
ORDER BY a.name;
```
__Output 351 results__

```
SELECT *
FROM accounts a;
```
__Output 351 results__

Have any sales reps worked on more than one account?
```
SELECT s.name sales_rep_name, COUNT(*) nb_accounts
FROM accounts a
JOIN sales_reps s ON a.sales_rep_id = s.id
GROUP BY  sales_rep_name
ORDER BY nb_accounts DESC;
```
__Output 50 results__

```
SELECT DISTINCT name
FROM sales_reps;
```

__Output 50 results__
