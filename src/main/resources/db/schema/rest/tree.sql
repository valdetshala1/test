/*
http://explainextended.com/2009/09/24/adjacency-list-vs-nested-sets-postgresql/#
*/

drop table t_hierarchy;

create table t_hierarchy(
id bigserial primary key,
lft bigint not null,
rgt bigint not null
);



insert into t_hierarchy values(0,1,14);
insert into t_hierarchy values(1,2,12);
insert into t_hierarchy values(2,3,3);
insert into t_hierarchy values(3,4,6);
insert into t_hierarchy values(4,5,5);
insert into t_hierarchy values(5,7,11);
insert into t_hierarchy values(6,8,10);
insert into t_hierarchy values(7,9,9);
insert into t_hierarchy values(8,13,13);

/*
ancestors = Vorfahren

To find out all ancestors of a given node, we just select all nodes that contain its LFT boundary (which in a properly built hierarchy implies containing the RGT boundary too):
*/
select * from t_hierarchy
SELECT  hp.*
FROM    t_hierarchy hc
JOIN    t_hierarchy hp
ON      hc.lft BETWEEN hp.lft AND hp.rgt
WHERE   hc.id = 4

/*
And to find the descendants, we shoud just reverse the condition, i. e. find all nodes that are contained between the current node's boundaries:
descendants = Nachkommen
*/
SELECT  hc.*
FROM    t_hierarchy hp
JOIN    t_hierarchy hc
ON      hc.lft BETWEEN hp.lft AND hp.rgt
WHERE   hp.id = 4

/*
This is the query to get all descendants up to the third generation (that is node itself, all children and grandchildren):
*/
SELECT  hc.*
FROM    t_hierarchy hp
JOIN    t_hierarchy hc
ON      hc.lft BETWEEN hp.lft AND hp.rgt
WHERE   hp.id = 1
        AND
        (
        SELECT  COUNT(*)
        FROM    t_hierarchy hn
        WHERE   hc.lft BETWEEN hn.lft AND hn.rgt
                AND hn.lft BETWEEN hp.lft AND hp.rgt
        ) <= 1000



/*
post
*/

select * from t_hierarchy;
CREATE TABLE t_hierarchy (
        id INT NOT NULL,
        parent INT NOT NULL,
        lft INT NOT NULL,
        rgt INT NOT NULL,
        data VARCHAR(100) NOT NULL,
        stuffing VARCHAR(100) NOT NULL
);

insert into t_hierarchy values(0,1,1,2);
insert into t_hierarchy values(1,0,12);
insert into t_hierarchy values(2,3,3);
insert into t_hierarchy values(3,4,6);
insert into t_hierarchy values(4,5,5);
insert into t_hierarchy values(5,7,11);
insert into t_hierarchy values(6,8,10);
insert into t_hierarchy values(7,9,9);
insert into t_hierarchy values(8,13,13);



INSERT
INTO    t_hierarchy
WITH RECURSIVE
        ini AS
        (
        SELECT  3 AS level, 2 AS children
        ),
        range AS
        (
        SELECT  level, children,
                (
                SELECT  SUM(POW(children, n)::INTEGER * ((n < level)::INTEGER + 1))
                FROM    generate_series(level, 0, -1) n
                ) width
        FROM    ini
        ),
        q AS
        (
        SELECT  s AS id, 0 AS parent, level, children,
                1 + width * (s - 1) AS lft,
                1 + width * s - 1 AS rgt,
                width / children AS width
        FROM    (
                SELECT  r.*, generate_series(1, children) s
                FROM    range r
                ) q2
        UNION ALL
        SELECT  id * children + position, id, level - 1, children,
                1 + lft + width * (position - 1),
                1 + lft + width * position - 1,
                width / children
        FROM    (
                SELECT  generate_series(1, children) AS position, q.*
                FROM    q
                ) q2
        WHERE   level > 0
        )
SELECT  id, parent, lft, rgt, 'Value ' || id, RPAD('', 10, '*')
FROM    q;

ALTER TABLE t_hierarchy ADD CONSTRAINT pk_hierarchy_id PRIMARY KEY (id);
CREATE INDEX ix_hierarchy_lft ON t_hierarchy (lft);
CREATE INDEX ix_hierarchy_rgt ON t_hierarchy (rgt);
CREATE INDEX ix_hierarchy_parent ON t_hierarchy (parent);

ANALYZE t_hierarchy;


SELECT  SUM(LENGTH(hc.stuffing))
FROM    t_hierarchy hp
JOIN    t_hierarchy hc
ON      hc.lft BETWEEN hp.lft AND hp.rgt
WHERE   hp.id = 2


WITH    RECURSIVE
        q AS
        (
        SELECT  id, stuffing
        FROM    t_hierarchy h
        WHERE   id = 2
        UNION ALL
        SELECT  hc.id, hc.stuffing
        FROM    q
        JOIN    t_hierarchy hc
        ON      hc.parent = q.id
        )
SELECT  SUM(LENGTH(stuffing))
FROM    q


SELECT  hp.id, hp.parent, hp.lft, hp.rgt, hp.data
FROM    t_hierarchy hc
JOIN    t_hierarchy hp
ON      hc.lft BETWEEN hp.lft AND hp.rgt
WHERE   hc.id = 4
ORDER BY
        hp.lft,hp.rgt

select * from t_hierarchy

WITH    RECURSIVE
        q AS
        (
        SELECT  h.*, 1 AS level
        FROM    t_hierarchy h
        WHERE   id = 4
        UNION ALL
        SELECT  hp.*, level + 1
        FROM    q
        JOIN    t_hierarchy hp
        ON      hp.id = q.parent
        )
SELECT  id, parent, lft, rgt, data
FROM    q
ORDER BY
        level DESC


SELECT  hc.id, hc.parent, hc.lft, hc.rgt, hc.data
FROM    t_hierarchy hp
JOIN    t_hierarchy hc
ON      hc.lft BETWEEN hp.lft AND hp.rgt
WHERE   hp.id = 1
        AND
        (
        SELECT  COUNT(*)
        FROM    t_hierarchy hn
        WHERE   hc.lft BETWEEN hn.lft AND hn.rgt
                AND hn.lft BETWEEN hp.lft AND hp.rgt
        ) <= 3
        

select * from t_hierarchy
delete from t_hierarchy

WITH    RECURSIVE
        q AS
        (
        SELECT  id, parent, lft, rgt, data, ARRAY[id] AS level
        FROM    t_hierarchy hc
        --WHERE   id = 10
        UNION ALL
        SELECT  hc.id, hc.parent, hc.lft, hc.rgt, hc.data, q.level || hc.id
        FROM    q
        JOIN    t_hierarchy hc
        ON      hc.parent = q.id
        WHERE   array_upper(level, 1) < 3
        )
SELECT  id, parent, lft, rgt, data
FROM    q
ORDER BY
        level


