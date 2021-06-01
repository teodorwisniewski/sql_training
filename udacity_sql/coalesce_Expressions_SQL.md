
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# COALESCE  exercices

__1.__
```
SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;
```

```
SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;
```


```
SELECT a.*,
  COALESCE(o.account_id, a.id) account_id,
    COALESCE(o.total, 0) total,
    COALESCE(o.total_amt_usd, 0) total_amt_usd
  FROM accounts a
  LEFT JOIN orders o
  ON a.id = o.account_id
  WHERE o.total IS NULL;
```

__5.__
```
SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
;
```
