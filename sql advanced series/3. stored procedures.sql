USE parks_and_recreation;

SELECT * FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3();

USE `Parks_and_Recreation`
DELIMITER $$ 
CREATE PROCEDURE large_salaries4(p_employee_id INT) BEGIN -- p sets for parameter
SELECT
    salary
FROM
    employee_salary
WHERE
    employee_id = p_employee_id;


END $$ DELIMITER;

call large_salaries4(1);
call large_salaries4(2);
call large_salaries4(3);
call large_salaries4(4);