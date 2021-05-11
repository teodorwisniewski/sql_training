
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# Subqueries  exercices

Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
```
WITH sales_rep_sales_by_reg AS
(
  SELECT s.name sales_repr, r.name region, 	      SUM(o.total_amt_usd ) AS total_usd
  FROM accounts a
  JOIN orders o
  ON a.id = o.account_id
  JOIN sales_reps s ON a.sales_rep_id = s.id
  JOIN region r ON r.id = s.region_id
  GROUP BY 1,2
), max_by_region AS
(
  SELECT region, MAX(total_usd) AS total_usd
  FROM sales_rep_sales_by_reg
  GROUP BY 1
 )

SELECT *
FROM sales_rep_sales_by_reg s
JOIN max_by_region r
ON s.region = r.region AND s.total_usd = r.total_usd
```

For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?


How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?


For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?


What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?


What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order, on average, than the average of all orders.
