-- windows function 

select gender, avg(salary) as avg_salary
from employee_demographics as dem 
join employee_salary as sal
    on dem.employee_id = sal.employee_id
GROUP BY gender
;

select gender, avg(salary) OVER()
from employee_demographics as dem 
join employee_salary as sal
    on dem.employee_id = sal.employee_id
;