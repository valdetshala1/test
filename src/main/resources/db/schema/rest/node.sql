/*
http://sqlanywhere.blogspot.de/2012/10/example-recursive-union-tree-traversal.html
*/
CREATE TABLE node ( 
   node_id          INTEGER NOT NULL,
   parent_id        INTEGER NOT NULL REFERENCES node ( node_id ),
   sibling_number   INTEGER NOT NULL,
   PRIMARY KEY ( node_id ) );


INSERT INTO node VALUES (  1,  1,             9 );
INSERT INTO node VALUES (      2,  1,             1 );
INSERT INTO node VALUES (          6,  2,             5 );
INSERT INTO node VALUES (          7,  2,             6 );
INSERT INTO node VALUES (             27,  7,             8 );
INSERT INTO node VALUES (             26,  7,             9 );
INSERT INTO node VALUES (          8,  2,             7 );
INSERT INTO node VALUES (          9,  2,             8 );
INSERT INTO node VALUES (         10,  2,             9 );
INSERT INTO node VALUES (     93,  1,             2 );
INSERT INTO node VALUES (         11, 93,             3 );
INSERT INTO node VALUES (         12, 93,             5 );
INSERT INTO node VALUES (         13, 93,             7 );
INSERT INTO node VALUES (             25, 13,             7 );
INSERT INTO node VALUES (             24, 13,             8 );
INSERT INTO node VALUES (         14, 93,             9 );
INSERT INTO node VALUES (      4,  1,             3 );
INSERT INTO node VALUES (         15,  4,             1 );
INSERT INTO node VALUES (         16,  4,             5 );
INSERT INTO node VALUES (         17,  4,             9 );
INSERT INTO node VALUES (             23, 17,             6 );
INSERT INTO node VALUES (             22, 17,             7 );
INSERT INTO node VALUES (      5, 1,              4 );
INSERT INTO node VALUES (         18,  5,             2 );
INSERT INTO node VALUES (             21, 18,             5 );
INSERT INTO node VALUES (             20, 18,             6 );
INSERT INTO node VALUES (         19,  5,             8 );
COMMIT;


WITH RECURSIVE top_down_traversal
   ( level,
     node_id,
     parent_id,
     sibling_number )
AS ( SELECT CAST ( 1 AS INTEGER )  AS level,
            node.node_id           AS node_id,
            node.parent_id         AS parent_id,
            node.sibling_number    AS sibling_number
       FROM node
      WHERE node.node_id = node.parent_id
     UNION ALL
     SELECT top_down_traversal.level + 1,
            node.node_id,
            node.parent_id,
            node.sibling_number
       FROM top_down_traversal
            INNER JOIN node
                    ON node.parent_id = top_down_traversal.node_id
      WHERE node.parent_id <> node.node_id )
SELECT level,
       node_id 
  FROM top_down_traversal
 ORDER BY level,
       node_id;


drop table employee cascade;

CREATE TABLE employee ( 
   employee_id  INTEGER NOT NULL,
   manager_id   INTEGER NOT NULL REFERENCES employee ( employee_id ),
   name         VARCHAR NOT NULL,
   salary       NUMERIC ( 20, 2 ) NOT NULL,
   PRIMARY KEY ( employee_id ) );

INSERT INTO employee VALUES ( 1,  1,  'Ainslie',  1000000.00 );
INSERT INTO employee VALUES ( 2,  1,  'Briana',    900000.00 );
INSERT INTO employee VALUES ( 3,  1,  'Calista',   900000.00 );
INSERT INTO employee VALUES ( 4,  1,  'Delmar',    900000.00 );
INSERT INTO employee VALUES ( 5,  2,  'Electra',   750000.00 );
INSERT INTO employee VALUES ( 6,  3,  'Fabriane',  800000.00 );
INSERT INTO employee VALUES ( 7,  3,  'Genevieve', 750000.00 );
INSERT INTO employee VALUES ( 8,  4,  'Hunter',    800000.00 );
INSERT INTO employee VALUES ( 9,  6,  'Inari',     500000.00 );
INSERT INTO employee VALUES ( 10, 6,  'Jordan',    100000.00 );
INSERT INTO employee VALUES ( 11, 8,  'Khalil',    100000.00 );
INSERT INTO employee VALUES ( 12, 8,  'Lisette',   100000.00 );
INSERT INTO employee VALUES ( 13, 10, 'Marlon',    100000.00 );
INSERT INTO employee VALUES ( 14, 10, 'Nissa',     100000.00 );
COMMIT;

WITH RECURSIVE superior_list 
   ( level,
     chosen_employee_id,
     manager_id,
     employee_id,
     name )
