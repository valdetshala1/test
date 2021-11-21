DROP TABLE IF EXISTS trole CASCADE;
DROP TABLE IF EXISTS tuser_role CASCADE;
DROP TABLE IF EXISTS tsession CASCADE;
DROP TABLE IF EXISTS toperation CASCADE;
DROP TABLE IF EXISTS tobject CASCADE;
DROP TABLE IF EXISTS tpermission CASCADE;
DROP TABLE IF EXISTS trole_permission CASCADE;
DROP TABLE IF EXISTS tsession_role CASCADE;
DROP TABLE IF EXISTS tpermission_operation CASCADE;
DROP TABLE IF EXISTS tpermission_object CASCADE;


DROP TABLE IF EXISTS trbac_role CASCADE;
DROP TABLE IF EXISTS trbac_user_role CASCADE;
DROP TABLE IF EXISTS trbac_session CASCADE;
DROP TABLE IF EXISTS trbac_operation CASCADE;
DROP TABLE IF EXISTS trbac_object CASCADE;
DROP TABLE IF EXISTS trbac_permission CASCADE;
DROP TABLE IF EXISTS trbac_role_permission CASCADE;
DROP TABLE IF EXISTS trbac_session_role CASCADE;
DROP TABLE IF EXISTS trbac_permission_operation CASCADE;
DROP TABLE IF EXISTS trbac_permission_object CASCADE;

DROP TABLE IF EXISTS TUSER_PASSWORD CASCADE;
CREATE TABLE TUSER_PASSWORD
(
	ID SERIAL PRIMARY KEY NOT NULL,
	PASSWORD VARCHAR(100) NOT NULL,
	SALT_VALUE VARCHAR(50),
	HASH_VALUE VARCHAR(50),
	PASSWORD_ANSWER VARCHAR(255), --PasswordAnswer
	PASSWORD_QUESTION VARCHAR(255), --PasswordQuestion
	PASSWORD_STATUS VARCHAR(1) NOT NULL, --I=INITIAL, C=CHANGED, R=RESET, L=LOCKED
	ACTIVE BOOLEAN NOT NULL DEFAULT TRUE,
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW()
);
ALTER TABLE TUSER_PASSWORD OWNER TO POSTGRES;

DROP TABLE IF EXISTS TUSER CASCADE;
CREATE TABLE TUSER
(
	ID SERIAL PRIMARY KEY NOT NULL,
	FIRST_NAME VARCHAR(30) NOT NULL,
	LAST_NAME VARCHAR(30) NOT NULL,
	USERNAME VARCHAR(50) NOT NULL UNIQUE,
	BIRTHDATE DATE NOT NULL,
	PERSONAL_ID VARCHAR(20) , 
	GENDER VARCHAR(1) NOT NULL CHECK (GENDER IN ('M', 'F')), --ENUM('M','F')
	DEGREE VARCHAR(20), --academic degree
	EMAIL VARCHAR(50) NOT NULL ,
	PHONE VARCHAR(50),
	MOBILE VARCHAR(50),
	
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW(),
	ACTIVE BOOLEAN NOT NULL DEFAULT TRUE,
	PASSWORD_ID INTEGER NOT NULL, 
	PHOTO BYTEA,
	NOTES TEXT,

	FOREIGN KEY (PASSWORD_ID) REFERENCES TUSER_PASSWORD(ID)
);

DROP TABLE IF EXISTS TUSER_LOGIN_ATTEMPT CASCADE;
CREATE TABLE TUSER_LOGIN_ATTEMPT --LoginAttempt 
(
	ID BIGSERIAL PRIMARY KEY NOT NULL,	
	ACCOUNT_NAME VARCHAR(50) NOT NULL, --AccountName
	PASSWORD VARCHAR(100) NOT NULL, --Password
	IP_NUMBER VARCHAR(50), --IPNumber
	BROWSER_TYPE VARCHAR(150), --BrowserType
	SUCCESS BOOLEAN NOT NULL, --Success
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW()
);
ALTER TABLE TUSER_LOGIN_ATTEMPT OWNER TO POSTGRES;

