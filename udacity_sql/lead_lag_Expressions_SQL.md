
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# Lead and Lag  exercices

In the previous video, Derek outlines how to compare a row to a previous or subsequent row. This technique can be useful when analyzing time-based events. Imagine you're an analyst at Parch & Posey and you want to determine how the current order's total revenue ("total" meaning from sales of all types of paper) compares to the next order's total revenue.
```
SELECT
	id,
    occurred_at,
	total_amt_usd,
    LEAD(total_amt_usd) OVER
    (
    	ORDER BY occurred_at
    ) AS lead,
    LEAD(total_amt_usd) OVER
    (
    	ORDER BY occurred_at
    )  - total_amt_usd AS lead_difference
FROM orders
ORDER BY 2


```
