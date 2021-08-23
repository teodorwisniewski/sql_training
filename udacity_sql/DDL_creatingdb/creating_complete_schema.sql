
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL aggregations  </br> </br> </br>


![](indexing_exercices.PNG)
![](books_and_topics.PNG)


# Creating a complete schema at sql

__1.__ We need to be able to quickly find books and authors by their IDs. 
```

```
* A movie has a title and a description, and zero or more categories associated to it.
A category is just a name, but that name has to be unique
Users can register to the system to rate movies:
A user's username has to be unique in a case-insensitive way. For instance, if a user registers with the username "Bob", then nobody can register with "bob" nor "BOB"
A user can only rate a movie once, and the rating is an integer between 0 and 100, inclusive
In addition to rating movies, users can also "like" categories.
The following queries need to execute quickly and efficiently. The database will contain ~6 million movies:
Finding a movie by partially searching its name
Finding a user by their username
For a given user, find all the categories they like and movies they rated
For a given movie, find all the users who rated it
For a given category, find all the users who like it