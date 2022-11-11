-- opdracht 1
ALTER table employees
add salary int(11) default 0,
add date_hired date NULL default NULL,
add date_fired date NULL default NULL;

-- opdracht 2
update employees
set date_hired=CAST(CONCAT(2000+officeCode,'-',((employeeNumber-1000)%12)+1, '-',((employeeNumber-1000)%28)+1) AS DATE), salary=(2000-employeeNumber);

update employees
set date_fired=CAST(CONCAT(2004+officeCode,'-',((employeeNumber-1000)%12)+1, '-',((employeeNumber-1000)%28)+1) AS DATE)
where employeeNumber>1400;

-- opdracht 3
DROP TRIGGER IF EXISTS employees_fired_aur;
DELIMITER $$

CREATE TRIGGER employees_fired_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN
    IF new.date_fired is not null THEN
        INSERT INTO employeearchive(`employeeNumber`, `date_fired`)
        VALUES(OLD.employeeNumber, new.date_fired);
    END IF;
END$$

DELIMITER ;

    CREATE TABLE if not exists `employeeArchive` (
`employeeNumber` int(11) NOT NULL,
  `date_fired` date NOT NULL,
  PRIMARY KEY (`employeeNumber`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- opdracht 4
-- Create a stored function which examines the date_fired and return an empty string if the value is null, and the text 'FIRED' if field is not null;
DROP FUNCTION IF EXISTS f_employee_fired;

DELIMITER $$

CREATE FUNCTION f_employee_fired(
    f_employeeNumber int(11)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE f_employee_status VARCHAR(20) default null;
	declare f_date_fired date default null;
    
    set f_date_fired = (select date_fired from employees where employeeNumber=f_employeeNumber);
    
    IF isnull(f_date_fired) THEN
        SET f_employee_status = '';
    ELSE
        SET f_employee_status = 'FIRED';
    END IF;
    RETURN (f_employee_status);
END$$

DELIMITER ;

-- opdracht 5
-- Create a view on this function with a list of employees and their status;
drop view if exists v_employees_status;
create view v_employees_status as
select employeeNumber, f_employee_fired(employeeNumber)
from employees
group by employeeNumber;

-- opdracht 6
-- Create a stored procedure which batch update the employee tables and gives them a 5% raise;
DROP PROCEDURE if exists p_create_employee_raise;
DELIMITER $$
CREATE PROCEDURE p_create_employee_raise()
BEGIN
UPDATE employees SET salary = CAST(salary * 1.05 AS UNSIGNED);
end$$
DELIMITER ;

-- opdracht 7
-- Create a stored procedure which removes all fired employees;
DROP PROCEDURE if exists p_remove_fired_employees;
DELIMITER $$
CREATE PROCEDURE p_remove_fired_employees()
BEGIN
delete from employees where date_fired is not null;
end$$
DELIMITER ;

-- opdracht 8
-- All employee salary modifications should be logged in a (new) salaryArchive table
DROP TRIGGER IF EXISTS employees_salaryChange_aur;
DELIMITER $$

CREATE TRIGGER employees_salaryChange_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN

    IF new.salary <> old.salary THEN
        INSERT INTO salaryArchive(`employeeNumber`, `before_salary` , `after_salary`)
        VALUES(OLD.employeeNumber, old.salary, new.salary);
    END IF;
END$$

DELIMITER ;

    CREATE TABLE if not exists `salaryArchive` (
    `id` int auto_increment,
`employeeNumber` int(11) NOT NULL,
  `before_salary` int(11),
  `after_salary` int(11),
  PRIMARY KEY (`id`),
  key (`employeeNumber`),
  constraint `salaryArchive_ibfk_1` foreign key (`employeeNumber`) references `employees`(`employeeNumber`) on delete no action
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;