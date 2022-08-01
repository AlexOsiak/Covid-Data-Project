USE employees;
SELECT first_name, last_name FROM employees;
SELECT * FROM employees;
SELECT dept_no FROM departments; 
SELECT * FROM departments;
SELECT * FROM employees WHERE first_name='Denis' and gender='M';
SELECT * FROM employees WHERE gender='F' and first_name='Kellie';
SELECT * FROM employees WHERE first_name='Kellie' OR first_name='Aruna';
SELECT * FROM employees WHERE gender='F' AND (first_name='Kellie' OR first_name='Aruna');
SELECT * FROM employees WHERE first_name NOT IN ('Cathie','Mark','Nathan');
SELECT * FROM employees WHERE first_name NOT LIKE ('Mar_');
SELECT * FROM employees WHERE first_name LIKE ('mark%');
SELECT * FROM employees WHERE hire_date LIKE ('%2000%');
SELECT * FROM employees WHERE emp_no LIKE ('1000_');
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;
SELECT * FROM salaries WHERE emp_no NOT BETWEEN 10004 AND 10012;
SELECT * FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';
SELECT * FROM employees WHERE first_name IS NOT NULL;
SELECT * FROM employees WHERE first_name IS NULL;
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;
SELECT * FROM employees WHERE hire_date != '2000-01-01';
SELECT * FROM employees WHERE (gender='F' AND hire_date >= '2000-01-01');
SELECT * FROM salaries WHERE salary > 150000;
SELECT DISTINCT gender FROM employees;
SELECT DISTINCT hire_date FROM employees;
SELECT COUNT(emp_no) FROM employees;
SELECT COUNT(salary) FROM salaries WHERE salary >= 100000;
SELECT COUNT(*) FROM salaries WHERE salary >= 100000;
SELECT COUNT(*) FROM dept_manager;
SELECT * FROM employees ORDER BY first_name ASC;
SELECT * FROM employees ORDER BY first_name DESC;
SELECT * FROM employees ORDER BY hire_date DESC;
SELECT first_name FROM employees GROUP BY first_name;
SELECT COUNT(first_name) FROM employees GROUP BY first_name;
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name;
SELECT first_name, COUNT(first_name) AS names_count FROM employees GROUP BY first_name;
SELECT salary, COUNT(emp_no) AS emps_with_same_salary FROM salaries WHERE SALARY > 80000 GROUP BY salary ORDER BY salary;
SELECT * FROM employees WHERE hire_date >= '2000-01-01';
SELECT * FROM employees HAVING hire_date >= '2000-01-01';
SELECT first_name, COUNT(first_name) AS names_count FROM employees GROUP BY first_name HAVING COUNT(first_name) > 250 ORDER BY first_name;
SELECT emp_no, AVG(salary) FROM salaries GROUP BY emp_no HAVING AVG(salary) > 120000;
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;
SELECT * FROM dept_emp;
SELECT emp_no FROM dept_emp WHERE from_date > '2000-01-01' GROUP BY emp_no HAVING COUNT(from_date) > 1 ORDER BY emp_no;
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;
SELECT * FROM dept_emp LIMIT 100;
INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) VALUES
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);
SELECT

    *

FROM

    dept_emp

ORDER BY emp_no DESC

LIMIT 10;
INSERT INTO dept_emp
(
	emp_no,
    dept_no,
    from_date,
    to_date
) 
VALUES
( 
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
);

