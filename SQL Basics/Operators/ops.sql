use college ;
 
 SELECT * from employee_details;
 
 --- DISTINCT IS USED WITH SELECT QUERY TO RETRIVE ALL THE UNIQUE VALUES FROM THE GIVEN COL / COMBINATION OF COLS ---
 
 SELECT DISTINCT age from employee_details;
 SELECT DISTINCT salary from employee_details ;
 
 SELECT DISTINCT age , salary from employee_details ;
 
 --- OPERATORS IN SQL :
 ---  ARITHMETRIC OPERATOR : ARITHMETRIC OPERATOR INCLUDES : + , - , * , / , %   ----
 
SELECT * from employee_details where age + 1 = 20 ;
SELECT * from employee_details where age - 1 <= 18 ;

--- COMPARISON OPERATOR INCLUDES : > , < , >= , <= , != 

SELECT * from employee_details where age >= 18 ;
SELECT * from employee_details where age != 19;
SELECT * FROM employee_details where age < 18;

--- LOGICAL OPERATORS INCLUDES : AND , OR , NOT  --- 

SELECT * from employee_details where age = 19 AND salary >= 55000;

SELECT * from employee_details where age = 19 AND salary > 55000;

SELECT * from employee_details where age > 18 OR salary > 50000;

SELECT * from employee_details where age NOT IN ( 20 , 21 , 22, 23 , 24 , 25 , 19 );

SELECT * from employee_details where age IN ( 30 , 32 );

SELECT * from employee_details where age IN ( 19 , 20);

SELECT * from employee_details where age BETWEEN 20 AND 25 ;

SELECT * from employee_details where age BETWEEN 18 AND 20;

SELECT * from employee_details where salary BETWEEN 50000 AND 55000;
 
-- name ending with A ---
SELECT * from employee_details where name LIKE "%A"; 

-- name starting with a particular character ---
SELECT * from employee_details where name LIKE "A%";
SELECT * from employee_details where name LIKE "%i" ;


-- name containing  a particular character ---
SELECT * from employee_details where name LIKE "%Y%" ;
SELECT * from employee_details where name LIKE "%n%" ;

-- name containing a 2nd / 3rd particular character --- 
SELECT * from employee_details where name LIKE "_A%" ; --- at 2nd positon
SELECT * from employee_details where name LIKE "__A%" ; --- at 3rd position
SELECT * from employee_details where name LIKE "%h_" ; --- at 2nd last position 
SELECT * from employee_details where name LIKE "%t__" ; ---- at 3rd last position 

-- name containing some length ---alter
SELECT *from employee_details where name LIKE "_____"; --- name of length 5
SELECT * from employee_details where name LIKE "S____"; --- name of length 5 starting with savepoint

--- name starts and end with some character --

SELECT * from employee_details where name LIKE "A%Y";-- start with A , end with Y
SELECT * from employee_details where name LIKE "%AN%" ; -- contain A , N both

