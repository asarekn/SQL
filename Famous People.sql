/* Group Work */
/* Ubeida Zakariah, Akosua Gyamfua Asare-Kena, Paul Boakye-Dankwa */
drop database famous_people;
CREATE DATABASE famous_people;

/* creating table */

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    actor TEXT,
    age INTEGER,
    nationality TEXT);
    
/* inserting values */

INSERT INTO actors (actor, age, nationality) VALUES ("Ubeida Zakaariah", 30, "UK");
INSERT INTO actors (actor, age, nationality) VALUES ("Paul Boakye-Dankwa", 32, "Australia");
INSERT INTO actors (actor, age, nationality) VALUES ("Akosua Gyamfua Asare-Kena", 48, "Spain");
INSERT INTO actors (actor, age, nationality) VALUES ("Derrick Edem Sosoo", 53, "Canada");
INSERT INTO actors (actor, age, nationality) VALUES ("Celestina Asantewaa Adu", 20, "France");

/* creating table */

CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT, actor_id INTEGER,
     title TEXT,
    debuted_year INTEGER);
    
/* inserting values */

INSERT INTO movies (actor_id, title, debuted_year) VALUES (1, "Suits", 2006);
INSERT INTO movies (actor_id, title, debuted_year) VALUES (2, "Thor", 2011);
INSERT INTO movies (actor_id, title, debuted_year) VALUES (3, "Never Have I Ever", 2022);
INSERT INTO movies (actor_id, title, debuted_year) VALUES (4, "The Rookie", 2002);
INSERT INTO movies (actor_id, title, debuted_year) VALUES (5, "Titanic", 2024);



CREATE TABLE Ratings (
    id INTEGER PRIMARY KEY AUTO_INCREMENT, actor_id INTEGER,
    rating FLOAT);
    
/*inserting values */

INSERT INTO Ratings (actor_id, rating) VALUES (1, 5.0);
INSERT INTO Ratings (actor_id, rating) VALUES (2, 5.0);
INSERT INTO Ratings (actor_id, rating) VALUES (3, 3.0);
INSERT INTO Ratings (actor_id, rating) VALUES (4, 4.9);
INSERT INTO Ratings (actor_id, rating) VALUES (5, 2.1);


/* 1. update relevant tables with another row of Akua Asiedu who is 75 yrs from China with a movie called "Journey to the 
West" that was made in 1984 and received a rating of 3.5) */

insert into actors (actor, age, nationality) values ("Akua Asiedu", 75 , "China");
insert into movies (actor_id, title, debuted_year) values (6, "Journey to the West", 1984); 
insert into Ratings (actor_id, rating) VALUES (6, 3.5);


/* 2. Write a query to see the actors and their asscociated movies, debuted years and ratings */

select a.actor, m.title, m.debuted_year, r.rating
from actors a left join movies m on a.id = m.actor_id
left join ratings r on a.id = r.actor_id;

select a.actor, m.title, m.debuted_year, r.rating
from actors a left join movies m on a.id = m.actor_id
inner join ratings r on a.id = r.actor_id;

select a.actor, m.title, m.debuted_year, r.rating
from actors a left join movies m on a.id = m.actor_id
right join ratings r on a.id = r.actor_id;

/* 3. Write a query to get the actors and their movies if their rating is higher than the average movie rating*/

select a.actor, m.title, r.rating
from actors a 
left join movies m 
on a.id = m.actor_id 
inner join ratings r
on a.id = r.actor_id
where r.rating > (select avg(rating) from ratings); 

/* 4. Write a query to get the actors who made started acting before 2017 and their corresponding years*/

select a.actor, m.debuted_year from
actors a inner join movies m
on a.id = m.actor_id where a.id in (select actor_id from movies where debuted_year < 2017);