DROP TABLE IF EXISTS TUSER_LOG CASCADE;
CREATE TABLE TUSER_LOG 
(
	ID SERIAL PRIMARY KEY NOT NULL,	
	USER_ID INTEGER UNIQUE NOT NULL,
	PASSWORD_CREATED TIMESTAMP NOT NULL DEFAULT NOW(),
	PASSWORD_GENERATED BOOLEAN,
	LOGIN_TRYS INTEGER,
	SUCCESSFUL_LOGIN TIMESTAMP,
	FAILED_LOGIN TIMESTAMP,
	IP_ACCESS VARCHAR(255),
	FOREIGN KEY (USER_ID) REFERENCES TUSER(ID)
);
ALTER TABLE TUSER_LOG OWNER TO POSTGRES;

DROP INDEX IF EXISTS IDX_tuser_username;
CREATE INDEX IDX_tuser_username ON tuser (username);

/* ---------------------------------------------------------------------- */
/* Add table "roles"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_role (
    id serial NOT NULL,
    name CHARACTER VARYING(100) NOT NULL,
    code CHARACTER VARYING(10) NOT NULL,
    PRIMARY KEY (id)
);

DROP INDEX IF EXISTS IDX_trbac_role_name;
DROP INDEX IF EXISTS IDX_trbac_role_code;
CREATE INDEX IDX_trbac_role_name ON trbac_role (name);
CREATE INDEX IDX_trbac_role_code ON trbac_role (code);

/* ---------------------------------------------------------------------- */
/* Add table "user_role"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_user_role (
    id serial PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    /*
    FOREIGN KEY (user_id) REFERENCES tuser(ID),
    FOREIGN KEY (role_id) REFERENCES trole(ID),
    */
    UNIQUE (user_id, role_id)
);

DROP INDEX IF EXISTS IDX_trbac_user_role_1;
DROP INDEX IF EXISTS IDX_trbac_user_role_2;
CREATE INDEX IDX_trbac_user_role_1 ON trbac_user_role (user_id);
CREATE INDEX IDX_trbac_user_role_2 ON trbac_user_role (role_id);

/* ---------------------------------------------------------------------- */
/* Add table "sessions"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_session (
    id SERIAL NOT NULL,
    user_id INTEGER  NOT NULL,
    name CHARACTER VARYING(64)  NOT NULL,
    created DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL,
    PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "operations"                                                 */
