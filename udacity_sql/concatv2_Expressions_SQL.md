
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](assets/groupy_by-82530243.PNG)

# CONCAT  exercices

Each company in the accounts table wants to create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
```
WITH t1 AS
(
  select
      SUBSTR(website, POSITION('.' IN website)+1) AS domain,
      LEFT(primary_poc, POSITION(' ' in primary_poc)-1)  AS first ,
      SUBSTR(primary_poc, POSITION(' ' in primary_poc)+1) AS last  
  from accounts
)

SELECT
	CONCAT(first, '.', last, '@', domain) email
FROM t1
```

You may have noticed that in the previous solution some of the company names include spaces, which will certainly not work in an email address. See if you can create an email address that will work by removing all of the spaces in the account name, but otherwise your solution should be just as in question 1. Some helpful documentation is here.
```

```

We would also like to create an initial password, which they will change after their first log in. The first password will be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in their first name, the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.
```

```
