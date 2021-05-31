
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# CTE(Common Table Expressions)  exercices

In the accounts table, there is a column holding the website for each company. The last three digits specify what type of web address they are using. A list of extensions (and pricing) is provided here. Pull these extensions and provide how many of each website type exist in the accounts table.
```
SELECT
	RIGHT(website, 3) AS domain, count(*) num_companies
from accounts
group by RIGHT(website, 3)
order by 2 DESC
```

There is much debate about how much the name (or even the first letter of a company name) matters. Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number).
```
SELECT LEFT(name, 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;
```

Use the accounts table and a CASE statement to create two groups: one group of company names that start with a number and a second group of those company names that start with a letter. What proportion of company names start with a letter?
```


```

Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what percent start with anything else?
```


```
