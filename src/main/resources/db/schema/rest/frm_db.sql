
/* START OF MIGRATION SCRIPTS */
SELECT * FROM TREGION;
SELECT * FROM TFRM_MANAGEMENT_UNIT;
SELECT * FROM TFRM_COMPARTMENT ORDER BY COMP_ID ASC;
SELECT * FROM TFRM_STAND ORDER BY COMPARTMENT_ID ASC;
SELECT * FROM TFRM_FISKOS_DATA;
DELETE FROM TFRM_FISKOS_DATA;
DELETE FROM TFRM_COMPARTMENT;
DELETE FROM TFRM_STAND;

/* IMPORT INTO --> TREGION - PLEASE EXECUTE REGION TWICE */
SELECT * FROM TGIS_REGION;
INSERT INTO TGIS_REGION SELECT NEXTVAL('TGIS_REGION_ID_SEQ'::REGCLASS), F.REGION FROM TFRM_FISKOS_DATA AS F GROUP BY F.REGION;

/* IMPORT INTO --> TFRM_MANAGEMENT_UNIT */
SELECT * FROM TGIS_MANAGEMENT_UNIT;
INSERT INTO TGIS_MANAGEMENT_UNIT SELECT NEXTVAL('TGIS_MANAGEMENT_UNIT_ID_SEQ'::REGCLASS), (SELECT ID FROM TGIS_REGION WHERE NAME = F.REGION) AS REGION_ID, F.MANAGMENT_UNIT AS MU FROM TFRM_FISKOS_DATA AS F GROUP BY REGION_ID, MU;

/* IMPORT INTO --> TFRM_COMPARTMENT */
SELECT * FROM TGIS_COMPARTMENT;
INSERT INTO TGIS_COMPARTMENT(ID,MU_ID,COMP_ID,THE_GEOM,THE_GEOM_AREA,THE_GEOM_LENGTH) 
SELECT NEXTVAL('TGIS_COMPARTMENT_ID_SEQ'::REGCLASS), (SELECT MU.ID FROM TGIS_MANAGEMENT_UNIT AS MU WHERE MU.MU_NAME = F.MANAGMENT_UNIT) AS MU, CAST(F.COMP AS INT) AS COMP_NR, NULL AS A, NULL AS B, NULL AS C FROM TFRM_FISKOS_DATA AS F GROUP BY MU, F.COMP ORDER BY F.COMP ASC;
 

/* IMPORT --> TFRM_STAND */
SELECT * FROM TGIS_COMPARTMENT AS C WHERE C.COMP_ID NOT IN (SELECT CAST(F.COMP AS INT) FROM TFRM_FISKOS_DATA AS F GROUP BY F.COMP ORDER BY F.COMP ASC);
SELECT * FROM TFRM_FISKOS_DATA;
SELECT * FROM TGIS_STAND;

