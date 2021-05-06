
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# HAVING exercices

Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.

How many of the sales reps have more than 5 accounts that they manage?
```
SELECT COUNT(*)
FROM
(
  SELECT s.name, COUNT(*) nb_accounts
  FROM accounts a
  JOIN sales_reps s ON a.sales_rep_id = s.id
  GROUP BY s.name
  HAVING COUNT(*)>5
) s;
```

How many accounts have more than 20 orders?
```
SELECT COUNT(*)
FROM
(SELECT a.name, COUNT(*)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
HAVING  COUNT(*)>20) s;
```

Which account has the most orders?
```
SELECT *
FROM
(
  SELECT a.name, COUNT(*) nb_orders
  FROM accounts a
  JOIN orders o
  ON a.id = o.account_id
  GROUP BY a.name
  ORDER BY nb_orders DESC
) s
LIMIT 1;
```

Which accounts spent more than 30,000 usd total across all orders?
```
SELECT a.name, sum(total_amt_usd) total_usd
  FROM accounts a
  JOIN orders o
  ON a.id = o.account_id
  GROUP BY a.name
  HAVING sum(total_amt_usd)>30000
  ORDER BY total_usd DESC
```

Which accounts spent less than 1,000 usd total across all orders?
```
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;
```

Which account has spent the most with us?
```
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;
```

Which account has spent the least with us?
```
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 1;
```

Which accounts used facebook as a channel to contact customers more than 6 times?
```
SELECT a.name, w.channel, COUNT(*)
FROM web_events w
JOIN accounts a ON a.id = w.account_id
where w.channel = 'facebook'
GROUP BY 1,2
HAVING COUNT(*)>6;
```

Which account used facebook most as a channel?
```
SELECT a.name, w.channel, COUNT(*)
FROM web_events w
JOIN accounts a ON a.id = w.account_id
where w.channel = 'facebook'
GROUP BY 1,2
HAVING COUNT(*)>6
order by COUNT(*) desc
limit 1;
```

Which channel was most frequently used by most accounts?
```
SELECT channel, COUNT(*) FROM
(
    SELECT a.name, w.channel, COUNT(*) use_of_channel
  FROM accounts a
  JOIN web_events w
  ON a.id = w.account_id
  GROUP BY a.name, w.channel
  ORDER BY use_of_channel DESC) s
  GROUP BY channel
  ORDER BY count DESC;
```