/* Boolean values are stored as integers 0 (false) and 1 (true). 		  */
/* _create, _read, _update, _delete, _print, _execute, _approve, _locked */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_operation (
    id SERIAL NOT NULL,
    name CHARACTER VARYING(20) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "objects"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_object (
    id SERIAL NOT NULL,
    name CHARACTER VARYING(100) NOT NULL,
    code CHARACTER VARYING(20) NOT NULL UNIQUE,
    locked SMALLINT DEFAULT 0  NOT NULL,
    parent_id INTEGER,
    PRIMARY KEY (id)
    --FOREIGN KEY (parent_id) REFERENCES trbac_object(id)
);

/* ---------------------------------------------------------------------- */
/* Add table "permissions"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_permission (
    id SERIAL PRIMARY KEY NOT NULL,
    name CHARACTER VARYING(100)  NOT NULL,
    code CHARACTER VARYING(10)  NOT NULL
);

/* ---------------------------------------------------------------------- */
/* Add table "role_permission"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_role_permission (
    id serial PRIMARY KEY NOT NULL,
    role_id INTEGER NOT NULL,
    permission_id INTEGER NOT NULL,
    UNIQUE (role_id, permission_id)
);

DROP INDEX IF EXISTS IDX_trbac_role_permission_1;
DROP INDEX IF EXISTS IDX_trbac_role_permission_2;
CREATE INDEX IDX_trbac_role_permission_1 ON trbac_role_permission (role_id);
CREATE INDEX IDX_trbac_role_permission_2 ON trbac_role_permission (permission_id);

/* ---------------------------------------------------------------------- */
/* Add table "session_role"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_session_role (
	id serial PRIMARY KEY NOT NULL,
	role_id INTEGER  NOT NULL,
	session_id INTEGER  NOT NULL,
	UNIQUE (role_id, session_id)
);

DROP INDEX IF EXISTS IDX_trbac_session_role_1;
DROP INDEX IF EXISTS IDX_trbac_session_role_2;
CREATE INDEX IDX_trbac_session_role_1 ON trbac_session_role (role_id);
CREATE INDEX IDX_trbac_session_role_2 ON trbac_session_role (session_id);

/* ---------------------------------------------------------------------- */
/* Add table "trbac_permission_operation"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE trbac_permission_operation (
	id serial PRIMARY KEY NOT NULL,
	permission_id INTEGER  NOT NULL,
	operation_id INTEGER  NOT NULL,
	operation_value SMALLINT NOT NULL,
	UNIQUE (permission_id, operation_id)
);

DROP INDEX IF EXISTS IDX_trbac_permission_operation_1;
DROP INDEX IF EXISTS IDX_trbac_permission_operation_2;
CREATE INDEX IDX_trbac_permission_operation_1 ON trbac_permission_operation (permission_id);
CREATE INDEX IDX_trbac_permission_operation_2 ON trbac_permission_operation (operation_id);


/* ---------------------------------------------------------------------- */
/* Add table "trbac_permission_object"                                      */
/* ---------------------------------------------------------------------- */
CREATE TABLE trbac_permission_object (
	id serial PRIMARY KEY NOT NULL,
	permission_id INTEGER NOT NULL,
	object_id INTEGER NOT NULL,
	UNIQUE (permission_id, object_id)
);

DROP INDEX IF EXISTS IDX_trbac_permission_object_1;
DROP INDEX IF EXISTS IDX_trbac_permission_object_2;
CREATE INDEX IDX_trbac_permission_object_1 ON trbac_permission_object (permission_id);
CREATE INDEX IDX_trbac_permission_object_2 ON trbac_permission_object (object_id);

/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE trbac_user_role ADD CONSTRAINT trbac_user_role_user 
    FOREIGN KEY (user_id) REFERENCES tuser (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_user_role ADD CONSTRAINT trbac_user_role_role 
    FOREIGN KEY (role_id) REFERENCES trbac_role (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_session ADD CONSTRAINT trbac_session_user 
    FOREIGN KEY (user_id) REFERENCES tuser (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_role_permission ADD CONSTRAINT trbac_role_role_permission 
    FOREIGN KEY (role_id) REFERENCES trbac_role (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_role_permission ADD CONSTRAINT trbac_permission_role_permission 
    FOREIGN KEY (permission_id) REFERENCES trbac_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_session_role ADD CONSTRAINT trbac_session_role_role 
    FOREIGN KEY (role_id) REFERENCES trbac_role (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_session_role ADD CONSTRAINT trbac_session_role_session 
    FOREIGN KEY (session_id) REFERENCES trbac_session (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_permission_object ADD CONSTRAINT trbac_permission_object_permission 
    FOREIGN KEY (permission_id) REFERENCES trbac_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trbac_permission_object ADD CONSTRAINT trbac_permission_object_object 
    FOREIGN KEY (object_id) REFERENCES trbac_object (id) ON DELETE CASCADE ON UPDATE CASCADE;
    
 ALTER TABLE trbac_permission_operation ADD CONSTRAINT trbac_permission_operation_permission 
    FOREIGN KEY (permission_id) REFERENCES trbac_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;
    
 ALTER TABLE trbac_permission_operation ADD CONSTRAINT trbac_permission_operation_operation 
    FOREIGN KEY (operation_id) REFERENCES trbac_operation(id) ON DELETE CASCADE ON UPDATE CASCADE;


/* ------------ */
/* INSERT DATA  */
/* ------------ */
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_create');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_read');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_update');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_delete');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_print');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_execute');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_approve');
insert into trbac_operation values(nextval('trbac_operation_id_seq'), '_locked');

insert into trbac_permission values(nextval('trbac_permission_id_seq'), 'Adminstrator', 'admin');
insert into trbac_permission values(nextval('trbac_permission_id_seq'), 'Municipality Officier', 'munoff');
insert into trbac_permission values(nextval('trbac_permission_id_seq'), 'Employee', 'employee');
insert into trbac_permission values(nextval('trbac_permission_id_seq'), 'Locked', 'locked');

insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_operation where name = '_create'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_operation where name = '_read'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_operation where name = '_update'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_operation where name = '_delete'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_operation where name = '_print'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_operation where name = '_execute'), 1);

insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'locked'), (select id from trbac_operation where name = '_locked'), 1);

insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'munoff'), (select id from trbac_operation where name = '_create'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'munoff'), (select id from trbac_operation where name = '_read'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'munoff'), (select id from trbac_operation where name = '_update'), 1);

insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'employee'), (select id from trbac_operation where name = '_create'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'employee'), (select id from trbac_operation where name = '_read'), 1);
insert into trbac_permission_operation values(nextval('trbac_permission_operation_id_seq'), (select id from trbac_permission where code = 'employee'), (select id from trbac_operation where name = '_update'), 1);

/*rbac objects*/
insert into trbac_object values(nextval('trbac_object_id_seq'), 'KFIS', 'kfis', 0, null);

insert into trbac_object values(nextval('trbac_object_id_seq'), 'System Adminstration', 'adm', 0, (select id from trbac_object where code = 'kfis'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Administration Support', 'ads', 0, (select id from trbac_object where code = 'kfis'));

insert into trbac_object values(nextval('trbac_object_id_seq'), 'test1', 'adm-test1', 0, (select id from trbac_object where code = 'adm'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'test2', 'adm-test2', 0, (select id from trbac_object where code = 'adm'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'test3', 'adm-test3', 0, (select id from trbac_object where code = 'adm'));

insert into trbac_object values(nextval('trbac_object_id_seq'), 'Forestry Management', 'frm', 0, (select id from trbac_object where code = 'kfis'));

insert into trbac_object values(nextval('trbac_object_id_seq'), 'Human Resource Management', 'hrm', 0, (select id from trbac_object where code = 'kfis'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Attendace', 'attendace', 0, (select id from trbac_object where code = 'hrm'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Employee', 'employee', 0, (select id from trbac_object where code = 'hrm'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Leave', 'leave', 0, (select id from trbac_object where code = 'hrm'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Skill', 'skill', 0, (select id from trbac_object where code = 'hrm'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Travel', 'travel', 0, (select id from trbac_object where code = 'hrm'));

insert into trbac_object values(nextval('trbac_object_id_seq'), 'Travel test1', 'test1', 0, (select id from trbac_object where code = 'travel'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Travel test2', 'test2', 0, (select id from trbac_object where code = 'travel'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'Travel test3', 'test3', 0, (select id from trbac_object where code = 'travel'));

insert into trbac_object values(nextval('trbac_object_id_seq'), 'test31', 'test31', 0, (select id from trbac_object where code = 'test3'));
insert into trbac_object values(nextval('trbac_object_id_seq'), 'test32', 'test32', 0, (select id from trbac_object where code = 'test3'));

insert into trbac_object values(nextval('trbac_object_id_seq'), 'test41', 'test41', 0, (select id from trbac_object where code = 'frm'));



/*rbac permissiion to objects*/
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'adm'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'ads'));

insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'locked'), (select id from trbac_object where code = 'ads'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'locked'), (select id from trbac_object where code = 'hrm'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'locked'), (select id from trbac_object where code = 'frm'));

insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'hrm'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'attendace'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'employee'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'leave'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'skill'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'admin'), (select id from trbac_object where code = 'travel'));

insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'munoff'), (select id from trbac_object where code = 'hrm'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'munoff'), (select id from trbac_object where code = 'attendace'));

insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'employee'), (select id from trbac_object where code = 'hrm'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'employee'), (select id from trbac_object where code = 'employee'));
insert into trbac_permission_object values(nextval('trbac_permission_object_id_seq'), (select id from trbac_permission where code = 'employee'), (select id from trbac_object where code = 'travel'));

