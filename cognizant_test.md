# Question : 

<img width="1407" height="697" alt="image" src="https://github.com/user-attachments/assets/2d2c9146-8b54-45f0-9017-716d61e3f0cb" />

# SOLUTION :

```
SELECT
e1.name ,
e1.dept ,
e1.salary
from Employees as e1
left join
department as d1
on e1.deptId = d1.deptId
group by d1.deptId
having AVG(e1.salary) >
(SELECT AVG(salary) from employees ) ;

```

# Question : 

<img width="770" height="630" alt="image" src="https://github.com/user-attachments/assets/345430e7-25ef-4c1f-a994-099fd4b2bfb2" />

# Solution : 

```
SELECT
e1.name ,
e1.dept,
e1.salary
from
Employees as e1
where
e1.salary =
( select max(e2.salary) from employees as e2 where e2.dept= e1.dept)

```
