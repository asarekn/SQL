CREATE DATABASE SM;
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released 
INTEGER,sequel_id INTEGER);

INSERT INTO movies VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

SELECT * FROM movies;

SELECT m1.title AS title, m2.title AS sequel
FROM movies m1
LEFT JOIN movies m2
ON m1.sequel_id =m2.id;

/* multiple joins */

CREATE TABLE students (id INTEGER PRIMARY KEY AUTO_INCREMENT, first_name TEXT, last_name TEXT, email 
TEXT, phone TEXT, birthdate TEXT);

INSERT INTO students (first_name, last_name, email, phone, birthdate)
 VALUES ("Eben", "Rabbit", "eben@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students (first_name, last_name, email, phone, birthdate)
 VALUES ("Akua", "Wonderland", "akua@wonderland.com", "555-4444", "2002-07-04");
INSERT INTO students (first_name, last_name, email, phone, birthdate)
VALUES ("Gloria", "Lampland", "gloria@lampland.com", "555-3333", "2001-05-10");
INSERT INTO students (first_name, last_name, email, phone, birthdate)
 VALUES ("Joseph", "Kingston", "joseph@kingston.com", "555-1111", "2001-12-24");
 
 DROP TABLE students;
 
CREATE TABLE student_projects (id INTEGER PRIMARY KEY AUTO_INCREMENT,student_id INTEGER,title TEXT);

 INSERT INTO student_projects (student_id, title)
 VALUES (1, "Carrotapault");
 INSERT INTO student_projects (student_id, title)
 VALUES (2, "Mad Hattery");
INSERT INTO student_projects (student_id, title)
 VALUES (3, "Carpet Physics");
INSERT INTO student_projects (student_id, title)
 VALUES (4, "Hyena Habitats");
 
 CREATE TABLE project_pairs (id INTEGER PRIMARY KEY AUTO_INCREMENT, project1_id INTEGER, project2_id 
INTEGER);
INSERT INTO project_pairs (project1_id, project2_id)
 VALUES(1, 2);
INSERT INTO project_pairs (project1_id, project2_id)
 VALUES(3, 4);
 
 /* quering tables */
 
 SELECT * FROM students;
 SELECT * FROM student_projects;
 SELECT * FROM project_pairs;
 
 SELECT * FROM project_pairs
 JOIN student_projects
  JOIN student_projects AS e;
 
 SELECT student_projects.title, e.title FROM project_pairs
 JOIN student_projects
 ON project_pairs.project_id = students_projects.id
 JOIN student_projects AS e
 ON project_pairs.project2_id = e.id;
 
 
 /* challenge 2(group work), friendbook */ 
 /* Ubeida Zakariah, Celestina Asantewaa Adu, Akosua Gyamfua Asare-Kena, Paul Boakye-Dankwa, Derrick Edem Sosoo */
 
 
 
 CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, fullname TEXT, age 
INTEGER);

INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER, 
name TEXT);

INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (id INTEGER PRIMARY KEY AUTO_INCREMENT, person1_id INTEGER, 
person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id) 
 VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id) 
 VALUES (2, 3);
 
 SELECT * FROM persons;
 SELECT * FROM hobbies;
 SELECT * FROM friends;
 
 SELECT persons.fullname, hobbies.name AS hobbies
 FROM persons
 LEFT JOIN hobbies 
 ON persons.id = hobbies.person_id;
 
 SELECT p1.fullname, p2.fullname 
 FROM persons p1
 LEFT JOIN persons p2
 ON p1.id = p2.id
 JOIN friends
 ON p1.id = friends.person2_id;
 
 SELECT * FROM friends AS f
 JOIN persons AS a
 JOIN persons AS b;
 
 SELECT a.fullname, b.fullname FROM friends AS f
 JOIN persons AS a
 ON f.person1_id = a.id
 JOIN persons AS b
 ON f.person2_id = b.id;