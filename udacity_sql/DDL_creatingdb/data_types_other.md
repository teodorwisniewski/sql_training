
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL DDL  </br> </br> </br>




# Modifying Table Structure  exercices


Explore the structure of the three tables in the provided SQL workspace. We'd like to make the following changes:

It was found out that email addresses can be longer than 50 characters. We decided to remove the limit on email address lengths to keep things simple.
We'd like the course ratings to be more granular than just integers 0 to 10, also allowing values such as 6.45 or 9.5
We discovered a potential issue with the registrations table that will manifest itself as the number of new students and new courses keeps increasing. Identify the issue and fix it.

__First Attempt__
```
ALTER TABLE "table" ALTER COLUMN "email" SET DATA TYPE VARCHAR
ALTER TABLE "table" ALTER COLUMN "ratings" SET DATA TYPE REAL
ALTER TABLE "table" ALTER COLUMN "nb_of_Students" SET DATA TYPE  INTEGER
```

__Solution__

```
ALTER TABLE "students" ALTER COLUMN "email_address" SET DATA TYPE VARCHAR;
ALTER TABLE "courses" ALTER COLUMN "rating" SET DATA TYPE REAL;
ALTER TABLE "registrations" ALTER COLUMN "student_id" SET DATA TYPE INTEGER;
ALTER TABLE "registrations" ALTER COLUMN "course_id" SET DATA TYPE INTEGER;
```