CREATE TABLE dept_dup
(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT * FROM dept_dup;

INSERT INTO dept_dup
(
	dept_no,
    dept_name
)
SELECT * FROM departments;

INSERT INTO departments 
( 
	dept_no,
    dept_name
) VALUES
(
	'd010',
    'Business Analysis'
);
UPDATE departments
SET 
	dept_name = 'Data Analyst'
WHERE 
	dept_no = 'd010';
	
SELECT * FROM departments;
SELECT * FROM employees WHERE emp_no = 999901;
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

UPDATE dept_dup
SET 
	dept_no = 'd011',
    dept_name = 'Quality Control';
SELECT * FROM dept_dup;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
DELETE FROM employees WHERE emp_no=999901;
ROLLBACK;
SELECT * FROM dept_dup ORDER BY dept_no;
DELETE FROM dept_dup;
ROLLBACK;
DELETE FROM departments WHERE dept_no='d010';
ROLLBACK;

SELECT COUNT(DISTINCT from_date) FROM salaries;
SELECT COUNT(*) FROM salaries;
SELECT * FROM dept_emp;
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;
SELECT SUM(salary) FROM salaries;
SELECT * FROM salaries;
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';

SELECT MAX(salary) FROM salaries;
SELECT MIN(salary) FROM salaries;
SELECT * FROM employees;
SELECT MIN(emp_no) FROM employees;
SELECT MAX(emp_no) FROM employees;
SELECT AVG(salary) FROM salaries;
SELECT AVG(salary) FROM salaries WHERE from_date > '1997-01-01';
SELECT ROUND(AVG(salary)) FROM salaries;
SELECT ROUND(AVG(salary),2) FROM salaries;
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';
SELECT dept_no, IFNULL(dept_name, 'Department name not provided') AS dept_name FROM dept_dup;
SELECT dept_no, COALESCE(dept_name, 'Department name not provided') AS dept_name FROM dept_dup;
SELECT dept_no, COALESCE(dept_manager,dept_name,'N/A') AS dept_manager FROM dept_dup ORDER BY dept_no ASC;
SELECT dept_no, dept_name, COALESCE('department manager name') AS fake_col FROM dept_dup;
SELECT dept_no, dept_name,COALESCE(dept_no,dept_name) AS dept_info FROM dept_dup;
SELECT dept_no, dept_name,COALESCE(dept_no,'N/A') AS dept_info,IFNULL(dept_name,'Department name not provided')AS dept_name FROM dept_dup;
ALTER TABLE dept_dup CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
ALTER TABLE dept_dup CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;


DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );
  INSERT INTO dept_manager_dup 
  select * from dept_manager;
  
  INSERT INTO dept_manager_dup (emp_no, from_date)
  VALUES                (999904, '2017-01-01'),
                        (999905, '2017-01-01'),
                        (999906, '2017-01-01'),
                        (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE
dept_no = 'd001';
INSERT INTO dept_dup (dept_name)
VALUES                ('Public Relations');

DELETE FROM dept_dup WHERE dept_no='d002';
SELECT dept_no FROM dept_dup;
DELETE FROM dept_dup WHERE dept_no='d002';

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    dept_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    m.emp_no, m.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager_dup m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no
ORDER BY m.emp_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m 
        LEFT JOIN
    dept_dup d ON m.dept_no = d.dept_no
WHERE 
    dept_name IS NULL 
ORDER BY m.dept_no;

SELECT 
	e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM 
	employees e
		LEFT JOIN 
	dept_manager m ON e.emp_no = m.emp_no
WHERE 
	e.last_name = 'Markovitch'
ORDER BY m.dept_no DESC, e.emp_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    dept_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    dept_dup d
WHERE 
	m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT m.emp_no, m.dept_no, e.first_name, e.last_name, hire_date
FROM 
	dept_manager m,
	employees e
WHERE 
	m.emp_no=e.emp_no
ORDER BY m.emp_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no; 
    
SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;


set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

SELECT 
    e.hire_date, e.first_name, e.last_name, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;   

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;   

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
		JOIN 
	employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009';
    
SELECT 
    d.*, e.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE 
	e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;


SELECT 
    e.gender, AVG(s.salary) AS avarage_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;
    
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    dm.dept_no
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    titles t ON dm.from_date = t.from_date
WHERE 
	t.title = 'Manager';


SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
    d.dept_name, AVG(s.salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY d.dept_no;


SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;


DROP TABLE IF EXISTS employees_dup;
SELECT * FROM employees_dup;

INSERT INTO employees_dup SELECT e.* FROM employees e LIMIT 20;
INSERT INTO employees_dup VALUES ('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;


SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
SELECT 
    dm.emp_no
FROM
    dept_manager dm
WHERE
    dm.emp_no IN (SELECT 
            emp_no 
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;

SELECT 
    *
FROM
    employees
WHERE
    EXISTS( SELECT 
            t.title
        FROM
            titles t
        WHERE
            t.title = 'Assistant Engineer')
ORDER BY emp_no;

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');
SELECT 
	A.*
FROM
(SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_ID
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A
UNION 
SELECT 
	B.*
FROM
(SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_ID
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no > 10021
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B;

DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager
(	emp_no int(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no int(11) NOT NULL);
    

INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a
    UNION 
    SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    
SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT * FROM dept_emp;
SELECT 
	emp_no, 
    from_date, 
    to_date, 
    COUNT(emp_no) AS Num 
FROM 
	dept_emp
GROUP BY emp_no
HAVING Num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
CREATE OR REPLACE VIEW v_manager_salaryAVG AS
    SELECT 
        ROUND(AVG(s.salary), 2)
    FROM
        dept_manager dm
            JOIN
        salaries s ON dm.emp_no = s.emp_no;
    

USE employees;
DELIMITER $$ 
CREATE PROCEDURE procedure_name()
BEGIN 
	SELECT * FROM employees
    LIMIT 1000;
END$$

DELIMITER ;
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
    LIMIT 1000;
END$$
DELIMITER ;

CALL employees.select_employees();
SELECT emp_no, ROUND(AVG(salary),2) FROM salaries GROUP BY emp_no;
DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
	SELECT emp_no, ROUND(AVG(salary),2) FROM salaries GROUP BY emp_no;
END$$

DELIMITER ;
DROP PROCEDURE IF EXISTS procedure_name;
CALL employees.average_salary();


DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER) 
BEGIN 
SELECT 
	e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
	employees e 
		JOIN 
	salaries s ON e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no;
END$$
DELIMITER ;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER) 
BEGIN 
SELECT 
	e.first_name, e.last_name, AVG(s.salary)
FROM
	employees e 
		JOIN 
	salaries s ON e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL emp_avg_salary(11300);

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2)) 
BEGIN 
SELECT 
    AVG(s.salary)
INTO p_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INTEGER) 
BEGIN 
SELECT 
	e.emp_no
INTO p_emp_no FROM
    employees e
WHERE 
	e.first_name = p_first_name
		AND e.last_name = p_last_name;
END$$
DELIMITER ;

SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @v.avg_salary);
SELECT @v_avg_salary;

SET @v_emp_no = 0;
CALL emp_info('Aruna','Journel', @v_emp_no);
SELECT @v_emp_no;


USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    EMPLOYEES E
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_avg_salary;
END $$
DELIMITER ; 

select f_emp_avg_salary(11300);


DROP FUNCTION IF EXISTS emp_info;
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)