AS ( SELECT CAST ( 1 AS INTEGER ) AS level,
            employee.employee_id    AS chosen_employee_id,
            employee.manager_id     AS manager_id,
            employee.employee_id    AS employee_id,
            employee.name           AS name
       FROM employee
     UNION ALL
     SELECT superior_list.level + 1,
            superior_list.chosen_employee_id,
            employee.manager_id,
            employee.employee_id,
            employee.name
       FROM superior_list
            INNER JOIN employee
                    ON employee.employee_id = superior_list.manager_id
      WHERE superior_list.level <= 99
        AND superior_list.manager_id <> superior_list.employee_id )
SELECT superior_list.level,
       superior_list.name
  FROM superior_list
 WHERE superior_list.chosen_employee_id = 13
 ORDER BY superior_list.level DESC;


CREATE VIEW v_superior_list AS
WITH RECURSIVE superior_list 
   ( level,
     chosen_employee_id,
     manager_id,
     employee_id,
     name )
AS ( SELECT CAST ( 1 AS INTEGER ) AS level,
            employee.employee_id    AS chosen_employee_id,
            employee.manager_id     AS manager_id,
            employee.employee_id    AS employee_id,
            employee.name           AS name
       FROM employee
     UNION ALL
     SELECT superior_list.level + 1,
            superior_list.chosen_employee_id,
            employee.manager_id,
            employee.employee_id,
            employee.name
       FROM superior_list
            INNER JOIN employee
                    ON employee.employee_id = superior_list.manager_id
      WHERE superior_list.level <= 99
        AND superior_list.manager_id <> superior_list.employee_id )
SELECT *
  FROM superior_list;



 WITH RECURSIVE breadth_first_traversal
   ( level,
     lineage,
     employee_id,
     manager_id,
     name )
AS ( SELECT CAST ( 1 AS INTEGER )          AS level,
            employee.name  		   AS lineage,
            employee.employee_id           AS employee_id,
            employee.manager_id            AS manager_id,
            employee.name                  AS name
       FROM employee
      WHERE employee.employee_id = employee.manager_id
     UNION ALL
     SELECT breadth_first_traversal.level + 1,
              (breadth_first_traversal.lineage || '-' || employee.name),
            employee.employee_id,
            employee.manager_id,
            employee.name
       FROM breadth_first_traversal
            INNER JOIN employee
                    ON employee.manager_id = breadth_first_traversal.employee_id
      WHERE employee.manager_id <> employee.employee_id )
SELECT employee_id,
       level,
       lineage
  FROM breadth_first_traversal
 ORDER BY level,
       lineage;



WITH RECURSIVE breadth_first_traversal
   ( level,
     lineage,
     employee_id,
     manager_id,
     name )
AS ( SELECT CAST ( 1 AS INTEGER )          AS level,
            cast(employee.employee_id as text)	   AS lineage,
            employee.employee_id           AS employee_id,
            employee.manager_id            AS manager_id,
            employee.name                  AS name
       FROM employee
      WHERE employee.employee_id = employee.manager_id
     UNION ALL
     SELECT breadth_first_traversal.level + 1,
	--CAST(employee.employee_id as TEXT),
              (CAST(breadth_first_traversal.lineage as TEXT) || '-' || CAST(employee.employee_id as TEXT)),
            employee.employee_id,
            employee.manager_id,
            employee.name
       FROM breadth_first_traversal
            INNER JOIN employee
                    ON employee.manager_id = breadth_first_traversal.employee_id
      WHERE employee.manager_id <> employee.employee_id )
SELECT employee_id,
       level,
       lineage
  FROM breadth_first_traversal
 ORDER BY level,
       lineage;



WITH RECURSIVE breadth_first_traversal
   ( level,
     lineage,
     employee_id,
     manager_id,
     name )
AS ( SELECT CAST ( 1 AS INTEGER )          AS level,
            employee.name  		   AS lineage,
            employee.employee_id           AS employee_id,
            employee.manager_id            AS manager_id,
            employee.name                  AS name
       FROM employee
      WHERE employee.employee_id = employee.manager_id
     UNION ALL
     SELECT breadth_first_traversal.level + 1,
              (breadth_first_traversal.lineage || '-' || employee.name),
            employee.employee_id,
            employee.manager_id,
            employee.name
       FROM breadth_first_traversal
            INNER JOIN employee
                    ON employee.manager_id = breadth_first_traversal.employee_id
      WHERE employee.manager_id <> employee.employee_id )
SELECT employee_id,
       level,
       lineage
  FROM breadth_first_traversal
 ORDER BY level,
       lineage;       