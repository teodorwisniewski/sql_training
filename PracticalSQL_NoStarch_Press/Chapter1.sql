--------------------------------------------------------------
-- Practical SQL: A Beginner's Guide to Storytelling with Data
-- by Anthony DeBarros

-- First Chapter - just playing around
--------------------------------------------------------------


create table teachers(
	id bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salary numeric
);

insert into teachers (first_name, last_name, school, hire_date, salary)
values ('Teodor', 'Wisniewski', 'gimnazjum 3', '2021-04-01', 33000)

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);




select * from teachers;



create table animals(
	id bigserial,
	breed varchar(50),
	height numeric,
	weight_in_kg numeric,
	other_details varchar(300)
)

insert into animals(breed, height, weight_in_kg, other_details)
values	('zebra', 180, 85, 'it is very quick'),
		('dog', 50, 30, 'cute'),
		('cat', 50, 30, 'it does not like people'),
		('monster', 10, 5, '');
		
	
	
select * from animals;