

CREATE TABLE users (
    user_id INTEGER  NOT NULL,
    username CHARACTER VARYING(40)  NOT NULL,
    password CHARACTER VARYING(64)  NOT NULL,
    nonce DATE DEFAULT NOW()  NOT NULL,
    first_name CHARACTER VARYING(50)  NOT NULL,
    family_name CHARACTER VARYING(100)  NOT NULL,
    email CHARACTER VARYING(100)  NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE INDEX IDX_users_1 ON users (username);

/* ---------------------------------------------------------------------- */
/* Add table "roles"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE roles (
    role_id INTEGER  NOT NULL,
    name CHARACTER VARYING(100)  NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE INDEX IDX_roles_1 ON roles (name);

/* ---------------------------------------------------------------------- */
/* Add table "user_role"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE user_role (
    user_id INTEGER  NOT NULL,
    role_id INTEGER  NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

CREATE INDEX IDX_user_role_1 ON user_role (user_id);

CREATE INDEX IDX_user_role_2 ON user_role (role_id);

/* ---------------------------------------------------------------------- */
/* Add table "sessions"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE sessions (
    session_id INTEGER  NOT NULL,
    user_id INTEGER  NOT NULL,
    name CHARACTER VARYING(64)  NOT NULL,
    created DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL,
    PRIMARY KEY (session_id)
);

/* ---------------------------------------------------------------------- */
/* Add table "operations"                                                 */
/* Boolean values are stored as integers 0 (false) and 1 (true). 		  */
/* ---------------------------------------------------------------------- */

CREATE TABLE operations (
    operation_id INTEGER  NOT NULL,
    name CHARACTER VARYING(100)  NOT NULL,
    _create SMALLINT DEFAULT NULL,
    _read SMALLINT DEFAULT NULL,
    _update SMALLINT DEFAULT NULL,
    _delete SMALLINT DEFAULT NULL,
    _print SMALLINT DEFAULT NULL,
    _execute SMALLINT DEFAULT NULL,
    _approve SMALLINT DEFAULT NULL,
    locked SMALLINT DEFAULT 0  NOT NULL,
    PRIMARY KEY (operation_id)
);

/* ---------------------------------------------------------------------- */
/* Add table "objects"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE objects (
    object_id INTEGER  NOT NULL,
    name CHARACTER VARYING(100)  NOT NULL,
    locked SMALLINT DEFAULT 0  NOT NULL,
    PRIMARY KEY (object_id)
);

/* ---------------------------------------------------------------------- */
/* Add table "permissions"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE permissions (
    permission_id INTEGER PRIMARY KEY NOT NULL,
    object_id INTEGER  NOT NULL,
    operation_id INTEGER  NOT NULL,
    name CHARACTER VARYING(100)  NOT NULL,
    UNIQUE (permission_id, object_id, operation_id)
);

CREATE INDEX IDX_permission_1 ON permissions (object_id);

CREATE INDEX IDX_permission_2 ON permissions (operation_id);

/* ---------------------------------------------------------------------- */
/* Add table "role_permission"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE role_permission (
    role_id INTEGER  NOT NULL,
    permission_id INTEGER  NOT NULL,
    PRIMARY KEY (role_id, permission_id)
);

CREATE INDEX IDX_role_permission_1 ON role_permission (role_id);

CREATE INDEX IDX_role_permission_2 ON role_permission (permission_id);

/* ---------------------------------------------------------------------- */
/* Add table "session_role"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE session_role (
    role_id INTEGER  NOT NULL,
    session_id INTEGER  NOT NULL,
    PRIMARY KEY (role_id, session_id)
);

CREATE INDEX IDX_session_role_1 ON session_role (role_id);

CREATE INDEX IDX_session_role_2 ON session_role (session_id);

/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE user_role ADD CONSTRAINT user_user_role 
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE user_role ADD CONSTRAINT role_user_role 
    FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE sessions ADD CONSTRAINT users_sessions 
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE permissions ADD CONSTRAINT object_permission 
    FOREIGN KEY (object_id) REFERENCES objects (object_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE permissions ADD CONSTRAINT operation_permission 
    FOREIGN KEY (operation_id) REFERENCES operations (operation_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE role_permission ADD CONSTRAINT role_role_permission 
    FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE role_permission ADD CONSTRAINT permission_role_permission 
    FOREIGN KEY (permission_id) REFERENCES permissions (permission_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE session_role ADD CONSTRAINT role_session_role 
    FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE session_role ADD CONSTRAINT session_session_role 
    FOREIGN KEY (session_id) REFERENCES sessions (session_id) ON DELETE CASCADE ON UPDATE CASCADE;