/*rbac roles*/
insert into trbac_role values(nextval('trbac_role_id_seq'), 'Superuser', 'superuser');
insert into trbac_role values(nextval('trbac_role_id_seq'), 'Municipal Officier', 'mun_off');
insert into trbac_role values(nextval('trbac_role_id_seq'), 'KFA Administator', 'kfa_admin');

/* create users */
insert into TUSER_PASSWORD values(nextval('tuser_password_id_seq'), 'bekim.bajraktari', null, null, null, null, 'I', TRUE, '2014-09-04');
insert into tuser values(nextval('tuser_id_seq'), 'Bekim', 'Bajraktari', 'bekim.bajraktari@gmx.de', '1971-12-15', '3432423423', 'M', NULL, 'bekim.bajraktari@gmx.de', 
NULL, NULL, '2014-07-07', TRUE, currval('tuser_password_id_seq'), NULL, NULL);

insert into TUSER_PASSWORD values(nextval('tuser_password_id_seq'), 'admin.demo', null, null, null, null, 'I', TRUE, '2014-09-04');
insert into tuser values(nextval('tuser_id_seq'), 'Admin', 'Demo', 'admin.demo@geoland.com', '1971-12-15', '121212121', 'M', NULL, 'admin.demo@geoland.com', 
NULL, NULL, '2014-07-07', TRUE, currval('tuser_password_id_seq'), NULL, NULL);

insert into TUSER_PASSWORD values(nextval('tuser_password_id_seq'), 'producer.demo', null, null, null, null, 'I', TRUE, '2014-09-04');
insert into tuser values(nextval('tuser_id_seq'), 'Producer', 'Demo', 'producer.demo@geoland.com', '1971-12-15', '347876876', 'M', NULL, 'producer.demo@geoland.com', 
NULL, NULL, '2014-07-07', TRUE, currval('tuser_password_id_seq'), NULL, NULL);

insert into TUSER_PASSWORD values(nextval('tuser_password_id_seq'), 'farmer.demo', null, null, null, null, 'I', TRUE, '2014-09-04');

insert into TUSER values(nextval('tuser_id_seq'), 'Farmer', 'Demo', 'farmer.demo@geoland.com', '1971-12-15', '545454545', 'M', NULL, 'farmer.demo@geoland.com', 
NULL, NULL, '2014-07-07', TRUE, currval('tuser_password_id_seq'), NULL, NULL);

/*rbac user roles*/
insert into trbac_user_role values(nextval('trbac_user_role_id_seq'), (select id from tuser where username = 'bekim.bajraktari@gmx.de'), (select id from trbac_role where code = 'superuser'));
insert into trbac_user_role values(nextval('trbac_user_role_id_seq'), (select id from tuser where username = 'bekim.bajraktari@gmx.de'), (select id from trbac_role where code = 'mun_off'));
insert into trbac_user_role values(nextval('trbac_user_role_id_seq'), (select id from tuser where username = 'bekim.bajraktari@gmx.de'), (select id from trbac_role where code = 'kfa_admin'));

/*rbac role permissions*/
insert into trbac_role_permission values(nextval('trbac_role_permission_id_seq'), (select id from trbac_role where code = 'superuser'), (select id from trbac_permission where code = 'admin'));
insert into trbac_role_permission values(nextval('trbac_role_permission_id_seq'), (select id from trbac_role where code = 'mun_off'), (select id from trbac_permission where code = 'munoff'));
insert into trbac_role_permission values(nextval('trbac_role_permission_id_seq'), (select id from trbac_role where code = 'kfa_admin'), (select id from trbac_permission where code = 'munoff'));

insert into trbac_role_permission values(nextval('trbac_role_permission_id_seq'), (select id from trbac_role where code = 'superuser'), (select id from trbac_permission where code = 'locked'));


