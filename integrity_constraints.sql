CREATE DATABASE const;
USE const;
 CREATE TABLE engineering (
    uid INT UNIQUE, 
    name VARCHAR(50) NOT NULL );


CREATE TABLE medical( 
   sid INT PRIMARY KEY , 
   age INT CHECK (age BETWEEN 18 AND 40),
   age INT CHECK (age>18), 
   location VARCHAR(50) DEFAULT 'himachal pardesh');
