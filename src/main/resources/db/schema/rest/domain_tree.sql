CREATE TABLE TFRM_S_DOMAIN(
 ID BIGSERIAL PRIMARY KEY NOT NULL, 
 PARENT_ID INTEGER ,
 NAME_AL VARCHAR(50) NOT NULL,
 NAME_EN VARCHAR(50) NOT NULL,
 NAME_SR VARCHAR(50) NOT NULL,
 TYPE VARCHAR(50) NOT NULL,--G-for group and A-for Activity
 SORT SMALLINT NOT NULL
);

CREATE OR REPLACE VIEW tdomaintree_view AS 
WITH RECURSIVE domaintree(id, parent_id, name_al, name_en, name_sr, type, sort, path, depth) AS (
                 SELECT tfrm_s_domain.id, tfrm_s_domain.parent_id, 
                    tfrm_s_domain.name_al, tfrm_s_domain.name_en, tfrm_s_domain.name_sr, tfrm_s_domain.type, tfrm_s_domain.sort, 
                    NULL::integer[] || tfrm_s_domain.parent_id as path, 1
                   FROM tfrm_s_domain
                  WHERE tfrm_s_domain.parent_id = 1
        UNION ALL 
                 SELECT t.id, t.parent_id, t.name_al, t.name_en, t.name_sr, t.type, t.sort, 
                    rt.path || t.parent_id, rt.depth + 1
                   FROM tfrm_s_domain t
              JOIN domaintree rt ON rt.id = t.parent_id
        )
 SELECT domaintree.id, domaintree.parent_id, domaintree.name_al, domaintree.name_en, domaintree.name_sr, domaintree.type,
    domaintree.sort, domaintree.path, domaintree.depth
   FROM domaintree
  ORDER BY (path || sort::int)::text
  
  
/*new staff*/  
delete from tfrm_s_domain
select * from tfrm_s_domain
select * from breadth_first_traversal
select * from tdomaintree_view

DROP TABLE tfrm_s_domain CASCADE;


CREATE TABLE TFRM_S_DOMAIN(
 ID BIGSERIAL PRIMARY KEY NOT NULL, 
 PARENT_ID INTEGER ,
 NAME_AL VARCHAR(50) NOT NULL,
 NAME_EN VARCHAR(50) NOT NULL,
 NAME_SR VARCHAR(50) NOT NULL,
 TYPE VARCHAR(50) NOT NULL,--G-for group and A-for Activity
 SORT SMALLINT NOT NULL
);

DROP INDEX ix_tfrm_s_domain_parent_id;
CREATE INDEX ix_tfrm_s_domain_parent_id ON tfrm_s_domain (parent_id);

/*
0

1
1.1
1.2

2
2.1
2.2

3
3.1
3.2
3.3

*/

insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), null, '0', '0', '0', '', 1);
insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '0'), '1', '1', '1', '', 1);
insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '0'), '2', '2', '2', '', 1);
insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '0'), '3', '3', '3', '', 1);

insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '1'), '1.1', '1.1', '1.1', '', 1);
insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '1'), '1.2', '1.2', '1.2', '', 1);

insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '2'), '2.1', '2.1', '2.1', '', 1);

insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '3'), '3.1', '3.1', '3.1', '', 1);

insert into tfrm_s_domain values(nextval('tfrm_s_domain_id_seq'), (select id from tfrm_s_domain where name_al = '3.1'), '3.1.1', '3.1.1', '3.1.1', '', 1);


CREATE OR REPLACE VIEW public.breadth_first_traversal AS
WITH RECURSIVE breadth_first_traversal
   ( level,
     lineage,
     employee_id,
     manager_id,
     name )
AS ( SELECT CAST ( 1 AS INTEGER )          AS level,
            cast(tfrm_s_domain.id as text)	   AS lineage,
            tfrm_s_domain.id           AS employee_id,
            tfrm_s_domain.parent_id            AS manager_id,
            tfrm_s_domain.name_al                  AS name
       FROM tfrm_s_domain
      WHERE tfrm_s_domain.id = tfrm_s_domain.parent_id
     UNION ALL
     SELECT breadth_first_traversal.level + 1,
	--CAST(employee.employee_id as TEXT),
              (CAST(breadth_first_traversal.lineage as TEXT) || '-' || CAST(tfrm_s_domain.parent_id as TEXT)),
            tfrm_s_domain.id,
            tfrm_s_domain.parent_id,
            tfrm_s_domain.name_al
       FROM breadth_first_traversal
            INNER JOIN tfrm_s_domain
                    ON tfrm_s_domain.parent_id = breadth_first_traversal.employee_id
      WHERE tfrm_s_domain.parent_id <> tfrm_s_domain.id )
SELECT employee_id,
       level,
       lineage,
       name
  FROM breadth_first_traversal
 ORDER BY level,
       lineage;


  SELECT breadth_first_traversal.level,
       breadth_first_traversal.name
  FROM breadth_first_traversal
 WHERE breadth_first_traversal.employee_id = 8
 ORDER BY breadth_first_traversal.level DESC;



CREATE OR REPLACE VIEW public.tdomaintree_view AS 
 WITH RECURSIVE domaintree(id, parent_id, name_al, name_en, name_sr, type, sort, path, depth) AS (
                 SELECT tfrm_s_domain.id,
                    tfrm_s_domain.parent_id,
                    tfrm_s_domain.name_al,
                    tfrm_s_domain.name_en,
                    tfrm_s_domain.name_sr,
                    tfrm_s_domain.type,
                    tfrm_s_domain.sort,
                    NULL::integer[] || tfrm_s_domain.parent_id AS path,
                    1
                   FROM tfrm_s_domain
                  WHERE tfrm_s_domain.parent_id = 1
        UNION ALL
                 SELECT t.id,
                    t.parent_id,
                    t.name_al,
                    t.name_en,
                    t.name_sr,
                    t.type,
                    t.sort,
                    rt.path || t.parent_id,
                    rt.depth + 1
                   FROM tfrm_s_domain t
              JOIN domaintree rt ON rt.id = t.parent_id
        )
 SELECT domaintree.id,
    domaintree.parent_id,
    domaintree.name_al,
    domaintree.name_en,
    domaintree.name_sr,
    domaintree.type,
    domaintree.sort,
    domaintree.path,
    domaintree.depth
   FROM domaintree
  ORDER BY (domaintree.depth, domaintree.id);




select * from tdomaintree_view
where id = 3