WITH RECURSIVE objecttree(id, parent_id, object_name, code, path, depth) AS (
    SELECT id, parent_id, name, code, NULL::int[] || parent_id, 1 FROM trbac_object WHERE parent_id = 1 -- set root id

  UNION ALL

    SELECT 
    t.id, t.parent_id,
    name, t.code, rt.path || t.parent_id, depth + 1
    FROM trbac_object t
    JOIN objecttree rt ON rt.id = t.parent_id
  )
SELECT * FROM objecttree;


insert into trbac_object values(nextval('trbac_object_id_seq'), 'test1', 'adm-test4', 0, (select id from trbac_object where code = 'adm'));

-- View: public.rbac_object_view

DROP VIEW IF EXISTS public.rbac_object_view;

CREATE OR REPLACE VIEW public.rbac_object_view AS 
 WITH RECURSIVE objecttree(id, parent_id, object_name, code, path, depth) AS (
                 SELECT trbac_object.id,
                    trbac_object.parent_id,
                    trbac_object.name,
                    trbac_object.code,
                    NULL::integer[] || trbac_object.parent_id,
                    1
                   FROM trbac_object
                  WHERE trbac_object.parent_id = 1
        UNION ALL
                 SELECT t.id,
                    t.parent_id,
                    t.name,
                    t.code,
                    rt.path || t.parent_id,
                    rt.depth + 1
                   FROM trbac_object t
              JOIN objecttree rt ON rt.id = t.parent_id
        )
 SELECT objecttree.id,
    objecttree.parent_id,
    objecttree.object_name,
    objecttree.code,
    objecttree.path,
    objecttree.depth
   FROM objecttree
  ORDER BY objecttree.object_name, objecttree.path;

ALTER TABLE public.rbac_object_view
  OWNER TO postgres;


/* some selects about rbac */
/*
select * from trbac_operation
select * from trbac_object
select * from trbac_user_role 
select * from trbac_role_permission
select * from trbac_permission_object 
select * from trbac_permission_operation

select po.* from trbac_permission_object as po left join trbac_role_permission as rp on po.permission_id = rp.permission_id left join trbac_user_role as ur on ur.role_id = rp.role_id where ur.user_id = 1 and po.object_id = 6

select pop.* from trbac_permission_object as po left join trbac_role_permission as rp on po.permission_id = rp.permission_id 
left join trbac_user_role as ur on ur.role_id = rp.role_id left join trbac_permission_operation as pop on pop.permission_id = rp.permission_id 
where ur.user_id = 1 and po.object_id = 6 and pop.operation_id = 8

select count(po.*) as count from trbac_permission_object as po left join trbac_role_permission as rp on po.permission_id = rp.permission_id left join trbac_user_role as ur on ur.role_id = rp.role_id where ur.user_id = 1 and po.permission_id = 1 and po.object_id = 6
*/


/*
delete from trbac_permission_object where permission_id in (select id from trbac_permission where code = 'locked');
*/
/*
select count(pop.*) from trbac_permission_object as po left join trbac_role_permission as rp on po.permission_id = rp.permission_id  left join trbac_user_role as ur on ur.role_id = rp.role_id left join trbac_permission_operation as pop on pop.permission_id = rp.permission_id  where ur.user_id = 1 and po.object_id = 3 and pop.operation_id = 8
select count(pop.*) from trbac_permission_object as po left join trbac_role_permission as rp on po.permission_id = rp.permission_id  left join trbac_user_role as ur on ur.role_id = rp.role_id left join trbac_permission_operation as pop on pop.permission_id = rp.permission_id  where ur.user_id = 1 and po.object_id = 2 and pop.operation_id = 8
select count(pop.*) from trbac_permission_object as po left join trbac_role_permission as rp on po.permission_id = rp.permission_id  left join trbac_user_role as ur on ur.role_id = rp.role_id left join trbac_permission_operation as pop on pop.permission_id = rp.permission_id  where ur.user_id = 1 and po.object_id = 1 and pop.operation_id = 8
*/

