-- triggers and events
SELECT
    *
from
    employee_demographics;

SELECT
    *
from
    employee_salary;

DELIMITER $$ CREATE TRIGGER employee_insert2
AFTER
INSERT
    ON employee_salary FOR EACH ROW BEGIN
INSERT INTO
    employee_demographics (employee_id, first_name, last_name)
VALUES
    (NEW.employee_id, NEW.first_name, NEW.last_name);

END $$ DELIMITER;

INSERT INTO
    employee_salary (
        employee_id,
        first_name,
        last_name,
        occupation,
        salary,
        dept_id
    )
VALUES
    (
        13,
        'Jean-Ralphino',
        'Dufresne',
        'Software Engineer',
        100000,
        NULL
    );

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

-- Events

SELECT *
FROM employee_demographics;

DELETE FROM employee_demographics
WHERE
    employee_id IN (SELECT employee_id FROM employee_salary WHERE occupation = 'Retired');
END;

DELEMITER $$
CREATE EVENT delete_retired_employees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
DELETE FROM employee_demographics
WHERE
    age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';  