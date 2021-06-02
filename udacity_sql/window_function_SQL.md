
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# Window function  exercices

Create a running total of standard_amt_usd (in the orders table) over order time with no date truncation. Your final table should have two columns: one with the amount being added for each new row, and a second with the running total.
```
  SELECT standard_amt_usd,
  SUM(standard_amt_usd) OVER
    (PARTITION BY occurred_at) AS running_total
  FROM orders
```
We have 2 same columns
