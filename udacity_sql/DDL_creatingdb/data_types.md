
To see the preview in Atom, you have to tap ctrl+shift+m </br>
Exercices from Udacity SQL Nanodegree -> SQL DDL  </br> </br> </br>




# Datatypes and Creating new schemas  exercices


Create a schema that can accommodate a hotel reservation system. Your schema should have:

The ability to store customer data: first and last name, an optional phone number, and multiple email addresses.
The ability to store the hotel's rooms: the hotel has twenty floors with twenty rooms on each floor. In addition to the floor and room number, we need to store the room's livable area in square feet.
The ability to store room reservations: we need to know which guest reserved which room, and during what period.

__First Attempt__
```
CREATE TABLE "customers" (
    "customer_id" SERIAL,
    "first_name" VARCHAR,
    "last_name" VARCHAR,
    "phone_number" VARCHAR,
    "email_id" INT
)


CREATE TABLE "emails" (
    "id" SERIAL,
    "email_id" INT,
    "email" VARCHAR
)

CREATE TABLE "rooms" (
    "room_number" INT,
    "floor_nb" INT,
    "area" REAL
)

CREATE TABLE "reservations" (
    "id" SERIAL,
    "customer_id" INT,
    "starting_date" TIMESTAMP WITH TIME ZONE,
    "end_date" TIMESTAMP WITH TIME ZONE
)

```
