
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# SELF JOIN  exercices

Modify the query from the previous video, which is pre-populated in the SQL Explorer below, to perform the same interval analysis except for the web_events table. Also:

change the interval to 1 day to find those web events that occurred after, but not more than 1 day after, another web event
add a column for the channel variable in both instances of the table in your query
You can find more on the types of INTERVALS (and other date related functionality) in the Postgres documentation here.
```
SELECT w1.account_id w1_id,
		w1.occurred_at w1_occurred_at,
        w1.channel w1_channel,
        w2.account_id w2_id,
        w2.occurred_at w2_occurred_at,
        w2.channel w2_channel
  FROM web_events w1
 LEFT JOIN web_events w2
   ON w1.account_id  = w2.account_id
   AND w1.occurred_at > w2.occurred_at
   AND w1.occurred_at <= w2.occurred_at + INTERVAL '1 days'
ORDER BY w1.account_id, w2.account_id
```
