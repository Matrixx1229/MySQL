-- windows function 
select
    gender,
    avg(salary) as avg_salary
from
    employee_demographics as dem
    join employee_salary as sal on dem.employee_id = sal.employee_id
GROUP BY
    gender;

select
    dem.first_name,
    dem.last_name,
    gender,
    avg(salary) OVER(PARTITION BY gender)
from
    employee_demographics as dem
    join employee_salary as sal on dem.employee_id = sal.employee_id;

select
    dem.first_name,
    dem.last_name,
    gender,
    salary,
    SUM(salary) OVER(
        PARTITION BY gender
        ORDER BY
            dem.employee_id
    ) as rolling_total
from
    employee_demographics as dem
    join employee_salary as sal on dem.employee_id = sal.employee_id;

select
    dem.employee_id,
    dem.first_name,
    dem.last_name,
    gender,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY gender
        ORDER BY
            salary DESC
    ) as row_num,
    RANK() OVER(
        PARTITION BY gender
        ORDER BY
            salary DESC
    ) as rank_num,
    DENSE_RANK() OVER(
        PARTITION BY gender
        ORDER BY
            salary DESC
    ) as dense_rank_num
from
    employee_demographics as dem
    join employee_salary as sal on dem.employee_id = sal.employee_id;