USE parks_and_recreation;
WITH CTE_Example (Gender, AVG_Sal, MAX_Sal,MIN_Sal, COUNT_Sal) AS (
    select
        gender,
        AVG(salary) avg_sal,
        MAX(salary) max_sal,
        MIN(salary) min_sal,
        COUNT(salary) count_sal
    from
        employee_demographics dem
        join employee_salary sal on dem.employee_id = sal.employee_id
    GROUP BY
        gender
)
select
    *
from
    CTE_Example;

-- This will return the average of the average salaries for the employess 
-- also this type of coding is accepted by the interviewers

select
    avg(avg_sal)
FROM
    (
        select
            gender,
            avg(salary) avg_sal,
            MAX(salary) max_sal,
            MIN(salary) min_sal,
            count(salary) count_sal
        from
            employee_demographics dem
            join employee_salary sal on dem.employee_id = sal.employee_id
        GROUP BY
            gender
    ) example_subquery;

-- This will also return the average of the average salaries for the employess 
-- but this is not accepted by the interviewers as it is not a good practice to use subqueries in this way
-- The first example is preferred as it is more readable and maintainable.
-- The second example is less readable and can be harder to maintain, especially if the subquery is complex or used multiple times.
WITH CTE_Example AS (
    select
        employee_id,
        gender,
        birth_date
    from
        employee_demographics
    where
        birth_date > '1985-01-01'
),
CTE_Example2 AS (
    select
        employee_id,
        salary
    from
        employee_salary
    where
        salary > 50000
)
select
    *
from
    CTE_Example
    join CTE_Example2 ON CTE_Example.employee_id = CTE_Example2.employee_id;

