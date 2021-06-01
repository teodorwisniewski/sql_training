
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# POSITION and SUBSTR  exercices

Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
```
SELECT
	primary_poc,
    POSITION(' ' in primary_poc) space_postion,
    LEFT(primary_poc, POSITION(' ' in primary_poc))  AS first ,
    SUBSTR(primary_poc, POSITION(' ' in primary_poc)) AS last                             
FROM accounts
```

Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.
```
SELECT
		name,
    POSITION(' ' in name) space_postion,
    LEFT(name, POSITION(' ' in name))  AS first,
    SUBSTR(name, POSITION(' ' in name)) AS last                                
FROM sales_reps
```
