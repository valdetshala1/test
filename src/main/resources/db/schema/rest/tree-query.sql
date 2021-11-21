--http://truongtx.me/2014/02/28/tree-structure-query-with-postgresql/
--http://www.postgresonline.com/journal/archives/173-Using-LTree-to-Represent-and-Query-Hierarchy-and-Tree-Structures.html
--http://www.sqlteam.com/article/more-trees-hierarchies-in-sql
--http://scn.sap.com/community/sql-anywhere/blog/2014/02/05/using-recursive-queries-with-sql-anywhere

CREATE TABLE "People"
(
  id serial NOT NULL,
  name character varying NOT NULL,
  CONSTRAINT pk_people PRIMARY KEY (id)
);

CREATE TABLE "PedigreeRelations"
(
  "parentId" integer NOT NULL,
  "childId" integer NOT NULL,
  CONSTRAINT pk_pedigree PRIMARY KEY ("parentId", "childId"),
  CONSTRAINT fk_pedigree_child FOREIGN KEY ("childId")
      REFERENCES "People" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_pedigree_inside FOREIGN KEY ("parentId")
      REFERENCES "People" (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO "People" ("name") VALUES
('Root husband'),('F1.1 inside'),('F1.2 inside'),('F1.3 inside'),
('F2.1 inside'),('F2.2 inside'),('F2.3 inside'),('F2.4 inside'),('F3.1 inside');

INSERT INTO "PedigreeRelations" ("parentId","childId") VALUES
(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(3,8),(7,9);


WITH RECURSIVE nodes(parentId, parentName, childId, childName, path, depth) AS (
	SELECT
		r."parentId", p1."name",
		r."childId", p2."name",
		ARRAY[r."parentId"], 1
	FROM "PedigreeRelations" AS r, "People" AS p1, "People" AS p2
	WHERE r."parentId" = 1 -- change this to the root id
	AND 
	p1."id" = r."parentId" AND p2."id" = r."childId"

	UNION ALL
	
	SELECT
		r."parentId", p1."name",
		r."childId", p2."name",
		path || r."parentId", nd.depth + 1
	FROM "PedigreeRelations" AS r, "People" AS p1, "People" AS p2, nodes AS nd
	WHERE r."parentId" = nd.childId
	AND p1."id" = r."parentId" AND p2."id" = r."childId" -- AND depth < 2
)
SELECT * FROM nodes;



WITH RECURSIVE nodes(parentId, parentName, childId, childName, path, depth) AS (

	SELECT
		r.parent_id, p1.name,
		r.id, p2.name,
		ARRAY[r.parent_id], 1
	FROM trbac_object AS r, trbac_object AS p1, trbac_object AS p2
	WHERE 
	r.parent_id = 1 -- change this to the root id
	AND 
	p1.id = r.parent_id AND p2.id = r.id
	
	UNION ALL
	
	SELECT
		r."parent_id", p1."name",
		r."id", p2."name",
		path || r."parent_id", nd.depth + 1
	FROM trbac_object AS r, "trbac_object" AS p1, "trbac_object" AS p2,  nodes AS nd
	WHERE r."parent_id" = nd.id
	AND p1."id" = r."parent_id" AND p2."id" = r."id" -- AND depth < 2
)
SELECT * FROM nodes;


WITH RECURSIVE objecttree(id, parent_ids, object_name, depth) AS (
    SELECT id, NULL::int[] || parent_id, name, 1 FROM trbac_object WHERE parent_id = 1 -- set root id

  UNION ALL

    SELECT 
    t.id, 
    rt.parent_ids || t.parent_id, name, depth + 1
    FROM trbac_object t
    JOIN objecttree rt ON rt.id = t.parent_id
  )
SELECT * FROM objecttree ORDER BY parent_ids;


WITH RECURSIVE objecttree(id, parent_ids, object_name, depth) AS (
    SELECT id, NULL::integer[] || parent_id, name, 1 FROM trbac_object WHERE parent_id = 1 -- set root id

  UNION ALL

    SELECT 
    t.id, 
    rt.parent_ids || t.parent_id, name, depth + 1
    FROM trbac_object t
    JOIN objecttree rt ON rt.id = t.parent_id
  )
SELECT * FROM objecttree ORDER BY parent_ids;


--Secure Usage

/* Positional parameter in HQL */
Query hqlQuery = session.createQuery("from Orders as orders where orders.id = ?");List results = hqlQuery.setString(0, "123-ADB-567-QTWYTFDL").list(); 


/* named parameter in HQL */
Query hqlQuery = session.createQuery("from Employees as emp where emp.incentive > :incentive");List results = hqlQuery.setLong("incentive", new Long(10000)).list(); 


/* named parameter list in HQL */
List items = new ArrayList(); items.add("book"); items.add("clock"); items.add("ink");List results = session.createQuery("from Cart as cart where cart.item in (:itemList)").setParameterList("itemList", items).list(); 


/* JavaBean in HQL */
Query hqlQuery = session.createQuery("from Books as books where book.name = :name and book.author = :author");List results = hqlQuery.setProperties(javaBean).list(); //assumes javaBean has getName() & getAuthor() methods. 

/* Native-SQL */
Query sqlQuery = session.createSQLQuery("Select * from Books where author = ?");List results = sqlQuery.setString(0, "Charles Dickens").list(); 

/*
Assuming data used in the above code snippets is user input, that has not been validated or escaped and it contains malicious database code (payload), 
the payload will be escaped appropriately by the JDBC driver (since parameterized queries are used), such that it would be used as data and not as code.
*/

Vulnerable Usage
List results = session.createQuery("from Orders as orders where orders.id = " + currentOrder.getId()).list();
List results = session.createSQLQuery("Select * from Books where author = " + book.getAuthor()).list

/*
Assuming orderId and author are user input that have not been validated or escaped, 
it leaves the above queries vulnerable to SQL and HQL(ORM) injection attacks. 
*/