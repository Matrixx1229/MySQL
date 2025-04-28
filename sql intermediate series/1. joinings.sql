-- joining
SELECT DISTINCT
    employee_id,
    first_name,
    last_name,
    occupation,
    salary,
    dept_id
FROM employee_salary;
-- Create a temporary table with only unique records
CREATE TABLE employee_salary_tempp AS
SELECT DISTINCT
    employee_id,
    first_name,
    last_name,
    occupation,
    salary,
    dept_id
FROM employee_salary;

-- Delete all records from the original table
TRUNCATE TABLE employee_salary;

-- Insert the unique records back into the original table
INSERT INTO employee_salary
SELECT * FROM employee_salary_tempp;

-- Drop the temporary table
DROP TABLE employee_salary_tempp;
select *
from employee_demographics;

select * 
from employee_salary;


select dem.employee_id, age, occupation
from employee_demographics as dem
inner join employee_salary as sal
	on sal.employee_id = dem.employee_id
;

-- outer joins

select *
from employee_demographics as dem
-- left join employee_salary as sal
right join employee_salary as sal
	on sal.employee_id = dem.employee_id
;





-- -- self join 
-- select * 
-- from employee_salary emp1
-- join employee_salary emp2
-- 	on emp1.employee_id + 1 = emp2.employee_id
-- ;

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_santa,
emp2.first_name as first_name_santa,
emp2.last_name as last_name_santa
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
inner join parks_departments pd 
	on  
;

-- joining multiple tables together

select *
from employee_demographics as dem 
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;

select * 
from parks_departments;

