# EX1
Provide a table that provides the region for each sales_rep along with their associated accounts.
This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name,
and the account name. Sort the accounts alphabetically (A-Z) according to account name.


```
SELECT
   r.name region_name,
	   s.name sales_name,
   a.name account_name
 FROM region r
 JOIN sales_reps s ON r.id = s.region_id
 JOIN accounts a ON a.sales_rep_id = s.id
```

# Exercice 2
Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

```
SELECT
 r.name region_name,
     s.name sales_name,
 a.name account_name
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON a.sales_rep_id = s.id
WHERE s.name LIKE 'S%' AND r.name = 'Midwest'
```
