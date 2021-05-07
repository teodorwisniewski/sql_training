
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# CASE exercices


```
SELECT account_id, CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
                      ELSE standard_amt_usd/standard_qty END AS unit_price
FROM orders
LIMIT 10;

```


Write a query to display for each order, the account ID, total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
```
SELECT a.id, o.total_amt_usd,
  	CASE WHEN o.total_amt_usd>=3000 THEN 'Large'
      ELSE 'Small' END AS level_of_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id;
```
Write a query to display the number of orders in each of three categories, based on the total number of items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
```
SELECT a.id, o.total_amt_usd,
  	CASE
      WHEN o.total>=2000 THEN 'At Least 2000'
      WHEN o.total <2000 THEN 'Between 1000 and 2000'
      ELSE 'Less than 1000' END AS nb_items
FROM accounts a
JOIN orders o
ON a.id = o.account_id;
```

We would like to understand 3 different levels of customers based on the amount associated with their purchases. The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.
```
SELECT a.name, SUM(o.total_amt_usd) tot_usd,
  	CASE
      WHEN SUM(o.total_amt_usd)>=200000 THEN 'greater than 200,000'
      WHEN  100000<=SUM(o.total_amt_usd) AND SUM(o.total_amt_usd) < 200000 THEN 'Between 200,000 and 100,000'
      ELSE 'under 100,000' END AS nb_items
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC;
```
We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.
```
SELECT a.name, SUM(o.total_amt_usd) tot_usd,
  	CASE
      WHEN SUM(o.total_amt_usd)>=200000 THEN 'greater than 200,000'
      WHEN  100000<=SUM(o.total_amt_usd) AND SUM(o.total_amt_usd) < 200000 THEN 'Between 200,000 and 100,000'
      ELSE 'under 100,000' END AS nb_items
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '2016-01-01' AND
'2018-01-01'
GROUP BY 1
ORDER BY 2 DESC;
```
We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. Place the top sales people first in your final table.
```
SELECT  s.name, COUNT(o.id),
	CASE WHEN COUNT(o.id)>200 THEN 'top'
    ELSE 'not' END AS order_level
FROM orders o
JOIN accounts a ON a.id = o.account_id
JOIN sales_reps s ON a.sales_rep_id = s.id
GROUP BY s.name
ORDER BY 2 DESC;
```
The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well. We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, or low depending on this criteria. Place the top sales people based on dollar amount of sales first in your final table. You might see a few upset sales people by this criteria!
```
SELECT s.name, COUNT(*) num_ords,
     SUM(o.total_amt_usd) total_usd,
  	CASE
      WHEN SUM(o.total_amt_usd)>=750000 THEN 'top'
      WHEN  500000<=SUM(o.total_amt_usd) AND SUM(o.total_amt_usd) < 750000 THEN 'middle'
      ELSE 'low' END AS sales_total_level    
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;;

```
