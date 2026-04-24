CREATE database if not exists College ;
use COLLEGE;

-- NOT NULL CONSTRAINT --- 
CREATE TABLE student1 ( age INT , rollNo INT NOT NULL) ;
show tables ;
INSERT INTO student1 (age , rollNo) VALUES ( 18 , 101 ) , ( 19 , 102 ) ;
INSERT INTO student1 ( age , rollNo ) VALUES (19 , 104);
SELECT * from student1;

-- CHECK CONSTRAINT ---

CREATE table  if not exists student3 ( age INT check(age>=18) , rollNo INT NULL );
INSERT into student3 ( age , rollNo ) values ( 19 , 101 ) , ( 18 , 102 ) ;
SELECT * from student3;

--- DEFAULT CONSTRAINT ---

CREATE table if not exists student4 ( age INT CHECK( age >= 18) , rollNo int NOT NULL , schoolName VARCHAR(50) DEFAULT 'XYZ');
INSERT INTO student4 ( age , rollNo ) VALUES (19 , 101 ) , ( 20 , 102 ) , ( 21 , 103);
SELECT * from student4;


--- PRIMARY KEY CONTRAINT ---

CREATE TABLE if not exists student5( age INT CHECK( age >=18) , rollNo INT NOT NULL , schoolName VARCHAR(50) DEFAULT 'XYZ'  , 
studentID INT PRIMARY KEY );

INSERT INTO student5( age , rollNo , studentID) values ( 19 , 101 , 01 ) , ( 20 , 102 , 02 ) , ( 21 , 103 , 03 ) , ( 22 , 104, 04  );

SELECT * from student5;

--- FOREIGN KEY CONSTRAINT ---

CREATE TABLE if not exists courses( courseName VARCHAR(100) , cid INT PRIMARY KEY , studentId INT , FOREIGN KEY (studentId)
references student5(studentId) );

INSERT INTO courses (courseName , cid , studentId) VALUES  ( 'CSE' , 1001 , 01 ) , ( 'CSDS' , 1002 , 02 ) ;

SELECT * from courses ;


----------- ALL the SAME CONSTRAINT -------- 

CREATE TABLE fees ( paymentID INT PRIMARY KEY , studentID int NOT NULL , paymentStatus boolean  , paymentTime date ,
 semester INT NOT NULL , examEligibilty bool , FOREIGN KEY (studentId) references student5 ( studentId) );
 
 INSERT INTO fees ( paymentId , studentID , paymentStatus , paymentTime , semester , examEligibilty) VALUES ( 9999 , 01 , true , 
 '2026-04-10' , 06 , true ) , ( 99998, 02 , true , '2026-04-10' , 06 , true ) , ( 99997 , 03 , true , '2026-04-10' , 06 , true ) ;
 
 SELECT * from fees;
 

show tables;
