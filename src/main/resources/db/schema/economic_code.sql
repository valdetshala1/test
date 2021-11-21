--DROP TABLE IF EXISTS tfin_type_tree CASCADE;
DROP VIEW IF EXISTS tfin_type_tree;
--DROP TABLE IF EXISTS tref_economic_code;
/*
CREATE TABLE public.tref_economic_code
(
    id bigserial primary key, 
    parent_id integer references tref_economic_code(id),
    code  character varying(20) NOT NULL unique,
	level smallint NOT NULL,
	allocation boolean,
    name_al character varying(100) NOT NULL,
	name_en character varying(100),
    name_sr character varying(100),
	notes character varying(255),
	created_date date NOT NULL
);
CREATE UNIQUE INDEX tfin_type_code_idx ON tfin_type (code);
*/


insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (1, null, '0', 0, 'IN', false, 'Kodi Ekonomik', 'Economic Code', 'Economic Code', null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (2, 1, '11', 1, 'IN', false, 'Rrogat dhe pagat', null, null, null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (3, 1, '13', 1, 'IN', false, 'Mallra dhe shërbime', null, null, null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (4, 1, '111', 2, 'IN', false, 'Rrogat mujore me orar të plotë', null, null, null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (5, 2, '130', 2, 'IN', false, 'Mallra dhe shërbime ', null, null, null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (6, 3, '1110', 3, 'IN', false, 'Rrogat mujore me orar te plote', null, null, null ,'2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (7, 6, '11110', 4, 'IN', false, 'Pagat neto permes listes se pagave', null, null, null, '2020/02/26');

--select * from tfin_type;
--select count(*) from tfin_type

insert into tfin_type values(((select count(*) from tfin_type)+1), (select id from tfin_type where code = '1110'), '11115', 5, 'IN', false, 'Pagesa per sindikat', null, null, null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+1), (select id from tfin_type where code = '1110'), '11120', 5, 'IN', false, 'PAGESAT E SHTESES NE PAGE-30 EURO PER SHCK', null, null, null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+2), (select id from tfin_type where code = '1110'), '11125', 5, 'IN', false, 'ANTARSIM-ODA E INFERMIERVE TE KOSOVËS', null, null, null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+2), (select id from tfin_type where code = '1110'), '11126', 5, 'IN', false, 'ANTARSIM-ODA E MJEKVE TE KOSOVËS', null, null, null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+2), (select id from tfin_type where code = '1110'), '11155', 5, 'IN', false, 'SHTESAT DHE KOMPENZIMET TJERA(VENDIM)', null, null, null ,'2020/02/26');


/*VIEW*/
CREATE VIEW tfin_type_tree AS
 WITH RECURSIVE tfin_type_tree(id, parent_id, name_al, name_en, name_sr, notes, created_date, allocation, type, code, path, level) AS (
         SELECT tfin_type.id,
            tfin_type.parent_id,
            tfin_type.name_al,
	 		tfin_type.name_en,
	 		tfin_type.name_sr,
	 		tfin_type.notes,
	 		tfin_type.created_date,
	 		tfin_type.allocation,
	        tfin_type.type,
            tfin_type.code,
            NULL::integer[] || tfin_type.parent_id,
            1
           FROM tfin_type
          WHERE tfin_type.parent_id is null
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.name_al,
	 		t.name_en,
	 		t.name_sr,
	 		t.notes,
	 		t.created_date,
	 		t.allocation,
	 		t.type,
            t.code,
            rt.path || t.parent_id,
            rt.level + 1
           FROM tfin_type t
             JOIN tfin_type_tree rt ON rt.id = t.parent_id
        )
 SELECT tfin_type_tree.id,
    tfin_type_tree.parent_id,
    tfin_type_tree.name_al,
	tfin_type_tree.name_en,
	tfin_type_tree.name_sr,
    tfin_type_tree.code,
    tfin_type_tree.path,
    tfin_type_tree.level,
	tfin_type_tree.allocation,
	tfin_type_tree.type,
	tfin_type_tree.notes,
	tfin_type_tree.created_date
   FROM tfin_type_tree
  ORDER BY tfin_type_tree.id, tfin_type_tree.parent_id, tfin_type_tree.code;


select * from tfin_type_tree;

  

  