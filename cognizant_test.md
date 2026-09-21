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

# Question 

<img width="1182" height="736" alt="image" src="https://github.com/user-attachments/assets/b58d33fb-1683-4dea-807f-6ecd34763276" />



# Solution : 

```
select
customer_id ,
SUM(amount) as total_amount
from orders
where MONTH(Order_date)='02' and YEAR(order_date)='2023'
group by customer_id;

```

# Question : 

<img width="1410" height="733" alt="image" src="https://github.com/user-attachments/assets/c0ba8346-5f73-4eb0-838e-47cb23a0d408" />

# Solution : 

```
select
c1.name ,
COUNT(distinct o1.order_id)
from customers as c1
left join
orders as o1
on c1.customer_id = o1.customer_id
group by c1.customer_id
having COUNT(distinct o1.order_id) >1 ;

```