INSERT INTO TGIS_STAND(
ID, COMPARTMENT_ID, STAND_ID,
FOREST_TYP, STOCK_LEVEL, ACCESS_TYPE, BASAL_AREA, ESTABILISHED_YEAR, STAND_HEIGHT,
STAND_ACRES,PERIMETER,STAND_TYPE,CROWNCOVER,SLOPE,LITTERCOV,AGE,ORIGIN,CONIFER,CONIFER_BON,
DECIDOUSE,DECIDOUSE_BON,TREES,VOLUME_M3HA,CONIFER_PERC,DECIDOUSE_PERC,
PERC_0_30,PERC_30_50,PERC_50_70,PERC_70_100,INCR_PERC,M2_HA,DS_CON,DS_BRO,
CL1_PERC_CON,CL2_PERC_CON,CL3_PERC_CON,CL4_PERC_CON,
CL1_PERC_DEC,CL2_PERC_DEC,CL3_PERC_DEC,CL4_PERC_DEC,
DAMAGE_PERC,ESTEMATE_VOLUME,ESTIMATE_TREES_PER_HA,HEIGHT_MEAN,
TREE1,TREE2,TREE3,SURVEY_DATE,REMARKS,
THE_GEOM,THE_GEOM_AREA,THE_GEOM_LENGTH
)
SELECT NEXTVAL('TGIS_STAND_ID_SEQ'::REGCLASS), (SELECT C.ID FROM TGIS_COMPARTMENT AS C WHERE C.COMP_ID = CAST(F.COMP AS INT)), CAST(F.STAND AS INT), 
'FOREST_TYP','STOCK_LEVEL','ACCESS_TYPE',10.0,2014,555,
20.00,20.00,'STAND_TYPE',F.CROWNCOVER,F.SLOPE,F.CROWNCOVER,F.AGE,F.ORIGIN,F.CONIFER,F.CONIFER_BON,
F.DECIDOUSE,F.DECIDOUSE_BON,F.TREES,F.VOLUME_M3HA,F.CONIFER_PERC,F.DECIDOUSE_PERC,
F.PERC_0_30,F.PERC_30_50,F.PERC_50_70,F.PERC_70_100,F.INCR_PERC,F.M2_HA,F.DS_CON,F.DS_BRO,
F.CL1_PERC_CON,F.CL2_PERC_CON,F.CL3_PERC_CON,F.CL4_PERC_CON,
F.CL1_PERC_DEC,F.CL2_PERC_DEC,F.CL3_PERC_DEC,F.CL4_PERC_DEC,
F.DAMAGE_PERC,F.ESTEMATE_VOLUME,F.ESTIMATE_TREES_PER_HA,F.HEIGHT_MEAN,
F.TREE1,F.TREE2,F.TREE3,F.SURVEY_DATE,NULL,
NULL,NULL,NULL
FROM TFRM_FISKOS_DATA AS F ORDER BY F.COMP ASC


/*
select * from tfrm_stand
select * from tfrm_stand_activity
select * from tfrm_stand_activity_plan
select * from tfrm_stand_activity_volume
select * from tfrm_stand_volume_type
select * from tfrm_domain


select * from tfrm_stand_activity as a left join tfrm_stand_activity_plan as p on a.id = p.activity_id left join tfrm_stand_activity_volume as v on a.id = v.activity_id  where stand_id = 788


insert into tfrm_stand_volume_type values(1, 'TECH', null, null);
insert into tfrm_stand_volume_type values(2, 'FIRE', null, null);
insert into tfrm_stand_volume_type values(3, 'PULP', 'mbeturina', null);

--planning
insert into tfrm_stand_activity values(1, 788, 1, 1, '2014-10-16', null);
insert into tfrm_stand_activity_plan values(1, 1, 2014, '2014-10-16', null);
insert into tfrm_stand_activity_volume values(1, 1, 1, 20, null);
insert into tfrm_stand_activity_volume values(2, 1, 2, 30, null);
insert into tfrm_stand_activity_volume values(3, 1, 3, 50, null);

insert into tfrm_stand_activity values(2, 788, 2, 2, '2014-10-16', null);
insert into tfrm_stand_activity_plan values(2, 2, 2014, '2014-10-16', null);
insert into tfrm_stand_activity_volume values(4, 2, 1, 20, null);
insert into tfrm_stand_activity_volume values(5, 2, 2, 30, null);
insert into tfrm_stand_activity_volume values(6, 2, 3, 50, null);


--implemenation
select * from tfrm_stand_activity_impl
select * from tfrm_stand_activity_volume

insert into tfrm_stand_activity values(3, 788, 1, 1,'2014-10-16', null);
insert into tfrm_stand_activity_impl values(1, 3, 1, null);
insert into tfrm_stand_activity_volume values(nextval('tfrm_stand_activity_volume_id_seq'), 3, 1, 10, null);


--other activities i.e. illegal felling
select * from tfrm_stand_activity
insert into tfrm_stand_activity values(4, 788, 15, 1,'2014-10-16', null);
insert into tfrm_stand_activity_volume values(nextval('tfrm_stand_activity_volume_id_seq'), 4, 1, 25, null);
	

select d.domain_activity, * from tfrm_stand_activity as a 
	left join tfrm_stand_activity_plan as p on a.id = p.activity_id left join tfrm_stand_activity_impl as i on p.id = i.activity_plan_id
	left join tfrm_stand_activity_volume as v on a.id = v.activity_id left join tfrm_domain as d on d.id = a.activity_domain_id
	
	where stand_id = 788 and v.volume_type_id = 1
*/