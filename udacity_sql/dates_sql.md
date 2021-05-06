
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# DATEs exercices

Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
```
SELECT DATE_PART('year',occurred_at), SUM(total_amt_usd)
FROM orders
GROUP BY 1
ORDER BY 2 DESC
```

Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
```
SELECT DATE_PART('month',occurred_at), SUM(total_amt_usd)
FROM orders
GROUP BY 1
ORDER BY 2 DESC

```

Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
```
SELECT DATE_PART('year',occurred_at), COUNT(id)
FROM orders
GROUP BY 1
ORDER BY 2 DESC
```

Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
```
SELECT DATE_PART('month',occurred_at), COUNT(id)
FROM orders
WHERE occurred_at between '2014-01-01' and '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC
```

```
SELECT DATE_PART('month',occurred_at), COUNT(id)
FROM orders
WHERE cast(occurred_at as date) between '2014-01-01' and '2016-12-31'
GROUP BY 1
ORDER BY 2 DESC
```

In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
```
SELECT a.name,
		DATE_PART('year', o.occurred_at) AS year,
        DATE_PART('month', o.occurred_at) AS month,
      SUM(o.gloss_amt_usd)
  FROM accounts a
  JOIN orders o
  ON a.id = o.account_id
  WHERE name = 'Walmart'
  GROUP BY 1,2,3
  ORDER BY 4 DESC
```

OR other possible solution

```
SELECT a.name,
		DATE_PART('year', o.occurred_at) AS year,
        DATE_PART('month', o.occurred_at) AS month,
      SUM(o.gloss_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE name = 'Walmart'
GROUP BY 1,2,3
ORDER BY 4 DESC
```