DETERMINISTIC NO SQL READS SQL DATA

BEGIN
                DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);

SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;

SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
        
                RETURN v_salary;
END$$
DELIMITER ;
SELECT EMP_INFO('Aruna', 'Journel');



USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    EMPLOYEES E
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_avg_salary;
END $$
DELIMITER ; 
select f_emp_avg_salary(11300);

#session variables
SET @s_var1 = 3;
SELECT @s_var1;

#global variable 
SET GLOBAL max_connections = 1000;
SET @@global.max_connections=1;


USE employees;
COMMIT;

#BEFORE INSERT 
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW 
BEGIN
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0;
	END IF;
END $$
DELIMITER ;

SELECT * FROM salaries WHERE emp_no = '10001';

INSERT INTO salaries VALUES ('10001','-92891','2010-06-22','9999-01-01');


DELIMITER $$
CREATE TRIGGER before_salaries_update
BEFORE UPDATE ON salaries
FOR EACH ROW 
BEGIN
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary;
	END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_management
FOR EACH ROW 
BEGIN 
	DECLARE v_curr_salary int;
SELECT 
    MAX(salary)
INTO v_curr_salary FROM
    salaries
WHERE
    emp_no = NEW.emp_no;
    
    IF v_curr_salary IS NOT NULL THEN 
		UPADATE salaries
        SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no AND to_date = NEW.to_date;
		
        INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
	END IF;
END $$
DELIMITER ;


 DELIMITER $$
CREATE TRIGGER trig_hire_date  
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
	IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     
		SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
	END IF;  
END $$  
DELIMITER ;  

   
INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;   


CREATE INDEX i_hire_date ON employees(hire_date);
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
CREATE INDEX i_composite ON employees(first_name, last_name);
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
		AND last_name = 'Facello';
        
SHOW INDEX FROM employees;

ALTER TABLE employees
DROP INDEX i_hire_date;

SELECT * FROM salaries WHERE salary > 89000;
CREATE INDEX i_salary ON salaries(salary);

#case statement 
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
 SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;  
    
    
SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;
    
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Regular employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.emp_no > 109990;
    
    
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) >= 30000 THEN 'Salary rairse higer or equal to 30 000$'
        ELSE 'Salary raise lower then 30 000$'
    END AS raise_note
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no;




