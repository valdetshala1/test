http://truongtx.me/2014/02/28/tree-structure-query-with-postgresql/


drop table employees;
CREATE TABLE employees 
  ( 
    id integer PRIMARY KEY NOT NULL,
   name text, 
    id_manager integer,
--   Employees_pkey CONSTRAINT PRIMARY KEY (id),
   CONSTRAINT Fk_manager FOREIGN KEY (id_manager)
       REFERENCES employees (id) MATCH SIMPLE 
        ON UPDATE RESTRICT ON DELETE RESTRICT
 );


-- Director (root) itself has no manager 
 INSERT INTO employees (id, name, id_manager) VALUES (1, 'Peter', NULL); 
 INSERT INTO employees (id, name, id_manager) VALUES (2, 'Stefan' , 1); 
 INSERT INTO employees (id, name, id_manager) VALUES (3, 'Claire', 2); 
 INSERT INTO employees (id, name, id_manager) VALUES (4, 'Martin', 2); 
 INSERT INTO employees ( id, name, id_manager) VALUES (5, 'Geert', 4); 
 INSERT INTO employees (id, name, id_manager) VALUES (6, 'Kim', 1) ;
 INSERT INTO employees (id, name, id_manager) VALUES ( 7, 'Ronald', 5); 
 INSERT INTO employees (id, name, id_manager) VALUES (8, 'Frank', 1); 
 INSERT INTO employees (id, name, id_manager) VALUES (9, 'Alex', 8) ;  

WITH RECURSIVE managers (id, employee, id_manager, manager) AS (
SELECT id, employee, id_manager, manager
LEFT JOIN employees AS ON Manager id_manager employees WHERE id = manager employees id = 1 

UNION ALL 

SELECT id employees, especially employees, employees id_manager, managers Manager 
FROM employees INNER JOIN ON Managers Managers id = id_manager employees
)
SELECT id, employee, id_manager, manager FROM managers 


 WITH RECURSIVE managers (id, employee, id_manager, manager) AS (
 -- first part, 
 without recursion SELECT id employees, especially employees, employees id_manager, manager name 
 --.... Who is the manager of the searched manager FROM employees? - a LEFT JOIN, a director (the root) has no manager 
 LEFT JOIN employees AS ON Manager id_manager employees WHERE id = manager employees id = 1 
 --... from the employee down in the hierarchy - the second part starts recursion 
 UNION ALL SELECT id employees, especially employees, employees id_manager, managers Manager | | '->' |.... | Managers Employee 
 FROM employees INNER JOIN ON Managers Managers id = id_manager employees - Join the CTE "... Managers ") - and then the
 --" normal  "SELECT query: SELECT id, employee, id_manager, manager FROM managers - reference to the CTE created, not a table!  