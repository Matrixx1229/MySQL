-- Temporary Tables
CREATE TEMPORARY TABLE temp_table (
    first_name varchar(50),
    last_name varchar(50),
    favoraite_movie varchar(100)
);

select
    *
from
    temp_table;

INSERT INTO
    temp_table
VALUES
('Alex', 'Freberg', 'The Matrix'),
    ('John', 'Doe', 'Inception'),
    ('Jane', 'Smith', 'Interstellar'),
    ('Alice', 'Johnson', 'The Shawshank Redemption'),
    ('Bob', 'Brown', 'The Godfather');

-- This will return the average of the average salaries for the employess
select
    *
from
    temp_table;

select
    *
from
    parks_and_recreation.employee_salary;

create TEMPORARY table salary_over_50k
select
    *
from
    employee_salary
where
    salary >= 50000;

SELECT
    *
FROM
    parks_and_recreation.salary_over_50k;


