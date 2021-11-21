--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2020-10-16 13:59:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8638 (class 0 OID 0)
-- Dependencies: 8637
-- Name: DATABASE kfis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE kfis IS 'KFIS DB
developed by GEO&LAND';


--
-- TOC entry 19 (class 2615 OID 69256)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA tiger;


--
-- TOC entry 18 (class 2615 OID 69257)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA tiger_data;


--
-- TOC entry 22 (class 2615 OID 69258)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA topology;


--
-- TOC entry 17 (class 2615 OID 69259)
-- Name: traccar; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA traccar;


--
-- TOC entry 1 (class 3079 OID 69260)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 8640 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 69265)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 8641 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 7 (class 3079 OID 69272)
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- TOC entry 8642 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- TOC entry 8 (class 3079 OID 69316)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 8643 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- TOC entry 9 (class 3079 OID 69362)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 8644 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 10 (class 3079 OID 69373)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 8645 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 11 (class 3079 OID 69377)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 8646 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 14 (class 3079 OID 69414)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 8647 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 70889)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 8648 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 4 (class 3079 OID 71091)
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- TOC entry 8649 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- TOC entry 5 (class 3079 OID 71174)
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- TOC entry 8650 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- TOC entry 6 (class 3079 OID 71182)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 8651 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 12 (class 3079 OID 71200)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 8652 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 13 (class 3079 OID 71627)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 8653 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- TOC entry 2529 (class 1255 OID 71768)
-- Name: _final_mode(anyarray); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public._final_mode(anyarray) RETURNS anyelement
    LANGUAGE sql IMMUTABLE
    AS $_$
    SELECT a
    FROM unnest($1) a
    GROUP BY 1 
    ORDER BY COUNT(1) DESC, 1
    LIMIT 1;
$_$;


--
-- TOC entry 2530 (class 1255 OID 71769)
-- Name: bboxgeometryfrommetadata(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.bboxgeometryfrommetadata(character varying) RETURNS public.geometry
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	src alias for $1;
	tmp text;

	extentPath character varying;

	substract boolean;
	north numeric;
	south numeric;
	east numeric;
	west numeric;

	ns varchar[];

	m xml;
	app xml;
	doc xml[];

	box geometry;
	geo geometry;

BEGIN    
	ns := ARRAY[ARRAY['gmd', 'http://www.isotc211.org/2005/gmd'], 
	            ARRAY['gco', 'http://www.isotc211.org/2005/gco'], 
	            ARRAY['srv', 'http://www.isotc211.org/2005/srv'] ];
	doc := xpath('/gmd:MD_Metadata/gmd:identificationInfo/*/*/gmd:EX_Extent', XMLPARSE(DOCUMENT src), ns);
	FOREACH m IN ARRAY doc
	LOOP
		IF position('gmd:EX_Extent' in XMLSERIALIZE(DOCUMENT m AS text)) <> -1 THEN
			tmp := '<root xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:srv="http://www.isotc211.org/2005/srv">'||regexp_replace(XMLSERIALIZE(DOCUMENT m AS text), 'gmd:', '','g')||'</root>';
		ELSE
			tmp := '<root xmlns="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:srv="http://www.isotc211.org/2005/srv">'||XMLSERIALIZE(DOCUMENT m AS text)||'</root>';
		END IF;
		IF xpath_exists('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox', tmp::xml, ns) THEN
			substract := FALSE;
			IF xpath_exists('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox/extentTypeCode/*', tmp::xml, ns) THEN
				app := xpath('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox/extentTypeCode/*/text()', tmp::xml, ns); --gco:Boolean
				IF app::text = '{0}' OR app::text = '{false}' OR app::text = '{FALSE}' THEN
					substract := TRUE;
				END IF;
			END IF;
			
			app := xpath('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox/westBoundLongitude/*/text()',  tmp::xml, ns);
			west :=substring(app::text FROM '[0-9.-]+')::numeric;
			app := xpath('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox/eastBoundLongitude/*/text()',  tmp::xml, ns);
			east :=substring(app::text FROM '[0-9.-]+')::numeric;
			app := xpath('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox/southBoundLatitude/*/text()',  tmp::xml, ns);
			south :=substring(app::text FROM '[0-9.-]+')::numeric;
			app := xpath('/*/EX_Extent/geographicElement/EX_GeographicBoundingBox/northBoundLatitude/*/text()',  tmp::xml, ns);
			north :=substring(app::text FROM '[0-9.-]+')::numeric;
			
			box := st_astext(ST_MakeBox2D(ST_Point(west, south), ST_Point(east, north)));
			IF geo IS NULL THEN
				geo := box;
			ELSE
				IF substract THEN
					geo := ST_Difference(geo, box);
				ELSE
					geo := ST_Union(geo, box);
				END IF;
			END IF;
		ELSE
			CONTINUE;
		END IF;
		IF geo IS NOT NULL THEN
			geo = ST_ENVELOPE(geo);
		END IF;
	END LOOP;
	RETURN geo;
END;
$_$;


--
-- TOC entry 2531 (class 1255 OID 71770)
-- Name: bytea_import(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.bytea_import(p_path text, OUT p_result bytea) RETURNS bytea
    LANGUAGE plpgsql
    AS $$
declare
  l_oid oid;
  r record;
begin
  p_result := '';
  select lo_import(p_path) into l_oid;
  for r in ( select data
             from pg_largeobject
             where loid = l_oid 
             order by pageno ) loop
    p_result = p_result || r.data;
  end loop;
  perform lo_unlink(l_oid);
end;$$;


--
-- TOC entry 2532 (class 1255 OID 71771)
-- Name: f_frm_fiskos_mig_comp(bigint, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_frm_fiskos_mig_comp(id bigint, trx_id character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
BEGIN
	INSERT INTO TGIS_COMPARTMENT(ID,MU_ID,MUP_ID,MUN_ID,COMP_NR,THE_GEOM,THE_GEOM_AREA,THE_GEOM_LENGTH) 
	SELECT NEXTVAL('TGIS_COMPARTMENT_ID_SEQ'::REGCLASS), 
	f.mu_id,
	f.import_id,
	f.mun_id,
	CAST(F.COMP AS INT) AS COMP_NR, 
	NULL AS A, 
	NULL AS B, 
	NULL AS C 
	FROM TFRM_FISKOS_DATA AS f left join tfrm_fiskos_import as i on i.id = f.import_id  left join tgis_mu_period as mup on mup.trnx_id = i.trnx_id where i.id = $1 and i.isactive = 'Y' and i.trnx_id = $2 GROUP BY F.COMP,f.mu_id,f.import_id,f.mun_id ORDER BY F.mu_id ASC;

return true;

END;
$_$;


--
-- TOC entry 2533 (class 1255 OID 71772)
-- Name: f_frm_fiskos_mig_stand(bigint, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_frm_fiskos_mig_stand(id bigint, trx_id character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
BEGIN
	INSERT INTO TGIS_STAND(
	ID, COMPARTMENT_ID, STAND_ID,MNGM_CLASS,
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
	SELECT NEXTVAL('TGIS_STAND_ID_SEQ'::REGCLASS), (SELECT distinct C.ID FROM TGIS_COMPARTMENT AS C left join tgis_mu_period as mp on mp.id = C.mup_id WHERE C.COMP_NR = CAST(F.COMP AS INT) and mp.id = $1), CAST(F.STAND AS INT), 
	F.MNGM_CLASS_ID,'FOREST_TYP','STOCK_LEVEL','ACCESS_TYPE',F.STANDAREA,2014,F.HEIGHT_MEAN,
	20.00,20.00,'STAND_TYPE',F.CROWNCOVER,F.SLOPE,F.CROWNCOVER,F.AGE,F.ORIGIN,F.CONIFER,F.CONIFER_BON,
	F.DECIDOUSE,F.DECIDOUSE_BON,F.TREES,F.VOLUME_M3HA,F.CONIFER_PERC,F.DECIDOUSE_PERC,
	F.PERC_0_30,F.PERC_30_50,F.PERC_50_70,F.PERC_70_100,F.INCR_PERC,F.M2_HA,F.DS_CON,F.DS_BRO,
	F.CL1_PERC_CON,F.CL2_PERC_CON,F.CL3_PERC_CON,F.CL4_PERC_CON,
	F.CL1_PERC_DEC,F.CL2_PERC_DEC,F.CL3_PERC_DEC,F.CL4_PERC_DEC,
	F.DAMAGE_PERC,F.ESTEMATE_VOLUME,F.ESTIMATE_TREES_PER_HA,F.HEIGHT_MEAN,
	F.TREE1,F.TREE2,F.TREE3,F.SURVEY_DATE,NULL,
	NULL,NULL,NULL
	FROM TFRM_FISKOS_DATA AS F left join tfrm_fiskos_import as i on i.id = F.import_id  left join tgis_mu_period as mup on mup.trnx_id = i.trnx_id where i.id = $1 and i.isactive = 'Y' and i.trnx_id = $2;

return true;

END;
$_$;


--
-- TOC entry 2534 (class 1255 OID 71773)
-- Name: f_frm_migrate_shape_biodiv(bigint, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_frm_migrate_shape_biodiv(user_id bigint, mun_code character varying, reg_code character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO tgis_biodiv(stand_id, biodiv_id, remarks, comp_nr, stand_nr, timeform, taksator, the_geom)
	(select(select id from get_stand_id('Y',(comp_nr::int)::varchar,stand_nr,substring((1000+shb.comp_nr)::text,2,3) ,shb.stand_nr) ) , b.id,
	 shb.remarks,substring((1000+shb.comp_nr)::text,2,3),shb.stand_nr ,
	 shb.timeform ,shb.taksator ,
	 shb.wkb_geometry from shape_biodiversity shb  left join tbiodiv_name b ON shb.biocode=b.code
	);
	--update import status
	UPDATE timport_status
	   SET is_active=FALSE, status='Success', end_date=now(), end_user=500,
	   mup_id=(select distinct t.mup_id from (select mup.id as mup_id, mup.isactive, mu.id as mu_id, mu.mu_code, 
			r.id as region_id, r.code as region_code 
		from tgis_mu_period mup left join tgis_management_unit mu on mup.mu_id=mu.id left join tgis_region r on mu.region_id=r.id) t 
		where  t.region_code = reg_code and t.mu_code=mun_code and t.isactive='Y')
	    WHERE is_active=TRUE and import_type='B';

return true;

END;
$$;


--
-- TOC entry 2535 (class 1255 OID 71774)
-- Name: f_frm_migrate_shape_lines(bigint, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_frm_migrate_shape_lines(user_id bigint, mun_id integer, mu_id integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

INSERT INTO tgis_road( mun_id, mu_id, road_name, road_type, access_type, quality_cl, 
            maintenanc, last_activity_year, road_length, created_date, created_by, 
            the_geom) 
(select mun_id,mu_id,null,case when (ltheme>=7000 and ltheme<8000) then ltheme else case when (ltheme1>=7000 and ltheme1<8000) then ltheme1 else case when (ltheme2>=7000 and ltheme2<8000) then ltheme2 else null end end end,null,l.quality_cl,l.maintenanc,null,
ST_Length(l.wkb_geometry),now(),user_id,l.wkb_geometry 
from shape_lines l where (ltheme>=7000 and ltheme<8000) or (ltheme1>=7000 and ltheme1<8000) or (ltheme2>=7000 and ltheme2<8000));

return true;

END;
$$;


--
-- TOC entry 8654 (class 0 OID 0)
-- Dependencies: 2535
-- Name: FUNCTION f_frm_migrate_shape_lines(user_id bigint, mun_id integer, mu_id integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.f_frm_migrate_shape_lines(user_id bigint, mun_id integer, mu_id integer) IS 'param: user_id, mun_id, mu_id';


--
-- TOC entry 2536 (class 1255 OID 71775)
-- Name: f_frm_migrate_shape_plots(bigint, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_frm_migrate_shape_plots(user_id bigint, reg_code character varying, mun_code character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

--insert plots
INSERT INTO tgis_plots(stand_id, plot_nr, visited, plottype, slope, littercov, age, crowncov, c_stems1, c_stems2, c_damage, c_supress, c_distrib, 
            b_stems1, b_stems2, b_damage, b_supress, b_distrib, time_, date_, taksator, geom)
(select (select id from get_stand_id('Y',reg_code,mun_code,substring((1000+p.comp_nr)::text,2,3),p.stand_nr)),p.plot_nr, p.visited, p.plottype, p.slope, p.littercov, p.age, p.crowncov, p.c_stems1, p.c_stems2, p.c_damage, p.c_supress, p.c_distrib, 
            p.b_stems1, p.b_stems2, p.b_damage, p.b_supress, p.b_distrib, p.time_, p.date_, p.taksator,p.wkb_geometry from shape_plots p);

--insert plot trees
INSERT INTO tgis_plot_tree( plot_id, plot_nr, treeid, health, name, incomplete, height, increment, diameter, testmark, plottreeid, speccode, techcode)
(select (select id from tgis_plots p where p.id=(select  id from get_plot_id('Y',reg_code,mun_code,pt.plotid::text))), (select plot_nr from tgis_plots p where p.id=(select  id from get_plot_id('Y',reg_code,mun_code,pt.plotid::text))),
treeid,health, name, incomplete,height,
	increment, diameter, testmark, plottreeid, speccode, techcode from shape_plot_trees pt) ;
	
--update import status
UPDATE timport_status
   SET is_active=FALSE, status='Success', end_date=now(), end_user=user_id,
   mup_id=(select distinct t.mup_id from (select mup.id as mup_id, mup.isactive, mu.id as mu_id, mu.mu_code, r.id as region_id, r.code as region_code 
	from tgis_mu_period mup left join tgis_management_unit mu on mup.mu_id=mu.id left join tgis_region r on mu.region_id=r.id) t 
	where  t.region_code = reg_code and t.mu_code=mun_code and t.isactive='Y')
    WHERE is_active=TRUE and import_type='P';

return true;

END;
$$;


--
-- TOC entry 2537 (class 1255 OID 71776)
-- Name: f_frm_migrate_shape_stand(bigint, date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_frm_migrate_shape_stand(user_id bigint, from_date date, to_date date) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

--tgis_mu_period insert

update tgis_mu_period set isactive ='N', updated_date = now(), note = 'Deaktivizimi behet automatikisht nga sistemi, me ' || now() || '',updated_by=user_id
where tgis_mu_period.id=(select distinct t.mup_id from (
select mup.id as mup_id, mup.isactive, mu.id as mu_id, mu.mu_code, r.id as region_id, r.code as region_code from tgis_mu_period mup left join tgis_management_unit mu on mup.mu_id=mu.id
				 left join tgis_region r on mu.region_id=r.id) t , shape_stand
				 where  t.region_code::int = shape_stand.fmr::int and t.mu_code::int=shape_stand.mu::int and t.isactive='Y');

 
INSERT INTO tgis_mu_period( 
            mu_id,  trnx_id,the_geom, isactive, start_date,end_date,created_by,created_date,updated_by,updated_date,note)
    (select (select mu.id from tgis_management_unit mu where mu.mu_code::int=shape_stand.mu::int and mu.region_id=(select id from tgis_region r where r.code::int=shape_stand.fmr::int)),'trnx_id' , 
ST_Union(wkb_geometry) as geom,'Y',  from_date,to_date,user_id,now(),user_id,now(),NULL from shape_stand
group by fmr, mu);

--tgis_compartment insert

INSERT INTO tgis_compartment(
             mu_id, mup_id, mun_id, comp_nr,  the_geom)
(select(select mu.id from tgis_management_unit mu where mu.mu_code::int=shape_stand.mu::int and mu.region_id=(select id from tgis_region r where r.code::int=shape_stand.fmr::int)), 
(select id from tgis_mu_period mup where shape_stand.mu::int=(select mu.mu_code::int from tgis_management_unit mu where mu.id=mup.mu_id and mu.region_id=(select id from tgis_region r where r.code::int=shape_stand.fmr::int) and mup.isactive='Y')),
 (select id from tgis_cadastral_municipality where tgis_cadastral_municipality.code::int=shape_stand.munici::int), comp,  ST_Union(wkb_geometry) as geom from shape_stand
group by fmr, mu, 1, munici, comp
order by comp);


--tgis_stand insert

INSERT INTO tgis_stand( compartment_id, stand_id,stand_nr, mngm_class, no_plots, minehazard, layers, stand_type, access_type, basal_area, crowncover, slope, littercov, age, origin, conifer, conifer_bon, 
decidouse, decidouse_bon, trees, 
	volume_m3ha, conifer_perc, decidouse_perc, perc_0_30, perc_30_50, perc_50_70, perc_70_100, incr_perc, m2_ha, ds_con, ds_bro, cl1_perc_con, cl2_perc_con, 
	cl3_perc_con, cl4_perc_con, cl1_perc_dec, cl2_perc_dec, cl3_perc_dec, cl4_perc_dec, damage_perc, estemate_volume, estimate_trees_per_ha, height_mean, 
	tree1, tree2, tree3, the_geom)
(SELECT(select gc.comp_id from (select c.id comp_id, c.comp_nr, mup.id as mup_id, mup.isactive, mu.id as mu_id, mu.mu_code, mu.region_id , r.code as region_code from tgis_compartment c 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit  mu on mup.mu_id=mu.id
	left join tgis_region r on mu.region_id = r.id) gc  where gc.region_code::int = shape_stand.fmr::int and gc.mu_code::int=shape_stand.mu::int and gc.comp_nr=shape_stand.comp and gc.isactive='Y') as comp, stand_id,stand, mc, 
case when no_plots>0 then no_plots else null end as no_plots, 
minehazard, layers, 
case when mc > 5000 AND mc <7000 then 2 else case when no_plots > 0 then 0 else 1 end end stand_type,
"access", standarea,  
case when crowncover>0 then crowncover else null end as crowncover, case when slope>0 then slope else null end as slope, case when littercov>0 then littercov else null end as littercov, 
age, origin, 
case when domspc>0 then (select id from tfrm_tree_species s where s.code=shape_stand.domspc) else null end as domspc ,case when consi>0 then consi else null end as consi, case when domspb>0 then (select id from tfrm_tree_species s where s.code=shape_stand.domspb) else null end as domspb, 
case when brosi>0 then brosi else null end as brosi, case when trees>0 then trees else null end as trees, case when m3tot_ha>0 then m3tot_ha else null end as m3tot_ha, 

	case when m3tot_ha >0 then round((m3conha/m3tot_ha)*100,1) else null end conifer_perc, case when m3tot_ha >0 then round((m3broha/m3tot_ha)*100,1) else null end decidouse_perc, 
	case when m3tot_ha >0 then round((m3_0_30/m3tot_ha)*100,1) else null end perc_0_30, case when m3tot_ha >0 then round((m3_30_50/m3tot_ha)*100,1) else null end perc_30_50, 
	case when m3tot_ha >0 then round((m3_50_70/m3tot_ha)*100,1) else null end perc_50_70, case when m3tot_ha >0 then round((m3_70_/m3tot_ha)*100,1) else null end perc_70_100, 
	case when m3tot_ha >0 then round((incrtot_ha/m3tot_ha)*100,1) else null end incr_perc,
case when m2_ha>0 then m2_ha else null end m2_ha, case when ds_con>0 then ds_con else null end as ds_con, case when ds_bro>0 then ds_bro else null end as ds_bro,
case when cl1_con>0 then cl1_con else null end as cl1_con, case when cl2_con>0 then cl2_con else null end as cl2_con, case when cl3_con>0 then cl3_con else null end cl3_con, 
case when cl4_con>0 then cl4_con else null end as cl4_con, case when cl1_bro>0 then cl1_bro else null end as cl1_bro, case when cl2_bro>0 then cl2_bro else null end cl2_bro, 
case when cl3_bro>0 then cl3_bro else null end as cl3_bro, case when cl4_bro>0 then cl4_bro else null end as cl4_bro, case when damageperc>0 then damageperc else null end, 
m3est, stemsha, heightmean, (select id from tfrm_tree_species ts where ts.code=youngtree1), (select id from tfrm_tree_species ts where ts.code=youngtree2), 
(select id from tfrm_tree_species ts where ts.code=youngtree3), st_setsrid(wkb_geometry,900916) 
FROM shape_stand);


--tshape_stand_treatment insert
insert into tshape_stand_treatment( treatment_id, stand_id, treatment_area_perc)
(
	select (select id from tshape_treatment_name tn where tn.code=shape_stand.treatm),
	(select id from get_stand_id('Y', fmr,mu,comp,stand)),
	(round(( treatmarea )/st_area(( wkb_geometry ))::numeric,0)) from shape_stand where treatm!=99
	group by fmr, mu, 1, munici, comp,stand,treatmarea,wkb_geometry
	order by comp
);

--update import status
UPDATE timport_status
   SET is_active=FALSE, status='Success', end_date=now(), end_user=user_id,
   mup_id=(select distinct t.mup_id from (select mup.id as mup_id, mup.isactive, mu.id as mu_id, mu.mu_code, r.id as region_id, r.code as region_code 
	from tgis_mu_period mup left join tgis_management_unit mu on mup.mu_id=mu.id left join tgis_region r on mu.region_id=r.id) t , shape_stand
	where  t.region_code::int = shape_stand.fmr::int and t.mu_code::int=shape_stand.mu::int and t.isactive='Y')
    WHERE is_active=TRUE and import_type='C';

return true;

END;
$$;


--
-- TOC entry 2538 (class 1255 OID 71778)
-- Name: gen_activity_no(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_activity_no(integer, integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(activity_no) request_no from (
select a[1]::int as activity_no, a[2]::int as activity_year,a[3]::int as mun_id from (select regexp_split_to_array(activity_no, '/') from tfrm_activity as frm_act left join tfrm_annual_planning as annu_pl on
  frm_act.annual_planning_id=annu_pl.id) as dt(a)
) f
where activity_year=$1 and mun_id=$2
group by activity_year,mun_id

$_$;


--
-- TOC entry 2539 (class 1255 OID 71779)
-- Name: gen_activity_no(integer, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_activity_no(integer, character varying) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(activity_no) request_no from (
select a[1]::int as activity_no, a[2]::int as activity_year,a[3] as stand_nr from (select regexp_split_to_array(activity_no, '/') from tfrm_activity as frm_act left join tfrm_annual_planning as annu_pl on
  frm_act.annual_planning_id=annu_pl.id) as dt(a)
) f
where activity_year=$1 and stand_nr=$2
group by activity_year,stand_nr

$_$;


--
-- TOC entry 2540 (class 1255 OID 71780)
-- Name: gen_days(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_days(text, text) RETURNS TABLE(day_name character varying, days double precision, dates timestamp with time zone)
    LANGUAGE sql
    AS $_$

select TO_CHAR( dates , 'DY' ) day_name, date_part('day',  dates) days, dates   from (
select  generate_series(date1, date2, '1 day')as dates from 
(select (y||'-'||m||d)::date date1, ((y||'-'||m||d)::date + '1 MONTH'::INTERVAL - '1 DAY'::INTERVAL)::date as date2 from (
select $1::text as y, $2::text as m, '-01'::text as d) g) h) d






$_$;


--
-- TOC entry 2541 (class 1255 OID 71781)
-- Name: gen_inspection_no(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_inspection_no(integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(inspection_no) request_no from (
select a[1]::int as inspection_no, a[2]::int as inspection_year from (select regexp_split_to_array(inspection_no, '/') from tfrm_inspection) as dt(a)
) f
where inspection_year=$1 
group by inspection_year

$_$;


--
-- TOC entry 2542 (class 1255 OID 71782)
-- Name: gen_lawsuit_no(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_lawsuit_no(integer, integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(lawsuit_no) lawsuit_no from (
select a[1]::int as lawsuit_no,a[2]::int as law_suit_month ,a[3]::int as law_suit_year from (select regexp_split_to_array(lawsuit_no, '/') from tlegsec_lawsuit) as dt(a)
) f
where law_suit_month=$1  and  law_suit_year=$2 

group by law_suit_year,law_suit_month

$_$;


--
-- TOC entry 2543 (class 1255 OID 71783)
-- Name: gen_po_item_no(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_po_item_no(integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(item_number) item_number from (
select a[1]::int as order_id, a[2]::int as requisition_id, a[3]::int as item_number from (select regexp_split_to_array(item_number, '/') from tpurchase_order_item) as dt(a)
) f
where order_id=$1
group by order_id

$_$;


--
-- TOC entry 2544 (class 1255 OID 71784)
-- Name: gen_private_request_no(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_private_request_no(integer, integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(request_no) request_no from (
select a[1]::int as request_no, a[2]::int as request_year,a[3]::int as mun_id from (select regexp_split_to_array(request_no, '/') from tfrm_private_request) as dt(a)
) f
where request_year=$1 and mun_id=$2
group by request_year,mun_id

$_$;


--
-- TOC entry 2545 (class 1255 OID 71785)
-- Name: gen_req_item_no(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_req_item_no(integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$

select  max(item_number) item_number from (
select a[1]::int as requisition_id, a[2]::int as item_number from (select regexp_split_to_array(item_number, '/') from trequisition_item) as dt(a)
) f
where requisition_id=$1
group by requisition_id

$_$;


--
-- TOC entry 2546 (class 1255 OID 71786)
-- Name: gen_stand_nr(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.gen_stand_nr(integer, integer, integer) RETURNS SETOF text
    LANGUAGE sql
    AS $_$
SELECT R.R MIN_SEQ FROM
(select stand_nr as VALU from tgis_stand where compartment_id = $2) l 
right join (SELECT substring((100+GENERATE_SERIES)::text,2,3)  AS R 
FROM (select GENERATE_SERIES(st,en) from  (
WITH RECURSIVE t  AS (
    SELECT 1 AS t, 1 st , 50 en UNION ALL
    SELECT 0, 1, 50  UNION ALL
    SELECT 2, 51,99
)
SELECT * FROM t where t = $1) m  
) m ) R on R.R = L.VALU
WHERE L.VALU IS NULL limit $3
$_$;


--
-- TOC entry 2547 (class 1255 OID 71787)
-- Name: get_all_children_affreffprojects(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_all_children_affreffprojects(use_parent integer) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
DECLARE
    process_parents INT4[] := ARRAY[ use_parent ];
    children INT4[] := '{}';
    new_children INT4[];
BEGIN
    WHILE ( array_upper( process_parents, 1 ) IS NOT NULL ) LOOP
        new_children := ARRAY( SELECT id FROM taff_ref_projects WHERE refer_id = ANY( process_parents ) AND id <> ALL( children ) );
        children := children || new_children;
        process_parents := new_children;
    END LOOP;
    RETURN children;
END;
$$;


--
-- TOC entry 2548 (class 1255 OID 71788)
-- Name: get_all_children_array(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_all_children_array(use_parent integer) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
DECLARE
    process_parents INT4[] := ARRAY[ use_parent ];
    children INT4[] := '{}';
    new_children INT4[];
BEGIN
    WHILE ( array_upper( process_parents, 1 ) IS NOT NULL ) LOOP
        new_children := ARRAY( SELECT id FROM torganisation WHERE parent_id = ANY( process_parents ) AND id <> ALL( children ) );
        children := children || new_children;
        process_parents := new_children;
    END LOOP;
    RETURN children;
END;
$$;


--
-- TOC entry 2549 (class 1255 OID 71789)
-- Name: get_all_children_employee(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_all_children_employee(use_parent integer) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
DECLARE
    process_parents INT4[] := ARRAY[ use_parent ];
    children INT4[] := '{}';
    new_children INT4[];
BEGIN
    WHILE ( array_upper( process_parents, 1 ) IS NOT NULL ) LOOP
        new_children := ARRAY( SELECT id FROM thrm_employee WHERE person_id = ANY( process_parents ) AND id <> ALL( children ) );
        children := children || new_children;
        process_parents := new_children;
    END LOOP;
    RETURN children;
END;
$$;


--
-- TOC entry 2550 (class 1255 OID 71790)
-- Name: get_all_children_inspection(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_all_children_inspection(use_parent integer) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
DECLARE
    process_parents INT4[] := ARRAY[ use_parent ];
    children INT4[] := '{}';
    new_children INT4[];
BEGIN
    WHILE ( array_upper( process_parents, 1 ) IS NOT NULL ) LOOP
        new_children := ARRAY( SELECT id FROM tfrm_inspection WHERE parent_id = ANY( process_parents ) AND id <> ALL( children ) );
        children := children || new_children;
        process_parents := new_children;
    END LOOP;
    RETURN children;
END;
$$;


--
-- TOC entry 2551 (class 1255 OID 71791)
-- Name: get_biodiv_out_stand(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_biodiv_out_stand(region_code character varying, mu_code character varying) RETURNS TABLE(biodiversi character varying, comp_nr character varying, stand_nr character varying, area_out numeric, geom_out public.geometry)
    LANGUAGE sql
    AS $$

select a.biodiversi::text,a.comp_nr::text,a.stand_nr::text ,round(st_area(ST_Difference(a.wkb_geometry, b.the_geom))::numeric,2) area_out,
 ST_Difference(a.wkb_geometry, b.the_geom) geom_out   from shape_biodiversity a
 left join tgis_stand b on b.stand_nr=a.stand_nr where 
 b.id=(select id from get_stand_id('Y',region_code,mu_code,substring((1000*a.comp_nr)::text,2,3),a.stand_nr))
 and st_within(a.wkb_geometry, b.the_geom ) is false

$$;


--
-- TOC entry 8655 (class 0 OID 0)
-- Dependencies: 2551
-- Name: FUNCTION get_biodiv_out_stand(region_code character varying, mu_code character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_biodiv_out_stand(region_code character varying, mu_code character varying) IS 'param: region_code, mu_code';


--
-- TOC entry 2552 (class 1255 OID 71792)
-- Name: get_biodiv_with_no_stand(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_biodiv_with_no_stand(region_code character varying, mu_code character varying) RETURNS TABLE(biodiversi character varying, comp_nr character varying, stand_nr character varying)
    LANGUAGE sql
    AS $$

select distinct a.biodiversi::text, a.comp_nr::text,a.stand_nr::text from shape_biodiversity a 
left join tgis_stand b on b.stand_nr=a.stand_nr where a.stand_nr not in 
 (select stand_nr from get_stand_id('Y',region_code,mu_code,substring((1000+a.comp_nr)::text,2,3),a.stand_nr))


$$;


--
-- TOC entry 8656 (class 0 OID 0)
-- Dependencies: 2552
-- Name: FUNCTION get_biodiv_with_no_stand(region_code character varying, mu_code character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_biodiv_with_no_stand(region_code character varying, mu_code character varying) IS 'param: region_code, mu_code';


--
-- TOC entry 2553 (class 1255 OID 71793)
-- Name: get_overlap_lease_request(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlap_lease_request(text) RETURNS TABLE(request_id integer, area numeric)
    LANGUAGE sql
    AS $_$

SELECT r.id, ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT  * FROM ST_GEOMFROMTEXT(
$1, 900916) AS THE_GEOM) ING,  tfal_request r
 WHERE active is true AND 
(ST_OVERLAPS(ING.THE_GEOM, r.THE_GEOM) or  
ST_INTERSECTS(ING.THE_GEOM, r.THE_GEOM) )
and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC > 0.99

$_$;


--
-- TOC entry 2554 (class 1255 OID 71794)
-- Name: get_overlap_lease_request(integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlap_lease_request(id integer, text) RETURNS TABLE(request_id integer, area numeric)
    LANGUAGE sql
    AS $_$

SELECT r.ID, ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT $1 AS id, THE_GEOM FROM ST_GEOMFROMTEXT(

$2
, 900916) AS THE_GEOM) ING,  tfal_request r
 WHERE active is true AND 
(ST_OVERLAPS(ING.THE_GEOM, r.THE_GEOM) OR ST_INTERSECTS(ING.THE_GEOM, r.THE_GEOM))
and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC > 0.99$_$;


--
-- TOC entry 2555 (class 1255 OID 71795)
-- Name: get_overlap_shape_gis(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlap_shape_gis() RETURNS TABLE(fmr character varying, mu character varying, comp character varying, stand character varying, stand_id character varying, the_geom_a public.geometry, fmr_b character varying, mu_b character varying, comp_b character varying, stand_b character varying, stand_id_b character varying, the_geom_b public.geometry, count_part integer, area numeric, perimeter numeric, the_geom public.geometry)
    LANGUAGE sql
    AS $$

 SELECT a.fmr, a.mu,  a.comp, a.stand, a.stand_id, a.wkb_geometry,
    substring(b.stand_id from 1 for 2) fmr_b,
    substring(b.stand_id from 3 for 2) mu_b,
    substring(b.stand_id from 5 for 3) comp_b,
 b.stand_nr stand_b, b.stand_id AS stand_id_b, b.the_geom,
    ST_NumGeometries(st_collectionextract(st_intersection(a.wkb_geometry, b.the_geom), 3)) as count_part,
    round(st_area(st_intersection(a.wkb_geometry, b.the_geom))::numeric,2) AS area,
    round(ST_Perimeter(st_intersection(a.wkb_geometry, b.the_geom))::numeric,2) AS perimeter,
    st_collectionextract(st_intersection(a.wkb_geometry, b.the_geom), 3) AS the_geom
   FROM shape_stand a
   JOIN (select id, stand_id, stand_nr, the_geom from tgis_stand where id in (select id from get_stand_id('Y'))) b ON st_overlaps(a.wkb_geometry, b.the_geom)
where st_area(st_intersection(a.wkb_geometry, b.the_geom))>0.9
  order by a.stand_id;

$$;


--
-- TOC entry 2556 (class 1255 OID 71796)
-- Name: get_overlap_shape_stand(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlap_shape_stand() RETURNS TABLE(fmr character varying, mu character varying, comp character varying, stand character varying, stand_id character varying, comp_b character varying, stand_b character varying, stand_id_b character varying, count_part integer, area numeric, the_geom public.geometry)
    LANGUAGE sql
    AS $$

 SELECT a.fmr, a.mu,  a.comp, a.stand, a.stand_id, 
    b.comp comp_b, b.stand stand_b, b.stand_id AS stand_id_b, 
    ST_NumGeometries(st_collectionextract(st_intersection(a.wkb_geometry, b.wkb_geometry), 3)) as count_part,
    round(st_area(st_intersection(a.wkb_geometry, b.wkb_geometry))::numeric,2) AS area,
    st_collectionextract(st_setsrid(st_intersection(a.wkb_geometry, b.wkb_geometry), 900916), 3) AS the_geom
   FROM shape_stand a
   JOIN shape_stand b ON st_overlaps(a.wkb_geometry, b.wkb_geometry)
  WHERE a.stand_id::text < b.stand_id::text and st_area(st_intersection(a.wkb_geometry, b.wkb_geometry))>0.9
  order by a.stand_id;

$$;


--
-- TOC entry 2557 (class 1255 OID 71797)
-- Name: get_overlap_tourist_zone_geoms(integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlap_tourist_zone_geoms(id integer, text) RETURNS TABLE(touristzonegeomsid integer, area numeric)
    LANGUAGE sql
    AS $_$

SELECT r.ID, ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT $1 AS id, THE_GEOM FROM ST_GEOMFROMTEXT(

$2
, 900916) AS THE_GEOM) ING,  tdhpet_tourist_zone_geoms r
 WHERE  
(ST_OVERLAPS(ING.THE_GEOM, r.THE_GEOM) OR ST_INTERSECTS(ING.THE_GEOM, r.THE_GEOM))
and r.id!=$1 and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC > 0.99
 $_$;


--
-- TOC entry 2558 (class 1255 OID 71798)
-- Name: get_overlaped_animal_location(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlaped_animal_location(text) RETURNS TABLE(location_id integer, area numeric)
    LANGUAGE sql
    AS $_$
SELECT l.id,ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, l.THE_GEOM))::NUMERIC,2) AS AREA
 FROM (SELECT * FROM  ST_GEOMFROMTEXT(
$1, 900916) AS THE_GEOM) ING, tdhpet_location as l where 
(ST_OVERLAPS(ING.THE_GEOM, l.THE_GEOM) or  
ST_INTERSECTS(ING.THE_GEOM, l.THE_GEOM))
and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, l.THE_GEOM))::NUMERIC > 0.99
$_$;


--
-- TOC entry 2559 (class 1255 OID 71799)
-- Name: get_overlaped_animal_location(integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlaped_animal_location(id integer, text) RETURNS TABLE(location_id integer, area numeric)
    LANGUAGE sql
    AS $_$

SELECT r.ID, ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT $1 AS id, THE_GEOM FROM ST_GEOMFROMTEXT(

$2
, 900916) AS THE_GEOM) ING,  tdhpet_location r
 WHERE  r.id!=$1 and 
(ST_OVERLAPS(ING.THE_GEOM, r.THE_GEOM) OR ST_INTERSECTS(ING.THE_GEOM, r.THE_GEOM))
and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, r.THE_GEOM))::NUMERIC > 0.99$_$;


--
-- TOC entry 2560 (class 1255 OID 71800)
-- Name: get_overlapstand(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlapstand(text) RETURNS TABLE(stand_id character varying, area numeric)
    LANGUAGE sql
    AS $_$

SELECT gs.stand_id, ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, gs.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT  * FROM ST_GEOMFROMTEXT(
$1, 900916) AS THE_GEOM) ING,  tgis_stand gs left join tgis_compartment gc on gc.id=gs.compartment_id
left join tgis_mu_period mu on mu.id=gc.mup_id where mu.isactive='Y' and (gs.status  is  null or gs.status!='DEL')

AND 
(ST_OVERLAPS(ING.THE_GEOM, gs.THE_GEOM) or  
ST_INTERSECTS(ING.THE_GEOM, gs.THE_GEOM) )
and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, gs.THE_GEOM))::NUMERIC > 0.99

$_$;


--
-- TOC entry 2561 (class 1255 OID 71801)
-- Name: get_overlapstand(character varying, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_overlapstand(stand_id character varying, text) RETURNS TABLE(stand_id character varying, area numeric)
    LANGUAGE sql
    AS $_$

SELECT gs.stand_id, ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, gs.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT $1 AS stand_id, THE_GEOM FROM ST_GEOMFROMTEXT(

$2
, 900916) AS THE_GEOM) ING,  tgis_stand gs left join tgis_compartment gc on gc.id=gs.compartment_id
left join tgis_mu_period mu on mu.id=gc.mup_id where mu.isactive='Y' and ING.stand_id!=gs.stand_id and (gs.status is null or gs.status!='DEL')
AND  
(ST_OVERLAPS(ING.THE_GEOM, gs.THE_GEOM) OR ST_INTERSECTS(ING.THE_GEOM, gs.THE_GEOM))
and 
 ST_AREA(ST_INTERSECTION(ING.THE_GEOM, gs.THE_GEOM))::NUMERIC > 0.99$_$;


--
-- TOC entry 2562 (class 1255 OID 71802)
-- Name: get_parc_ow_by_coord(double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_parc_ow_by_coord(x double precision, y double precision, crs integer) RETURNS TABLE(cadzone integer, cad_zona_name character varying, parcelnr integer, subparcelnr integer, placename character varying, culturename character varying, clas smallint, area integer, pers_stat character varying, partsn character varying, cadparcelid character varying)
    LANGUAGE sql
    AS $_$

select b.cadzone, (select name from tgis_cadastral_zone where cad_id=b.cadzone::varchar) as cad_zona_name, parcelnr::integer,
 subparcelnr::int, placename, culturename, clas, b.area, pers_stat, partsn,b.cadparcelid from (
select * from tgis_parcelgeom 
where st_intersects(ST_SetSRID(ST_MakePoint($1, $2),$3), geom)
) a left join tparcel_detail b on a.cadparcelid=b.cadparcelid
left join tparcel_owner c on b.cadposslist=c.cadposslist

$_$;


--
-- TOC entry 2563 (class 1255 OID 71803)
-- Name: get_plan_split(character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_plan_split(linestring character varying, stand_id integer) RETURNS TABLE(id bigint, geom public.geometry, geom913 public.geometry, part integer)
    LANGUAGE sql
    AS $_$

select id, (h.poly).geom,st_transform((h.poly).geom,900913), unnest((h.poly).path) part from (
select id, planed_geom, ST_Dump(st_split(
planed_geom, 
st_setsrid(st_geomfromtext($1),900916)
)
) as poly from tfrm_activity where id = $2)  h  ; 

$_$;


--
-- TOC entry 8657 (class 0 OID 0)
-- Dependencies: 2563
-- Name: FUNCTION get_plan_split(linestring character varying, stand_id integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_plan_split(linestring character varying, stand_id integer) IS 'param: linestring, activity_id';


--
-- TOC entry 2564 (class 1255 OID 71804)
-- Name: get_plot_id(character, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_plot_id(isactive character, code character varying, mu_code character varying, plot_nr character varying) RETURNS TABLE(id integer, plot_nr character varying, stand_id integer, stand_nr character varying, comp_nr character varying)
    LANGUAGE sql
    AS $_$

select distinct p.id, p.plot_nr::text, p.stand_id,s.stand_nr::text,c.comp_nr::text from tgis_plots p
	left join tgis_stand s on p.stand_id=s.id
	left join tgis_compartment c on s.compartment_id=c.id 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit mu on mu.id=mup.mu_id
	left join tgis_region r on r.id=mu.region_id
	where mup.isactive =$1 and r.code =$2 and mu.mu_code=$3 and  p.plot_nr::text=$4;
$_$;


--
-- TOC entry 8658 (class 0 OID 0)
-- Dependencies: 2564
-- Name: FUNCTION get_plot_id(isactive character, code character varying, mu_code character varying, plot_nr character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_plot_id(isactive character, code character varying, mu_code character varying, plot_nr character varying) IS 'param: isactive, region_code, mu_code, plot_nr';


--
-- TOC entry 2565 (class 1255 OID 71805)
-- Name: get_plot_out_stand(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_plot_out_stand(region_code character varying, mu_code character varying) RETURNS TABLE(plot_nr character varying, comp_nr character varying, stand_nr character varying, area_out numeric, geom_out public.geometry)
    LANGUAGE sql
    AS $$

select a.plot_nr::text,comp_nr::text,a.stand_nr::text, round(st_area(ST_Difference(a.wkb_geometry, b.the_geom))::numeric,2) area_out, ST_Difference(a.wkb_geometry, b.the_geom) geom_out   from shape_plots a 
left join tgis_stand b on b.stand_nr=a.stand_nr where b.id=(select id from get_stand_id('Y',region_code,mu_code,substring((1000*a.comp_nr)::text,2,3),a.stand_nr)) and st_within(a.wkb_geometry, b.the_geom ) is false


$$;


--
-- TOC entry 8659 (class 0 OID 0)
-- Dependencies: 2565
-- Name: FUNCTION get_plot_out_stand(region_code character varying, mu_code character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_plot_out_stand(region_code character varying, mu_code character varying) IS 'param: region_code, mu_code';


--
-- TOC entry 2566 (class 1255 OID 71806)
-- Name: get_plot_trees_without_plot(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_plot_trees_without_plot() RETURNS TABLE(plotid character varying, treeid character varying, name character varying)
    LANGUAGE sql
    AS $$

select t.plotid::text,t.treeid::text,t.name::text from shape_plot_trees t where t.plotid not in (select plot_nr from shape_plots);


$$;


--
-- TOC entry 2567 (class 1255 OID 71807)
-- Name: get_plot_with_no_stand(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_plot_with_no_stand(region_code character varying, mu_code character varying) RETURNS TABLE(plot_nr character varying, comp_nr character varying, stand_nr character varying)
    LANGUAGE sql
    AS $$

select distinct a.plot_nr::text, a.comp_nr::text,a.stand_nr::text from shape_plots a 
left join tgis_stand b on b.stand_nr=a.stand_nr where a.stand_nr not in (select stand_nr from get_stand_id('Y',region_code,mu_code,substring((1000+a.comp_nr)::text,2,3),a.stand_nr))


$$;


--
-- TOC entry 8660 (class 0 OID 0)
-- Dependencies: 2567
-- Name: FUNCTION get_plot_with_no_stand(region_code character varying, mu_code character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_plot_with_no_stand(region_code character varying, mu_code character varying) IS 'param: region_code, mu_code';


--
-- TOC entry 2568 (class 1255 OID 71808)
-- Name: get_segment_details_checked(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_segment_details_checked(integer, character varying, character varying) RETURNS boolean
    LANGUAGE sql
    AS $_$
select lg1<lg2 start_point_is_min from (
select id, round(st_length(g1)::numeric,2) as lg1,
round(st_length(g2)::numeric,2) as lg2, ST_AsText (the_geom) as geom_line,  st_length(the_geom) lg0 from (
select a.id,  
(ST_Dump(ST_Split(ST_Snap(a.the_geom, start_g, 2),start_g))).geom as g1,
(ST_Dump(ST_Split(ST_Snap(a.the_geom, end_g, 2),end_g))).geom as g2, the_geom
 from tgis_road a , (select st_geomfromtext($2,900916) as start_g) b, 
 (select st_geomfromtext($3,900916) as end_g) c
 where id =$1
limit 1
) h
) k
$_$;


--
-- TOC entry 2569 (class 1255 OID 71809)
-- Name: get_segment_details_from_road(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_segment_details_from_road(integer, character varying, character varying) RETURNS TABLE(id bigint, lg1 numeric, lg2 numeric, geom_line text, lg0 double precision, geom_act text, distance_lg0_lg_1 double precision)
    LANGUAGE sql
    AS $_$
select m.*,ST_AsText ( st_line_substring(geom_line, lg1/lg0, lg2/lg0))as geom_act, st_length(st_line_substring(geom_line, lg1/lg0, lg2/lg0)) as distance_lg0_lg_1 from (
select id, round(st_length(g1)::numeric,2) as lg1,
round(st_length(g2)::numeric,2) as lg2, ST_AsText (the_geom) as geom_line,  st_length(the_geom) lg0 from (
select a.id,  
(ST_Dump(ST_Split(ST_Snap(a.the_geom, start_g, 2),start_g))).geom as g1,
(ST_Dump(ST_Split(ST_Snap(a.the_geom, end_g, 2),end_g))).geom as g2, the_geom
 from tgis_road a , (select st_geomfromtext($2,900916) as start_g) b, 
 (select st_geomfromtext($3,900916) as end_g) c
 where id =$1
limit 1
) h
) m

$_$;


--
-- TOC entry 2570 (class 1255 OID 71810)
-- Name: get_shape_out_state(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_shape_out_state() RETURNS TABLE(stand_id character varying, area_out numeric, geom_out public.geometry)
    LANGUAGE sql
    AS $$
with state as (
select a.stand_id, round(st_area(ST_Difference(a.wkb_geometry, b.the_geom))::numeric,2) area_out, 
ST_Difference(a.wkb_geometry, b.the_geom) geom_out   
from shape_stand a join tgis_state b on st_within(a.wkb_geometry, b.the_geom ) is false

)
select * from state where area_out>0.15

$$;


--
-- TOC entry 2571 (class 1255 OID 71811)
-- Name: get_stand_id(character); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stand_id(isactive character) RETURNS TABLE(id bigint, stand_id character varying, stand_nr character varying, compartment_id integer, comp_nr character varying, mup_id integer, isactive character, mu_id integer, mu_code character varying, region_id integer, region_code character varying)
    LANGUAGE sql
    AS $_$

select s.id, s.stand_id, s.stand_nr, s.compartment_id, c.comp_nr, c.mup_id, mup.isactive, mup.mu_id, mu.mu_code, mu.region_id, r.code as region_code from tgis_stand s 
	left join tgis_compartment c on s.compartment_id=c.id 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit mu on mu.id=mup.mu_id
	left join tgis_region r on r.id=mu.region_id
	where mup.isactive =$1;

$_$;


--
-- TOC entry 8661 (class 0 OID 0)
-- Dependencies: 2571
-- Name: FUNCTION get_stand_id(isactive character); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_stand_id(isactive character) IS 'param: isactive';


--
-- TOC entry 2572 (class 1255 OID 71812)
-- Name: get_stand_id(character, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stand_id(isactive character, code character varying) RETURNS TABLE(id bigint, stand_id character varying, stand_nr character varying, compartment_id integer, comp_nr character varying, mup_id integer, isactive character, mu_id integer, mu_code character varying, region_id integer, region_code character varying)
    LANGUAGE sql
    AS $_$

select s.id, s.stand_id, s.stand_nr, s.compartment_id, c.comp_nr, c.mup_id, mup.isactive, mup.mu_id, mu.mu_code, mu.region_id, r.code as region_code from tgis_stand s 
	left join tgis_compartment c on s.compartment_id=c.id 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit mu on mu.id=mup.mu_id
	left join tgis_region r on r.id=mu.region_id
	where mup.isactive =$1 and r.code =$2 ;

$_$;


--
-- TOC entry 8662 (class 0 OID 0)
-- Dependencies: 2572
-- Name: FUNCTION get_stand_id(isactive character, code character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_stand_id(isactive character, code character varying) IS 'param: isactive, region_code';


--
-- TOC entry 2573 (class 1255 OID 71813)
-- Name: get_stand_id(character, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stand_id(isactive character, code character varying, mu_code character varying) RETURNS TABLE(id bigint, stand_id character varying, stand_nr character varying, compartment_id integer, comp_nr character varying, mup_id integer, isactive character, mu_id integer, mu_code character varying, region_id integer, region_code character varying)
    LANGUAGE sql
    AS $_$

select s.id, s.stand_id, s.stand_nr, s.compartment_id, c.comp_nr, c.mup_id, mup.isactive, mup.mu_id, mu.mu_code, mu.region_id, r.code as region_code from tgis_stand s 
	left join tgis_compartment c on s.compartment_id=c.id 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit mu on mu.id=mup.mu_id
	left join tgis_region r on r.id=mu.region_id
	where mup.isactive =$1 and r.code =$2 and mu.mu_code=$3;

$_$;


--
-- TOC entry 8663 (class 0 OID 0)
-- Dependencies: 2573
-- Name: FUNCTION get_stand_id(isactive character, code character varying, mu_code character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_stand_id(isactive character, code character varying, mu_code character varying) IS 'param: isactive, region_code, mu_code';


--
-- TOC entry 2574 (class 1255 OID 71814)
-- Name: get_stand_id(character, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stand_id(isactive character, code character varying, mu_code character varying, comp_nr character varying) RETURNS TABLE(id bigint, stand_id character varying, stand_nr character varying, compartment_id integer, comp_nr character varying, mup_id integer, isactive character, mu_id integer, mu_code character varying, region_id integer, region_code character varying)
    LANGUAGE sql
    AS $_$

select s.id, s.stand_id, s.stand_nr, s.compartment_id, c.comp_nr, c.mup_id, mup.isactive, mup.mu_id, mu.mu_code, mu.region_id, r.code as region_code from tgis_stand s 
	left join tgis_compartment c on s.compartment_id=c.id 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit mu on mu.id=mup.mu_id
	left join tgis_region r on r.id=mu.region_id
	where mup.isactive =$1 and r.code =$2 and mu.mu_code=$3 and c.comp_nr=$4

$_$;


--
-- TOC entry 8664 (class 0 OID 0)
-- Dependencies: 2574
-- Name: FUNCTION get_stand_id(isactive character, code character varying, mu_code character varying, comp_nr character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_stand_id(isactive character, code character varying, mu_code character varying, comp_nr character varying) IS 'param: isactive, region_code, mu_code, comp_nr';


--
-- TOC entry 2575 (class 1255 OID 71815)
-- Name: get_stand_id(character, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stand_id(isactive character, code character varying, mu_code character varying, comp_nr character varying, stand_nr character varying) RETURNS TABLE(id bigint, stand_id character varying, stand_nr character varying, compartment_id integer, comp_nr character varying, mup_id integer, isactive character, mu_id integer, mu_code character varying, region_id integer, region_code character varying)
    LANGUAGE sql
    AS $_$

select s.id, s.stand_id, s.stand_nr, s.compartment_id, c.comp_nr, c.mup_id, mup.isactive, mup.mu_id, mu.mu_code, mu.region_id, r.code as region_code from tgis_stand s 
	left join tgis_compartment c on s.compartment_id=c.id 
	left join tgis_mu_period mup on c.mup_id=mup.id
	left join tgis_management_unit mu on mu.id=mup.mu_id
	left join tgis_region r on r.id=mu.region_id
	where mup.isactive =$1 and r.code =$2 and mu.mu_code=$3 and c.comp_nr=$4 and stand_nr=$5;

$_$;


--
-- TOC entry 8665 (class 0 OID 0)
-- Dependencies: 2575
-- Name: FUNCTION get_stand_id(isactive character, code character varying, mu_code character varying, comp_nr character varying, stand_nr character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_stand_id(isactive character, code character varying, mu_code character varying, comp_nr character varying, stand_nr character varying) IS 'param: isactive, region_code, mu_code, comp_nr, stand_nr';


--
-- TOC entry 2576 (class 1255 OID 71816)
-- Name: get_stand_split(character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stand_split(linestring character varying, stand_id integer) RETURNS TABLE(id bigint, geom public.geometry, geom913 public.geometry, part integer)
    LANGUAGE sql
    AS $_$

select id, (h.poly).geom,st_transform((h.poly).geom,900913), unnest((h.poly).path) part from (
select id, the_geom, ST_Dump(st_split(
the_geom, 
st_setsrid(st_geomfromtext($1),900916)
)
) as poly from tgis_stand where id = $2)  h  ; 

$_$;


--
-- TOC entry 8666 (class 0 OID 0)
-- Dependencies: 2576
-- Name: FUNCTION get_stand_split(linestring character varying, stand_id integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.get_stand_split(linestring character varying, stand_id integer) IS 'param: linestring, stand_id';


--
-- TOC entry 2577 (class 1255 OID 71817)
-- Name: get_surfacedata(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_surfacedata(text) RETURNS TABLE(nr integer, min_elevation numeric, max_elevation numeric, mean_elevation numeric, min_slope numeric, max_slope numeric, mean_slope numeric, exp character varying, soil_code integer)
    LANGUAGE sql
    AS $_$
SELECT SURFACE.*, SOIL.CODE AS SOIL_CODE FROM (
SELECT NR, 
MIN(ELEVATION)::NUMERIC AS MIN_ELEVATION, MAX(ELEVATION)::NUMERIC AS MAX_ELEVATION, ROUND((SUM(ELEVATION)/COUNT(NR))::NUMERIC,0) AS MEAN_ELEVATION,
MIN(SLOPE)::NUMERIC AS MIN_SLOPE, MAX(SLOPE)::NUMERIC AS MAX_SLOPE, ROUND((SUM(SLOPE)/COUNT(NR))::NUMERIC,2) AS MEAN_SLOPE,
MODE_(EXP)::VARCHAR(2) EXP 
FROM (
SELECT NR, VAL ELEVATION , SLOPE,
CASE WHEN EXPOSITION= -1 THEN 'F' ELSE 
CASE WHEN (EXPOSITION>= 0 AND EXPOSITION < 22.5) OR (EXPOSITION >= 337.5 AND EXPOSITION<=360) THEN 'N' ELSE 
CASE WHEN (EXPOSITION>= 22.5 AND EXPOSITION < 67.5) THEN 'NE' ELSE 
CASE WHEN EXPOSITION>= 67.5 AND EXPOSITION < 112.5 THEN 'E' ELSE 
CASE WHEN EXPOSITION>= 112.5 AND EXPOSITION < 157.5 THEN 'SE' ELSE 
CASE WHEN EXPOSITION>= 157.5 AND EXPOSITION < 202.5 THEN 'S' ELSE 
CASE WHEN EXPOSITION>= 202.5 AND EXPOSITION < 247.5 THEN 'SW' ELSE 
CASE WHEN EXPOSITION>= 247.5 AND EXPOSITION < 292.5 THEN 'W' ELSE 
CASE WHEN EXPOSITION>= 292.5 AND EXPOSITION < 337.5 THEN 'NW' ELSE 
'' END END END END END END END END END AS EXP
  FROM 
(SELECT NR, (ST_PIXELASPOLYGONS((ST_CLIP(TGIS_SURFACEDATA.ELEVATION,  ST_EXPAND(THE_GEOM,25))), 1, FALSE)).*  ,
ROUND((ST_PIXELASPOLYGONS((ST_CLIP(TGIS_SURFACEDATA.SLOPE,  ST_EXPAND(THE_GEOM,25))), 1, FALSE)).VAL::NUMERIC,2) AS SLOPE, 
ROUND((ST_PIXELASPOLYGONS((ST_CLIP(TGIS_SURFACEDATA.EXPOSITION,  ST_EXPAND(THE_GEOM,25))), 1, FALSE)).VAL::NUMERIC,2) AS EXPOSITION, 
THE_GEOM
FROM TGIS_SURFACEDATA, (SELECT 1 AS NR, * FROM ST_GEOMFROMTEXT($1, 900916) AS THE_GEOM) TVINEYARD
 WHERE ST_INTERSECTS(ELEVATION, THE_GEOM) )
 FOO WHERE ST_INTERSECTS(GEOM, THE_GEOM)
) FOO2
GROUP BY NR) SURFACE
LEFT JOIN 
(
SELECT 1 AS NR,  TGIS_SOIL.CODE,  ROUND(ST_AREA(ST_INTERSECTION(ING.THE_GEOM, TGIS_SOIL.THE_GEOM))::NUMERIC,2) AS AREA
FROM (SELECT  * FROM ST_GEOMFROMTEXT(
$1, 900916) AS THE_GEOM) ING,  TGIS_SOIL
 WHERE
ST_INTERSECTS(TGIS_SOIL.THE_GEOM, ING.THE_GEOM) 
ORDER BY AREA DESC 
LIMIT 1) SOIL ON SURFACE.NR=SOIL.NR


$_$;


--
-- TOC entry 2578 (class 1255 OID 71818)
-- Name: get_trip_positions(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_trip_positions(trip_id integer) RETURNS TABLE(id bigint, path integer, geom public.geometry, height double precision, time_trip timestamp with time zone)
    LANGUAGE sql COST 1000 ROWS 20000
    AS $_$

SELECT id, unnest(((ST_DumpPoints(geom)).path)) as path, ((ST_DumpPoints(geom)).geom) as  geom, 
st_z((ST_DumpPoints(geom)).geom) as height, to_timestamp(st_m((ST_DumpPoints(geom)).geom)) as time_trip  FROM tlog_trips 
where id = $1


$_$;


--
-- TOC entry 2579 (class 1255 OID 71819)
-- Name: getisometadata(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.getisometadata(character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
    schema_name alias for $1;
    table_name alias for $2;

    rowid integer;
    metadata xml;
    sql text;
    ret text;
BEGIN

    sql := 'SELECT md_file_id FROM iso_metadata_reference WHERE column_name IS NULL AND row_id_value IS NULL AND reference_scope=''table'' AND table_name=''' || table_name || ''' LIMIT 1';
    EXECUTE sql INTO rowid;

    IF rowid IS NULL THEN
	RETURN '';
    END IF;

    sql := 'SELECT metadata FROM iso_metadata WHERE id=' || rowid || ' LIMIT 1 ';
    EXECUTE sql INTO metadata;

    RETURN metadata::text;

END;
$_$;


--
-- TOC entry 2580 (class 1255 OID 71820)
-- Name: getprofile(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.getprofile(text) RETURNS TABLE(x double precision, y double precision, elev double precision, m double precision)
    LANGUAGE sql
    AS $_$


 WITH line AS
    (SELECT ('SRID=900916;'||$1)::geometry AS geom),
  linem AS
    (SELECT ST_AddMeasure(line.geom, 0, ST_Length(line.geom)) as linem,
            generate_series(0, ST_Length(line.geom)::int, ( case when ST_Length(line.geom)/300 < 5 then 5 else round((ST_Length(line.geom)/300)::numeric,5) end  )::int)  as i
     FROM line),
  points AS
    (SELECT ST_GeometryN(ST_LocateAlong(linem, i), 1) AS geom FROM linem),
  elevation AS
    (SELECT p.geom AS geom, ST_Value(tgis_surfacedata.elevation, 1, p.geom) AS elev
     FROM tgis_surfacedata, points p
     WHERE ST_Intersects(tgis_surfacedata.elevation, p.geom))
  SELECT ST_X(geom) as x, ST_Y(geom) as y, elev, ST_M(geom) as m  FROM elevation

$_$;


--
-- TOC entry 2581 (class 1255 OID 71821)
-- Name: insert_trip_delete_positions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.insert_trip_delete_positions() RETURNS integer
    LANGUAGE plpgsql COST 10000
    AS $$
BEGIN
insert into public.tlog_trips (
             device_name, uniqueid, phone, min_id, max_id, protocol, deviceid, 
            start_time, end_time, duration_time, start_device_time, end_device_time, 
            average_speed, max_speed, geom)
(select d.name as device_name, d.uniqueid, d.phone, t.* from (
--fili

 SELECT min(sel_subquery.id) AS min_id, max(sel_subquery.id) AS max_id, 
    sel_subquery.protocol, sel_subquery.deviceid, 
    min(sel_subquery.servertime) AS start_time, 
    max(sel_subquery.servertime) AS end_time, 
    max(sel_subquery.servertime) - min(sel_subquery.servertime) AS duration_time, 
    min(sel_subquery.devicetime) AS start_device_time, 
    max(sel_subquery.devicetime) AS end_device_time, 
    avg(sel_subquery.speed) AS average_speed, 
    max(sel_subquery.speed) AS max_speed, 
    st_makeline(sel_subquery.geom)::geometry(LineStringZM,900916) AS geom
   FROM ( SELECT p.id, p.protocol, p.deviceid, p.geom, p.servertime, 
            p.devicetime, p.speed, p.gap, p.groupid
           FROM ( SELECT k.id, k.protocol, k.deviceid, k.servertime, 
                    k.devicetime, k.valid, k.speed,  k.gap, 
                    k.prev_servertime, k.next_rainy, k.geom, 
                    count(k.gap) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS groupid
                   FROM ( SELECT positions.id, positions.protocol, 
                            positions.deviceid, positions.servertime, 
                            positions.devicetime, positions.valid, 
                            positions.speed*1.852 speed, 
                                CASE
                                    WHEN (positions.devicetime - lag(positions.devicetime) OVER (ORDER BY positions.protocol, positions.deviceid, positions.devicetime)) > '00:05:00'::interval THEN 1
                                    ELSE NULL::integer
                                END AS gap, 
                            lag(positions.id) OVER (ORDER BY positions.protocol, positions.deviceid, positions.devicetime) AS prev_servertime, 
                            lead(positions.id) OVER (ORDER BY positions.protocol, positions.deviceid, positions.devicetime) AS next_rainy, 
                            st_transform(st_setsrid(st_makepoint(positions.longitude, positions.latitude, positions.altitude, date_part('epoch'::text, positions.devicetime)), 4326), 900916) AS geom
                           FROM traccar.positions
                          ORDER BY positions.protocol, positions.deviceid, positions.devicetime) k) p
          WHERE p.valid IS TRUE AND p.geom IS NOT NULL
          ORDER BY p.protocol, p.deviceid, p.devicetime) sel_subquery
  GROUP BY sel_subquery.protocol, sel_subquery.deviceid, sel_subquery.groupid
--end



) t
left join traccar.devices as d on t.deviceid=d.id
where now()- end_device_time >=  interval '5 minutes'
order by protocol, deviceid,  end_device_time);

delete from  traccar.positions using tlog_trips
where  positions.protocol=tlog_trips.protocol and positions.deviceid=tlog_trips.deviceid and ( positions.id >= min_id and positions.id <= max_id );

return 1;
END;
$$;


--
-- TOC entry 2582 (class 1255 OID 71822)
-- Name: positions_aud(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.positions_aud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN

        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO traccar.positions_aud VALUES (DEFAULT, 'U', now(), user, NEW.*);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO traccar.positions_aud VALUES (DEFAULT, 'I', now(), user, NEW.*);
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$$;


--
-- TOC entry 2583 (class 1255 OID 71823)
-- Name: registerisometadata(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.registerisometadata(character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	schema_name alias for $1;
	table_name_alias alias for $2;
	metadata alias for $3;

	sql text;
	ret text;
	tmp text;
	fid xml;
	pid xml;
	geo geometry;
	ns varchar[];

BEGIN    
	ns := ARRAY[ARRAY['gmd', 'http://www.isotc211.org/2005/gmd']];
	IF position('gmd:fileIdentifier' in metadata) <> -1 THEN
		fid := xpath('//gmd:fileIdentifier/*', XMLPARSE(DOCUMENT metadata), ns);
		pid := xpath('//gmd:parentIdentifier/*', XMLPARSE(DOCUMENT metadata), ns);
	ELSE
		fid := xpath('//fileIdentifier/*', XMLPARSE(DOCUMENT metadata), ns);
		pid := xpath('//parentIdentifier/*', XMLPARSE(DOCUMENT metadata), ns);
	END IF;
	geo := BBoxGeometryFromMetadata(metadata);
	tmp := XMLSERIALIZE(CONTENT pid AS text);
	IF tmp = '{}' THEN
		pid := fid;
	END IF;
	sql := 'SELECT GetIsoMetadata(''' || schema_name || ''', ''' || table_name_alias || ''')';
	EXECUTE sql INTO tmp;
	INSERT INTO iso_metadata(md_scope, metadata, fileid, parentid, geometry)
	       VALUES('undefined', XMLPARSE(DOCUMENT metadata), fid, pid, geo); 
	sql := 'SELECT max(id) FROM iso_metadata';
	EXECUTE sql INTO ret;

	IF tmp <> '' THEN
		UPDATE iso_metadata_reference SET md_file_id = cast(ret AS integer), md_parent_id = cast(ret AS integer) 
		       WHERE reference_scope='table' AND table_name = table_name_alias;
	ELSE 
		INSERT INTO iso_metadata_reference(reference_scope, table_name, md_file_id, md_parent_id)
		       VALUES('table', table_name_alias, cast(ret AS integer), cast(ret AS integer));
	END IF;
	RETURN ret;

END;
$_$;


--
-- TOC entry 2584 (class 1255 OID 71824)
-- Name: tlayers_gis(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.tlayers_gis() RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    d_result            json;
BEGIN
SELECT      ARRAY_TO_JSON(
                    ARRAY_AGG(
                        ROW_TO_JSON(
                            CAST(ROW(tgis.* ) AS tgis)
                        )
                    )
                )
        INTO    d_result
        FROM   tgis;
    RETURN d_result;
    END; $$;


--
-- TOC entry 2585 (class 1255 OID 71825)
-- Name: update_imr_timestamp_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_imr_timestamp_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
	   NEW.timestamp = now(); 
	   RETURN NEW;
	END;
	$$;


--
-- TOC entry 4665 (class 1255 OID 71826)
-- Name: mode_(anyelement); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE public.mode_(anyelement) (
    SFUNC = array_append,
    STYPE = anyarray,
    INITCOND = '{}',
    FINALFUNC = public._final_mode
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 286 (class 1259 OID 71827)
-- Name: komuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.komuna (
    id integer NOT NULL,
    "nr iden vjeter" character varying,
    komuna character varying,
    "kodi komunes" character varying
);


--
-- TOC entry 287 (class 1259 OID 71833)
-- Name: Komuna_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Komuna_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8667 (class 0 OID 0)
-- Dependencies: 287
-- Name: Komuna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Komuna_id_seq" OWNED BY public.komuna.id;


--
-- TOC entry 288 (class 1259 OID 71835)
-- Name: tdhpet_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_location (
    id integer NOT NULL,
    habitat_location character varying(50) NOT NULL,
    mun_id integer NOT NULL,
    superintend_by integer NOT NULL,
    hunter_no integer,
    hunting_area_type character varying(3) NOT NULL,
    the_geom public.geometry NOT NULL,
    area double precision NOT NULL,
    comments text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL)))
);


--
-- TOC entry 289 (class 1259 OID 71842)
-- Name: dhpet_location; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.dhpet_location AS
 SELECT tdhpet_location.id,
    tdhpet_location.habitat_location,
    tdhpet_location.mun_id,
    tdhpet_location.superintend_by,
    tdhpet_location.hunter_no,
    tdhpet_location.hunting_area_type,
    tdhpet_location.the_geom,
    tdhpet_location.area,
    tdhpet_location.comments,
    tdhpet_location.created_by,
    tdhpet_location.created_date
   FROM public.tdhpet_location;


--
-- TOC entry 290 (class 1259 OID 71846)
-- Name: tdhpet_tourist_zone_geoms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_tourist_zone_geoms (
    id integer NOT NULL,
    location_id integer NOT NULL,
    zone_type character varying(3) NOT NULL,
    the_geom public.geometry NOT NULL,
    area double precision,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 291 (class 1259 OID 71852)
-- Name: dhpet_tourist_zone_geoms; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.dhpet_tourist_zone_geoms AS
 SELECT tdhpet_tourist_zone_geoms.id,
    tdhpet_tourist_zone_geoms.location_id,
    tdhpet_tourist_zone_geoms.zone_type,
    tdhpet_tourist_zone_geoms.the_geom,
    tdhpet_tourist_zone_geoms.area,
    tdhpet_tourist_zone_geoms.note,
    tdhpet_tourist_zone_geoms.created_by,
    tdhpet_tourist_zone_geoms.created_date
   FROM public.tdhpet_tourist_zone_geoms;


--
-- TOC entry 292 (class 1259 OID 71856)
-- Name: tref_economic_code; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tref_economic_code (
    id bigint NOT NULL,
    parent_id integer,
    code character varying(20) NOT NULL,
    level smallint NOT NULL,
    allocation boolean,
    name_al character varying(100) NOT NULL,
    name_en character varying(100),
    name_sr character varying(100),
    notes character varying(255),
    created_date date NOT NULL
);


--
-- TOC entry 293 (class 1259 OID 71862)
-- Name: economic_code_tree; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.economic_code_tree AS
 WITH RECURSIVE tref_economic_code_tree(id, parent_id, name_al, name_en, name_sr, notes, created_date, allocation, code, path, level) AS (
         SELECT tref_economic_code.id,
            tref_economic_code.parent_id,
            tref_economic_code.name_al,
            tref_economic_code.name_en,
            tref_economic_code.name_sr,
            tref_economic_code.notes,
            tref_economic_code.created_date,
            tref_economic_code.allocation,
            tref_economic_code.code,
            (NULL::integer[] || tref_economic_code.parent_id),
            1
           FROM public.tref_economic_code
          WHERE (tref_economic_code.parent_id IS NULL)
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.name_al,
            t.name_en,
            t.name_sr,
            t.notes,
            t.created_date,
            t.allocation,
            t.code,
            (rt.path || t.parent_id),
            (rt.level + 1)
           FROM (public.tref_economic_code t
             JOIN tref_economic_code_tree rt ON ((rt.id = t.parent_id)))
        )
 SELECT tref_economic_code_tree.id,
    tref_economic_code_tree.parent_id,
    tref_economic_code_tree.name_al,
    tref_economic_code_tree.name_en,
    tref_economic_code_tree.name_sr,
    tref_economic_code_tree.code,
    tref_economic_code_tree.path,
    tref_economic_code_tree.level,
    tref_economic_code_tree.allocation,
    tref_economic_code_tree.notes,
    tref_economic_code_tree.created_date
   FROM tref_economic_code_tree
  ORDER BY tref_economic_code_tree.id, tref_economic_code_tree.parent_id, tref_economic_code_tree.code;


--
-- TOC entry 294 (class 1259 OID 71867)
-- Name: ekonomic_code; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ekonomic_code (
    id bigint NOT NULL,
    parent_id integer,
    code character varying(20) NOT NULL,
    name_al character varying(100) NOT NULL,
    name_en character varying(100),
    name_sr character varying(100),
    level smallint NOT NULL
);


--
-- TOC entry 295 (class 1259 OID 71870)
-- Name: ekonomic_code_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ekonomic_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8668 (class 0 OID 0)
-- Dependencies: 295
-- Name: ekonomic_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ekonomic_code_id_seq OWNED BY public.ekonomic_code.id;


--
-- TOC entry 296 (class 1259 OID 71872)
-- Name: tgis_af_ref_07_plantation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_07_plantation (
    geom public.geometry(Polygon,900916),
    id bigint NOT NULL,
    area_ha double precision
);


--
-- TOC entry 297 (class 1259 OID 71878)
-- Name: ex_07_plantation; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ex_07_plantation AS
 SELECT tgis_af_ref_07_plantation.geom,
    tgis_af_ref_07_plantation.id,
    tgis_af_ref_07_plantation.area_ha
   FROM public.tgis_af_ref_07_plantation;


--
-- TOC entry 298 (class 1259 OID 71882)
-- Name: tfrm_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_activity (
    id bigint NOT NULL,
    activity_no character varying(30) NOT NULL,
    activity_domain_id integer NOT NULL,
    annual_planning_id bigint NOT NULL,
    activity_field character varying(3) NOT NULL,
    operation_level smallint NOT NULL,
    qr_code bytea NOT NULL,
    planed_geom public.geometry,
    implemented_geom public.geometry,
    created_by bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 299 (class 1259 OID 71889)
-- Name: tfrm_annual_planning; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_annual_planning (
    id bigint NOT NULL,
    mun_id integer,
    year smallint NOT NULL,
    operation_level smallint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    created_by bigint NOT NULL,
    status_id bigint,
    remarks text
);


--
-- TOC entry 300 (class 1259 OID 71896)
-- Name: tfrm_protection_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_protection_activity (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    status_id bigint NOT NULL,
    mun_id integer NOT NULL,
    mu_id integer,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    pl_value double precision NOT NULL,
    im_value double precision,
    measure_unit_id integer NOT NULL,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_created_date timestamp without time zone,
    im_created_by integer
);


--
-- TOC entry 301 (class 1259 OID 71900)
-- Name: tfrm_road_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_road_activity (
    id bigint NOT NULL,
    road_id integer NOT NULL,
    activity_id bigint NOT NULL,
    status_id bigint NOT NULL,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    pl_lenght double precision NOT NULL,
    pl_start_m double precision NOT NULL,
    pl_end_m double precision NOT NULL,
    pl_width double precision NOT NULL,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_lenght double precision,
    im_start_m double precision,
    im_end_m double precision,
    im_width double precision,
    im_created_date timestamp without time zone,
    im_created_by integer
);


--
-- TOC entry 302 (class 1259 OID 71904)
-- Name: tfrm_stand_harvest_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_harvest_activity (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    stand_id bigint NOT NULL,
    status_id bigint NOT NULL,
    tree_species_id integer NOT NULL,
    remarks text,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    pl_tech_volume double precision,
    pl_fire_volume double precision,
    pl_pulp_volume double precision,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_tech_volume double precision,
    im_fire_volume double precision,
    im_pulp_volume double precision,
    im_created_date timestamp without time zone,
    im_created_by integer,
    damage_volume double precision
);


--
-- TOC entry 303 (class 1259 OID 71911)
-- Name: tfrm_stand_planting_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_planting_activity (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    stand_id integer NOT NULL,
    status_id bigint NOT NULL,
    tree_species_id integer NOT NULL,
    prod_type character varying(50),
    inventory_pos_id bigint,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    seedling_age character varying(10),
    pl_area double precision,
    pl_trees integer,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_area double precision,
    im_trees integer,
    im_created_date timestamp without time zone,
    im_created_by integer,
    im_contr_id integer,
    im_contr_assign_date timestamp without time zone,
    im_contr_done_date timestamp without time zone,
    im_contr_notes character varying(255)
);


--
-- TOC entry 304 (class 1259 OID 71915)
-- Name: tfrm_stand_silviculture_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_silviculture_activity (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    stand_id integer NOT NULL,
    status_id bigint NOT NULL,
    tree_species_group character varying,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    pl_area double precision,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_area double precision,
    im_created_date timestamp without time zone,
    im_created_by integer
);


--
-- TOC entry 305 (class 1259 OID 71922)
-- Name: tgis_cadastral_municipality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_cadastral_municipality (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    name_sr character varying(100),
    name_en character varying(100),
    nr integer NOT NULL,
    code character varying(3),
    region_id integer NOT NULL,
    the_geom public.geometry NOT NULL,
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 306 (class 1259 OID 71930)
-- Name: tgis_compartment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_compartment (
    id bigint NOT NULL,
    mu_id integer NOT NULL,
    mup_id integer NOT NULL,
    mun_id integer NOT NULL,
    comp_nr character varying(3) NOT NULL,
    remarks character varying(255),
    the_geom public.geometry
);


--
-- TOC entry 307 (class 1259 OID 71936)
-- Name: tgis_management_unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_management_unit (
    id bigint NOT NULL,
    region_id integer NOT NULL,
    mu_name character varying(150) NOT NULL,
    remarks character varying(255),
    mu_code character varying(10)
);


--
-- TOC entry 308 (class 1259 OID 71939)
-- Name: tgis_stand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_stand (
    id bigint NOT NULL,
    compartment_id integer NOT NULL,
    stand_id character varying(15) NOT NULL,
    stand_nr character varying(2) NOT NULL,
    mngm_class character varying(4) NOT NULL,
    no_plots integer,
    minehazard character varying(3),
    layers integer,
    access_type character varying(20) NOT NULL,
    basal_area double precision NOT NULL,
    stand_type character varying(1),
    crowncover double precision,
    slope double precision,
    littercov double precision,
    age integer,
    origin character varying(1),
    conifer integer,
    conifer_bon double precision,
    decidouse integer,
    decidouse_bon double precision,
    trees integer,
    volume_m3ha double precision,
    conifer_perc double precision,
    decidouse_perc double precision,
    perc_0_30 double precision,
    perc_30_50 double precision,
    perc_50_70 double precision,
    perc_70_100 double precision,
    incr_perc double precision,
    m2_ha double precision,
    ds_con double precision,
    ds_bro double precision,
    cl1_perc_con double precision,
    cl2_perc_con double precision,
    cl3_perc_con double precision,
    cl4_perc_con double precision,
    cl1_perc_dec double precision,
    cl2_perc_dec double precision,
    cl3_perc_dec double precision,
    cl4_perc_dec double precision,
    damage_perc double precision,
    estemate_volume integer,
    estimate_trees_per_ha character varying(10),
    height_mean integer,
    tree1 integer,
    tree2 integer,
    tree3 integer,
    survey_date timestamp without time zone,
    remarks character varying(255),
    status character varying(3),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 309 (class 1259 OID 71948)
-- Name: ex_v_annual_planning_activity_detail; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ex_v_annual_planning_activity_detail AS
 SELECT act.id,
    act.activity_no,
    act.activity_field,
    ap.year,
    mu.mu_name AS mg_unit,
    cm.name AS municipality,
    mu.mu_code,
    c.comp_nr,
    s.stand_nr,
    act.planed_geom,
    act.implemented_geom
   FROM ((((((public.tfrm_activity act
     LEFT JOIN public.tfrm_annual_planning ap ON ((ap.id = act.annual_planning_id)))
     LEFT JOIN public.tgis_cadastral_municipality cm ON ((cm.id = ap.mun_id)))
     LEFT JOIN ( SELECT tfrm_stand_harvest_activity.activity_id,
            tfrm_stand_harvest_activity.stand_id,
            'HRV'::text AS act_type
           FROM public.tfrm_stand_harvest_activity
        UNION ALL
         SELECT tfrm_stand_silviculture_activity.activity_id,
            tfrm_stand_silviculture_activity.stand_id,
            'SLV'::text AS act_type
           FROM public.tfrm_stand_silviculture_activity
        UNION ALL
         SELECT tfrm_stand_planting_activity.activity_id,
            tfrm_stand_planting_activity.stand_id,
            'PLA'::text AS act_type
           FROM public.tfrm_stand_planting_activity
        UNION ALL
         SELECT tfrm_road_activity.activity_id,
            NULL::bigint AS stand_id,
            'INF'::text AS act_type
           FROM public.tfrm_road_activity
        UNION ALL
         SELECT tfrm_protection_activity.activity_id,
            NULL::bigint AS stand_id,
            'PRO'::text AS act_type
           FROM public.tfrm_protection_activity) act_det ON ((act.id = act_det.activity_id)))
     LEFT JOIN public.tgis_stand s ON ((s.id = act_det.stand_id)))
     LEFT JOIN public.tgis_compartment c ON ((c.id = s.compartment_id)))
     LEFT JOIN public.tgis_management_unit mu ON ((mu.id = c.mu_id)));


--
-- TOC entry 310 (class 1259 OID 71953)
-- Name: tfal_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfal_request (
    id integer NOT NULL,
    company_id integer,
    person_id integer,
    start_lease date NOT NULL,
    end_lease date NOT NULL,
    tfal_request_type_id integer NOT NULL,
    price double precision,
    lease_date timestamp without time zone DEFAULT now() NOT NULL,
    active boolean NOT NULL,
    current_status_id integer,
    created_by integer NOT NULL,
    area double precision NOT NULL,
    the_geom public.geometry NOT NULL,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 311 (class 1259 OID 71963)
-- Name: tfal_request_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfal_request_status (
    id integer NOT NULL,
    request_id integer NOT NULL,
    status character varying(6) NOT NULL,
    active boolean DEFAULT false NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    changed_by integer NOT NULL,
    note text
);


--
-- TOC entry 312 (class 1259 OID 71971)
-- Name: tfal_request_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfal_request_type (
    id integer NOT NULL,
    name_al character varying(100) NOT NULL,
    name_en character varying(100),
    name_sr character varying(100),
    price double precision,
    period_type character varying(2) NOT NULL,
    created_date date NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 313 (class 1259 OID 71974)
-- Name: ttextdomain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ttextdomain (
    id bigint NOT NULL,
    domname character varying(30) NOT NULL,
    domvalue character varying(30) NOT NULL,
    domkey character varying(6) NOT NULL,
    sort integer NOT NULL,
    domtext character varying(150) NOT NULL,
    domtext_en character varying(150),
    domtext_sr character varying(150)
);


--
-- TOC entry 314 (class 1259 OID 71980)
-- Name: ex_v_fal_request; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ex_v_fal_request AS
 SELECT r.id,
    rt.name_al AS request_type,
    r.start_lease,
    r.end_lease,
    dt.domtext AS status,
    r.the_geom
   FROM (((public.tfal_request r
     LEFT JOIN public.tfal_request_type rt ON ((r.tfal_request_type_id = rt.id)))
     LEFT JOIN public.tfal_request_status rs ON ((rs.id = r.current_status_id)))
     LEFT JOIN ( SELECT ttextdomain.id,
            ttextdomain.domname,
            ttextdomain.domvalue,
            ttextdomain.domkey,
            ttextdomain.sort,
            ttextdomain.domtext,
            ttextdomain.domtext_en,
            ttextdomain.domtext_sr
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text ~~* 'REQUESTSTATUS'::text)) dt ON (((dt.domkey)::text = (rs.status)::text)));


--
-- TOC entry 315 (class 1259 OID 71985)
-- Name: tgis_mu_period; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_mu_period (
    id bigint NOT NULL,
    mu_id integer NOT NULL,
    trnx_id character varying(36) NOT NULL,
    the_geom public.geometry,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone,
    note character varying(255),
    CONSTRAINT tgis_mu_period_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 316 (class 1259 OID 71994)
-- Name: vgis_comp_active; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_comp_active AS
 SELECT c.mu_id,
    c.mup_id,
    c.comp_nr,
    s.stand_count,
    c.the_geom
   FROM ((public.tgis_compartment c
     LEFT JOIN public.tgis_mu_period mup ON ((c.mup_id = mup.id)))
     LEFT JOIN ( SELECT tgis_stand.compartment_id,
            count(tgis_stand.id) AS stand_count
           FROM public.tgis_stand
          GROUP BY tgis_stand.compartment_id) s ON ((c.id = s.compartment_id)))
  WHERE (mup.isactive = 'Y'::bpchar);


--
-- TOC entry 317 (class 1259 OID 71999)
-- Name: ex_vgis_comp_active; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ex_vgis_comp_active AS
 SELECT vgis_comp_active.mu_id,
    vgis_comp_active.mup_id,
    vgis_comp_active.comp_nr,
    vgis_comp_active.stand_count,
    vgis_comp_active.the_geom
   FROM public.vgis_comp_active;


--
-- TOC entry 318 (class 1259 OID 72003)
-- Name: vgis_mu_period_active; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_mu_period_active WITH (security_barrier='true') AS
 SELECT mup.id,
    mu.mu_code,
    mu.mu_name,
    ((date_part('year'::text, mup.start_date) || '-'::text) || date_part('year'::text, mup.end_date)) AS period,
    mup.the_geom
   FROM (public.tgis_mu_period mup
     LEFT JOIN public.tgis_management_unit mu ON ((mup.mu_id = mu.id)))
  WHERE (mup.isactive = 'Y'::bpchar);


--
-- TOC entry 319 (class 1259 OID 72007)
-- Name: ex_vgis_mu_period_active; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ex_vgis_mu_period_active AS
 SELECT vgis_mu_period_active.id,
    vgis_mu_period_active.mu_code,
    vgis_mu_period_active.mu_name,
    vgis_mu_period_active.period,
    vgis_mu_period_active.the_geom
   FROM public.vgis_mu_period_active;


--
-- TOC entry 320 (class 1259 OID 72011)
-- Name: fiskos_version; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fiskos_version
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 321 (class 1259 OID 72013)
-- Name: get_shape_out_state; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.get_shape_out_state AS
 SELECT get_shape_out_state.stand_id,
    get_shape_out_state.area_out,
    get_shape_out_state.geom_out
   FROM public.get_shape_out_state() get_shape_out_state(stand_id, area_out, geom_out);


SET default_with_oids = true;

--
-- TOC entry 322 (class 1259 OID 72017)
-- Name: iso_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.iso_metadata (
    id integer NOT NULL,
    md_scope character varying(64),
    metadata xml,
    fileid xml,
    parentid xml,
    geometry public.geometry
);


--
-- TOC entry 323 (class 1259 OID 72023)
-- Name: iso_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.iso_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8669 (class 0 OID 0)
-- Dependencies: 323
-- Name: iso_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.iso_metadata_id_seq OWNED BY public.iso_metadata.id;


--
-- TOC entry 324 (class 1259 OID 72025)
-- Name: iso_metadata_reference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.iso_metadata_reference (
    reference_scope character varying(64),
    table_name character varying(256),
    column_name character varying(256),
    row_id_value integer,
    "timestamp" timestamp without time zone DEFAULT statement_timestamp(),
    md_file_id integer DEFAULT 0,
    md_parent_id integer DEFAULT 0
);


--
-- TOC entry 325 (class 1259 OID 72034)
-- Name: kfis_tdp_mngmt_documentno; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kfis_tdp_mngmt_documentno
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 326 (class 1259 OID 72036)
-- Name: kfis_tpurchase_order_po_number; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kfis_tpurchase_order_po_number
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 327 (class 1259 OID 72038)
-- Name: kfis_trequisition_requisition_nr; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kfis_trequisition_requisition_nr
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_with_oids = false;

--
-- TOC entry 328 (class 1259 OID 72040)
-- Name: liqenet2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.liqenet2 (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,900916),
    name character varying(100)
);


--
-- TOC entry 329 (class 1259 OID 72046)
-- Name: liqenet2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.liqenet2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8670 (class 0 OID 0)
-- Dependencies: 329
-- Name: liqenet2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.liqenet2_id_seq OWNED BY public.liqenet2.id;


--
-- TOC entry 330 (class 1259 OID 72048)
-- Name: lumenjet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lumenjet (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,900916)
);


--
-- TOC entry 331 (class 1259 OID 72054)
-- Name: ms; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ms AS
 SELECT min(sel_subquery.id) AS min_id,
    max(sel_subquery.id) AS max_id,
    sel_subquery.protocol,
    sel_subquery.deviceid,
    min(sel_subquery.servertime) AS start_time,
    max(sel_subquery.servertime) AS end_time,
    (max(sel_subquery.servertime) - min(sel_subquery.servertime)) AS duration_time,
    min(sel_subquery.devicetime) AS start_device_time,
    max(sel_subquery.devicetime) AS end_device_time,
    avg(sel_subquery.speed) AS average_speed,
    max(sel_subquery.speed) AS max_speed,
    (public.st_makeline(sel_subquery.geom))::public.geometry(LineStringZM,900916) AS geom
   FROM ( SELECT p.id,
            p.protocol,
            p.deviceid,
            p.geom,
            p.servertime,
            p.devicetime,
            p.speed,
            p.gap,
            p.groupid
           FROM ( SELECT k.id,
                    k.protocol,
                    k.deviceid,
                    k.servertime,
                    k.devicetime,
                    k.valid,
                    k.speed,
                    k.interva,
                    k.gap,
                    k.prev_servertime,
                    k.next_rainy,
                    k.geom,
                    count(k.gap) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS groupid
                   FROM ( SELECT positions.id,
                            positions.protocol,
                            positions.deviceid,
                            positions.servertime,
                            positions.devicetime,
                            positions.valid,
                            positions.speed,
                                CASE
                                    WHEN ((positions.servertime - lag(positions.servertime) OVER (ORDER BY positions.protocol, positions.deviceid, positions.servertime)) >= '00:05:00'::interval) THEN 'ok'::text
                                    ELSE 'jo'::text
                                END AS interva,
                                CASE
                                    WHEN ((positions.servertime - lag(positions.servertime) OVER (ORDER BY positions.protocol, positions.deviceid, positions.servertime)) >= '00:05:00'::interval) THEN 1
                                    ELSE NULL::integer
                                END AS gap,
                            lag(positions.id) OVER (ORDER BY positions.protocol, positions.deviceid, positions.servertime) AS prev_servertime,
                            lead(positions.id) OVER (ORDER BY positions.protocol, positions.deviceid, positions.servertime) AS next_rainy,
                            public.st_transform(public.st_setsrid(public.st_makepoint(positions.longitude, positions.latitude, positions.altitude, date_part('epoch'::text, positions.servertime)), 4326), 900916) AS geom
                           FROM ( SELECT positions_1.id,
                                    positions_1.protocol,
                                    positions_1.deviceid,
                                    positions_1.servertime,
                                    positions_1.devicetime,
                                    positions_1.fixtime,
                                    positions_1.valid,
                                    positions_1.latitude,
                                    positions_1.longitude,
                                    positions_1.altitude,
                                    positions_1.speed,
                                    positions_1.course,
                                    positions_1.address,
                                    positions_1.attributes,
                                    positions_1.accuracy,
                                    positions_1.network
                                   FROM public.dblink('dbname=traccar port=5432 host=localhost 
                user=postgres password=*****'::text, 'SELECT id, protocol, deviceid, servertime, devicetime, fixtime, valid, 
       latitude, longitude, altitude, speed, course, address, attributes, 
       accuracy, network
  FROM public.positions'::text) positions_1(id integer, protocol character varying(128), deviceid integer, servertime timestamp without time zone, devicetime timestamp without time zone, fixtime timestamp without time zone, valid boolean, latitude double precision, longitude double precision, altitude double precision, speed double precision, course double precision, address character varying(512), attributes character varying(4000), accuracy double precision, network character varying(4000))) positions
                          ORDER BY positions.protocol, positions.deviceid, positions.servertime) k) p
          WHERE ((p.valid IS TRUE) AND (p.geom IS NOT NULL))
          ORDER BY p.protocol, p.deviceid, p.servertime) sel_subquery
  GROUP BY sel_subquery.protocol, sel_subquery.deviceid, sel_subquery.groupid
  ORDER BY sel_subquery.protocol, sel_subquery.deviceid, (max(sel_subquery.servertime));


--
-- TOC entry 332 (class 1259 OID 72059)
-- Name: poligon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.poligon (
    id integer NOT NULL,
    emri character varying NOT NULL,
    the_geom public.geometry(MultiPolygon,4326)
);


--
-- TOC entry 333 (class 1259 OID 72065)
-- Name: poligon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.poligon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8671 (class 0 OID 0)
-- Dependencies: 333
-- Name: poligon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.poligon_id_seq OWNED BY public.poligon.id;


--
-- TOC entry 334 (class 1259 OID 72067)
-- Name: pos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.pos AS
 SELECT get_trip_positions.id,
    get_trip_positions.path,
    get_trip_positions.geom,
    get_trip_positions.height,
    get_trip_positions.time_trip
   FROM public.get_trip_positions(5) get_trip_positions(id, path, geom, height, time_trip);


--
-- TOC entry 335 (class 1259 OID 72071)
-- Name: trbac_object; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_object (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(20) NOT NULL,
    locked smallint DEFAULT 0 NOT NULL,
    parent_id integer
);


--
-- TOC entry 336 (class 1259 OID 72075)
-- Name: rbac_object_view; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.rbac_object_view AS
 WITH RECURSIVE objecttree(id, parent_id, object_name, code, path, depth) AS (
         SELECT trbac_object.id,
            trbac_object.parent_id,
            trbac_object.name,
            trbac_object.code,
            (NULL::integer[] || trbac_object.parent_id),
            1
           FROM public.trbac_object
          WHERE (trbac_object.parent_id = 1)
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.name,
            t.code,
            (rt.path || t.parent_id),
            (rt.depth + 1)
           FROM (public.trbac_object t
             JOIN objecttree rt ON ((rt.id = t.parent_id)))
        )
 SELECT objecttree.id,
    objecttree.parent_id,
    objecttree.object_name,
    objecttree.code,
    objecttree.path,
    objecttree.depth
   FROM objecttree
  ORDER BY objecttree.object_name, objecttree.path;


--
-- TOC entry 337 (class 1259 OID 72080)
-- Name: shape_biodiversity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shape_biodiversity (
    ogc_fid integer NOT NULL,
    wkb_geometry public.geometry(Point),
    biocode numeric(4,0),
    remarks character varying(150),
    comp_nr numeric(19,11),
    stand_nr character varying(3),
    biodiversi numeric(4,0),
    timeform character varying(10),
    taksator character varying(25)
);


--
-- TOC entry 338 (class 1259 OID 72086)
-- Name: shape_biodiversity_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shape_biodiversity_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8672 (class 0 OID 0)
-- Dependencies: 338
-- Name: shape_biodiversity_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shape_biodiversity_ogc_fid_seq OWNED BY public.shape_biodiversity.ogc_fid;


--
-- TOC entry 339 (class 1259 OID 72088)
-- Name: shape_stand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shape_stand (
    ogc_fid integer NOT NULL,
    wkb_geometry public.geometry,
    stand_id character varying(254),
    fmr character varying(2),
    munici character varying(3),
    mu character varying(2),
    comp character varying(3),
    stand character varying(2),
    standarea numeric(19,11),
    mc numeric(4,0),
    no_plots numeric(9,0),
    access numeric(4,0),
    minehazard character varying(254),
    layers numeric(9,0),
    crowncover numeric(19,11),
    slope numeric(19,11),
    littercov numeric(19,11),
    age numeric(19,11),
    origin numeric(4,0),
    domspc numeric(4,0),
    consi numeric(19,11),
    domspb numeric(4,0),
    brosi numeric(19,11),
    trees numeric(19,11),
    treatm numeric(9,0),
    treatmarea numeric(19,11),
    m3conha numeric(19,11),
    m3broha numeric(19,11),
    m3_0_30 numeric(19,11),
    m3_30_50 numeric(19,11),
    m3_50_70 numeric(19,11),
    m3_70_ numeric(19,11),
    m3tot_ha numeric(19,11),
    m3stand numeric(19,11),
    relerror numeric(19,11),
    conperc numeric(19,11),
    broperc numeric(19,11),
    m3ilcutcon numeric(19,11),
    m3ilcutbro numeric(19,11),
    incrconha numeric(19,11),
    incrbroha numeric(19,11),
    incrtot_ha numeric(19,11),
    incrstand numeric(19,11),
    m3_m_con numeric(19,11),
    m3_m_bro numeric(19,11),
    m3_m_tot numeric(19,11),
    m3_m_stand numeric(19,11),
    m2_ha numeric(19,11),
    ds_con numeric(19,11),
    ds_bro numeric(19,11),
    cl1_con numeric(19,11),
    cl2_con numeric(19,11),
    cl3_con numeric(19,11),
    cl4_con numeric(19,11),
    cl1_bro numeric(19,11),
    cl2_bro numeric(19,11),
    cl3_bro numeric(19,11),
    cl4_bro numeric(19,11),
    damageperc numeric(19,11),
    m3est numeric(13,11),
    stemsha numeric(4,0),
    heightmean numeric(4,0),
    youngtree1 numeric(9,0),
    youngtree2 numeric(9,0),
    youngtree3 numeric(9,0),
    survey_dat date,
    id integer NOT NULL
);


--
-- TOC entry 340 (class 1259 OID 72094)
-- Name: tfrm_estimate_volume; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_estimate_volume (
    code integer NOT NULL,
    description character varying(100) NOT NULL,
    minimum integer NOT NULL,
    maximum integer NOT NULL
);


--
-- TOC entry 341 (class 1259 OID 72097)
-- Name: tfrm_tree_species; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_tree_species (
    id integer NOT NULL,
    code integer NOT NULL,
    name_en character varying(100) NOT NULL,
    name_al character varying(100) NOT NULL,
    name_sr character varying(100) NOT NULL,
    name_la character varying(100) NOT NULL,
    species_group character varying(100),
    species_bonitet double precision NOT NULL,
    max_diameter double precision NOT NULL
);


--
-- TOC entry 342 (class 1259 OID 72103)
-- Name: tshape_treatment_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tshape_treatment_name (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    name_sr character varying(255)
);


--
-- TOC entry 343 (class 1259 OID 72109)
-- Name: shape_fields_control; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.shape_fields_control AS
 SELECT shape_stand.stand_id,
    'mc'::text AS field,
    shape_stand.mc AS value
   FROM public.shape_stand
  WHERE (NOT (shape_stand.mc IN ( SELECT (ttextdomain.domkey)::numeric AS mc
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'MNGMCLASS'::text))))
UNION ALL
 SELECT shape_stand.stand_id,
    'access'::text AS field,
    shape_stand.access AS value
   FROM public.shape_stand
  WHERE (NOT (shape_stand.access IN ( SELECT (ttextdomain.domkey)::numeric AS domkey
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'ACCESSIBLE'::text))))
UNION ALL
 SELECT shape_stand.stand_id,
    'stemsha'::text AS field,
    shape_stand.stemsha AS value
   FROM public.shape_stand
  WHERE ((shape_stand.mc < (5000)::numeric) AND (shape_stand.no_plots = (0)::numeric) AND (NOT (shape_stand.stemsha IN ( SELECT (ttextdomain.domkey)::numeric AS domkey
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'ESTIMATETREES'::text)))))
UNION ALL
 SELECT shape_stand.stand_id,
    'origin'::text AS field,
    shape_stand.origin AS value
   FROM public.shape_stand
  WHERE (NOT (shape_stand.origin IN ( SELECT (ttextdomain.domkey)::numeric AS domkey
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'FORESTORIGIN'::text))))
UNION ALL
 SELECT shape_stand.stand_id,
    'no_plots'::text AS field,
    shape_stand.no_plots AS value
   FROM public.shape_stand
  WHERE (NOT ((( SELECT
                CASE
                    WHEN ((shape_stand.no_plots > (0)::numeric) AND (shape_stand.mc > (5000)::numeric)) THEN 3
                    ELSE
                    CASE
                        WHEN ((shape_stand.mc > (5000)::numeric) AND (shape_stand.mc < (7000)::numeric)) THEN 2
                        ELSE
                        CASE
                            WHEN ((shape_stand.no_plots > (0)::numeric) AND (shape_stand.mc < (5000)::numeric)) THEN 0
                            ELSE 1
                        END
                    END
                END AS "case"))::numeric IN ( SELECT (ttextdomain.domkey)::numeric AS domkey
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'STANDTYPE'::text))))
UNION ALL
 SELECT shape_stand.stand_id,
    'm3est'::text AS field,
    shape_stand.m3est AS value
   FROM public.shape_stand
  WHERE (NOT (shape_stand.m3est IN ( SELECT tfrm_estimate_volume.code
           FROM public.tfrm_estimate_volume)))
UNION ALL
 SELECT shape_stand.stand_id,
    'youngtree1'::text AS field,
    shape_stand.youngtree1 AS value
   FROM public.shape_stand
  WHERE ((shape_stand.youngtree1 <> (0)::numeric) AND (NOT (shape_stand.youngtree1 IN ( SELECT tfrm_tree_species.code
           FROM public.tfrm_tree_species))))
UNION ALL
 SELECT shape_stand.stand_id,
    'youngtree2'::text AS field,
    shape_stand.youngtree2 AS value
   FROM public.shape_stand
  WHERE ((shape_stand.youngtree2 <> (0)::numeric) AND (NOT (shape_stand.youngtree2 IN ( SELECT tfrm_tree_species.code
           FROM public.tfrm_tree_species))))
UNION ALL
 SELECT shape_stand.stand_id,
    'youngtree3'::text AS field,
    shape_stand.youngtree3 AS value
   FROM public.shape_stand
  WHERE ((shape_stand.youngtree3 <> (0)::numeric) AND (NOT (shape_stand.youngtree3 IN ( SELECT tfrm_tree_species.code
           FROM public.tfrm_tree_species))))
UNION ALL
 SELECT shape_stand.stand_id,
    'domspc'::text AS field,
    shape_stand.domspc AS value
   FROM public.shape_stand
  WHERE ((shape_stand.domspc <> (0)::numeric) AND (NOT (shape_stand.domspc IN ( SELECT tfrm_tree_species.code
           FROM public.tfrm_tree_species))))
UNION ALL
 SELECT shape_stand.stand_id,
    'domspb'::text AS field,
    shape_stand.domspb AS value
   FROM public.shape_stand
  WHERE ((shape_stand.domspb <> (0)::numeric) AND (NOT (shape_stand.domspb IN ( SELECT tfrm_tree_species.code
           FROM public.tfrm_tree_species))))
UNION ALL
 SELECT shape_stand.stand_id,
    'treatm'::text AS field,
    shape_stand.treatm AS value
   FROM public.shape_stand
  WHERE ((shape_stand.treatm <> (99)::numeric) AND (NOT (shape_stand.treatm IN ( SELECT tshape_treatment_name.code
           FROM public.tshape_treatment_name))));


--
-- TOC entry 344 (class 1259 OID 72114)
-- Name: shape_plot_trees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shape_plot_trees (
    ogc_fid integer NOT NULL,
    odeljenje numeric(19,11),
    plotid numeric(9,0),
    treeid numeric(9,0),
    health numeric(9,0),
    name character varying(28),
    incomplete numeric(19,11),
    height numeric(9,0),
    increment numeric(19,11),
    diameter numeric(19,11),
    testmark numeric(19,11),
    odsek character varying(7),
    plottreeid character varying(12),
    speccode numeric(9,0),
    techcode numeric(9,0)
);


--
-- TOC entry 345 (class 1259 OID 72117)
-- Name: shape_plot_trees_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shape_plot_trees_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8673 (class 0 OID 0)
-- Dependencies: 345
-- Name: shape_plot_trees_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shape_plot_trees_ogc_fid_seq OWNED BY public.shape_plot_trees.ogc_fid;


--
-- TOC entry 346 (class 1259 OID 72119)
-- Name: shape_plots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shape_plots (
    ogc_fid integer NOT NULL,
    wkb_geometry public.geometry,
    plot_nr numeric(9,0),
    comp_nr numeric(9,0),
    stand_nr character varying(3),
    visited numeric(4,0),
    plottype numeric(4,0),
    slope numeric(4,0),
    littercov numeric(4,0),
    age numeric(4,0),
    crowncov numeric(4,0),
    c_stems1 numeric(4,0),
    c_stems2 numeric(4,0),
    c_damage numeric(4,0),
    c_supress numeric(4,0),
    c_distrib numeric(4,0),
    b_stems1 numeric(4,0),
    b_stems2 numeric(4,0),
    b_damage numeric(4,0),
    b_supress numeric(4,0),
    b_distrib numeric(4,0),
    time_ character varying(12),
    date_ date,
    taksator character varying(20)
);


--
-- TOC entry 347 (class 1259 OID 72125)
-- Name: shape_plots_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shape_plots_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8674 (class 0 OID 0)
-- Dependencies: 347
-- Name: shape_plots_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shape_plots_ogc_fid_seq OWNED BY public.shape_plots.ogc_fid;


--
-- TOC entry 348 (class 1259 OID 72127)
-- Name: shape_stand_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shape_stand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8675 (class 0 OID 0)
-- Dependencies: 348
-- Name: shape_stand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shape_stand_id_seq OWNED BY public.shape_stand.id;


--
-- TOC entry 349 (class 1259 OID 72129)
-- Name: shape_stand_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shape_stand_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8676 (class 0 OID 0)
-- Dependencies: 349
-- Name: shape_stand_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shape_stand_ogc_fid_seq OWNED BY public.shape_stand.ogc_fid;


--
-- TOC entry 350 (class 1259 OID 72131)
-- Name: stand_search; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.stand_search AS
 SELECT mu.id AS mu_id,
    mu.mu_name,
    mu.region_id,
    co.id AS comp_id,
    co.comp_nr,
    st.id AS st_id,
    st.compartment_id,
    st.stand_id,
    st.stand_nr,
    st.mngm_class,
    st.access_type,
    st.basal_area,
    st.stand_type,
    doms.domkey AS stypedomkey,
    doms.domtext AS stype,
    doms.domtext_en AS stypeen,
    doms.domtext_sr AS stypesr,
    doma.domkey AS accdomkey,
    doma.domtext AS acctext,
    doma.domtext_en AS acctexten,
    doma.domtext_sr AS acctextsr,
    dommn.domkey AS mndomkey,
    dommn.domtext AS mntext,
    dommn.domtext_en AS mntexten,
    dommn.domtext_sr AS mntextsr
   FROM (((((((public.tgis_stand st
     LEFT JOIN public.tgis_compartment co ON ((co.id = st.compartment_id)))
     LEFT JOIN public.tgis_mu_period mup ON ((co.mup_id = mup.id)))
     LEFT JOIN public.tgis_management_unit mu ON ((co.mu_id = mu.id)))
     LEFT JOIN public.tgis_cadastral_municipality cm ON ((cm.id = co.mun_id)))
     LEFT JOIN ( SELECT ttextdomain.id,
            ttextdomain.domname,
            ttextdomain.domvalue,
            ttextdomain.domkey,
            ttextdomain.sort,
            ttextdomain.domtext,
            ttextdomain.domtext_en,
            ttextdomain.domtext_sr
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'STANDTYPE'::text)) doms ON (((doms.domkey)::text = (st.stand_type)::text)))
     LEFT JOIN ( SELECT ttextdomain.id,
            ttextdomain.domname,
            ttextdomain.domvalue,
            ttextdomain.domkey,
            ttextdomain.sort,
            ttextdomain.domtext,
            ttextdomain.domtext_en,
            ttextdomain.domtext_sr
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'ACCESSIBLE'::text)) doma ON (((doma.domkey)::text = (st.access_type)::text)))
     LEFT JOIN ( SELECT ttextdomain.id,
            ttextdomain.domname,
            ttextdomain.domvalue,
            ttextdomain.domkey,
            ttextdomain.sort,
            ttextdomain.domtext,
            ttextdomain.domtext_en,
            ttextdomain.domtext_sr
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'MNGMCLASS'::text)) dommn ON (((dommn.domkey)::text = (st.mngm_class)::text)))
  WHERE (mup.isactive = 'Y'::bpchar);


--
-- TOC entry 351 (class 1259 OID 72136)
-- Name: stand_temp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stand_temp (
    gid integer NOT NULL,
    stand_id character varying(254),
    fmr character varying(2),
    fmrname character varying(50),
    munici character varying(3),
    municiname character varying(50),
    mu character varying(2),
    muname character varying(50),
    comp character varying(3),
    subcomp character varying(1),
    stand character varying(2),
    standarea numeric,
    mc smallint,
    mcname character varying(254),
    no_plots integer,
    access smallint,
    accessname character varying(254),
    minehazard character varying(254),
    layers integer,
    layersname character varying(254),
    biodiversi integer,
    crowncover numeric,
    slope numeric,
    littercov numeric,
    age numeric,
    origin smallint,
    originname character varying(254),
    domspc smallint,
    consi numeric,
    domspb smallint,
    brosi numeric,
    trees numeric,
    treatm integer,
    treatmname character varying(254),
    treatmarea numeric,
    m3conha numeric,
    m3broha numeric,
    m3_0_30 numeric,
    m3_30_50 numeric,
    m3_50_70 numeric,
    m3_70_ numeric,
    m3tot_ha numeric,
    m3stand numeric,
    relerror numeric,
    conperc numeric,
    broperc numeric,
    m3ilcutcon numeric,
    m3ilcutbro numeric,
    incrconha numeric,
    incrbroha numeric,
    incrtot_ha numeric,
    incrstand numeric,
    m3_m_con numeric,
    m3_m_bro numeric,
    m3_m_tot numeric,
    m3_m_stand numeric,
    m2_ha numeric,
    ds_con numeric,
    ds_bro numeric,
    cl1_con numeric,
    cl2_con numeric,
    cl3_con numeric,
    cl4_con numeric,
    cl1_bro numeric,
    cl2_bro numeric,
    cl3_bro numeric,
    cl4_bro numeric,
    damageperc numeric,
    m3est double precision,
    stemsha smallint,
    heightmean smallint,
    youngtree1 integer,
    youngtree2 integer,
    youngtree3 integer,
    geom public.geometry(MultiPolygon,900916)
);


--
-- TOC entry 352 (class 1259 OID 72142)
-- Name: stand_temp_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stand_temp_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8677 (class 0 OID 0)
-- Dependencies: 352
-- Name: stand_temp_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stand_temp_gid_seq OWNED BY public.stand_temp.gid;


--
-- TOC entry 353 (class 1259 OID 72144)
-- Name: standfc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.standfc (
    ogc_fid integer NOT NULL,
    geom public.geometry(Geometry,900917),
    objectid numeric(10,0),
    mc_org numeric(5,0),
    stand_id character varying(12),
    id_stand numeric(10,0),
    shape_length double precision,
    shape_area double precision
);


--
-- TOC entry 354 (class 1259 OID 72150)
-- Name: standfc_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.standfc_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8678 (class 0 OID 0)
-- Dependencies: 354
-- Name: standfc_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.standfc_ogc_fid_seq OWNED BY public.standfc.ogc_fid;


--
-- TOC entry 355 (class 1259 OID 72152)
-- Name: tables_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tables_aud (
    id bigint NOT NULL,
    action character varying(10) NOT NULL,
    detail text NOT NULL,
    diff text,
    entity_id bigint NOT NULL,
    entity_name character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    cerated_by character varying(150) NOT NULL
);


--
-- TOC entry 356 (class 1259 OID 72159)
-- Name: tables_aud_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tables_aud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8679 (class 0 OID 0)
-- Dependencies: 356
-- Name: tables_aud_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tables_aud_id_seq OWNED BY public.tables_aud.id;


--
-- TOC entry 357 (class 1259 OID 72161)
-- Name: tad_language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tad_language (
    id bigint NOT NULL,
    ad_language character varying(6) NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    name character varying(60) NOT NULL,
    languageiso character(2),
    countrycode character(2),
    isbaselanguage character(1) DEFAULT 'N'::bpchar NOT NULL,
    issystemlanguage character(1) DEFAULT 'N'::bpchar NOT NULL,
    processing character(1),
    pixelsize numeric(10,0),
    translatedby character varying(255),
    isrtl character(1) DEFAULT 'N'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT tad_language_isactive_chk CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tad_language_isbaselanguage_chk CHECK ((isbaselanguage = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tad_language_issystemlangua_chk CHECK ((issystemlanguage = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 358 (class 1259 OID 72173)
-- Name: tad_language_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tad_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8680 (class 0 OID 0)
-- Dependencies: 358
-- Name: tad_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tad_language_id_seq OWNED BY public.tad_language.id;


--
-- TOC entry 359 (class 1259 OID 72175)
-- Name: taddress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taddress (
    id bigint NOT NULL,
    street character varying(80) NOT NULL,
    home_nr character varying(5) NOT NULL,
    zip_code character(9) NOT NULL,
    place character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    phone character varying(30),
    mobile character varying(30),
    email character varying(50),
    note character varying(255),
    lat double precision,
    lon double precision
);


--
-- TOC entry 360 (class 1259 OID 72181)
-- Name: taddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8681 (class 0 OID 0)
-- Dependencies: 360
-- Name: taddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taddress_id_seq OWNED BY public.taddress.id;


--
-- TOC entry 361 (class 1259 OID 72183)
-- Name: taff_ref_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taff_ref_projects (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    refer_id integer,
    data_from character varying(250),
    remarks text,
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 362 (class 1259 OID 72189)
-- Name: talert; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talert (
    id bigint NOT NULL,
    org_id bigint NOT NULL,
    alertrule_id bigint,
    role_id integer,
    person_id integer,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    name character varying(60) NOT NULL,
    description character varying(255),
    isfixed character(1) DEFAULT 'N'::bpchar,
    note character varying(2000),
    table_name character varying(150),
    table_id bigint,
    referencekey_id character varying(32) NOT NULL,
    status character varying(60),
    errormsg character varying(2000)
);


--
-- TOC entry 363 (class 1259 OID 72199)
-- Name: talert_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8682 (class 0 OID 0)
-- Dependencies: 363
-- Name: talert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talert_id_seq OWNED BY public.talert.id;


--
-- TOC entry 364 (class 1259 OID 72201)
-- Name: talertrecipient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talertrecipient (
    id bigint NOT NULL,
    org_id bigint NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    person_id integer,
    alertrule_id bigint,
    role_id integer,
    sendemail character(1) DEFAULT 'N'::bpchar
);


--
-- TOC entry 365 (class 1259 OID 72208)
-- Name: talertrecipient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talertrecipient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8683 (class 0 OID 0)
-- Dependencies: 365
-- Name: talertrecipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talertrecipient_id_seq OWNED BY public.talertrecipient.id;


--
-- TOC entry 366 (class 1259 OID 72210)
-- Name: talertrule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talertrule (
    id bigint NOT NULL,
    org_id bigint NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    name character varying(60) NOT NULL,
    action character varying(60),
    filterclause character varying(2000),
    sql_str character varying(2000),
    type_str character varying(60)
);


--
-- TOC entry 367 (class 1259 OID 72219)
-- Name: talertrule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talertrule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8684 (class 0 OID 0)
-- Dependencies: 367
-- Name: talertrule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talertrule_id_seq OWNED BY public.talertrule.id;


--
-- TOC entry 368 (class 1259 OID 72221)
-- Name: talertrule_trl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talertrule_trl (
    id bigint NOT NULL,
    alertrule_id bigint NOT NULL,
    ad_language character varying(6) NOT NULL,
    org_id bigint NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    name character varying(60) NOT NULL,
    istranslated character(1) DEFAULT 'N'::bpchar
);


--
-- TOC entry 369 (class 1259 OID 72228)
-- Name: talertrule_trl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talertrule_trl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8685 (class 0 OID 0)
-- Dependencies: 369
-- Name: talertrule_trl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talertrule_trl_id_seq OWNED BY public.talertrule_trl.id;


--
-- TOC entry 370 (class 1259 OID 72230)
-- Name: tassets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tassets (
    id integer NOT NULL,
    barcode character varying(50),
    name character varying(100) NOT NULL,
    department_id integer,
    location character varying(255),
    in_function boolean NOT NULL,
    damaged boolean,
    date_of_purchase timestamp without time zone,
    quantity double precision,
    purchase_value double precision,
    purchase_total double precision,
    amortization_grade double precision,
    net_after_deval_year double precision,
    serial_no character varying(100),
    comments character varying(500),
    deleted boolean DEFAULT false NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 371 (class 1259 OID 72238)
-- Name: tassets_devaluation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tassets_devaluation (
    id integer NOT NULL,
    asset_id integer NOT NULL,
    year_of_deval integer NOT NULL,
    net_after_deval_year double precision,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 372 (class 1259 OID 72241)
-- Name: tassets_devaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tassets_devaluation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8686 (class 0 OID 0)
-- Dependencies: 372
-- Name: tassets_devaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tassets_devaluation_id_seq OWNED BY public.tassets_devaluation.id;


--
-- TOC entry 373 (class 1259 OID 72243)
-- Name: tassets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tassets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8687 (class 0 OID 0)
-- Dependencies: 373
-- Name: tassets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tassets_id_seq OWNED BY public.tassets.id;


--
-- TOC entry 374 (class 1259 OID 72245)
-- Name: tassets_staff_assign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tassets_staff_assign (
    id integer NOT NULL,
    assets_id integer NOT NULL,
    employee_id integer NOT NULL,
    created_by integer,
    created_time timestamp without time zone,
    date_of_autorization timestamp without time zone
);


--
-- TOC entry 375 (class 1259 OID 72248)
-- Name: tassets_staff_assign_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tassets_staff_assign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8688 (class 0 OID 0)
-- Dependencies: 375
-- Name: tassets_staff_assign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tassets_staff_assign_id_seq OWNED BY public.tassets_staff_assign.id;


--
-- TOC entry 376 (class 1259 OID 72250)
-- Name: tb_monitor_eval; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_monitor_eval (
    id integer NOT NULL,
    source character varying(255),
    pillar character varying(255),
    psp_code character varying(255),
    project character varying(255),
    sub_project character varying(255),
    indicator character varying(255),
    unit character varying(255),
    target_actual character varying(255),
    entry_type character varying(255),
    calc_formula character varying(255),
    baseline character varying(255),
    "2010" character varying(255),
    "2011" character varying(255),
    "2012" character varying(255),
    "2013" character varying(255),
    "2014" character varying(255),
    "2015" character varying(255),
    "2016" character varying(255),
    "2017" character varying(255),
    "2018" character varying(255),
    "2019" character varying(255),
    "2020" character varying(255),
    "2021" character varying(255),
    "2022" character varying(255),
    "2023" character varying(255),
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 377 (class 1259 OID 72256)
-- Name: tb_monitor_eval_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_monitor_eval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8689 (class 0 OID 0)
-- Dependencies: 377
-- Name: tb_monitor_eval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_monitor_eval_id_seq OWNED BY public.tb_monitor_eval.id;


--
-- TOC entry 378 (class 1259 OID 72258)
-- Name: tbiodiv_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbiodiv_name (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    name_sr character varying(255)
);


--
-- TOC entry 379 (class 1259 OID 72264)
-- Name: tbiodiv_name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbiodiv_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8690 (class 0 OID 0)
-- Dependencies: 379
-- Name: tbiodiv_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbiodiv_name_id_seq OWNED BY public.tbiodiv_name.id;


--
-- TOC entry 380 (class 1259 OID 72266)
-- Name: tbpartner; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbpartner (
    id integer NOT NULL,
    party_id bigint,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    name character varying(120) NOT NULL,
    name2 character varying(60),
    description character varying(255),
    employer_id_number character varying(100) NOT NULL,
    social_security_number character varying(100) NOT NULL,
    contact_etbilished_date date NOT NULL,
    vendor_discount_percent double precision NOT NULL,
    issummary character(1) DEFAULT 'N'::bpchar NOT NULL,
    isonetime character(1) DEFAULT 'N'::bpchar NOT NULL,
    isprospect character(1) DEFAULT 'Y'::bpchar NOT NULL,
    isvendor character(1) DEFAULT 'N'::bpchar NOT NULL,
    iscustomer character(1) DEFAULT 'Y'::bpchar NOT NULL,
    isemployee character(1) DEFAULT 'N'::bpchar NOT NULL,
    issalesrep character(1) DEFAULT 'N'::bpchar NOT NULL,
    referenceno character varying(40),
    rating character(1),
    salesvolume numeric(10,0),
    numberemployees numeric(10,0),
    flatdiscount numeric,
    totalopenbalance numeric,
    bpartner_parent_id numeric(10,0),
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT tbpartner_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 381 (class 1259 OID 72283)
-- Name: tbpartner_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbpartner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8691 (class 0 OID 0)
-- Dependencies: 381
-- Name: tbpartner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbpartner_id_seq OWNED BY public.tbpartner.id;


--
-- TOC entry 382 (class 1259 OID 72285)
-- Name: tbpartner_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbpartner_location (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    name character varying(60) NOT NULL,
    isbillto character(1) DEFAULT 'Y'::bpchar NOT NULL,
    isshipto character(1) DEFAULT 'Y'::bpchar NOT NULL,
    ispayfrom character(1) DEFAULT 'Y'::bpchar NOT NULL,
    isremitto character(1) DEFAULT 'Y'::bpchar NOT NULL,
    phone character varying(40),
    phone2 character varying(40),
    fax character varying(40),
    isdn character varying(40),
    bpartner_id integer NOT NULL,
    location_id integer,
    CONSTRAINT tbpartner_location_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tbpartner_location_isbillto_check CHECK ((isbillto = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tbpartner_location_ispayfrom_check CHECK ((ispayfrom = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tbpartner_location_isremitto_check CHECK ((isremitto = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tbpartner_location_isshipto_check CHECK ((isshipto = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 383 (class 1259 OID 72300)
-- Name: tbpartner_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbpartner_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8692 (class 0 OID 0)
-- Dependencies: 383
-- Name: tbpartner_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbpartner_location_id_seq OWNED BY public.tbpartner_location.id;


--
-- TOC entry 384 (class 1259 OID 72302)
-- Name: tcurrency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tcurrency (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    iso_code character(3) NOT NULL,
    cursymbol character varying(10),
    description character varying(255) NOT NULL,
    stdprecision numeric(10,0) NOT NULL,
    costingprecision numeric(10,0) NOT NULL,
    priceprecision numeric(10,0) DEFAULT 0 NOT NULL,
    issymbolrightside character(1) DEFAULT 'N'::bpchar,
    CONSTRAINT tcurrency_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 385 (class 1259 OID 72311)
-- Name: tcurrency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tcurrency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8693 (class 0 OID 0)
-- Dependencies: 385
-- Name: tcurrency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tcurrency_id_seq OWNED BY public.tcurrency.id;


--
-- TOC entry 386 (class 1259 OID 72313)
-- Name: tdhpet_activity_management; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_activity_management (
    id integer NOT NULL,
    animal_id integer NOT NULL,
    the_purpose_of_hunting character varying(100),
    objective character varying(250),
    method_of_propagation character varying(100),
    sex_ratios_ma smallint,
    sex_ratios_fm smallint,
    small_up_to_1 double precision,
    young_2_3_4 double precision,
    medium_5_6_7_8 double precision,
    aging_9_and_more double precision,
    prod_area_for_hunt_id integer,
    quality_of_location character varying(20),
    number_of_animals_100ha integer,
    main_stock integer,
    rate_of_growth double precision,
    growth integer,
    normal_stock integer,
    hunting_season character varying(2),
    anula_decline integer,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 387 (class 1259 OID 72316)
-- Name: tdhpet_activity_management_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_activity_management_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8694 (class 0 OID 0)
-- Dependencies: 387
-- Name: tdhpet_activity_management_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_activity_management_id_seq OWNED BY public.tdhpet_activity_management.id;


--
-- TOC entry 388 (class 1259 OID 72318)
-- Name: tdhpet_animal_capacity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_animal_capacity (
    id integer NOT NULL,
    animal_location_id integer NOT NULL,
    use_of_land character varying(2) NOT NULL,
    area double precision NOT NULL,
    percentage double precision NOT NULL,
    geom public.geometry,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 389 (class 1259 OID 72324)
-- Name: tdhpet_animal_capacity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_animal_capacity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8695 (class 0 OID 0)
-- Dependencies: 389
-- Name: tdhpet_animal_capacity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_animal_capacity_id_seq OWNED BY public.tdhpet_animal_capacity.id;


--
-- TOC entry 390 (class 1259 OID 72326)
-- Name: tdhpet_animal_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_animal_location (
    id integer NOT NULL,
    annu_plan_id integer NOT NULL,
    animal_id integer NOT NULL,
    quantity integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 391 (class 1259 OID 72329)
-- Name: tdhpet_animal_location_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_animal_location_detail (
    id integer NOT NULL,
    animal_location_id integer NOT NULL,
    gender character varying(1) NOT NULL,
    age_type character varying(3) NOT NULL,
    quantity integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 392 (class 1259 OID 72335)
-- Name: tdhpet_animal_location_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_animal_location_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8696 (class 0 OID 0)
-- Dependencies: 392
-- Name: tdhpet_animal_location_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_animal_location_detail_id_seq OWNED BY public.tdhpet_animal_location_detail.id;


--
-- TOC entry 393 (class 1259 OID 72337)
-- Name: tdhpet_animal_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_animal_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8697 (class 0 OID 0)
-- Dependencies: 393
-- Name: tdhpet_animal_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_animal_location_id_seq OWNED BY public.tdhpet_animal_location.id;


--
-- TOC entry 394 (class 1259 OID 72339)
-- Name: tdhpet_annual_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_annual_plan (
    id integer NOT NULL,
    period_plan_id integer NOT NULL,
    year integer NOT NULL,
    doc bytea,
    doc_name character varying,
    doc_type character varying(10),
    remark text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 395 (class 1259 OID 72345)
-- Name: tdhpet_annual_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_annual_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8698 (class 0 OID 0)
-- Dependencies: 395
-- Name: tdhpet_annual_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_annual_plan_id_seq OWNED BY public.tdhpet_annual_plan.id;


--
-- TOC entry 396 (class 1259 OID 72347)
-- Name: tdhpet_hunt_ground_eval; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_hunt_ground_eval (
    id integer NOT NULL,
    animal_location_id integer NOT NULL,
    animal_request_id integer NOT NULL,
    defined_point integer,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 397 (class 1259 OID 72353)
-- Name: tdhpet_hunt_ground_eval_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_hunt_ground_eval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8699 (class 0 OID 0)
-- Dependencies: 397
-- Name: tdhpet_hunt_ground_eval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_hunt_ground_eval_id_seq OWNED BY public.tdhpet_hunt_ground_eval.id;


--
-- TOC entry 398 (class 1259 OID 72355)
-- Name: tdhpet_hunted_animal_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_hunted_animal_detail (
    id integer NOT NULL,
    hunted_animal_id integer NOT NULL,
    gender character varying(1) NOT NULL,
    age integer,
    weight double precision,
    death_cause character varying(3) NOT NULL,
    animals_number integer NOT NULL,
    notes text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    CONSTRAINT tdhpet_hunted_animal_detail_gender_check CHECK (((gender)::text = ANY (ARRAY[('M'::character varying)::text, ('F'::character varying)::text])))
);


--
-- TOC entry 399 (class 1259 OID 72362)
-- Name: tdhpet_hunted_animal_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_hunted_animal_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8700 (class 0 OID 0)
-- Dependencies: 399
-- Name: tdhpet_hunted_animal_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_hunted_animal_detail_id_seq OWNED BY public.tdhpet_hunted_animal_detail.id;


--
-- TOC entry 400 (class 1259 OID 72364)
-- Name: tdhpet_hunted_animals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_hunted_animals (
    id integer NOT NULL,
    annu_plan_id integer NOT NULL,
    animal_id integer NOT NULL,
    date date NOT NULL,
    animals_number integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 401 (class 1259 OID 72367)
-- Name: tdhpet_hunted_animals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_hunted_animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8701 (class 0 OID 0)
-- Dependencies: 401
-- Name: tdhpet_hunted_animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_hunted_animals_id_seq OWNED BY public.tdhpet_hunted_animals.id;


--
-- TOC entry 402 (class 1259 OID 72369)
-- Name: tdhpet_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8702 (class 0 OID 0)
-- Dependencies: 402
-- Name: tdhpet_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_location_id_seq OWNED BY public.tdhpet_location.id;


--
-- TOC entry 403 (class 1259 OID 72371)
-- Name: tdhpet_location_land_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_location_land_type (
    id integer NOT NULL,
    location_id integer NOT NULL,
    land_type character varying(2) NOT NULL,
    private_land_area double precision,
    public_land_area double precision,
    total_area double precision,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 404 (class 1259 OID 72374)
-- Name: tdhpet_location_land_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_location_land_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8703 (class 0 OID 0)
-- Dependencies: 404
-- Name: tdhpet_location_land_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_location_land_type_id_seq OWNED BY public.tdhpet_location_land_type.id;


--
-- TOC entry 405 (class 1259 OID 72376)
-- Name: tdhpet_period_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_period_plan (
    id integer NOT NULL,
    location_id integer NOT NULL,
    start_year integer NOT NULL,
    end_year integer NOT NULL,
    doc bytea,
    doc_name character varying,
    doc_type character varying(10),
    remark text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 406 (class 1259 OID 72382)
-- Name: tdhpet_period_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_period_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8704 (class 0 OID 0)
-- Dependencies: 406
-- Name: tdhpet_period_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_period_plan_id_seq OWNED BY public.tdhpet_period_plan.id;


--
-- TOC entry 407 (class 1259 OID 72384)
-- Name: tdhpet_tourist_purpose; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_tourist_purpose (
    id integer NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    name_en character varying(50) DEFAULT NULL::character varying,
    name_sr character varying(50) DEFAULT NULL::character varying,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 408 (class 1259 OID 72393)
-- Name: tdhpet_tourist_purpose_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_tourist_purpose_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8705 (class 0 OID 0)
-- Dependencies: 408
-- Name: tdhpet_tourist_purpose_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_tourist_purpose_id_seq OWNED BY public.tdhpet_tourist_purpose.id;


--
-- TOC entry 409 (class 1259 OID 72395)
-- Name: tdhpet_tourist_register; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_tourist_register (
    id integer NOT NULL,
    location_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    purpose_id integer NOT NULL,
    payment double precision,
    tourist_number integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 410 (class 1259 OID 72401)
-- Name: tdhpet_tourist_register_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_tourist_register_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8706 (class 0 OID 0)
-- Dependencies: 410
-- Name: tdhpet_tourist_register_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_tourist_register_id_seq OWNED BY public.tdhpet_tourist_register.id;


--
-- TOC entry 411 (class 1259 OID 72403)
-- Name: tdhpet_tourist_zone_geoms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_tourist_zone_geoms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8707 (class 0 OID 0)
-- Dependencies: 411
-- Name: tdhpet_tourist_zone_geoms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_tourist_zone_geoms_id_seq OWNED BY public.tdhpet_tourist_zone_geoms.id;


--
-- TOC entry 412 (class 1259 OID 72405)
-- Name: tdhpet_wild_animals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_wild_animals (
    id integer NOT NULL,
    name_la character varying(50) DEFAULT NULL::character varying,
    name_al character varying(50) NOT NULL,
    name_en character varying(50) DEFAULT NULL::character varying,
    name_sr character varying(50) DEFAULT NULL::character varying,
    hunt_seasone_start character varying(5),
    hunt_seasone_end character varying(5),
    hunt_forbidden_seasone_start character varying(5),
    hunt_forbidden_seasone_end character varying(5),
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 413 (class 1259 OID 72414)
-- Name: tdhpet_wild_animals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_wild_animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8708 (class 0 OID 0)
-- Dependencies: 413
-- Name: tdhpet_wild_animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_wild_animals_id_seq OWNED BY public.tdhpet_wild_animals.id;


--
-- TOC entry 414 (class 1259 OID 72416)
-- Name: tdhpet_wild_animals_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdhpet_wild_animals_request (
    id integer NOT NULL,
    animal_id integer NOT NULL,
    request_for character varying(2) NOT NULL,
    max_point double precision NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    note text
);


--
-- TOC entry 415 (class 1259 OID 72422)
-- Name: tdhpet_wild_animals_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdhpet_wild_animals_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8709 (class 0 OID 0)
-- Dependencies: 415
-- Name: tdhpet_wild_animals_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdhpet_wild_animals_request_id_seq OWNED BY public.tdhpet_wild_animals_request.id;


--
-- TOC entry 416 (class 1259 OID 72424)
-- Name: tdoc_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdoc_category (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    name character varying(60) NOT NULL,
    name_en character varying(60) NOT NULL,
    name_sr character varying(60),
    description character varying(255),
    categorytype character varying(60) NOT NULL,
    isdefault character(1) DEFAULT 'N'::bpchar NOT NULL,
    docbasetype character varying(60),
    CONSTRAINT tdoc_category_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 417 (class 1259 OID 72435)
-- Name: tdoc_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdoc_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8710 (class 0 OID 0)
-- Dependencies: 417
-- Name: tdoc_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdoc_category_id_seq OWNED BY public.tdoc_category.id;


--
-- TOC entry 418 (class 1259 OID 72437)
-- Name: tdoctype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdoctype (
    id integer NOT NULL,
    category_id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    name character varying(60) NOT NULL,
    name_en character varying(60) NOT NULL,
    name_sr character varying(60),
    printname character varying(60) NOT NULL,
    printname_en character varying(60) NOT NULL,
    printname_sr character varying(60),
    description character varying(255),
    docbasetype character varying(60) NOT NULL,
    issotrx character(1) DEFAULT 'Y'::bpchar NOT NULL,
    isdocnocontrolled character(1) DEFAULT 'Y'::bpchar NOT NULL,
    documentnote character varying(2000),
    CONSTRAINT tdoctype_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tdoctype_isdocnocontrolle_chk CHECK ((isdocnocontrolled = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 419 (class 1259 OID 72450)
-- Name: tdoctype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdoctype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8711 (class 0 OID 0)
-- Dependencies: 419
-- Name: tdoctype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdoctype_id_seq OWNED BY public.tdoctype.id;


--
-- TOC entry 420 (class 1259 OID 72452)
-- Name: tdomain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdomain (
    id integer NOT NULL,
    domname character varying(18) NOT NULL,
    colname character varying(18) NOT NULL,
    tabname character varying(30) NOT NULL,
    domtype character(1) NOT NULL,
    colllength integer NOT NULL,
    mandatory character(1) NOT NULL
);


--
-- TOC entry 421 (class 1259 OID 72455)
-- Name: tdomain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdomain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8712 (class 0 OID 0)
-- Dependencies: 421
-- Name: tdomain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdomain_id_seq OWNED BY public.tdomain.id;


--
-- TOC entry 422 (class 1259 OID 72457)
-- Name: tdp_mngmt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdp_mngmt (
    id integer NOT NULL,
    department_id integer,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    channel_type character(1) DEFAULT 'I'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    documentno character varying(36) NOT NULL,
    doc_subject character varying(255) NOT NULL,
    datetrx timestamp without time zone NOT NULL,
    doctype_id integer NOT NULL,
    shipper character varying(255),
    receiver character varying(255),
    processing character(1),
    processed character varying(60) DEFAULT 'N'::character varying NOT NULL,
    posted character varying(60) DEFAULT 'N'::character varying NOT NULL,
    status_id integer,
    owner_id integer,
    description character varying(255),
    textmsg text,
    issued_date timestamp without time zone,
    received_date timestamp without time zone,
    stored_date timestamp without time zone,
    CONSTRAINT tdp_mngmt_channel_type_chk CHECK ((channel_type = ANY (ARRAY['I'::bpchar, 'O'::bpchar]))),
    CONSTRAINT tdp_mngmt_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 423 (class 1259 OID 72471)
-- Name: tdp_mngmt_attach; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdp_mngmt_attach (
    id integer NOT NULL,
    dp_mngm_id integer NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_content_type character varying(100) NOT NULL,
    doc_type character varying(10) NOT NULL,
    doc_size bigint,
    doc bytea,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL
);


--
-- TOC entry 424 (class 1259 OID 72479)
-- Name: tdp_mngmt_attach_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdp_mngmt_attach_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8713 (class 0 OID 0)
-- Dependencies: 424
-- Name: tdp_mngmt_attach_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdp_mngmt_attach_id_seq OWNED BY public.tdp_mngmt_attach.id;


--
-- TOC entry 425 (class 1259 OID 72481)
-- Name: tdp_mngmt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdp_mngmt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8714 (class 0 OID 0)
-- Dependencies: 425
-- Name: tdp_mngmt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdp_mngmt_id_seq OWNED BY public.tdp_mngmt.id;


--
-- TOC entry 426 (class 1259 OID 72483)
-- Name: tdp_mngmt_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdp_mngmt_settings (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    data_dir character varying(255) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL
);


--
-- TOC entry 427 (class 1259 OID 72488)
-- Name: tdp_mngmt_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdp_mngmt_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8715 (class 0 OID 0)
-- Dependencies: 427
-- Name: tdp_mngmt_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdp_mngmt_settings_id_seq OWNED BY public.tdp_mngmt_settings.id;


--
-- TOC entry 428 (class 1259 OID 72490)
-- Name: tdp_mngmt_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdp_mngmt_status (
    id integer NOT NULL,
    dp_mngm_id integer NOT NULL,
    from_dpt_id integer,
    to_dpt_id integer,
    msg_type character(1) DEFAULT 'U'::bpchar NOT NULL,
    status_code character varying(20) NOT NULL,
    action_taken character varying(255),
    textmsg character varying(2000),
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL
);


--
-- TOC entry 429 (class 1259 OID 72499)
-- Name: tdp_mngmt_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdp_mngmt_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8716 (class 0 OID 0)
-- Dependencies: 429
-- Name: tdp_mngmt_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdp_mngmt_status_id_seq OWNED BY public.tdp_mngmt_status.id;


--
-- TOC entry 430 (class 1259 OID 72501)
-- Name: tfal_cad_parcel_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfal_cad_parcel_request (
    id integer NOT NULL,
    request_id integer NOT NULL,
    cadastral_zone character varying(100) NOT NULL,
    parcel_num integer NOT NULL
);


--
-- TOC entry 431 (class 1259 OID 72504)
-- Name: tfal_cad_parcel_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfal_cad_parcel_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8717 (class 0 OID 0)
-- Dependencies: 431
-- Name: tfal_cad_parcel_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfal_cad_parcel_request_id_seq OWNED BY public.tfal_cad_parcel_request.id;


--
-- TOC entry 432 (class 1259 OID 72506)
-- Name: tfal_request_coord; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfal_request_coord (
    id integer NOT NULL,
    request_id integer NOT NULL,
    x double precision NOT NULL,
    y double precision NOT NULL,
    z double precision,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 433 (class 1259 OID 72510)
-- Name: tfal_request_coord_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfal_request_coord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8718 (class 0 OID 0)
-- Dependencies: 433
-- Name: tfal_request_coord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfal_request_coord_id_seq OWNED BY public.tfal_request_coord.id;


--
-- TOC entry 434 (class 1259 OID 72512)
-- Name: tfal_request_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfal_request_doc (
    id integer NOT NULL,
    request_status_id integer NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_type character varying(10) NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL,
    doc bytea NOT NULL,
    note character varying(250),
    created_by integer NOT NULL
);


--
-- TOC entry 435 (class 1259 OID 72519)
-- Name: tfal_request_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfal_request_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8719 (class 0 OID 0)
-- Dependencies: 435
-- Name: tfal_request_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfal_request_doc_id_seq OWNED BY public.tfal_request_doc.id;


--
-- TOC entry 436 (class 1259 OID 72521)
-- Name: tfal_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfal_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8720 (class 0 OID 0)
-- Dependencies: 436
-- Name: tfal_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfal_request_id_seq OWNED BY public.tfal_request.id;


--
-- TOC entry 437 (class 1259 OID 72523)
-- Name: tfal_request_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfal_request_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8721 (class 0 OID 0)
-- Dependencies: 437
-- Name: tfal_request_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfal_request_status_id_seq OWNED BY public.tfal_request_status.id;


--
-- TOC entry 438 (class 1259 OID 72525)
-- Name: tfal_request_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfal_request_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8722 (class 0 OID 0)
-- Dependencies: 438
-- Name: tfal_request_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfal_request_type_id_seq OWNED BY public.tfal_request_type.id;


--
-- TOC entry 439 (class 1259 OID 72527)
-- Name: tfin_annu_budget_alloc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_annu_budget_alloc (
    id integer NOT NULL,
    municipality_id integer NOT NULL,
    wood_sales double precision,
    other_income double precision,
    total double precision,
    allocation_36 double precision,
    municipality_30_portion double precision,
    kfa_remainder double precision,
    month character varying(2) NOT NULL,
    year integer NOT NULL,
    created_by integer,
    created_time timestamp without time zone
);


--
-- TOC entry 440 (class 1259 OID 72530)
-- Name: tfin_annu_budget_alloc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_annu_budget_alloc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8723 (class 0 OID 0)
-- Dependencies: 440
-- Name: tfin_annu_budget_alloc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_annu_budget_alloc_id_seq OWNED BY public.tfin_annu_budget_alloc.id;


--
-- TOC entry 441 (class 1259 OID 72532)
-- Name: tfin_budget_mainntenance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_budget_mainntenance (
    id integer NOT NULL,
    fin_type_id integer NOT NULL,
    budget_code character varying(50) NOT NULL,
    initial_annual_budget double precision,
    annual_allocation double precision,
    current_expenditure double precision,
    commitment double precision,
    available_balance double precision,
    buget_utilization_in_percent double precision,
    created_by integer,
    created_date timestamp without time zone,
    budget_year integer
);


--
-- TOC entry 442 (class 1259 OID 72535)
-- Name: tfin_budget_mainntenance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_budget_mainntenance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8724 (class 0 OID 0)
-- Dependencies: 442
-- Name: tfin_budget_mainntenance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_budget_mainntenance_id_seq OWNED BY public.tfin_budget_mainntenance.id;


--
-- TOC entry 443 (class 1259 OID 72537)
-- Name: tfin_contract; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_contract (
    id integer NOT NULL,
    contractor_id integer NOT NULL,
    contract_number character varying(50) NOT NULL,
    contract_name character varying(150) NOT NULL,
    contract_costs double precision NOT NULL,
    organisation_id integer NOT NULL,
    approved_date date,
    date_due_for_start date,
    date_due_for_completion date,
    date_completed date,
    notification_date date,
    delayed boolean,
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 444 (class 1259 OID 72540)
-- Name: tfin_contract_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_contract_doc (
    id bigint NOT NULL,
    contract_id bigint NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc bytea NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 445 (class 1259 OID 72546)
-- Name: tfin_contract_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_contract_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8725 (class 0 OID 0)
-- Dependencies: 445
-- Name: tfin_contract_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_contract_doc_id_seq OWNED BY public.tfin_contract_doc.id;


--
-- TOC entry 446 (class 1259 OID 72548)
-- Name: tfin_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8726 (class 0 OID 0)
-- Dependencies: 446
-- Name: tfin_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_contract_id_seq OWNED BY public.tfin_contract.id;


--
-- TOC entry 447 (class 1259 OID 72550)
-- Name: tfin_contractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_contractor (
    id integer NOT NULL,
    comopany_name character varying(100) NOT NULL,
    fiscal_number character varying(50) NOT NULL,
    business_number character varying(50) NOT NULL,
    attachment bytea,
    address character varying(100),
    phone character varying(20),
    e_mail character varying(50),
    contact_person character varying(50),
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL,
    note text
);


--
-- TOC entry 448 (class 1259 OID 72556)
-- Name: tfin_contractor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_contractor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8727 (class 0 OID 0)
-- Dependencies: 448
-- Name: tfin_contractor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_contractor_id_seq OWNED BY public.tfin_contractor.id;


--
-- TOC entry 449 (class 1259 OID 72558)
-- Name: tfin_input; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_input (
    id integer NOT NULL,
    input_type_id integer NOT NULL,
    year integer NOT NULL,
    month character varying(2) NOT NULL,
    municipality_id integer NOT NULL,
    cumulative_value numeric(10,2),
    current_status integer,
    allocated boolean NOT NULL,
    allocated_date date,
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL,
    input_date date DEFAULT now() NOT NULL
);


--
-- TOC entry 450 (class 1259 OID 72561)
-- Name: tfin_input_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_input_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8728 (class 0 OID 0)
-- Dependencies: 450
-- Name: tfin_input_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_input_id_seq OWNED BY public.tfin_input.id;


--
-- TOC entry 451 (class 1259 OID 72563)
-- Name: tfin_input_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_input_status (
    id integer NOT NULL,
    input_id integer NOT NULL,
    status character varying(2) NOT NULL,
    doc_type character varying(100),
    doc_name character varying(100),
    doc_size bigint,
    doc bytea,
    note text,
    create_by integer NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 452 (class 1259 OID 72570)
-- Name: tfin_input_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_input_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8729 (class 0 OID 0)
-- Dependencies: 452
-- Name: tfin_input_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_input_status_id_seq OWNED BY public.tfin_input_status.id;


--
-- TOC entry 453 (class 1259 OID 72572)
-- Name: tfin_output; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_output (
    id integer NOT NULL,
    uop_number character varying(50) NOT NULL,
    free_balance integer NOT NULL,
    date_of_commitment date,
    expenditure_type integer,
    department integer,
    economic_code character varying(100) NOT NULL,
    description_of_economic_code text,
    value_in_euro double precision NOT NULL,
    description_cpo text,
    souce_fund integer,
    beneficiary character varying(100),
    nrb_code character varying(100),
    invoice_number character varying(100),
    payment_date date,
    month character varying(2),
    output_type character varying(2) NOT NULL,
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 454 (class 1259 OID 72578)
-- Name: tfin_output_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_output_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8730 (class 0 OID 0)
-- Dependencies: 454
-- Name: tfin_output_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_output_id_seq OWNED BY public.tfin_output.id;


--
-- TOC entry 455 (class 1259 OID 72580)
-- Name: tfin_payment_period; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_payment_period (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    start_date date,
    completion_date date,
    payment_period double precision,
    payment_realized boolean,
    payment_balance double precision,
    created_by integer,
    created_time timestamp without time zone
);


--
-- TOC entry 456 (class 1259 OID 72583)
-- Name: tfin_payment_period_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_payment_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8731 (class 0 OID 0)
-- Dependencies: 456
-- Name: tfin_payment_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_payment_period_id_seq OWNED BY public.tfin_payment_period.id;


--
-- TOC entry 856 (class 1259 OID 106913)
-- Name: tfin_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfin_type (
    id bigint NOT NULL,
    parent_id integer,
    code character varying(20) NOT NULL,
    level smallint NOT NULL,
    type character varying(2),
    allocation boolean DEFAULT false NOT NULL,
    name_al character varying(100) NOT NULL,
    name_en character varying(100),
    name_sr character varying(100),
    notes character varying(255),
    created_date date NOT NULL
);


--
-- TOC entry 855 (class 1259 OID 106911)
-- Name: tfin_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfin_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8732 (class 0 OID 0)
-- Dependencies: 855
-- Name: tfin_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfin_type_id_seq OWNED BY public.tfin_type.id;


--
-- TOC entry 857 (class 1259 OID 106945)
-- Name: tfin_type_tree; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.tfin_type_tree AS
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
            (NULL::integer[] || tfin_type.parent_id),
            1
           FROM public.tfin_type
          WHERE (tfin_type.parent_id IS NULL)
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
            (rt.path || t.parent_id),
            (rt.level + 1)
           FROM (public.tfin_type t
             JOIN tfin_type_tree rt ON ((rt.id = t.parent_id)))
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


--
-- TOC entry 457 (class 1259 OID 72599)
-- Name: tfrm_activity_domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_activity_domain (
    id bigint NOT NULL,
    parent_id integer,
    code character varying(5),
    name_al character varying(50) NOT NULL,
    name_en character varying(50) NOT NULL,
    name_sr character varying(50) NOT NULL,
    type character(1) NOT NULL,
    sort smallint NOT NULL
);


--
-- TOC entry 458 (class 1259 OID 72602)
-- Name: tfrm_activity_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_activity_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8733 (class 0 OID 0)
-- Dependencies: 458
-- Name: tfrm_activity_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_activity_domain_id_seq OWNED BY public.tfrm_activity_domain.id;


--
-- TOC entry 459 (class 1259 OID 72604)
-- Name: tfrm_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8734 (class 0 OID 0)
-- Dependencies: 459
-- Name: tfrm_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_activity_id_seq OWNED BY public.tfrm_activity.id;


--
-- TOC entry 460 (class 1259 OID 72606)
-- Name: tfrm_activity_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_activity_status (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    status character varying(6) NOT NULL,
    created_by bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    remarks character varying(255)
);


--
-- TOC entry 461 (class 1259 OID 72610)
-- Name: tfrm_activity_status_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_activity_status_doc (
    id bigint NOT NULL,
    status_id bigint NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc bytea NOT NULL,
    remark text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 462 (class 1259 OID 72616)
-- Name: tfrm_activity_status_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_activity_status_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8735 (class 0 OID 0)
-- Dependencies: 462
-- Name: tfrm_activity_status_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_activity_status_doc_id_seq OWNED BY public.tfrm_activity_status_doc.id;


--
-- TOC entry 463 (class 1259 OID 72618)
-- Name: tfrm_activity_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_activity_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8736 (class 0 OID 0)
-- Dependencies: 463
-- Name: tfrm_activity_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_activity_status_id_seq OWNED BY public.tfrm_activity_status.id;


--
-- TOC entry 464 (class 1259 OID 72620)
-- Name: tfrm_annual_planning_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_annual_planning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8737 (class 0 OID 0)
-- Dependencies: 464
-- Name: tfrm_annual_planning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_annual_planning_id_seq OWNED BY public.tfrm_annual_planning.id;


--
-- TOC entry 465 (class 1259 OID 72622)
-- Name: tfrm_annual_planning_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_annual_planning_status (
    id bigint NOT NULL,
    annual_planning_id bigint NOT NULL,
    status character varying(6) NOT NULL,
    created_by bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    remarks character varying(255)
);


--
-- TOC entry 466 (class 1259 OID 72626)
-- Name: tfrm_annual_planning_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_annual_planning_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8738 (class 0 OID 0)
-- Dependencies: 466
-- Name: tfrm_annual_planning_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_annual_planning_status_id_seq OWNED BY public.tfrm_annual_planning_status.id;


--
-- TOC entry 467 (class 1259 OID 72628)
-- Name: tfrm_annual_protection_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_annual_protection_plan (
    id integer NOT NULL,
    mun_id integer,
    mu_id integer,
    diseases character varying(50),
    insects character varying(50),
    year integer
);


--
-- TOC entry 468 (class 1259 OID 72631)
-- Name: tfrm_annual_protection_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_annual_protection_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8739 (class 0 OID 0)
-- Dependencies: 468
-- Name: tfrm_annual_protection_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_annual_protection_plan_id_seq OWNED BY public.tfrm_annual_protection_plan.id;


--
-- TOC entry 469 (class 1259 OID 72633)
-- Name: tfrm_bio_diversity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_bio_diversity (
    id bigint NOT NULL,
    stand_id bigint NOT NULL,
    bio_code integer NOT NULL,
    surveyor character varying(150) NOT NULL,
    remarks character varying(255)
);


--
-- TOC entry 470 (class 1259 OID 72636)
-- Name: tfrm_bio_diversity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_bio_diversity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8740 (class 0 OID 0)
-- Dependencies: 470
-- Name: tfrm_bio_diversity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_bio_diversity_id_seq OWNED BY public.tfrm_bio_diversity.id;


--
-- TOC entry 471 (class 1259 OID 72638)
-- Name: tfrm_bio_diversity_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_bio_diversity_name (
    id bigint NOT NULL,
    bio_div_id bigint NOT NULL,
    bio_div_name character varying(150) NOT NULL,
    lang_code character varying(2) DEFAULT 'sq'::character varying NOT NULL
);


--
-- TOC entry 472 (class 1259 OID 72642)
-- Name: tfrm_bio_diversity_name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_bio_diversity_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8741 (class 0 OID 0)
-- Dependencies: 472
-- Name: tfrm_bio_diversity_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_bio_diversity_name_id_seq OWNED BY public.tfrm_bio_diversity_name.id;


--
-- TOC entry 473 (class 1259 OID 72644)
-- Name: tfrm_confiscation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_confiscation (
    id integer NOT NULL,
    mun_id integer NOT NULL,
    confiscation_date date,
    type character(2) NOT NULL,
    remarks text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 474 (class 1259 OID 72650)
-- Name: tfrm_confiscation_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_confiscation_detail (
    id integer NOT NULL,
    confiscation_id integer NOT NULL,
    tree_species_id integer NOT NULL,
    tree_tech_volume double precision,
    tree_fire_volume double precision,
    total_volume double precision NOT NULL
);


--
-- TOC entry 475 (class 1259 OID 72653)
-- Name: tfrm_confiscation_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_confiscation_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8742 (class 0 OID 0)
-- Dependencies: 475
-- Name: tfrm_confiscation_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_confiscation_detail_id_seq OWNED BY public.tfrm_confiscation_detail.id;


--
-- TOC entry 476 (class 1259 OID 72655)
-- Name: tfrm_confiscation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_confiscation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8743 (class 0 OID 0)
-- Dependencies: 476
-- Name: tfrm_confiscation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_confiscation_id_seq OWNED BY public.tfrm_confiscation.id;


--
-- TOC entry 477 (class 1259 OID 72657)
-- Name: tfrm_domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_domain (
    id bigint NOT NULL,
    domain_code character varying(50) NOT NULL,
    domain_value character varying(50) NOT NULL,
    domain_category character varying(50) NOT NULL,
    domain_type character varying(50) NOT NULL,
    domain_activity character varying(50) NOT NULL,
    domain_category_sort smallint NOT NULL,
    domain_type_sort smallint NOT NULL,
    domain_activity_sort smallint NOT NULL
);


--
-- TOC entry 478 (class 1259 OID 72660)
-- Name: tfrm_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8744 (class 0 OID 0)
-- Dependencies: 478
-- Name: tfrm_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_domain_id_seq OWNED BY public.tfrm_domain.id;


--
-- TOC entry 479 (class 1259 OID 72662)
-- Name: tfrm_domain_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_domain_name (
    id bigint NOT NULL,
    domain_id integer NOT NULL,
    domain_category character varying(50) NOT NULL,
    domain_type character varying(50) NOT NULL,
    domain_activity character varying(50) NOT NULL,
    lang_code character varying(2) NOT NULL,
    domain_sort smallint NOT NULL
);


--
-- TOC entry 480 (class 1259 OID 72665)
-- Name: tfrm_domain_name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_domain_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8745 (class 0 OID 0)
-- Dependencies: 480
-- Name: tfrm_domain_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_domain_name_id_seq OWNED BY public.tfrm_domain_name.id;


--
-- TOC entry 481 (class 1259 OID 72667)
-- Name: tfrm_fire_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_fire_details (
    id integer NOT NULL,
    fire_report_id integer NOT NULL,
    comp_id integer NOT NULL,
    stand_id integer NOT NULL,
    damage_m2 double precision,
    damage_m3 double precision,
    damage_euro double precision
);


--
-- TOC entry 482 (class 1259 OID 72670)
-- Name: tfrm_fire_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_fire_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8746 (class 0 OID 0)
-- Dependencies: 482
-- Name: tfrm_fire_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_fire_details_id_seq OWNED BY public.tfrm_fire_details.id;


--
-- TOC entry 483 (class 1259 OID 72672)
-- Name: tfrm_fire_point; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_fire_point (
    id bigint NOT NULL,
    point public.geometry,
    fire_id integer NOT NULL
);


--
-- TOC entry 484 (class 1259 OID 72678)
-- Name: tfrm_fire_polygon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_fire_polygon (
    id bigint NOT NULL,
    polygon public.geometry,
    fire_id integer NOT NULL
);


--
-- TOC entry 485 (class 1259 OID 72684)
-- Name: tfrm_fire_report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_fire_report (
    id integer NOT NULL,
    region_id integer NOT NULL,
    mun_id integer NOT NULL,
    mu_id integer NOT NULL,
    fire_type character varying(255),
    fire_cause character varying(255),
    occurrence_date timestamp without time zone NOT NULL,
    extinguish_date timestamp without time zone NOT NULL,
    extinguished_by character varying(100),
    pub_damage_m3 double precision,
    pub_damage_euro double precision,
    pub_damage_m2 double precision,
    pvt_damage_m3 double precision,
    pvt_damage_euro double precision,
    pvt_damage_m2 double precision,
    proposed_action character varying(255),
    doc_type character varying(100),
    doc_name character varying(100),
    doc bytea,
    comment text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 486 (class 1259 OID 72690)
-- Name: tfrm_fire_report_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_fire_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8747 (class 0 OID 0)
-- Dependencies: 486
-- Name: tfrm_fire_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_fire_report_id_seq OWNED BY public.tfrm_fire_report.id;


--
-- TOC entry 487 (class 1259 OID 72692)
-- Name: tfrm_fiskos_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_fiskos_data (
    id bigint NOT NULL,
    import_id integer NOT NULL,
    region_id integer NOT NULL,
    mu_id integer NOT NULL,
    mun_id integer,
    mngm_class_id integer,
    active boolean DEFAULT true NOT NULL,
    version_nr integer NOT NULL,
    modyfied_date timestamp without time zone,
    imported_by integer NOT NULL,
    imported_date timestamp without time zone DEFAULT now() NOT NULL,
    notes character varying(255),
    region character varying(150),
    managment_unit character varying(150),
    municipality character varying(100),
    comp character varying(20),
    stand character varying(20),
    standarea double precision,
    mngmnt_class integer,
    alb_short character varying(150),
    plots_nr character varying(100),
    accessible character varying(100),
    minehazard character varying(100),
    layers character varying(50),
    stand_type character varying(50),
    crowncover double precision,
    slope double precision,
    littercov double precision,
    age integer,
    origin character varying(50),
    conifer character varying(50),
    conifer_bon double precision,
    decidouse character varying(50),
    decidouse_bon double precision,
    trees integer,
    volume_m3ha double precision,
    conifer_perc double precision,
    decidouse_perc double precision,
    perc_0_30 double precision,
    perc_30_50 double precision,
    perc_50_70 double precision,
    perc_70_100 double precision,
    incr_perc double precision,
    m2_ha double precision,
    ds_con double precision,
    ds_bro double precision,
    cl1_perc_con double precision,
    cl2_perc_con double precision,
    cl3_perc_con double precision,
    cl4_perc_con double precision,
    cl1_perc_dec double precision,
    cl2_perc_dec double precision,
    cl3_perc_dec double precision,
    cl4_perc_dec double precision,
    damage_perc double precision,
    estemate_volume integer,
    estimate_trees_per_ha integer,
    height_mean integer,
    tree_species1 character varying(50),
    tree_species2 character varying(50),
    tree_species3 character varying(50),
    tree1 integer,
    tree2 integer,
    tree3 integer,
    terrain_date timestamp without time zone,
    survey_date timestamp without time zone,
    msgtext character varying(255)
);


--
-- TOC entry 488 (class 1259 OID 72700)
-- Name: tfrm_fiskos_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_fiskos_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8748 (class 0 OID 0)
-- Dependencies: 488
-- Name: tfrm_fiskos_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_fiskos_data_id_seq OWNED BY public.tfrm_fiskos_data.id;


--
-- TOC entry 489 (class 1259 OID 72702)
-- Name: tfrm_fiskos_import; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_fiskos_import (
    id integer NOT NULL,
    trnx_id character varying(36) NOT NULL,
    version_nr integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    region_id integer NOT NULL,
    mu_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    changed_by integer NOT NULL,
    changed_date timestamp without time zone NOT NULL,
    note character varying(255),
    CONSTRAINT tfrm_fiskos_import_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 490 (class 1259 OID 72707)
-- Name: tfrm_fiskos_import_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_fiskos_import_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8749 (class 0 OID 0)
-- Dependencies: 490
-- Name: tfrm_fiskos_import_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_fiskos_import_id_seq OWNED BY public.tfrm_fiskos_import.id;


--
-- TOC entry 491 (class 1259 OID 72709)
-- Name: tfrm_harvest_impl_transport; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_harvest_impl_transport (
    id bigint NOT NULL,
    doc_type character varying(100),
    doc_name character varying(100),
    doc bytea,
    remark text,
    trans_date date NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 492 (class 1259 OID 72715)
-- Name: tfrm_harvest_impl_transport_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_harvest_impl_transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8750 (class 0 OID 0)
-- Dependencies: 492
-- Name: tfrm_harvest_impl_transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_harvest_impl_transport_id_seq OWNED BY public.tfrm_harvest_impl_transport.id;


--
-- TOC entry 493 (class 1259 OID 72717)
-- Name: tfrm_insp_action_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_insp_action_type (
    id bigint NOT NULL,
    name_al character varying(50) NOT NULL,
    name_en character varying(50) NOT NULL,
    name_sr character varying(50),
    description text
);


--
-- TOC entry 494 (class 1259 OID 72723)
-- Name: tfrm_insp_action_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_insp_action_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8751 (class 0 OID 0)
-- Dependencies: 494
-- Name: tfrm_insp_action_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_insp_action_type_id_seq OWNED BY public.tfrm_insp_action_type.id;


--
-- TOC entry 495 (class 1259 OID 72725)
-- Name: tfrm_inspection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_inspection (
    id integer NOT NULL,
    inspection_no character varying(20) NOT NULL,
    inspection_type character(3),
    region_id integer,
    mun_id integer,
    notes character varying(500),
    date timestamp without time zone NOT NULL,
    procesverbal boolean,
    procesverbal_no integer,
    contact_person character varying(150),
    procesverbal_note text,
    sequestration boolean,
    seq_teach_volume double precision,
    seq_fire_volume double precision,
    seq_note text,
    charges boolean,
    charges_type character varying(2),
    charges_ref_no character varying(30),
    charges_note text,
    parent_id integer,
    type_action integer,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 496 (class 1259 OID 72731)
-- Name: tfrm_inspection_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_inspection_doc (
    id integer NOT NULL,
    inspection_id bigint NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc bytea NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 497 (class 1259 OID 72737)
-- Name: tfrm_inspection_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_inspection_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8752 (class 0 OID 0)
-- Dependencies: 497
-- Name: tfrm_inspection_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_inspection_doc_id_seq OWNED BY public.tfrm_inspection_doc.id;


--
-- TOC entry 498 (class 1259 OID 72739)
-- Name: tfrm_inspection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_inspection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8753 (class 0 OID 0)
-- Dependencies: 498
-- Name: tfrm_inspection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_inspection_id_seq OWNED BY public.tfrm_inspection.id;


--
-- TOC entry 499 (class 1259 OID 72741)
-- Name: tfrm_inspector; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_inspector (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    office_activity_id integer NOT NULL
);


--
-- TOC entry 500 (class 1259 OID 72744)
-- Name: tfrm_inspector_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_inspector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8754 (class 0 OID 0)
-- Dependencies: 500
-- Name: tfrm_inspector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_inspector_id_seq OWNED BY public.tfrm_inspector.id;


--
-- TOC entry 501 (class 1259 OID 72746)
-- Name: tfrm_landscap_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_landscap_plan (
    id bigint NOT NULL
);


--
-- TOC entry 502 (class 1259 OID 72749)
-- Name: tfrm_landscap_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_landscap_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8755 (class 0 OID 0)
-- Dependencies: 502
-- Name: tfrm_landscap_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_landscap_plan_id_seq OWNED BY public.tfrm_landscap_plan.id;


--
-- TOC entry 503 (class 1259 OID 72751)
-- Name: tfrm_management_class; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_management_class (
    id integer NOT NULL,
    mngmt_class_code integer NOT NULL,
    created_date date NOT NULL,
    remarks character varying(255)
);


--
-- TOC entry 504 (class 1259 OID 72754)
-- Name: tfrm_management_class_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_management_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8756 (class 0 OID 0)
-- Dependencies: 504
-- Name: tfrm_management_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_management_class_id_seq OWNED BY public.tfrm_management_class.id;


--
-- TOC entry 505 (class 1259 OID 72756)
-- Name: tfrm_private_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_private_activity (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    status_id bigint NOT NULL,
    activity_unit character varying(10) NOT NULL,
    mun_id integer NOT NULL,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    pl_tech_volume double precision,
    pl_fire_volume double precision,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_tech_volume double precision,
    im_fire_volume double precision,
    im_created_date timestamp without time zone,
    im_created_by integer,
    start_cmpgn_date date NOT NULL,
    end_cmpgn_date date NOT NULL
);


--
-- TOC entry 506 (class 1259 OID 72760)
-- Name: tfrm_private_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_private_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8757 (class 0 OID 0)
-- Dependencies: 506
-- Name: tfrm_private_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_private_activity_id_seq OWNED BY public.tfrm_private_activity.id;


--
-- TOC entry 507 (class 1259 OID 72762)
-- Name: tfrm_private_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_private_request (
    id integer NOT NULL,
    activity_id bigint NOT NULL,
    status_id bigint NOT NULL,
    mun_id integer NOT NULL,
    requester_id integer NOT NULL,
    request_no character varying(30) NOT NULL,
    request_date timestamp without time zone NOT NULL,
    cad_zone_id integer NOT NULL,
    parcel_detail_id bigint,
    cad_cert_no character varying(50),
    copy_plan_no character varying(20),
    remarks text,
    work_stage character(1) DEFAULT 'P'::bpchar NOT NULL,
    pl_tech_volume double precision,
    pl_fire_volume double precision,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    alw_tech_volume double precision,
    alw_fire_volume double precision,
    alw_created_date timestamp without time zone,
    alw_created_by integer,
    marking_tool character varying(20),
    receiver_person character varying(50),
    auth_person_id integer,
    marking_date timestamp without time zone,
    ap_tech_volume double precision,
    ap_fire_volume double precision,
    ap_created_date timestamp without time zone,
    ap_created_by integer,
    payment boolean DEFAULT false,
    payment_value double precision,
    transported boolean DEFAULT false
);


--
-- TOC entry 508 (class 1259 OID 72771)
-- Name: tfrm_private_request_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_private_request_doc (
    id bigint NOT NULL,
    request_id bigint NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 509 (class 1259 OID 72778)
-- Name: tfrm_private_request_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_private_request_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8758 (class 0 OID 0)
-- Dependencies: 509
-- Name: tfrm_private_request_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_private_request_doc_id_seq OWNED BY public.tfrm_private_request_doc.id;


--
-- TOC entry 510 (class 1259 OID 72780)
-- Name: tfrm_private_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_private_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8759 (class 0 OID 0)
-- Dependencies: 510
-- Name: tfrm_private_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_private_request_id_seq OWNED BY public.tfrm_private_request.id;


--
-- TOC entry 511 (class 1259 OID 72782)
-- Name: tfrm_private_request_impl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_private_request_impl (
    id integer NOT NULL,
    request_id integer NOT NULL,
    tree_species_id integer NOT NULL,
    diameter_1_3 double precision NOT NULL,
    factor double precision NOT NULL,
    height double precision NOT NULL,
    tech_volume double precision,
    fire_volume double precision,
    pulp_volume double precision,
    volume_total double precision,
    remarks character varying(255),
    created_date timestamp without time zone,
    created_by integer
);


--
-- TOC entry 512 (class 1259 OID 72785)
-- Name: tfrm_private_request_impl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_private_request_impl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8760 (class 0 OID 0)
-- Dependencies: 512
-- Name: tfrm_private_request_impl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_private_request_impl_id_seq OWNED BY public.tfrm_private_request_impl.id;


--
-- TOC entry 513 (class 1259 OID 72787)
-- Name: tfrm_protection_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_protection_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8761 (class 0 OID 0)
-- Dependencies: 513
-- Name: tfrm_protection_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_protection_activity_id_seq OWNED BY public.tfrm_protection_activity.id;


--
-- TOC entry 514 (class 1259 OID 72789)
-- Name: tfrm_protection_impl_declare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_protection_impl_declare (
    id bigint NOT NULL,
    protection_id integer NOT NULL,
    im_value double precision NOT NULL,
    im_date date NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    im_geom public.geometry
);


--
-- TOC entry 515 (class 1259 OID 72795)
-- Name: tfrm_protection_impl_declare_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_protection_impl_declare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8762 (class 0 OID 0)
-- Dependencies: 515
-- Name: tfrm_protection_impl_declare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_protection_impl_declare_id_seq OWNED BY public.tfrm_protection_impl_declare.id;


--
-- TOC entry 516 (class 1259 OID 72797)
-- Name: tfrm_road_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_road_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8763 (class 0 OID 0)
-- Dependencies: 516
-- Name: tfrm_road_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_road_activity_id_seq OWNED BY public.tfrm_road_activity.id;


--
-- TOC entry 517 (class 1259 OID 72799)
-- Name: tfrm_road_impl_declare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_road_impl_declare (
    id bigint NOT NULL,
    road_id integer NOT NULL,
    im_lenght double precision NOT NULL,
    im_start_m double precision NOT NULL,
    im_end_m double precision NOT NULL,
    im_width double precision NOT NULL,
    im_date date NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 518 (class 1259 OID 72802)
-- Name: tfrm_road_impl_declare_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_road_impl_declare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8764 (class 0 OID 0)
-- Dependencies: 518
-- Name: tfrm_road_impl_declare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_road_impl_declare_id_seq OWNED BY public.tfrm_road_impl_declare.id;


--
-- TOC entry 519 (class 1259 OID 72804)
-- Name: tfrm_seed_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_seed_activity (
    id bigint NOT NULL,
    institute character varying(100),
    activity_id bigint NOT NULL,
    status_id bigint NOT NULL,
    year smallint NOT NULL,
    prod_type character varying(50) NOT NULL,
    tree_species_id integer NOT NULL,
    work_stage character(1) DEFAULT 'R'::bpchar NOT NULL,
    pr_value integer,
    pl_value integer,
    ex_value integer,
    im_value integer,
    pr_created_date timestamp without time zone,
    pr_created_by integer,
    pl_created_date timestamp without time zone,
    pl_created_by integer,
    im_created_date timestamp without time zone,
    im_created_by integer
);


--
-- TOC entry 520 (class 1259 OID 72808)
-- Name: tfrm_seed_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_seed_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8765 (class 0 OID 0)
-- Dependencies: 520
-- Name: tfrm_seed_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_seed_activity_id_seq OWNED BY public.tfrm_seed_activity.id;


--
-- TOC entry 521 (class 1259 OID 72810)
-- Name: tfrm_seedling_inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_seedling_inventory (
    id bigint NOT NULL,
    seed_activity_id bigint,
    prod_type character varying(50) NOT NULL,
    tree_species_id integer NOT NULL,
    age smallint NOT NULL,
    seed_year integer NOT NULL,
    stock integer NOT NULL,
    price numeric(10,2),
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    changed_date timestamp without time zone,
    changed_by integer
);


--
-- TOC entry 522 (class 1259 OID 72813)
-- Name: tfrm_seedling_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_seedling_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8766 (class 0 OID 0)
-- Dependencies: 522
-- Name: tfrm_seedling_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_seedling_inventory_id_seq OWNED BY public.tfrm_seedling_inventory.id;


--
-- TOC entry 523 (class 1259 OID 72815)
-- Name: tfrm_seedling_inventory_pos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_seedling_inventory_pos (
    id bigint NOT NULL,
    inventory_id bigint NOT NULL,
    prod_type character varying(50),
    tree_species_id integer NOT NULL,
    age smallint NOT NULL,
    quantity numeric(10,0) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    note character varying(255),
    changed_date timestamp without time zone,
    changed_by integer,
    isapproved character(1) DEFAULT 'O'::bpchar NOT NULL,
    approved_date timestamp without time zone,
    approved_by integer,
    isdelivered character(1) DEFAULT 'N'::bpchar NOT NULL,
    pickup_date timestamp without time zone,
    pickup_contact character varying(255),
    CONSTRAINT tfrm_seedling_inventory_pos_isapproved_check CHECK ((isapproved = ANY (ARRAY['O'::bpchar, 'Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tfrm_seedling_inventory_pos_isdelivered_check CHECK ((isdelivered = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 524 (class 1259 OID 72825)
-- Name: tfrm_seedling_inventory_pos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_seedling_inventory_pos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8767 (class 0 OID 0)
-- Dependencies: 524
-- Name: tfrm_seedling_inventory_pos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_seedling_inventory_pos_id_seq OWNED BY public.tfrm_seedling_inventory_pos.id;


--
-- TOC entry 525 (class 1259 OID 72827)
-- Name: tfrm_siviculture_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_siviculture_plan (
    id bigint NOT NULL
);


--
-- TOC entry 526 (class 1259 OID 72830)
-- Name: tfrm_siviculture_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_siviculture_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8768 (class 0 OID 0)
-- Dependencies: 526
-- Name: tfrm_siviculture_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_siviculture_plan_id_seq OWNED BY public.tfrm_siviculture_plan.id;


--
-- TOC entry 527 (class 1259 OID 72832)
-- Name: tfrm_stand_harvest_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_harvest_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8769 (class 0 OID 0)
-- Dependencies: 527
-- Name: tfrm_stand_harvest_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_harvest_activity_id_seq OWNED BY public.tfrm_stand_harvest_activity.id;


--
-- TOC entry 528 (class 1259 OID 72834)
-- Name: tfrm_stand_harvest_impl_declare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_harvest_impl_declare (
    id bigint NOT NULL,
    harvest_activity_id integer NOT NULL,
    transport_id integer,
    tech_volume double precision NOT NULL,
    fire_volume double precision NOT NULL,
    pulp_volume double precision NOT NULL,
    im_date date NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 529 (class 1259 OID 72837)
-- Name: tfrm_stand_harvest_impl_declare_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_harvest_impl_declare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8770 (class 0 OID 0)
-- Dependencies: 529
-- Name: tfrm_stand_harvest_impl_declare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_harvest_impl_declare_id_seq OWNED BY public.tfrm_stand_harvest_impl_declare.id;


--
-- TOC entry 530 (class 1259 OID 72839)
-- Name: tfrm_stand_harvest_marked; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_harvest_marked (
    id integer NOT NULL,
    harvest_id integer NOT NULL,
    tree_species_id integer NOT NULL,
    diameter_1_3 double precision NOT NULL,
    height double precision NOT NULL,
    tech_volume double precision,
    fire_volume double precision,
    pulp_volume double precision,
    volume_total double precision,
    remarks character varying(255),
    created_date timestamp without time zone,
    created_by integer
);


--
-- TOC entry 531 (class 1259 OID 72842)
-- Name: tfrm_stand_harvest_marked_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_harvest_marked_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8771 (class 0 OID 0)
-- Dependencies: 531
-- Name: tfrm_stand_harvest_marked_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_harvest_marked_id_seq OWNED BY public.tfrm_stand_harvest_marked.id;


--
-- TOC entry 532 (class 1259 OID 72844)
-- Name: tfrm_stand_planting_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_planting_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8772 (class 0 OID 0)
-- Dependencies: 532
-- Name: tfrm_stand_planting_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_planting_activity_id_seq OWNED BY public.tfrm_stand_planting_activity.id;


--
-- TOC entry 533 (class 1259 OID 72846)
-- Name: tfrm_stand_planting_impl_declare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_planting_impl_declare (
    id bigint NOT NULL,
    plant_activity_id integer NOT NULL,
    im_area double precision NOT NULL,
    im_trees integer NOT NULL,
    im_date date NOT NULL,
    im_geom public.geometry NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 534 (class 1259 OID 72852)
-- Name: tfrm_stand_planting_impl_declare_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_planting_impl_declare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8773 (class 0 OID 0)
-- Dependencies: 534
-- Name: tfrm_stand_planting_impl_declare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_planting_impl_declare_id_seq OWNED BY public.tfrm_stand_planting_impl_declare.id;


--
-- TOC entry 535 (class 1259 OID 72854)
-- Name: tfrm_stand_silviculture_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_silviculture_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8774 (class 0 OID 0)
-- Dependencies: 535
-- Name: tfrm_stand_silviculture_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_silviculture_activity_id_seq OWNED BY public.tfrm_stand_silviculture_activity.id;


--
-- TOC entry 536 (class 1259 OID 72856)
-- Name: tfrm_stand_silviculture_impl_declare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_stand_silviculture_impl_declare (
    id bigint NOT NULL,
    slv_activity_id integer NOT NULL,
    im_area double precision NOT NULL,
    im_geom public.geometry NOT NULL,
    im_date date NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 537 (class 1259 OID 72862)
-- Name: tfrm_stand_silviculture_impl_declare_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_stand_silviculture_impl_declare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8775 (class 0 OID 0)
-- Dependencies: 537
-- Name: tfrm_stand_silviculture_impl_declare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_stand_silviculture_impl_declare_id_seq OWNED BY public.tfrm_stand_silviculture_impl_declare.id;


--
-- TOC entry 538 (class 1259 OID 72864)
-- Name: tfrm_treatment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_treatment (
    id integer NOT NULL,
    treat_group_id integer,
    code integer,
    name_en character varying(100),
    name_al character varying(100),
    name_sr character varying(100),
    units character varying(2)
);


--
-- TOC entry 539 (class 1259 OID 72867)
-- Name: tfrm_treatment_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfrm_treatment_group (
    id integer NOT NULL,
    code integer,
    name_en character varying(100),
    name_al character varying(100),
    name_sr character varying(100)
);


--
-- TOC entry 540 (class 1259 OID 72870)
-- Name: tfrm_treatment_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_treatment_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8776 (class 0 OID 0)
-- Dependencies: 540
-- Name: tfrm_treatment_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_treatment_group_id_seq OWNED BY public.tfrm_treatment_group.id;


--
-- TOC entry 541 (class 1259 OID 72872)
-- Name: tfrm_treatment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_treatment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8777 (class 0 OID 0)
-- Dependencies: 541
-- Name: tfrm_treatment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_treatment_id_seq OWNED BY public.tfrm_treatment.id;


--
-- TOC entry 542 (class 1259 OID 72874)
-- Name: tfrm_tree_species_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfrm_tree_species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8778 (class 0 OID 0)
-- Dependencies: 542
-- Name: tfrm_tree_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfrm_tree_species_id_seq OWNED BY public.tfrm_tree_species.id;


--
-- TOC entry 543 (class 1259 OID 72876)
-- Name: tfuell_consum; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tfuell_consum (
    id integer NOT NULL,
    vehicles_id integer NOT NULL,
    vendor character varying(50),
    invoice_no character varying(25),
    date timestamp without time zone,
    type_feul character varying(25),
    driver_id integer NOT NULL,
    liter numeric(10,2) NOT NULL,
    mileage_when_filled character varying(20),
    total_mileage character varying(20),
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 544 (class 1259 OID 72879)
-- Name: tfuell_consum_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tfuell_consum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8779 (class 0 OID 0)
-- Dependencies: 544
-- Name: tfuell_consum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tfuell_consum_id_seq OWNED BY public.tfuell_consum.id;


--
-- TOC entry 545 (class 1259 OID 72881)
-- Name: tlayers_gis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlayers_gis (
    id integer NOT NULL,
    parent_id integer,
    url text,
    service_type character varying(3),
    featurens character varying(250),
    store character varying(100),
    feature_type_layer character varying(100) NOT NULL,
    is_base_layer boolean,
    min_scale integer,
    srs_name character varying(100),
    outputformat character varying(10),
    tiled boolean,
    transparent boolean,
    visibility boolean,
    tilesize integer,
    module character varying(250),
    sort integer
);


--
-- TOC entry 546 (class 1259 OID 72887)
-- Name: tgis; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.tgis AS
 SELECT tlayers_gis.id,
    tlayers_gis.store
   FROM public.tlayers_gis;


--
-- TOC entry 547 (class 1259 OID 72891)
-- Name: tgis_af_ref_01_national_forest_inventory_4x4_4x2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_01_national_forest_inventory_4x4_4x2 (
    id integer NOT NULL,
    geom public.geometry(Point),
    objectid integer,
    autoplot double precision,
    plotno double precision,
    x_kosovare double precision,
    y_kosovare double precision,
    cluster integer,
    date_ date,
    crew character varying(254),
    municip character varying(2),
    invstatus character varying(2),
    plotstatus character varying(1),
    landuse character varying(2),
    land_qual character varying(2),
    standcode character varying(2),
    crowncover double precision,
    riskmuxo character varying(2),
    accesscode character varying(2),
    photofinis character varying(5),
    azimuth1 double precision,
    distance1 double precision,
    object1 character varying(254),
    azimuth2 double precision,
    distance2 double precision,
    object2 character varying(254),
    azimuth3 double precision,
    distance3 double precision,
    object3 character varying(254),
    elevation double precision,
    slope double precision,
    aspect double precision,
    ownership character varying(1),
    species_cl character varying(1),
    age double precision,
    meanheight double precision,
    dom_height double precision,
    stand_orig character varying(1),
    small_orig character varying(1),
    structure character varying(1),
    treatment character varying(2),
    illegal character varying(1),
    soil_depth character varying(254),
    conifer0_7 double precision,
    broadl0_7 double precision,
    conifer_bh double precision,
    broadl_bh double precision,
    small_dama character varying(254),
    int_damage character varying(254),
    biomass character varying(254),
    juniper double precision,
    sign_anim character varying(254),
    occ_anim character varying(254),
    grid double precision,
    vm_salv double precision,
    vm_nsalv double precision,
    vm double precision,
    int_ double precision,
    bark double precision,
    num double precision,
    vmprha_con double precision,
    vmprha_bdl double precision,
    vm_con0_7 double precision,
    vm_bdl0_7 double precision,
    vmprha double precision,
    intprha double precision,
    barkprha double precision,
    vmprha_sal double precision,
    vmprha_nsa double precision,
    x double precision,
    y double precision,
    originalfi character varying(254),
    last_numbe character varying(1),
    plot_txt character varying(8),
    plot_nr double precision,
    partialplo integer,
    naturalnes integer,
    trespeccom integer,
    trespecc_1 integer,
    trespecc_2 integer,
    trespecc_3 integer,
    trespecc_4 integer,
    trespecc_5 integer,
    trespecc_6 integer,
    littercove integer,
    soiltype integer,
    notre2549 integer,
    nobtre2549 integer,
    notre0024 integer,
    nobtre0024 integer,
    notre0113 integer,
    nobtre0113 integer,
    managclas integer,
    fmr character varying(10),
    to_visit character varying(1),
    new_plot20 character varying(25)
);


--
-- TOC entry 548 (class 1259 OID 72897)
-- Name: tgis_af_ref_01_national_forest_inventory_4x4_4x2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_01_national_forest_inventory_4x4_4x2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8780 (class 0 OID 0)
-- Dependencies: 548
-- Name: tgis_af_ref_01_national_forest_inventory_4x4_4x2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_01_national_forest_inventory_4x4_4x2_id_seq OWNED BY public.tgis_af_ref_01_national_forest_inventory_4x4_4x2.id;


--
-- TOC entry 549 (class 1259 OID 72899)
-- Name: tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100 (
    pid integer NOT NULL,
    geom public.geometry(Point),
    objectid integer,
    id double precision,
    aa integer,
    nat_grid_i character varying(50),
    f1km_grdi_ character varying(50),
    sample_id character varying(50),
    plotno double precision,
    cluster integer,
    last_numbe integer,
    name character varying(50)
);


--
-- TOC entry 550 (class 1259 OID 72905)
-- Name: tgis_af_ref_02_intensify_grid_inventory_sample_plots_10_pid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_10_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8781 (class 0 OID 0)
-- Dependencies: 550
-- Name: tgis_af_ref_02_intensify_grid_inventory_sample_plots_10_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_10_pid_seq OWNED BY public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100.pid;


--
-- TOC entry 551 (class 1259 OID 72907)
-- Name: tgis_af_ref_03_intensify_grid_inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_03_intensify_grid_inventory (
    pid integer NOT NULL,
    geom public.geometry(Point),
    objectid integer,
    id double precision,
    nr character varying(50),
    nfi character varying(50)
);


--
-- TOC entry 552 (class 1259 OID 72913)
-- Name: tgis_af_ref_03_intensify_grid_inventory_pid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_03_intensify_grid_inventory_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8782 (class 0 OID 0)
-- Dependencies: 552
-- Name: tgis_af_ref_03_intensify_grid_inventory_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_03_intensify_grid_inventory_pid_seq OWNED BY public.tgis_af_ref_03_intensify_grid_inventory.pid;


--
-- TOC entry 553 (class 1259 OID 72915)
-- Name: tgis_af_ref_04_forest_type_fmp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_04_forest_type_fmp (
    id bigint NOT NULL,
    geom public.geometry(Polygon,900916),
    path integer,
    mc_gr integer,
    pershkrimi character varying(254),
    descriptio character varying(254),
    shape_area double precision
);


--
-- TOC entry 554 (class 1259 OID 72921)
-- Name: tgis_af_ref_05_potential_area_reforestation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_05_potential_area_reforestation (
    geom public.geometry(Polygon,900916),
    into_man_u character varying(50),
    mu_name_al character varying(100),
    mu_name_en character varying(100),
    into_nat_p character varying(50),
    nat_park_n character varying(100),
    na_park_na character varying(50),
    id bigint NOT NULL,
    area_ha double precision,
    descr character varying(20)
);


--
-- TOC entry 555 (class 1259 OID 72927)
-- Name: tgis_af_ref_05_potential_area_reforestation_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_05_potential_area_reforestation_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8783 (class 0 OID 0)
-- Dependencies: 555
-- Name: tgis_af_ref_05_potential_area_reforestation_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_05_potential_area_reforestation_id_seq1 OWNED BY public.tgis_af_ref_05_potential_area_reforestation.id;


--
-- TOC entry 556 (class 1259 OID 72929)
-- Name: tgis_af_ref_06_potential_area_afforestation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_06_potential_area_afforestation (
    geom public.geometry(Polygon,900916),
    into_man_u character varying(50),
    mu_name_al character varying(100),
    mu_name_en character varying(100),
    into_nat_p character varying(10),
    nat_park_n character varying(100),
    na_park_na character varying(100),
    id bigint NOT NULL,
    area_ha double precision,
    descr character varying(20)
);


--
-- TOC entry 557 (class 1259 OID 72935)
-- Name: tgis_af_ref_06_potential_area_afforestation_; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_06_potential_area_afforestation_ (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon),
    objectid_1 integer,
    objectid integer,
    shape_leng double precision,
    into_man_u character varying(50),
    mu_name_al character varying(100),
    mu_name_en character varying(100),
    into_nat_p character varying(10),
    nat_park_n character varying(100),
    na_park_na character varying(100),
    shape_le_1 double precision,
    shape_area double precision
);


--
-- TOC entry 558 (class 1259 OID 72941)
-- Name: tgis_af_ref_06_potential_area_afforestation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_06_potential_area_afforestation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8784 (class 0 OID 0)
-- Dependencies: 558
-- Name: tgis_af_ref_06_potential_area_afforestation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_06_potential_area_afforestation_id_seq OWNED BY public.tgis_af_ref_06_potential_area_afforestation_.id;


--
-- TOC entry 559 (class 1259 OID 72943)
-- Name: tgis_af_ref_06_potential_area_afforestation_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_06_potential_area_afforestation_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8785 (class 0 OID 0)
-- Dependencies: 559
-- Name: tgis_af_ref_06_potential_area_afforestation_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_06_potential_area_afforestation_id_seq1 OWNED BY public.tgis_af_ref_06_potential_area_afforestation.id;


--
-- TOC entry 560 (class 1259 OID 72945)
-- Name: tgis_af_ref_07_plantation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_07_plantation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8786 (class 0 OID 0)
-- Dependencies: 560
-- Name: tgis_af_ref_07_plantation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_07_plantation_id_seq OWNED BY public.tgis_af_ref_07_plantation.id;


--
-- TOC entry 561 (class 1259 OID 72947)
-- Name: tgis_af_ref_09_aff_species; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_09_aff_species (
    pid integer NOT NULL,
    geom public.geometry(MultiPolygon),
    id double precision,
    emri character varying(50),
    sname character varying(50),
    priorarea character varying(10),
    groupeleva character varying(10),
    groupslop character varying(10),
    expositgr character varying(10),
    soil_type character varying(50),
    urbanbuff character varying(10),
    soil_class double precision,
    roadbuffer character varying(254),
    specie_1 character varying(254),
    specie_2 character varying(254),
    mix_in__ character varying(254),
    areasqm double precision,
    areaha double precision
);


--
-- TOC entry 562 (class 1259 OID 72953)
-- Name: tgis_af_ref_08_aff_species_pid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_08_aff_species_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8787 (class 0 OID 0)
-- Dependencies: 562
-- Name: tgis_af_ref_08_aff_species_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_08_aff_species_pid_seq OWNED BY public.tgis_af_ref_09_aff_species.pid;


--
-- TOC entry 563 (class 1259 OID 72955)
-- Name: tgis_af_ref_08_seed_stand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_08_seed_stand (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon),
    areasqm double precision,
    areaha double precision,
    ssource_no character varying(10),
    species_en character varying(50),
    species_al character varying(50),
    species_la character varying(50),
    leg_nr character varying(10),
    albdescr character varying(254),
    engdescr character varying(254)
);


--
-- TOC entry 564 (class 1259 OID 72961)
-- Name: tgis_af_ref_08_seed_stand_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_08_seed_stand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8788 (class 0 OID 0)
-- Dependencies: 564
-- Name: tgis_af_ref_08_seed_stand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_08_seed_stand_id_seq OWNED BY public.tgis_af_ref_08_seed_stand.id;


--
-- TOC entry 565 (class 1259 OID 72963)
-- Name: tgis_af_ref_10_ref_species; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_af_ref_10_ref_species (
    pid integer NOT NULL,
    geom public.geometry(MultiPolygon),
    id double precision,
    emri character varying(50),
    sname character varying(50),
    priority_a integer,
    groupeleva character varying(20),
    groupslop character varying(20),
    groupexpo character varying(10),
    leg_nr character varying(10),
    soil_type character varying(50),
    category double precision,
    species_1 character varying(254),
    species_2 character varying(254),
    areasqm double precision,
    areaha double precision
);


--
-- TOC entry 566 (class 1259 OID 72969)
-- Name: tgis_af_ref_10_ref_species_pid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_af_ref_10_ref_species_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8789 (class 0 OID 0)
-- Dependencies: 566
-- Name: tgis_af_ref_10_ref_species_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_af_ref_10_ref_species_pid_seq OWNED BY public.tgis_af_ref_10_ref_species.pid;


--
-- TOC entry 567 (class 1259 OID 72971)
-- Name: tgis_biodiv; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_biodiv (
    id integer NOT NULL,
    stand_id integer,
    biodiv_id integer,
    remarks character varying(150),
    comp_nr character varying(3),
    stand_nr character varying(3),
    timeform character varying(10),
    taksator character varying(25),
    the_geom public.geometry(Point,900916)
);


--
-- TOC entry 568 (class 1259 OID 72977)
-- Name: tgis_biodiv_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_biodiv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8790 (class 0 OID 0)
-- Dependencies: 568
-- Name: tgis_biodiv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_biodiv_id_seq OWNED BY public.tgis_biodiv.id;


--
-- TOC entry 569 (class 1259 OID 72979)
-- Name: tgis_cadastral_municipality_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_cadastral_municipality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8791 (class 0 OID 0)
-- Dependencies: 569
-- Name: tgis_cadastral_municipality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_cadastral_municipality_id_seq OWNED BY public.tgis_cadastral_municipality.id;


--
-- TOC entry 570 (class 1259 OID 72981)
-- Name: tgis_cadastral_zone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_cadastral_zone (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    name_sr character varying(100),
    name_en character varying(100),
    municipality_id integer NOT NULL,
    the_geom public.geometry NOT NULL,
    cad_id character varying(100),
    geom public.geometry(MultiPolygon,900916),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 571 (class 1259 OID 72989)
-- Name: tgis_cadastral_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_cadastral_zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8792 (class 0 OID 0)
-- Dependencies: 571
-- Name: tgis_cadastral_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_cadastral_zone_id_seq OWNED BY public.tgis_cadastral_zone.id;


--
-- TOC entry 572 (class 1259 OID 72991)
-- Name: tgis_compartment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_compartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8793 (class 0 OID 0)
-- Dependencies: 572
-- Name: tgis_compartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_compartment_id_seq OWNED BY public.tgis_compartment.id;


--
-- TOC entry 573 (class 1259 OID 72993)
-- Name: tgis_management_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_management_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8794 (class 0 OID 0)
-- Dependencies: 573
-- Name: tgis_management_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_management_unit_id_seq OWNED BY public.tgis_management_unit.id;


--
-- TOC entry 574 (class 1259 OID 72995)
-- Name: tgis_ms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_ms (
    id integer,
    parent_id integer,
    url text,
    service_type character varying(3),
    featurens character varying(250),
    store character varying(100),
    feature_type_layer character varying(100),
    is_base_layer boolean,
    min_scale integer,
    srs_name character varying(100),
    outputformat character varying(10),
    tiled boolean,
    transparent boolean,
    visibility boolean,
    tilesize integer,
    module character varying(250),
    sort integer
);


--
-- TOC entry 575 (class 1259 OID 73001)
-- Name: tgis_mu_period_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_mu_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8795 (class 0 OID 0)
-- Dependencies: 575
-- Name: tgis_mu_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_mu_period_id_seq OWNED BY public.tgis_mu_period.id;


--
-- TOC entry 576 (class 1259 OID 73003)
-- Name: tgis_parcelgeom; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_parcelgeom (
    id integer NOT NULL,
    parcelid integer,
    cadparcelid character varying,
    cadastrezoneid integer,
    area double precision,
    mu integer,
    ow smallint,
    old_parc character varying(25),
    geom public.geometry(MultiPolygon,900916)
);


--
-- TOC entry 577 (class 1259 OID 73009)
-- Name: tgis_parcelgeom3; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_parcelgeom3 (
    parcelid integer,
    cadparcelid character varying,
    cadastrezoneid integer,
    area double precision,
    mu integer,
    ow smallint,
    old_parc character varying(25),
    geom public.geometry(MultiPolygon),
    id integer
);


--
-- TOC entry 578 (class 1259 OID 73015)
-- Name: tgis_plot_tree; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_plot_tree (
    id integer NOT NULL,
    plot_id integer,
    plot_nr integer,
    treeid integer,
    health integer,
    name character varying(28),
    incomplete numeric,
    height integer,
    increment numeric,
    diameter numeric,
    testmark numeric,
    plottreeid character varying(12),
    speccode integer,
    techcode integer
);


--
-- TOC entry 579 (class 1259 OID 73021)
-- Name: tgis_plot_tree_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_plot_tree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8796 (class 0 OID 0)
-- Dependencies: 579
-- Name: tgis_plot_tree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_plot_tree_id_seq OWNED BY public.tgis_plot_tree.id;


--
-- TOC entry 580 (class 1259 OID 73023)
-- Name: tgis_plots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_plots (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    plot_nr integer,
    visited smallint,
    plottype smallint,
    slope smallint,
    littercov smallint,
    age smallint,
    crowncov smallint,
    c_stems1 smallint,
    c_stems2 smallint,
    c_damage smallint,
    c_supress smallint,
    c_distrib smallint,
    b_stems1 smallint,
    b_stems2 smallint,
    b_damage smallint,
    b_supress smallint,
    b_distrib smallint,
    time_ character varying(12),
    date_ date,
    taksator character varying(20),
    geom public.geometry
);


--
-- TOC entry 581 (class 1259 OID 73029)
-- Name: tgis_plots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_plots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8797 (class 0 OID 0)
-- Dependencies: 581
-- Name: tgis_plots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_plots_id_seq OWNED BY public.tgis_plots.id;


--
-- TOC entry 582 (class 1259 OID 73031)
-- Name: tgis_region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_region (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    name_sr character varying(80),
    name_en character varying(80),
    code character varying(2),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 583 (class 1259 OID 73040)
-- Name: tgis_region_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8798 (class 0 OID 0)
-- Dependencies: 583
-- Name: tgis_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_region_id_seq OWNED BY public.tgis_region.id;


--
-- TOC entry 584 (class 1259 OID 73042)
-- Name: tgis_road; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_road (
    id bigint NOT NULL,
    mun_id integer NOT NULL,
    mu_id integer,
    road_name character varying,
    road_type character varying(10),
    access_type character varying(10),
    quality_cl character varying(20),
    maintenanc character varying(20),
    last_activity_year smallint,
    road_length double precision NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer NOT NULL,
    the_geom public.geometry
);


--
-- TOC entry 585 (class 1259 OID 73049)
-- Name: tgis_road_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_road_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8799 (class 0 OID 0)
-- Dependencies: 585
-- Name: tgis_road_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_road_id_seq OWNED BY public.tgis_road.id;


--
-- TOC entry 586 (class 1259 OID 73051)
-- Name: tgis_soil; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_soil (
    id bigint NOT NULL,
    code integer,
    name_al character varying(100),
    name_en character varying(100),
    name_sr character varying(100),
    the_geom public.geometry NOT NULL,
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 587 (class 1259 OID 73059)
-- Name: tgis_soil_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_soil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8800 (class 0 OID 0)
-- Dependencies: 587
-- Name: tgis_soil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_soil_id_seq OWNED BY public.tgis_soil.id;


--
-- TOC entry 588 (class 1259 OID 73061)
-- Name: tgis_soil_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_soil_name (
    id bigint NOT NULL,
    code integer NOT NULL,
    name_al character varying(100),
    name_en character varying(100),
    name_sr character varying(100)
);


--
-- TOC entry 589 (class 1259 OID 73064)
-- Name: tgis_soil_name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_soil_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8801 (class 0 OID 0)
-- Dependencies: 589
-- Name: tgis_soil_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_soil_name_id_seq OWNED BY public.tgis_soil_name.id;


--
-- TOC entry 590 (class 1259 OID 73066)
-- Name: tgis_stand_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_stand_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint NOT NULL,
    compartment_id integer NOT NULL,
    stand_id character varying(255),
    mngm_class integer,
    no_plots integer,
    minehazard character varying(3),
    layers integer,
    access_type character varying(20) NOT NULL,
    basal_area double precision NOT NULL,
    stand_type integer,
    crowncover double precision,
    slope double precision,
    littercov double precision,
    age integer,
    origin integer,
    conifer character varying(50),
    conifer_bon double precision,
    decidouse character varying(50),
    decidouse_bon double precision,
    trees integer,
    volume_m3ha double precision,
    conifer_perc double precision,
    decidouse_perc double precision,
    perc_0_30 double precision,
    perc_30_50 double precision,
    perc_50_70 double precision,
    perc_70_100 double precision,
    incr_perc double precision,
    m2_ha double precision,
    ds_con double precision,
    ds_bro double precision,
    cl1_perc_con double precision,
    cl2_perc_con double precision,
    cl3_perc_con double precision,
    cl4_perc_con double precision,
    cl1_perc_dec double precision,
    cl2_perc_dec double precision,
    cl3_perc_dec double precision,
    cl4_perc_dec double precision,
    damage_perc double precision,
    estemate_volume integer,
    estimate_trees_per_ha character varying(10),
    height_mean integer,
    tree1 integer,
    tree2 integer,
    tree3 integer,
    survey_date timestamp without time zone,
    remarks character varying(255),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 591 (class 1259 OID 73075)
-- Name: tgis_stand_growth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_stand_growth (
    id bigint NOT NULL,
    stand_id integer NOT NULL,
    year integer NOT NULL,
    old_volume double precision,
    new_volume double precision,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 592 (class 1259 OID 73078)
-- Name: tgis_stand_growth_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_stand_growth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8802 (class 0 OID 0)
-- Dependencies: 592
-- Name: tgis_stand_growth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_stand_growth_id_seq OWNED BY public.tgis_stand_growth.id;


--
-- TOC entry 593 (class 1259 OID 73080)
-- Name: tgis_stand_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_stand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8803 (class 0 OID 0)
-- Dependencies: 593
-- Name: tgis_stand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_stand_id_seq OWNED BY public.tgis_stand.id;


--
-- TOC entry 594 (class 1259 OID 73082)
-- Name: tgis_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_state (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    name_sr character varying(80),
    name_en character varying(80),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 595 (class 1259 OID 73091)
-- Name: tgis_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8804 (class 0 OID 0)
-- Dependencies: 595
-- Name: tgis_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_state_id_seq OWNED BY public.tgis_state.id;


--
-- TOC entry 596 (class 1259 OID 73093)
-- Name: tgis_subregion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_subregion (
    id bigint NOT NULL,
    region_id integer NOT NULL,
    name character varying(80) NOT NULL,
    name_sr character varying(80),
    name_en character varying(80),
    the_geom public.geometry NOT NULL,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 900916))
);


--
-- TOC entry 597 (class 1259 OID 73102)
-- Name: tgis_subregion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_subregion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8805 (class 0 OID 0)
-- Dependencies: 597
-- Name: tgis_subregion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_subregion_id_seq OWNED BY public.tgis_subregion.id;


--
-- TOC entry 598 (class 1259 OID 73104)
-- Name: tgis_surfacedata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_surfacedata (
    id bigint NOT NULL,
    slope public.raster,
    elevation public.raster,
    filename text,
    exposition public.raster,
    CONSTRAINT enforce_height_expostion CHECK ((public.st_height(exposition) = 201)),
    CONSTRAINT enforce_height_slope CHECK ((public.st_height(elevation) = 201)),
    CONSTRAINT enforce_max_extent_expostion CHECK (public.st_coveredby(public.st_convexhull(exposition), '010300002034BF0D0001000000FB000000A01A2F1DE2B65C41DD2406614ECB5141A01A2F1DE2B65C41DD24066149CB5141A01A2F1DE2B65C41DD24066161C75141A01A2F1DFAB25C41DD24066161C75141A01A2F1DF5B25C41DD24066161C75141A01A2F1D12AF5C41DD24066161C75141A01A2F1D0DAF5C41DD24066161C75141A01A2F1D25AB5C41DD24066161C75141A01A2F1D25AB5C41DD24066149CB5141A01A2F1D25AB5C41DD2406614ECB5141A01A2F1D25AB5C41DD24066131CF5141A01A2F1D3DA75C41DD24066131CF5141A01A2F1D3DA75C41DD24066119D35141A01A2F1D5AA35C41DD24066119D35141A01A2F1D5AA35C41DD24066131CF5141A01A2F1D729F5C41DD24066131CF5141A01A2F1D729F5C41DD24066149CB5141A01A2F1D8A9B5C41DD24066149CB5141A01A2F1D859B5C41DD24066149CB5141A01A2F1DA2975C41DD24066149CB5141A01A2F1DA2975C41DD24066161C75141A01A2F1DBA935C41DD24066161C75141A01A2F1DB5935C41DD24066161C75141A01A2F1DD28F5C41DD24066161C75141A01A2F1DD28F5C41DD24066179C35141A01A2F1DEA8B5C41DD24066179C35141A01A2F1DEA8B5C41DD24066196BF5141A01A2F1DEA8B5C41DD24066191BF5141A01A2F1DEA8B5C41DD240661AEBB5141A01A2F1DEA8B5C41DD240661A9BB5141A01A2F1DEA8B5C41DD240661C6B75141A01A2F1DEA8B5C41DD240661C1B75141A01A2F1DEA8B5C41DD240661DEB35141A01A2F1DEA8B5C41DD240661D9B35141A01A2F1DEA8B5C41DD240661F1AF5141A01A2F1D02885C41DD240661F1AF5141A01A2F1D02885C41DD24066109AC5141A01A2F1D1A845C41DD24066109AC5141A01A2F1D15845C41DD24066109AC5141A01A2F1D32805C41DD24066109AC5141A01A2F1D2D805C41DD24066109AC5141A01A2F1D4A7C5C41DD24066109AC5141A01A2F1D457C5C41DD24066109AC5141A01A2F1D5D785C41DD24066109AC5141A01A2F1D5D785C41DD240661F1AF5141A01A2F1D5D785C41DD240661F6AF5141A01A2F1D5D785C41DD240661D9B35141A01A2F1D5D785C41DD240661DEB35141A01A2F1D5D785C41DD240661C6B75141A01A2F1D457C5C41DD240661C6B75141A01A2F1D457C5C41DD240661A9BB5141A01A2F1D5D785C41DD240661A9BB5141A01A2F1D5D785C41DD24066191BF5141A01A2F1D5D785C41DD24066196BF5141A01A2F1D5D785C41DD24066179C35141A01A2F1D75745C41DD24066179C35141A01A2F1D75745C41DD24066161C75141A01A2F1D75745C41DD24066166C75141A01A2F1D75745C41DD24066149CB5141A01A2F1D75745C41DD2406614ECB5141A01A2F1D75745C41DD24066131CF5141A01A2F1D75745C41DD24066136CF5141A01A2F1D75745C41DD24066119D35141A01A2F1D8D705C41DD24066119D35141A01A2F1D8D705C41DD24066101D75141A01A2F1D8D705C41DD24066106D75141A01A2F1D8D705C41DD240661E9DA5141A01A2F1DAA6C5C41DD240661E9DA5141A01A2F1DA56C5C41DD240661E9DA5141A01A2F1DBD685C41DD240661E9DA5141A01A2F1DBD685C41DD240661D1DE5141A01A2F1DDA645C41DD240661D1DE5141A01A2F1DD5645C41DD240661D1DE5141A01A2F1DF2605C41DD240661D1DE5141A01A2F1DED605C41DD240661D1DE5141A01A2F1D055D5C41DD240661D1DE5141A01A2F1D055D5C41DD240661B9E25141A01A2F1D055D5C41DD240661BEE25141A01A2F1D055D5C41DD240661A1E65141A01A2F1D1D595C41DD240661A1E65141A01A2F1D1D595C41DD24066189EA5141A01A2F1D1D595C41DD2406618EEA5141A01A2F1D1D595C41DD24066171EE5141A01A2F1D1D595C41DD24066176EE5141A01A2F1D1D595C41DD24066159F25141A01A2F1D35555C41DD24066159F25141A01A2F1D35555C41DD24066141F65141A01A2F1D4D515C41DD24066141F65141A01A2F1D4D515C41DD24066129FA5141A01A2F1D4D515C41DD2406612EFA5141A01A2F1D4D515C41DD24066111FE5141A01A2F1D4D515C41DD24066116FE5141A01A2F1D4D515C41DD240661F9015241A01A2F1D4D515C41DD240661FE015241A01A2F1D4D515C41DD240661E1055241A01A2F1D654D5C41DD240661E1055241A01A2F1D654D5C41DD240661C9095241A01A2F1D654D5C41DD240661CE095241A01A2F1D654D5C41DD240661B10D5241A01A2F1D654D5C41DD240661B60D5241A01A2F1D654D5C41DD24066199115241A01A2F1D654D5C41DD2406619E115241A01A2F1D654D5C41DD24066186155241A01A2F1D4D515C41DD24066186155241A01A2F1D52515C41DD24066186155241A01A2F1D35555C41DD24066186155241A01A2F1D3A555C41DD24066186155241A01A2F1D22595C41DD24066186155241A01A2F1D22595C41DD2406619E115241A01A2F1D055D5C41DD2406619E115241A01A2F1D055D5C41DD24066181155241A01A2F1D055D5C41DD24066186155241A01A2F1D055D5C41DD2406616E195241A01A2F1DED605C41DD2406616E195241A01A2F1DF2605C41DD2406616E195241A01A2F1DD5645C41DD2406616E195241A01A2F1DDA645C41DD2406616E195241A01A2F1DBD685C41DD2406616E195241A01A2F1DBD685C41DD240661561D5241A01A2F1DA56C5C41DD240661561D5241A01A2F1DAA6C5C41DD240661561D5241A01A2F1D8D705C41DD240661561D5241A01A2F1D92705C41DD240661561D5241A01A2F1D75745C41DD240661561D5241A01A2F1D75745C41DD24066139215241A01A2F1D8D705C41DD24066139215241A01A2F1D8D705C41DD24066121255241A01A2F1D8D705C41DD24066126255241A01A2F1D8D705C41DD2406610E295241A01A2F1D75745C41DD2406610E295241A01A2F1D7A745C41DD2406610E295241A01A2F1D5D785C41DD2406610E295241A01A2F1D5D785C41DD240661F62C5241A01A2F1D457C5C41DD240661F62C5241A01A2F1D457C5C41DD240661DE305241A01A2F1D2D805C41DD240661DE305241A01A2F1D2D805C41DD240661C1345241A01A2F1D2D805C41DD240661C6345241A01A2F1D2D805C41DD240661A9385241A01A2F1D457C5C41DD240661A9385241A01A2F1D457C5C41DD240661913C5241A01A2F1D457C5C41DD240661963C5241A01A2F1D457C5C41DD24066179405241A01A2F1D5D785C41DD24066179405241A01A2F1D5D785C41DD24066166445241A01A2F1D457C5C41DD24066166445241A01A2F1D4A7C5C41DD24066166445241A01A2F1D2D805C41DD24066166445241A01A2F1D32805C41DD24066166445241A01A2F1D15845C41DD24066166445241A01A2F1D15845C41DD2406614E485241A01A2F1DFD875C41DD2406614E485241A01A2F1D02885C41DD2406614E485241A01A2F1DE58B5C41DD2406614E485241A01A2F1DEA8B5C41DD2406614E485241A01A2F1DCD8F5C41DD2406614E485241A01A2F1DD28F5C41DD2406614E485241A01A2F1DBA935C41DD2406614E485241A01A2F1DBA935C41DD24066166445241A01A2F1DBA935C41DD24066161445241A01A2F1DBA935C41DD2406617E405241A01A2F1DBA935C41DD24066179405241A01A2F1DBA935C41DD240661963C5241A01A2F1D9D975C41DD240661963C5241A01A2F1DA2975C41DD240661963C5241A01A2F1D859B5C41DD240661963C5241A01A2F1D8A9B5C41DD240661963C5241A01A2F1D6D9F5C41DD240661963C5241A01A2F1D729F5C41DD240661963C5241A01A2F1D55A35C41DD240661963C5241A01A2F1D5AA35C41DD240661963C5241A01A2F1D42A75C41DD240661963C5241A01A2F1D42A75C41DD240661AE385241A01A2F1D2AAB5C41DD240661AE385241A01A2F1D2AAB5C41DD240661C6345241A01A2F1D2AAB5C41DD240661C1345241A01A2F1D2AAB5C41DD240661DE305241A01A2F1D12AF5C41DD240661DE305241A01A2F1D12AF5C41DD240661F62C5241A01A2F1DFAB25C41DD240661F62C5241A01A2F1DFAB25C41DD2406610E295241A01A2F1DFAB25C41DD24066109295241A01A2F1DFAB25C41DD24066126255241A01A2F1DFAB25C41DD24066121255241A01A2F1DFAB25C41DD2406613E215241A01A2F1DDDB65C41DD2406613E215241A01A2F1DE2B65C41DD2406613E215241A01A2F1DCABA5C41DD2406613E215241A01A2F1DCABA5C41DD240661561D5241A01A2F1DADBE5C41DD240661561D5241A01A2F1DB2BE5C41DD240661561D5241A01A2F1D9AC25C41DD240661561D5241A01A2F1D9AC25C41DD24066169195241A01A2F1DB2BE5C41DD24066169195241A01A2F1DB2BE5C41DD24066186155241A01A2F1DB2BE5C41DD24066181155241A01A2F1DB2BE5C41DD2406619E115241A01A2F1D95C25C41DD2406619E115241A01A2F1D9AC25C41DD2406619E115241A01A2F1D7DC65C41DD2406619E115241A01A2F1D82C65C41DD2406619E115241A01A2F1D6ACA5C41DD2406619E115241A01A2F1D6ACA5C41DD240661B60D5241A01A2F1D4DCE5C41DD240661B60D5241A01A2F1D52CE5C41DD240661B60D5241A01A2F1D3AD25C41DD240661B60D5241A01A2F1D3AD25C41DD240661CE095241A01A2F1D1DD65C41DD240661CE095241A01A2F1D1DD65C41DD240661B60D5241A01A2F1D0ADA5C41DD240661B60D5241A01A2F1D0ADA5C41DD240661CE095241A01A2F1DF2DD5C41DD240661CE095241A01A2F1DF2DD5C41DD240661E6055241A01A2F1DF2DD5C41DD240661E1055241A01A2F1DF2DD5C41DD240661F9015241A01A2F1D0ADA5C41DD240661F9015241A01A2F1D0ADA5C41DD24066116FE5141A01A2F1D0ADA5C41DD24066111FE5141A01A2F1D0ADA5C41DD2406612EFA5141A01A2F1D0ADA5C41DD24066129FA5141A01A2F1D0ADA5C41DD24066141F65141A01A2F1D22D65C41DD24066141F65141A01A2F1D22D65C41DD24066159F25141A01A2F1D3AD25C41DD24066159F25141A01A2F1D3AD25C41DD24066176EE5141A01A2F1D3AD25C41DD24066171EE5141A01A2F1D3AD25C41DD2406618EEA5141A01A2F1D3AD25C41DD24066189EA5141A01A2F1D3AD25C41DD240661A1E65141A01A2F1D52CE5C41DD240661A1E65141A01A2F1D52CE5C41DD240661B9E25141A01A2F1D6ACA5C41DD240661B9E25141A01A2F1D6ACA5C41DD240661D6DE5141A01A2F1D52CE5C41DD240661D6DE5141A01A2F1D52CE5C41DD240661EEDA5141A01A2F1D52CE5C41DD240661E9DA5141A01A2F1D52CE5C41DD24066101D75141A01A2F1D6ACA5C41DD24066101D75141A01A2F1D65CA5C41DD24066101D75141A01A2F1D82C65C41DD24066101D75141A01A2F1D7DC65C41DD24066101D75141A01A2F1D9AC25C41DD24066101D75141A01A2F1D95C25C41DD24066101D75141A01A2F1DB2BE5C41DD24066101D75141A01A2F1DADBE5C41DD24066101D75141A01A2F1DCABA5C41DD24066101D75141A01A2F1DCABA5C41DD2406611ED35141A01A2F1DCABA5C41DD24066119D35141A01A2F1DCABA5C41DD24066131CF5141A01A2F1DE2B65C41DD24066131CF5141A01A2F1DE2B65C41DD2406614ECB5141'::public.geometry)),
    CONSTRAINT enforce_max_extent_rast CHECK (public.st_coveredby(public.st_convexhull(slope), '010300002034BF0D0001000000FB000000A01A2F1DE2B65C41DD2406614ECB5141A01A2F1DE2B65C41DD24066149CB5141A01A2F1DE2B65C41DD24066161C75141A01A2F1DFAB25C41DD24066161C75141A01A2F1DF5B25C41DD24066161C75141A01A2F1D12AF5C41DD24066161C75141A01A2F1D0DAF5C41DD24066161C75141A01A2F1D25AB5C41DD24066161C75141A01A2F1D25AB5C41DD24066149CB5141A01A2F1D25AB5C41DD2406614ECB5141A01A2F1D25AB5C41DD24066131CF5141A01A2F1D3DA75C41DD24066131CF5141A01A2F1D3DA75C41DD24066119D35141A01A2F1D5AA35C41DD24066119D35141A01A2F1D5AA35C41DD24066131CF5141A01A2F1D729F5C41DD24066131CF5141A01A2F1D729F5C41DD24066149CB5141A01A2F1D8A9B5C41DD24066149CB5141A01A2F1D859B5C41DD24066149CB5141A01A2F1DA2975C41DD24066149CB5141A01A2F1DA2975C41DD24066161C75141A01A2F1DBA935C41DD24066161C75141A01A2F1DB5935C41DD24066161C75141A01A2F1DD28F5C41DD24066161C75141A01A2F1DD28F5C41DD24066179C35141A01A2F1DEA8B5C41DD24066179C35141A01A2F1DEA8B5C41DD24066196BF5141A01A2F1DEA8B5C41DD24066191BF5141A01A2F1DEA8B5C41DD240661AEBB5141A01A2F1DEA8B5C41DD240661A9BB5141A01A2F1DEA8B5C41DD240661C6B75141A01A2F1DEA8B5C41DD240661C1B75141A01A2F1DEA8B5C41DD240661DEB35141A01A2F1DEA8B5C41DD240661D9B35141A01A2F1DEA8B5C41DD240661F1AF5141A01A2F1D02885C41DD240661F1AF5141A01A2F1D02885C41DD24066109AC5141A01A2F1D1A845C41DD24066109AC5141A01A2F1D15845C41DD24066109AC5141A01A2F1D32805C41DD24066109AC5141A01A2F1D2D805C41DD24066109AC5141A01A2F1D4A7C5C41DD24066109AC5141A01A2F1D457C5C41DD24066109AC5141A01A2F1D5D785C41DD24066109AC5141A01A2F1D5D785C41DD240661F1AF5141A01A2F1D5D785C41DD240661F6AF5141A01A2F1D5D785C41DD240661D9B35141A01A2F1D5D785C41DD240661DEB35141A01A2F1D5D785C41DD240661C6B75141A01A2F1D457C5C41DD240661C6B75141A01A2F1D457C5C41DD240661A9BB5141A01A2F1D5D785C41DD240661A9BB5141A01A2F1D5D785C41DD24066191BF5141A01A2F1D5D785C41DD24066196BF5141A01A2F1D5D785C41DD24066179C35141A01A2F1D75745C41DD24066179C35141A01A2F1D75745C41DD24066161C75141A01A2F1D75745C41DD24066166C75141A01A2F1D75745C41DD24066149CB5141A01A2F1D75745C41DD2406614ECB5141A01A2F1D75745C41DD24066131CF5141A01A2F1D75745C41DD24066136CF5141A01A2F1D75745C41DD24066119D35141A01A2F1D8D705C41DD24066119D35141A01A2F1D8D705C41DD24066101D75141A01A2F1D8D705C41DD24066106D75141A01A2F1D8D705C41DD240661E9DA5141A01A2F1DAA6C5C41DD240661E9DA5141A01A2F1DA56C5C41DD240661E9DA5141A01A2F1DBD685C41DD240661E9DA5141A01A2F1DBD685C41DD240661D1DE5141A01A2F1DDA645C41DD240661D1DE5141A01A2F1DD5645C41DD240661D1DE5141A01A2F1DF2605C41DD240661D1DE5141A01A2F1DED605C41DD240661D1DE5141A01A2F1D055D5C41DD240661D1DE5141A01A2F1D055D5C41DD240661B9E25141A01A2F1D055D5C41DD240661BEE25141A01A2F1D055D5C41DD240661A1E65141A01A2F1D1D595C41DD240661A1E65141A01A2F1D1D595C41DD24066189EA5141A01A2F1D1D595C41DD2406618EEA5141A01A2F1D1D595C41DD24066171EE5141A01A2F1D1D595C41DD24066176EE5141A01A2F1D1D595C41DD24066159F25141A01A2F1D35555C41DD24066159F25141A01A2F1D35555C41DD24066141F65141A01A2F1D4D515C41DD24066141F65141A01A2F1D4D515C41DD24066129FA5141A01A2F1D4D515C41DD2406612EFA5141A01A2F1D4D515C41DD24066111FE5141A01A2F1D4D515C41DD24066116FE5141A01A2F1D4D515C41DD240661F9015241A01A2F1D4D515C41DD240661FE015241A01A2F1D4D515C41DD240661E1055241A01A2F1D654D5C41DD240661E1055241A01A2F1D654D5C41DD240661C9095241A01A2F1D654D5C41DD240661CE095241A01A2F1D654D5C41DD240661B10D5241A01A2F1D654D5C41DD240661B60D5241A01A2F1D654D5C41DD24066199115241A01A2F1D654D5C41DD2406619E115241A01A2F1D654D5C41DD24066186155241A01A2F1D4D515C41DD24066186155241A01A2F1D52515C41DD24066186155241A01A2F1D35555C41DD24066186155241A01A2F1D3A555C41DD24066186155241A01A2F1D22595C41DD24066186155241A01A2F1D22595C41DD2406619E115241A01A2F1D055D5C41DD2406619E115241A01A2F1D055D5C41DD24066181155241A01A2F1D055D5C41DD24066186155241A01A2F1D055D5C41DD2406616E195241A01A2F1DED605C41DD2406616E195241A01A2F1DF2605C41DD2406616E195241A01A2F1DD5645C41DD2406616E195241A01A2F1DDA645C41DD2406616E195241A01A2F1DBD685C41DD2406616E195241A01A2F1DBD685C41DD240661561D5241A01A2F1DA56C5C41DD240661561D5241A01A2F1DAA6C5C41DD240661561D5241A01A2F1D8D705C41DD240661561D5241A01A2F1D92705C41DD240661561D5241A01A2F1D75745C41DD240661561D5241A01A2F1D75745C41DD24066139215241A01A2F1D8D705C41DD24066139215241A01A2F1D8D705C41DD24066121255241A01A2F1D8D705C41DD24066126255241A01A2F1D8D705C41DD2406610E295241A01A2F1D75745C41DD2406610E295241A01A2F1D7A745C41DD2406610E295241A01A2F1D5D785C41DD2406610E295241A01A2F1D5D785C41DD240661F62C5241A01A2F1D457C5C41DD240661F62C5241A01A2F1D457C5C41DD240661DE305241A01A2F1D2D805C41DD240661DE305241A01A2F1D2D805C41DD240661C1345241A01A2F1D2D805C41DD240661C6345241A01A2F1D2D805C41DD240661A9385241A01A2F1D457C5C41DD240661A9385241A01A2F1D457C5C41DD240661913C5241A01A2F1D457C5C41DD240661963C5241A01A2F1D457C5C41DD24066179405241A01A2F1D5D785C41DD24066179405241A01A2F1D5D785C41DD24066166445241A01A2F1D457C5C41DD24066166445241A01A2F1D4A7C5C41DD24066166445241A01A2F1D2D805C41DD24066166445241A01A2F1D32805C41DD24066166445241A01A2F1D15845C41DD24066166445241A01A2F1D15845C41DD2406614E485241A01A2F1DFD875C41DD2406614E485241A01A2F1D02885C41DD2406614E485241A01A2F1DE58B5C41DD2406614E485241A01A2F1DEA8B5C41DD2406614E485241A01A2F1DCD8F5C41DD2406614E485241A01A2F1DD28F5C41DD2406614E485241A01A2F1DBA935C41DD2406614E485241A01A2F1DBA935C41DD24066166445241A01A2F1DBA935C41DD24066161445241A01A2F1DBA935C41DD2406617E405241A01A2F1DBA935C41DD24066179405241A01A2F1DBA935C41DD240661963C5241A01A2F1D9D975C41DD240661963C5241A01A2F1DA2975C41DD240661963C5241A01A2F1D859B5C41DD240661963C5241A01A2F1D8A9B5C41DD240661963C5241A01A2F1D6D9F5C41DD240661963C5241A01A2F1D729F5C41DD240661963C5241A01A2F1D55A35C41DD240661963C5241A01A2F1D5AA35C41DD240661963C5241A01A2F1D42A75C41DD240661963C5241A01A2F1D42A75C41DD240661AE385241A01A2F1D2AAB5C41DD240661AE385241A01A2F1D2AAB5C41DD240661C6345241A01A2F1D2AAB5C41DD240661C1345241A01A2F1D2AAB5C41DD240661DE305241A01A2F1D12AF5C41DD240661DE305241A01A2F1D12AF5C41DD240661F62C5241A01A2F1DFAB25C41DD240661F62C5241A01A2F1DFAB25C41DD2406610E295241A01A2F1DFAB25C41DD24066109295241A01A2F1DFAB25C41DD24066126255241A01A2F1DFAB25C41DD24066121255241A01A2F1DFAB25C41DD2406613E215241A01A2F1DDDB65C41DD2406613E215241A01A2F1DE2B65C41DD2406613E215241A01A2F1DCABA5C41DD2406613E215241A01A2F1DCABA5C41DD240661561D5241A01A2F1DADBE5C41DD240661561D5241A01A2F1DB2BE5C41DD240661561D5241A01A2F1D9AC25C41DD240661561D5241A01A2F1D9AC25C41DD24066169195241A01A2F1DB2BE5C41DD24066169195241A01A2F1DB2BE5C41DD24066186155241A01A2F1DB2BE5C41DD24066181155241A01A2F1DB2BE5C41DD2406619E115241A01A2F1D95C25C41DD2406619E115241A01A2F1D9AC25C41DD2406619E115241A01A2F1D7DC65C41DD2406619E115241A01A2F1D82C65C41DD2406619E115241A01A2F1D6ACA5C41DD2406619E115241A01A2F1D6ACA5C41DD240661B60D5241A01A2F1D4DCE5C41DD240661B60D5241A01A2F1D52CE5C41DD240661B60D5241A01A2F1D3AD25C41DD240661B60D5241A01A2F1D3AD25C41DD240661CE095241A01A2F1D1DD65C41DD240661CE095241A01A2F1D1DD65C41DD240661B60D5241A01A2F1D0ADA5C41DD240661B60D5241A01A2F1D0ADA5C41DD240661CE095241A01A2F1DF2DD5C41DD240661CE095241A01A2F1DF2DD5C41DD240661E6055241A01A2F1DF2DD5C41DD240661E1055241A01A2F1DF2DD5C41DD240661F9015241A01A2F1D0ADA5C41DD240661F9015241A01A2F1D0ADA5C41DD24066116FE5141A01A2F1D0ADA5C41DD24066111FE5141A01A2F1D0ADA5C41DD2406612EFA5141A01A2F1D0ADA5C41DD24066129FA5141A01A2F1D0ADA5C41DD24066141F65141A01A2F1D22D65C41DD24066141F65141A01A2F1D22D65C41DD24066159F25141A01A2F1D3AD25C41DD24066159F25141A01A2F1D3AD25C41DD24066176EE5141A01A2F1D3AD25C41DD24066171EE5141A01A2F1D3AD25C41DD2406618EEA5141A01A2F1D3AD25C41DD24066189EA5141A01A2F1D3AD25C41DD240661A1E65141A01A2F1D52CE5C41DD240661A1E65141A01A2F1D52CE5C41DD240661B9E25141A01A2F1D6ACA5C41DD240661B9E25141A01A2F1D6ACA5C41DD240661D6DE5141A01A2F1D52CE5C41DD240661D6DE5141A01A2F1D52CE5C41DD240661EEDA5141A01A2F1D52CE5C41DD240661E9DA5141A01A2F1D52CE5C41DD24066101D75141A01A2F1D6ACA5C41DD24066101D75141A01A2F1D65CA5C41DD24066101D75141A01A2F1D82C65C41DD24066101D75141A01A2F1D7DC65C41DD24066101D75141A01A2F1D9AC25C41DD24066101D75141A01A2F1D95C25C41DD24066101D75141A01A2F1DB2BE5C41DD24066101D75141A01A2F1DADBE5C41DD24066101D75141A01A2F1DCABA5C41DD24066101D75141A01A2F1DCABA5C41DD2406611ED35141A01A2F1DCABA5C41DD24066119D35141A01A2F1DCABA5C41DD24066131CF5141A01A2F1DE2B65C41DD24066131CF5141A01A2F1DE2B65C41DD2406614ECB5141'::public.geometry)),
    CONSTRAINT enforce_max_extent_slope CHECK (public.st_coveredby(public.st_convexhull(elevation), '010300002034BF0D0001000000FB000000A01A2F1DE2B65C41DD2406614ECB5141A01A2F1DE2B65C41DD24066149CB5141A01A2F1DE2B65C41DD24066161C75141A01A2F1DFAB25C41DD24066161C75141A01A2F1DF5B25C41DD24066161C75141A01A2F1D12AF5C41DD24066161C75141A01A2F1D0DAF5C41DD24066161C75141A01A2F1D25AB5C41DD24066161C75141A01A2F1D25AB5C41DD24066149CB5141A01A2F1D25AB5C41DD2406614ECB5141A01A2F1D25AB5C41DD24066131CF5141A01A2F1D3DA75C41DD24066131CF5141A01A2F1D3DA75C41DD24066119D35141A01A2F1D5AA35C41DD24066119D35141A01A2F1D5AA35C41DD24066131CF5141A01A2F1D729F5C41DD24066131CF5141A01A2F1D729F5C41DD24066149CB5141A01A2F1D8A9B5C41DD24066149CB5141A01A2F1D859B5C41DD24066149CB5141A01A2F1DA2975C41DD24066149CB5141A01A2F1DA2975C41DD24066161C75141A01A2F1DBA935C41DD24066161C75141A01A2F1DB5935C41DD24066161C75141A01A2F1DD28F5C41DD24066161C75141A01A2F1DD28F5C41DD24066179C35141A01A2F1DEA8B5C41DD24066179C35141A01A2F1DEA8B5C41DD24066196BF5141A01A2F1DEA8B5C41DD24066191BF5141A01A2F1DEA8B5C41DD240661AEBB5141A01A2F1DEA8B5C41DD240661A9BB5141A01A2F1DEA8B5C41DD240661C6B75141A01A2F1DEA8B5C41DD240661C1B75141A01A2F1DEA8B5C41DD240661DEB35141A01A2F1DEA8B5C41DD240661D9B35141A01A2F1DEA8B5C41DD240661F1AF5141A01A2F1D02885C41DD240661F1AF5141A01A2F1D02885C41DD24066109AC5141A01A2F1D1A845C41DD24066109AC5141A01A2F1D15845C41DD24066109AC5141A01A2F1D32805C41DD24066109AC5141A01A2F1D2D805C41DD24066109AC5141A01A2F1D4A7C5C41DD24066109AC5141A01A2F1D457C5C41DD24066109AC5141A01A2F1D5D785C41DD24066109AC5141A01A2F1D5D785C41DD240661F1AF5141A01A2F1D5D785C41DD240661F6AF5141A01A2F1D5D785C41DD240661D9B35141A01A2F1D5D785C41DD240661DEB35141A01A2F1D5D785C41DD240661C6B75141A01A2F1D457C5C41DD240661C6B75141A01A2F1D457C5C41DD240661A9BB5141A01A2F1D5D785C41DD240661A9BB5141A01A2F1D5D785C41DD24066191BF5141A01A2F1D5D785C41DD24066196BF5141A01A2F1D5D785C41DD24066179C35141A01A2F1D75745C41DD24066179C35141A01A2F1D75745C41DD24066161C75141A01A2F1D75745C41DD24066166C75141A01A2F1D75745C41DD24066149CB5141A01A2F1D75745C41DD2406614ECB5141A01A2F1D75745C41DD24066131CF5141A01A2F1D75745C41DD24066136CF5141A01A2F1D75745C41DD24066119D35141A01A2F1D8D705C41DD24066119D35141A01A2F1D8D705C41DD24066101D75141A01A2F1D8D705C41DD24066106D75141A01A2F1D8D705C41DD240661E9DA5141A01A2F1DAA6C5C41DD240661E9DA5141A01A2F1DA56C5C41DD240661E9DA5141A01A2F1DBD685C41DD240661E9DA5141A01A2F1DBD685C41DD240661D1DE5141A01A2F1DDA645C41DD240661D1DE5141A01A2F1DD5645C41DD240661D1DE5141A01A2F1DF2605C41DD240661D1DE5141A01A2F1DED605C41DD240661D1DE5141A01A2F1D055D5C41DD240661D1DE5141A01A2F1D055D5C41DD240661B9E25141A01A2F1D055D5C41DD240661BEE25141A01A2F1D055D5C41DD240661A1E65141A01A2F1D1D595C41DD240661A1E65141A01A2F1D1D595C41DD24066189EA5141A01A2F1D1D595C41DD2406618EEA5141A01A2F1D1D595C41DD24066171EE5141A01A2F1D1D595C41DD24066176EE5141A01A2F1D1D595C41DD24066159F25141A01A2F1D35555C41DD24066159F25141A01A2F1D35555C41DD24066141F65141A01A2F1D4D515C41DD24066141F65141A01A2F1D4D515C41DD24066129FA5141A01A2F1D4D515C41DD2406612EFA5141A01A2F1D4D515C41DD24066111FE5141A01A2F1D4D515C41DD24066116FE5141A01A2F1D4D515C41DD240661F9015241A01A2F1D4D515C41DD240661FE015241A01A2F1D4D515C41DD240661E1055241A01A2F1D654D5C41DD240661E1055241A01A2F1D654D5C41DD240661C9095241A01A2F1D654D5C41DD240661CE095241A01A2F1D654D5C41DD240661B10D5241A01A2F1D654D5C41DD240661B60D5241A01A2F1D654D5C41DD24066199115241A01A2F1D654D5C41DD2406619E115241A01A2F1D654D5C41DD24066186155241A01A2F1D4D515C41DD24066186155241A01A2F1D52515C41DD24066186155241A01A2F1D35555C41DD24066186155241A01A2F1D3A555C41DD24066186155241A01A2F1D22595C41DD24066186155241A01A2F1D22595C41DD2406619E115241A01A2F1D055D5C41DD2406619E115241A01A2F1D055D5C41DD24066181155241A01A2F1D055D5C41DD24066186155241A01A2F1D055D5C41DD2406616E195241A01A2F1DED605C41DD2406616E195241A01A2F1DF2605C41DD2406616E195241A01A2F1DD5645C41DD2406616E195241A01A2F1DDA645C41DD2406616E195241A01A2F1DBD685C41DD2406616E195241A01A2F1DBD685C41DD240661561D5241A01A2F1DA56C5C41DD240661561D5241A01A2F1DAA6C5C41DD240661561D5241A01A2F1D8D705C41DD240661561D5241A01A2F1D92705C41DD240661561D5241A01A2F1D75745C41DD240661561D5241A01A2F1D75745C41DD24066139215241A01A2F1D8D705C41DD24066139215241A01A2F1D8D705C41DD24066121255241A01A2F1D8D705C41DD24066126255241A01A2F1D8D705C41DD2406610E295241A01A2F1D75745C41DD2406610E295241A01A2F1D7A745C41DD2406610E295241A01A2F1D5D785C41DD2406610E295241A01A2F1D5D785C41DD240661F62C5241A01A2F1D457C5C41DD240661F62C5241A01A2F1D457C5C41DD240661DE305241A01A2F1D2D805C41DD240661DE305241A01A2F1D2D805C41DD240661C1345241A01A2F1D2D805C41DD240661C6345241A01A2F1D2D805C41DD240661A9385241A01A2F1D457C5C41DD240661A9385241A01A2F1D457C5C41DD240661913C5241A01A2F1D457C5C41DD240661963C5241A01A2F1D457C5C41DD24066179405241A01A2F1D5D785C41DD24066179405241A01A2F1D5D785C41DD24066166445241A01A2F1D457C5C41DD24066166445241A01A2F1D4A7C5C41DD24066166445241A01A2F1D2D805C41DD24066166445241A01A2F1D32805C41DD24066166445241A01A2F1D15845C41DD24066166445241A01A2F1D15845C41DD2406614E485241A01A2F1DFD875C41DD2406614E485241A01A2F1D02885C41DD2406614E485241A01A2F1DE58B5C41DD2406614E485241A01A2F1DEA8B5C41DD2406614E485241A01A2F1DCD8F5C41DD2406614E485241A01A2F1DD28F5C41DD2406614E485241A01A2F1DBA935C41DD2406614E485241A01A2F1DBA935C41DD24066166445241A01A2F1DBA935C41DD24066161445241A01A2F1DBA935C41DD2406617E405241A01A2F1DBA935C41DD24066179405241A01A2F1DBA935C41DD240661963C5241A01A2F1D9D975C41DD240661963C5241A01A2F1DA2975C41DD240661963C5241A01A2F1D859B5C41DD240661963C5241A01A2F1D8A9B5C41DD240661963C5241A01A2F1D6D9F5C41DD240661963C5241A01A2F1D729F5C41DD240661963C5241A01A2F1D55A35C41DD240661963C5241A01A2F1D5AA35C41DD240661963C5241A01A2F1D42A75C41DD240661963C5241A01A2F1D42A75C41DD240661AE385241A01A2F1D2AAB5C41DD240661AE385241A01A2F1D2AAB5C41DD240661C6345241A01A2F1D2AAB5C41DD240661C1345241A01A2F1D2AAB5C41DD240661DE305241A01A2F1D12AF5C41DD240661DE305241A01A2F1D12AF5C41DD240661F62C5241A01A2F1DFAB25C41DD240661F62C5241A01A2F1DFAB25C41DD2406610E295241A01A2F1DFAB25C41DD24066109295241A01A2F1DFAB25C41DD24066126255241A01A2F1DFAB25C41DD24066121255241A01A2F1DFAB25C41DD2406613E215241A01A2F1DDDB65C41DD2406613E215241A01A2F1DE2B65C41DD2406613E215241A01A2F1DCABA5C41DD2406613E215241A01A2F1DCABA5C41DD240661561D5241A01A2F1DADBE5C41DD240661561D5241A01A2F1DB2BE5C41DD240661561D5241A01A2F1D9AC25C41DD240661561D5241A01A2F1D9AC25C41DD24066169195241A01A2F1DB2BE5C41DD24066169195241A01A2F1DB2BE5C41DD24066186155241A01A2F1DB2BE5C41DD24066181155241A01A2F1DB2BE5C41DD2406619E115241A01A2F1D95C25C41DD2406619E115241A01A2F1D9AC25C41DD2406619E115241A01A2F1D7DC65C41DD2406619E115241A01A2F1D82C65C41DD2406619E115241A01A2F1D6ACA5C41DD2406619E115241A01A2F1D6ACA5C41DD240661B60D5241A01A2F1D4DCE5C41DD240661B60D5241A01A2F1D52CE5C41DD240661B60D5241A01A2F1D3AD25C41DD240661B60D5241A01A2F1D3AD25C41DD240661CE095241A01A2F1D1DD65C41DD240661CE095241A01A2F1D1DD65C41DD240661B60D5241A01A2F1D0ADA5C41DD240661B60D5241A01A2F1D0ADA5C41DD240661CE095241A01A2F1DF2DD5C41DD240661CE095241A01A2F1DF2DD5C41DD240661E6055241A01A2F1DF2DD5C41DD240661E1055241A01A2F1DF2DD5C41DD240661F9015241A01A2F1D0ADA5C41DD240661F9015241A01A2F1D0ADA5C41DD24066116FE5141A01A2F1D0ADA5C41DD24066111FE5141A01A2F1D0ADA5C41DD2406612EFA5141A01A2F1D0ADA5C41DD24066129FA5141A01A2F1D0ADA5C41DD24066141F65141A01A2F1D22D65C41DD24066141F65141A01A2F1D22D65C41DD24066159F25141A01A2F1D3AD25C41DD24066159F25141A01A2F1D3AD25C41DD24066176EE5141A01A2F1D3AD25C41DD24066171EE5141A01A2F1D3AD25C41DD2406618EEA5141A01A2F1D3AD25C41DD24066189EA5141A01A2F1D3AD25C41DD240661A1E65141A01A2F1D52CE5C41DD240661A1E65141A01A2F1D52CE5C41DD240661B9E25141A01A2F1D6ACA5C41DD240661B9E25141A01A2F1D6ACA5C41DD240661D6DE5141A01A2F1D52CE5C41DD240661D6DE5141A01A2F1D52CE5C41DD240661EEDA5141A01A2F1D52CE5C41DD240661E9DA5141A01A2F1D52CE5C41DD24066101D75141A01A2F1D6ACA5C41DD24066101D75141A01A2F1D65CA5C41DD24066101D75141A01A2F1D82C65C41DD24066101D75141A01A2F1D7DC65C41DD24066101D75141A01A2F1D9AC25C41DD24066101D75141A01A2F1D95C25C41DD24066101D75141A01A2F1DB2BE5C41DD24066101D75141A01A2F1DADBE5C41DD24066101D75141A01A2F1DCABA5C41DD24066101D75141A01A2F1DCABA5C41DD2406611ED35141A01A2F1DCABA5C41DD24066119D35141A01A2F1DCABA5C41DD24066131CF5141A01A2F1DE2B65C41DD24066131CF5141A01A2F1DE2B65C41DD2406614ECB5141'::public.geometry)),
    CONSTRAINT enforce_nodata_values_slope CHECK (((public._raster_constraint_nodata_values(elevation))::numeric(16,10)[] = '{NULL}'::numeric(16,10)[])),
    CONSTRAINT enforce_num_bands_expostion CHECK ((public.st_numbands(exposition) = 1)),
    CONSTRAINT enforce_num_bands_rast CHECK ((public.st_numbands(slope) = 1)),
    CONSTRAINT enforce_num_bands_slope CHECK ((public.st_numbands(elevation) = 1)),
    CONSTRAINT enforce_out_db_expostion CHECK ((public._raster_constraint_out_db(exposition) = '{f}'::boolean[])),
    CONSTRAINT enforce_out_db_rast CHECK ((public._raster_constraint_out_db(slope) = '{f}'::boolean[])),
    CONSTRAINT enforce_out_db_slope CHECK ((public._raster_constraint_out_db(elevation) = '{f}'::boolean[])),
    CONSTRAINT enforce_pixel_types_expostion CHECK ((public._raster_constraint_pixel_types(exposition) = '{32BF}'::text[])),
    CONSTRAINT enforce_pixel_types_slope CHECK ((public._raster_constraint_pixel_types(elevation) = '{16BSI}'::text[])),
    CONSTRAINT enforce_same_alignment_expostion CHECK (public.st_samealignment(exposition, '0100000000000000000000344000000000000034C0A01A2F1DBD685C41DD240661D6DE51410000000000000000000000000000000034BF0D0001000100'::public.raster)),
    CONSTRAINT enforce_same_alignment_rast CHECK (public.st_samealignment(slope, '0100000000000000000000344000000000000034C0A01A2F1DBD685C41DD240661D6DE51410000000000000000000000000000000034BF0D0001000100'::public.raster)),
    CONSTRAINT enforce_same_alignment_slope CHECK (public.st_samealignment(elevation, '0100000000000000000000344000000000000034C0A01A2F1DBD685C41DD240661D6DE51410000000000000000000000000000000034BF0D0001000100'::public.raster)),
    CONSTRAINT enforce_scalex_expostion CHECK (((public.st_scalex(exposition))::numeric(16,10) = (20)::numeric(16,10))),
    CONSTRAINT enforce_scalex_rast CHECK (((public.st_scalex(slope))::numeric(16,10) = (20)::numeric(16,10))),
    CONSTRAINT enforce_scalex_slope CHECK (((public.st_scalex(elevation))::numeric(16,10) = (20)::numeric(16,10))),
    CONSTRAINT enforce_scaley_expostion CHECK (((public.st_scaley(exposition))::numeric(16,10) = ('-20'::integer)::numeric(16,10))),
    CONSTRAINT enforce_scaley_rast CHECK (((public.st_scaley(slope))::numeric(16,10) = ('-20'::integer)::numeric(16,10))),
    CONSTRAINT enforce_scaley_slope CHECK (((public.st_scaley(elevation))::numeric(16,10) = ('-20'::integer)::numeric(16,10))),
    CONSTRAINT enforce_srid_expostion CHECK ((public.st_srid(exposition) = 900916)),
    CONSTRAINT enforce_srid_rast CHECK ((public.st_srid(slope) = 900916)),
    CONSTRAINT enforce_srid_slope CHECK ((public.st_srid(elevation) = 900916)),
    CONSTRAINT enforce_width_expostion CHECK ((public.st_width(exposition) = 201)),
    CONSTRAINT enforce_width_rast CHECK ((public.st_width(slope) = 201)),
    CONSTRAINT enforce_width_slope CHECK ((public.st_width(elevation) = 201))
);


--
-- TOC entry 599 (class 1259 OID 73142)
-- Name: tgis_surfacedata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_surfacedata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8806 (class 0 OID 0)
-- Dependencies: 599
-- Name: tgis_surfacedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_surfacedata_id_seq OWNED BY public.tgis_surfacedata.id;


--
-- TOC entry 600 (class 1259 OID 73144)
-- Name: tgis_wr_lake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_wr_lake (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,900916),
    gridcode integer,
    name character varying(60)
);


--
-- TOC entry 601 (class 1259 OID 73150)
-- Name: tgis_wr_lake_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgis_wr_lake_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8807 (class 0 OID 0)
-- Dependencies: 601
-- Name: tgis_wr_lake_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgis_wr_lake_id_seq OWNED BY public.tgis_wr_lake.id;


--
-- TOC entry 602 (class 1259 OID 73152)
-- Name: tgis_wr_river; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_wr_river (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,900916),
    ogc_fid bigint,
    name_1 character varying,
    type_1 character varying
);


--
-- TOC entry 603 (class 1259 OID 73158)
-- Name: tgis_zonat_mbrojtura_ammk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgis_zonat_mbrojtura_ammk (
    id character varying NOT NULL,
    geom public.geometry(MultiPolygon,900916),
    name character varying(254),
    status character varying(254)
);


--
-- TOC entry 604 (class 1259 OID 73164)
-- Name: tgiscadastrezone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgiscadastrezone (
    gid integer NOT NULL,
    cadastrezo numeric,
    cadastrez0 character varying(254),
    cadastrez1 character varying(254),
    cadastrez2 character varying(254),
    cadastrez3 character varying(254),
    cadastrez4 numeric,
    municipali numeric,
    geom public.geometry(MultiPolygon,900916)
);


--
-- TOC entry 605 (class 1259 OID 73170)
-- Name: tgiscadastrezone_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgiscadastrezone_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8808 (class 0 OID 0)
-- Dependencies: 605
-- Name: tgiscadastrezone_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgiscadastrezone_gid_seq OWNED BY public.tgiscadastrezone.gid;


--
-- TOC entry 606 (class 1259 OID 73172)
-- Name: tgismun; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tgismun (
    gid integer NOT NULL,
    municipali numeric,
    municipal0 character varying(254),
    municipal1 character varying(254),
    municipal2 character varying(254),
    municipal3 character varying(254),
    stateid numeric,
    geom public.geometry(MultiPolygon,900916)
);


--
-- TOC entry 607 (class 1259 OID 73178)
-- Name: tgismun_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tgismun_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8809 (class 0 OID 0)
-- Dependencies: 607
-- Name: tgismun_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tgismun_gid_seq OWNED BY public.tgismun.gid;


--
-- TOC entry 608 (class 1259 OID 73180)
-- Name: thrm_ann_plan_employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_ann_plan_employee (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    ann_plan_id integer NOT NULL
);


--
-- TOC entry 609 (class 1259 OID 73183)
-- Name: thrm_ann_plan_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_ann_plan_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8810 (class 0 OID 0)
-- Dependencies: 609
-- Name: thrm_ann_plan_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_ann_plan_employee_id_seq OWNED BY public.thrm_ann_plan_employee.id;


--
-- TOC entry 610 (class 1259 OID 73185)
-- Name: thrm_annual_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_annual_plan (
    id bigint NOT NULL,
    annual_plan_al character varying(50) NOT NULL,
    annual_plan_en character varying(50) NOT NULL,
    annual_plan_sr character varying(50) NOT NULL,
    submission_date date,
    current_status integer,
    comment text
);


--
-- TOC entry 611 (class 1259 OID 73191)
-- Name: thrm_annual_plan_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_annual_plan_doc (
    id bigint NOT NULL,
    annual_plan_id bigint NOT NULL,
    status_name character varying(3),
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 612 (class 1259 OID 73198)
-- Name: thrm_annual_plan_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_annual_plan_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8811 (class 0 OID 0)
-- Dependencies: 612
-- Name: thrm_annual_plan_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_annual_plan_doc_id_seq OWNED BY public.thrm_annual_plan_doc.id;


--
-- TOC entry 613 (class 1259 OID 73200)
-- Name: thrm_annual_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_annual_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8812 (class 0 OID 0)
-- Dependencies: 613
-- Name: thrm_annual_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_annual_plan_id_seq OWNED BY public.thrm_annual_plan.id;


--
-- TOC entry 614 (class 1259 OID 73202)
-- Name: thrm_annual_plan_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_annual_plan_status (
    id integer NOT NULL,
    annual_plan_id integer NOT NULL,
    status character varying(3) NOT NULL,
    note text,
    create_by integer NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 615 (class 1259 OID 73209)
-- Name: thrm_annual_plan_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_annual_plan_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8813 (class 0 OID 0)
-- Dependencies: 615
-- Name: thrm_annual_plan_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_annual_plan_status_id_seq OWNED BY public.thrm_annual_plan_status.id;


--
-- TOC entry 616 (class 1259 OID 73211)
-- Name: thrm_attendance_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_attendance_record (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    punch_in_utc_time timestamp without time zone,
    punch_in_note character varying(255),
    punch_in_user_time timestamp without time zone,
    punch_out_utc_time timestamp without time zone,
    punch_out_note character varying(255),
    punch_out_user_time timestamp without time zone,
    status character varying(2) NOT NULL,
    supervisor_id integer,
    supervisor_date timestamp without time zone,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_attendance_record_status_check CHECK (((status)::text = ANY (ARRAY[('P'::character varying)::text, ('HP'::character varying)::text, ('A'::character varying)::text, ('H'::character varying)::text, ('AN'::character varying)::text, ('MT'::character varying)::text, ('ME'::character varying)::text, ('AA'::character varying)::text, ('S'::character varying)::text])))
);


--
-- TOC entry 617 (class 1259 OID 73219)
-- Name: thrm_attendance_record_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_attendance_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8814 (class 0 OID 0)
-- Dependencies: 617
-- Name: thrm_attendance_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_attendance_record_id_seq OWNED BY public.thrm_attendance_record.id;


--
-- TOC entry 618 (class 1259 OID 73221)
-- Name: thrm_decision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_decision (
    id bigint NOT NULL,
    decision_type integer NOT NULL,
    current_status integer,
    date_of_request date NOT NULL,
    note text
);


--
-- TOC entry 619 (class 1259 OID 73227)
-- Name: thrm_decision_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_decision_doc (
    id bigint NOT NULL,
    decision_id bigint NOT NULL,
    status_name character varying(3),
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 620 (class 1259 OID 73234)
-- Name: thrm_decision_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_decision_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8815 (class 0 OID 0)
-- Dependencies: 620
-- Name: thrm_decision_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_decision_doc_id_seq OWNED BY public.thrm_decision_doc.id;


--
-- TOC entry 621 (class 1259 OID 73236)
-- Name: thrm_decision_employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_decision_employee (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    decision_id integer NOT NULL
);


--
-- TOC entry 622 (class 1259 OID 73239)
-- Name: thrm_decision_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_decision_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8816 (class 0 OID 0)
-- Dependencies: 622
-- Name: thrm_decision_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_decision_employee_id_seq OWNED BY public.thrm_decision_employee.id;


--
-- TOC entry 623 (class 1259 OID 73241)
-- Name: thrm_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8817 (class 0 OID 0)
-- Dependencies: 623
-- Name: thrm_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_decision_id_seq OWNED BY public.thrm_decision.id;


--
-- TOC entry 624 (class 1259 OID 73243)
-- Name: thrm_decision_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_decision_status (
    id integer NOT NULL,
    decision_id integer NOT NULL,
    status character varying(3) NOT NULL,
    note text,
    create_by integer NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 625 (class 1259 OID 73250)
-- Name: thrm_decision_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_decision_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8818 (class 0 OID 0)
-- Dependencies: 625
-- Name: thrm_decision_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_decision_status_id_seq OWNED BY public.thrm_decision_status.id;


--
-- TOC entry 626 (class 1259 OID 73252)
-- Name: thrm_decision_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_decision_type (
    id bigint NOT NULL,
    name_al character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    name_sr character varying(255),
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 627 (class 1259 OID 73259)
-- Name: thrm_decision_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_decision_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8819 (class 0 OID 0)
-- Dependencies: 627
-- Name: thrm_decision_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_decision_type_id_seq OWNED BY public.thrm_decision_type.id;


--
-- TOC entry 628 (class 1259 OID 73261)
-- Name: thrm_employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee (
    id integer NOT NULL,
    organisation_id integer NOT NULL,
    person_id integer NOT NULL,
    conctract_type character(3) NOT NULL,
    job_title character varying(3) NOT NULL,
    functional_title character varying(100),
    grade character varying(100),
    payroll character varying(20) DEFAULT 'TBD'::character varying NOT NULL,
    keycode character varying(10) DEFAULT '9999'::character varying NOT NULL,
    emp_ssn_num character varying(100) DEFAULT ''::character varying,
    emp_sin_num character varying(100) DEFAULT ''::character varying,
    emp_other_id character varying(100) DEFAULT ''::character varying,
    work_station character varying(30) DEFAULT NULL::character varying,
    step character varying(100),
    date_from date,
    date_to date,
    role_code character varying(2) NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    CONSTRAINT thrm_employee_conctract_type_check CHECK ((conctract_type = ANY (ARRAY['FTC'::bpchar, 'PTC'::bpchar, 'FTP'::bpchar, 'PTP'::bpchar, 'REC'::bpchar])))
);


--
-- TOC entry 629 (class 1259 OID 73274)
-- Name: thrm_employee_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_doc (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    document_type character varying(2) NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_employee_doc_document_type_check CHECK (((document_type)::text = ANY (ARRAY[('PE'::character varying)::text, ('EM'::character varying)::text, ('RE'::character varying)::text, ('OT'::character varying)::text])))
);


--
-- TOC entry 630 (class 1259 OID 73282)
-- Name: thrm_employee_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8820 (class 0 OID 0)
-- Dependencies: 630
-- Name: thrm_employee_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_doc_id_seq OWNED BY public.thrm_employee_doc.id;


--
-- TOC entry 631 (class 1259 OID 73284)
-- Name: thrm_employee_language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_language (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    language_id integer NOT NULL,
    reading character varying(3) NOT NULL,
    speaking character varying(3) NOT NULL,
    writing character varying(3) NOT NULL,
    understanding character varying(3) NOT NULL,
    CONSTRAINT thrm_employee_language_reading_check CHECK (((reading)::text = ANY (ARRAY[('EP'::character varying)::text, ('LWP'::character varying)::text, ('PWP'::character varying)::text, ('FPP'::character varying)::text, ('NBP'::character varying)::text]))),
    CONSTRAINT thrm_employee_language_speaking_check CHECK (((speaking)::text = ANY (ARRAY[('EP'::character varying)::text, ('LWP'::character varying)::text, ('PWP'::character varying)::text, ('FPP'::character varying)::text, ('NBP'::character varying)::text]))),
    CONSTRAINT thrm_employee_language_understanding_check CHECK (((understanding)::text = ANY (ARRAY[('EP'::character varying)::text, ('LWP'::character varying)::text, ('PWP'::character varying)::text, ('FPP'::character varying)::text, ('NBP'::character varying)::text]))),
    CONSTRAINT thrm_employee_language_writing_check CHECK (((writing)::text = ANY (ARRAY[('EP'::character varying)::text, ('LWP'::character varying)::text, ('PWP'::character varying)::text, ('FPP'::character varying)::text, ('NBP'::character varying)::text])))
);


--
-- TOC entry 632 (class 1259 OID 73291)
-- Name: thrm_employee_language_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8821 (class 0 OID 0)
-- Dependencies: 632
-- Name: thrm_employee_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_language_id_seq OWNED BY public.thrm_employee_language.id;


--
-- TOC entry 861 (class 1259 OID 115348)
-- Name: thrm_employee_salary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    grosssalary numeric(8,2),
    basicsalary numeric(8,2),
    regularworkhours integer,
    payperiod character varying(1) DEFAULT 'm'::character varying NOT NULL,
    autopay boolean DEFAULT false NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 854 (class 1259 OID 106362)
-- Name: thrm_employee_salary_adds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_adds (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    add_date date NOT NULL,
    fin_type_id integer NOT NULL,
    amount numeric(8,2) NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 853 (class 1259 OID 106360)
-- Name: thrm_employee_salary_adds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_adds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8822 (class 0 OID 0)
-- Dependencies: 853
-- Name: thrm_employee_salary_adds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_adds_id_seq OWNED BY public.thrm_employee_salary_adds.id;


--
-- TOC entry 865 (class 1259 OID 115401)
-- Name: thrm_employee_salary_adjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_adjustment (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    salary_id integer NOT NULL,
    adjustment_date date NOT NULL,
    fin_type_id integer NOT NULL,
    calculation_type character varying(3) NOT NULL,
    amount_type character varying(5) NOT NULL,
    amount numeric(8,2),
    amount_percentage numeric(5,2),
    amount_percentage_calc numeric(8,2),
    hoursworked numeric(8,2),
    hourlyrate numeric(8,2),
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_employee_salary_adjustment_amount_type_check CHECK (((amount_type)::text = ANY ((ARRAY['ONGRO'::character varying, 'BFTAX'::character varying, 'ONTAX'::character varying, 'AFTAX'::character varying, 'ONNET'::character varying, 'FINET'::character varying])::text[]))),
    CONSTRAINT thrm_employee_salary_adjustment_calculation_type_check CHECK (((calculation_type)::text = ANY ((ARRAY['ADD'::character varying, 'SUB'::character varying, 'NOP'::character varying])::text[])))
);


--
-- TOC entry 864 (class 1259 OID 115399)
-- Name: thrm_employee_salary_adjustment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_adjustment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8823 (class 0 OID 0)
-- Dependencies: 864
-- Name: thrm_employee_salary_adjustment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_adjustment_id_seq OWNED BY public.thrm_employee_salary_adjustment.id;


--
-- TOC entry 850 (class 1259 OID 106308)
-- Name: thrm_employee_salary_bonus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_bonus (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    fin_type_id integer NOT NULL,
    bonusdate date NOT NULL,
    amount numeric(8,2) NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 849 (class 1259 OID 106306)
-- Name: thrm_employee_salary_bonus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_bonus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8824 (class 0 OID 0)
-- Dependencies: 849
-- Name: thrm_employee_salary_bonus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_bonus_id_seq OWNED BY public.thrm_employee_salary_bonus.id;


--
-- TOC entry 852 (class 1259 OID 106335)
-- Name: thrm_employee_salary_deductions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_deductions (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    deduction_date date NOT NULL,
    fin_type_id integer NOT NULL,
    amount numeric(8,2) NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 851 (class 1259 OID 106333)
-- Name: thrm_employee_salary_deductions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_deductions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8825 (class 0 OID 0)
-- Dependencies: 851
-- Name: thrm_employee_salary_deductions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_deductions_id_seq OWNED BY public.thrm_employee_salary_deductions.id;


--
-- TOC entry 860 (class 1259 OID 115346)
-- Name: thrm_employee_salary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8826 (class 0 OID 0)
-- Dependencies: 860
-- Name: thrm_employee_salary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_id_seq OWNED BY public.thrm_employee_salary.id;


--
-- TOC entry 863 (class 1259 OID 115369)
-- Name: thrm_employee_salary_payroll; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_payroll (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    salary_id integer NOT NULL,
    fin_type_id integer,
    fiscal_year integer NOT NULL,
    pay_month smallint NOT NULL,
    payroll_date date NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    taxpay numeric(8,2) NOT NULL,
    grosspay numeric(8,2) NOT NULL,
    netpay numeric(8,2) NOT NULL,
    salaryyear numeric(8,2) NOT NULL,
    salarymonth numeric(8,2) NOT NULL,
    hoursworked numeric(8,2),
    status character varying(3) DEFAULT 'NEW'::character varying NOT NULL,
    fin_date timestamp without time zone,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 867 (class 1259 OID 115437)
-- Name: thrm_employee_salary_payroll_adjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_payroll_adjustment (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    payroll_id integer NOT NULL,
    adjustment_date date NOT NULL,
    fin_type_id integer NOT NULL,
    calculation_type character varying(3) NOT NULL,
    amount_type character varying(5) NOT NULL,
    amount numeric(8,2),
    amount_percentage numeric(5,2),
    amount_percentage_calc numeric(8,2),
    hoursworked numeric(8,2),
    hourlyrate numeric(8,2),
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_employee_salary_payroll_adjustment_amount_type_check CHECK (((amount_type)::text = ANY ((ARRAY['ONGRO'::character varying, 'BFTAX'::character varying, 'ONTAX'::character varying, 'AFTAX'::character varying, 'ONNET'::character varying, 'FINET'::character varying])::text[]))),
    CONSTRAINT thrm_employee_salary_payroll_adjustment_calculation_type_check CHECK (((calculation_type)::text = ANY ((ARRAY['ADD'::character varying, 'SUB'::character varying, 'NOP'::character varying])::text[])))
);


--
-- TOC entry 866 (class 1259 OID 115435)
-- Name: thrm_employee_salary_payroll_adjustment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_payroll_adjustment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8827 (class 0 OID 0)
-- Dependencies: 866
-- Name: thrm_employee_salary_payroll_adjustment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_payroll_adjustment_id_seq OWNED BY public.thrm_employee_salary_payroll_adjustment.id;


--
-- TOC entry 862 (class 1259 OID 115367)
-- Name: thrm_employee_salary_payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_payroll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8828 (class 0 OID 0)
-- Dependencies: 862
-- Name: thrm_employee_salary_payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_payroll_id_seq OWNED BY public.thrm_employee_salary_payroll.id;


--
-- TOC entry 859 (class 1259 OID 115330)
-- Name: thrm_employee_salary_tax_rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_salary_tax_rates (
    id bigint NOT NULL,
    tax_norm_name character varying(30) NOT NULL,
    percentage numeric(3,2) NOT NULL,
    start_amount numeric(8,2) NOT NULL,
    end_amount numeric(8,2) NOT NULL,
    valid_date_from date NOT NULL,
    valid_date_to date NOT NULL,
    valid boolean DEFAULT true NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 858 (class 1259 OID 115328)
-- Name: thrm_employee_salary_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_salary_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8829 (class 0 OID 0)
-- Dependencies: 858
-- Name: thrm_employee_salary_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_salary_tax_rates_id_seq OWNED BY public.thrm_employee_salary_tax_rates.id;


--
-- TOC entry 633 (class 1259 OID 73293)
-- Name: thrm_employee_skill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_skill (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    skill_type character varying(1) NOT NULL,
    education_type character varying(2),
    skill_name character varying(20),
    institute character varying(400) DEFAULT NULL::character varying,
    date_start date,
    date_end date,
    details character varying(400) DEFAULT NULL::character varying,
    doc_type character varying(100),
    doc_name character varying(100),
    doc_size bigint,
    doc bytea,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_employee_skill_education_type_check CHECK (((education_type)::text = ANY (ARRAY[('HS'::character varying)::text, ('HW'::character varying)::text, ('BC'::character varying)::text, ('FY'::character varying)::text, ('MC'::character varying)::text, ('DS'::character varying)::text]))),
    CONSTRAINT thrm_employee_skill_skill_type_check CHECK (((skill_type)::text = ANY (ARRAY[('S'::character varying)::text, ('E'::character varying)::text, ('C'::character varying)::text, ('T'::character varying)::text])))
);


--
-- TOC entry 634 (class 1259 OID 73304)
-- Name: thrm_employee_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8830 (class 0 OID 0)
-- Dependencies: 634
-- Name: thrm_employee_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_skill_id_seq OWNED BY public.thrm_employee_skill.id;


--
-- TOC entry 635 (class 1259 OID 73306)
-- Name: thrm_employee_sos_contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_employee_sos_contact (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    contact_name character varying(100) NOT NULL,
    relationship character varying(50) DEFAULT NULL::character varying,
    home_phone character varying(20) DEFAULT NULL::character varying,
    work_phone character varying(20) DEFAULT NULL::character varying,
    mobile_phone character varying(20) DEFAULT NULL::character varying,
    email character varying(20) DEFAULT NULL::character varying,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 636 (class 1259 OID 73318)
-- Name: thrm_employee_sos_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_employee_sos_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8831 (class 0 OID 0)
-- Dependencies: 636
-- Name: thrm_employee_sos_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_employee_sos_contact_id_seq OWNED BY public.thrm_employee_sos_contact.id;


--
-- TOC entry 637 (class 1259 OID 73320)
-- Name: thrm_language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_language (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    name_en character varying(120) DEFAULT NULL::character varying,
    name_sr character varying(120) DEFAULT NULL::character varying
);


--
-- TOC entry 638 (class 1259 OID 73325)
-- Name: thrm_language_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8832 (class 0 OID 0)
-- Dependencies: 638
-- Name: thrm_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_language_id_seq OWNED BY public.thrm_language.id;


--
-- TOC entry 639 (class 1259 OID 73327)
-- Name: thrm_leave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_leave (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    leave_type_id integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    days_requested double precision NOT NULL,
    status character varying(2) DEFAULT 'P'::character varying NOT NULL,
    requested_user_id integer NOT NULL,
    requested_date date DEFAULT now(),
    requested_comments character varying(256) DEFAULT NULL::character varying,
    days_approved double precision,
    approved_user_id integer NOT NULL,
    approved_date date,
    approved_comments character varying(256) DEFAULT NULL::character varying,
    return_date date,
    days_spent double precision,
    doc_type character varying(100),
    doc_name character varying(100),
    doc_size bigint,
    doc bytea,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_leave_status_check CHECK (((status)::text = ANY (ARRAY[('A'::character varying)::text, ('P'::character varying)::text, ('R'::character varying)::text])))
);


--
-- TOC entry 640 (class 1259 OID 73339)
-- Name: thrm_leave_entitlement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_leave_entitlement (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    leave_type_id integer NOT NULL,
    no_of_days double precision NOT NULL,
    days_used double precision DEFAULT 0 NOT NULL,
    from_date date NOT NULL,
    to_date date,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 641 (class 1259 OID 73347)
-- Name: thrm_leave_entitlement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_leave_entitlement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8833 (class 0 OID 0)
-- Dependencies: 641
-- Name: thrm_leave_entitlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_leave_entitlement_id_seq OWNED BY public.thrm_leave_entitlement.id;


--
-- TOC entry 642 (class 1259 OID 73349)
-- Name: thrm_leave_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_leave_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8834 (class 0 OID 0)
-- Dependencies: 642
-- Name: thrm_leave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_leave_id_seq OWNED BY public.thrm_leave.id;


--
-- TOC entry 643 (class 1259 OID 73351)
-- Name: thrm_leave_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_leave_type (
    id bigint NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(50) NOT NULL,
    name_en character varying(50),
    name_sr character varying(50),
    ispaid smallint DEFAULT 0 NOT NULL,
    isawol smallint DEFAULT 0 NOT NULL,
    isannual smallint DEFAULT 0 NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    exclude_in_reports_if_no_entitlement smallint DEFAULT 0 NOT NULL,
    operational_country_id integer,
    bg_color character varying(20) DEFAULT NULL::character varying,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 644 (class 1259 OID 73364)
-- Name: thrm_leave_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_leave_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8835 (class 0 OID 0)
-- Dependencies: 644
-- Name: thrm_leave_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_leave_type_id_seq OWNED BY public.thrm_leave_type.id;


--
-- TOC entry 645 (class 1259 OID 73366)
-- Name: thrm_nationality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_nationality (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    name_en character varying(120) DEFAULT NULL::character varying,
    name_sr character varying(120) DEFAULT NULL::character varying
);


--
-- TOC entry 646 (class 1259 OID 73371)
-- Name: thrm_nationality_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_nationality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8836 (class 0 OID 0)
-- Dependencies: 646
-- Name: thrm_nationality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_nationality_id_seq OWNED BY public.thrm_nationality.id;


--
-- TOC entry 647 (class 1259 OID 73373)
-- Name: thrm_offical_travel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thrm_offical_travel (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    travel_type character varying(2) NOT NULL,
    reimbursement_expenses boolean NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    from_destination character varying(150) NOT NULL,
    to_destination character varying(150) NOT NULL,
    reason text,
    days_requested double precision NOT NULL,
    status character varying(2) DEFAULT 'P'::character varying NOT NULL,
    requested_user_id integer NOT NULL,
    requested_date date DEFAULT now(),
    requested_comments character varying(256) DEFAULT NULL::character varying,
    days_approved double precision,
    approved_user_id integer,
    approved_date date,
    approved_comments character varying(256) DEFAULT NULL::character varying,
    return_date date,
    days_spent double precision,
    doc_type character varying(100),
    doc_name character varying(100),
    doc_size bigint,
    doc bytea,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT thrm_offical_travel_status_check CHECK (((status)::text = ANY (ARRAY[('A'::character varying)::text, ('P'::character varying)::text, ('R'::character varying)::text]))),
    CONSTRAINT thrm_offical_travel_travel_type_check CHECK (((travel_type)::text = ANY (ARRAY[('BG'::character varying)::text, ('VG'::character varying)::text, ('TR'::character varying)::text, ('AP'::character varying)::text, ('PV'::character varying)::text, ('OT'::character varying)::text])))
);


--
-- TOC entry 648 (class 1259 OID 73386)
-- Name: thrm_offical_travel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thrm_offical_travel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8837 (class 0 OID 0)
-- Dependencies: 648
-- Name: thrm_offical_travel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thrm_offical_travel_id_seq OWNED BY public.thrm_offical_travel.id;


--
-- TOC entry 649 (class 1259 OID 73388)
-- Name: timport_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.timport_status (
    id integer NOT NULL,
    import_type character varying(1),
    mup_id integer,
    is_active boolean DEFAULT false NOT NULL,
    status character varying(20),
    start_date timestamp without time zone DEFAULT now(),
    start_user integer,
    end_date timestamp without time zone DEFAULT now(),
    end_user integer,
    CONSTRAINT timport_status_import_type_check CHECK (((import_type)::text = ANY (ARRAY[('C'::character varying)::text, ('P'::character varying)::text, ('L'::character varying)::text, ('B'::character varying)::text])))
);


--
-- TOC entry 650 (class 1259 OID 73395)
-- Name: timport_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.timport_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8838 (class 0 OID 0)
-- Dependencies: 650
-- Name: timport_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.timport_status_id_seq OWNED BY public.timport_status.id;


--
-- TOC entry 651 (class 1259 OID 73397)
-- Name: tkfis_gen_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tkfis_gen_documents (
    id bigint NOT NULL,
    uid character varying(8) NOT NULL,
    url character varying(250) NOT NULL,
    generated_by integer,
    generated_date timestamp without time zone,
    accessed boolean,
    a_uid character varying(50)
);


--
-- TOC entry 652 (class 1259 OID 73400)
-- Name: tlegsec_lawsuit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlegsec_lawsuit (
    id integer NOT NULL,
    office_id integer NOT NULL,
    current_status integer,
    lawsuit_no character varying(20) NOT NULL,
    suit_type character varying(2) NOT NULL,
    damage_type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    parent_name character varying(50),
    last_name character varying(50) NOT NULL,
    personal_id character varying(20),
    birthdate date,
    address character varying(100),
    profession character varying(50),
    place_of_employment character varying(50),
    accomplice character varying(255),
    managment_unit character varying(50),
    stand character varying(10),
    origin character varying(2) NOT NULL,
    total_damage double precision NOT NULL,
    total_damage_euro double precision NOT NULL,
    evidence text,
    placename character varying(100),
    date date NOT NULL,
    claimant_id integer NOT NULL,
    note text
);


--
-- TOC entry 653 (class 1259 OID 73406)
-- Name: tlegsec_lawsuit_damage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlegsec_lawsuit_damage (
    id integer NOT NULL,
    lawsuit_id integer NOT NULL,
    tree_species_id integer NOT NULL,
    timber_number integer,
    timber_diameter_stump double precision,
    timber_diameter_13 double precision,
    timber_height double precision,
    volume_damage double precision NOT NULL,
    volume_unit_price double precision,
    damage_euro double precision NOT NULL
);


--
-- TOC entry 654 (class 1259 OID 73409)
-- Name: tlegsec_lawsuit_damage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlegsec_lawsuit_damage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8839 (class 0 OID 0)
-- Dependencies: 654
-- Name: tlegsec_lawsuit_damage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlegsec_lawsuit_damage_id_seq OWNED BY public.tlegsec_lawsuit_damage.id;


--
-- TOC entry 655 (class 1259 OID 73411)
-- Name: tlegsec_lawsuit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlegsec_lawsuit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8840 (class 0 OID 0)
-- Dependencies: 655
-- Name: tlegsec_lawsuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlegsec_lawsuit_id_seq OWNED BY public.tlegsec_lawsuit.id;


--
-- TOC entry 656 (class 1259 OID 73413)
-- Name: tlegsec_lawsuit_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlegsec_lawsuit_status (
    id integer NOT NULL,
    lawsuit_id integer NOT NULL,
    status character varying(2) NOT NULL,
    court_session_date timestamp without time zone,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    note text,
    active boolean NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 657 (class 1259 OID 73420)
-- Name: tlegsec_lawsuit_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlegsec_lawsuit_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8841 (class 0 OID 0)
-- Dependencies: 657
-- Name: tlegsec_lawsuit_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlegsec_lawsuit_status_id_seq OWNED BY public.tlegsec_lawsuit_status.id;


--
-- TOC entry 658 (class 1259 OID 73422)
-- Name: tlinetemp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlinetemp (
    id bigint NOT NULL,
    ltheme12 character varying(10),
    quality_cl character varying(20),
    maintenanc character varying(20),
    comment text,
    file_format character varying(10),
    date date,
    status character varying(2),
    created_date timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    changed_date timestamp without time zone,
    changed_by integer,
    the_geom public.geometry
);


--
-- TOC entry 659 (class 1259 OID 73428)
-- Name: tlinetemp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlinetemp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8842 (class 0 OID 0)
-- Dependencies: 659
-- Name: tlinetemp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlinetemp_id_seq OWNED BY public.tlinetemp.id;


--
-- TOC entry 660 (class 1259 OID 73430)
-- Name: tlocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlocation (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    address1 character varying(60),
    address2 character varying(60),
    city character varying(60),
    postal character varying(10),
    postal_add character varying(10),
    country character varying(80) NOT NULL,
    region character varying(50),
    address3 character varying(60),
    address4 character varying(60),
    validateaddress character(1) DEFAULT NULL::bpchar,
    result character varying(2000) DEFAULT NULL::character varying,
    isvalid character(1) DEFAULT 'N'::bpchar,
    CONSTRAINT tlocation_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tlocation_isvalid_check CHECK ((isvalid = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 661 (class 1259 OID 73444)
-- Name: tlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8843 (class 0 OID 0)
-- Dependencies: 661
-- Name: tlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlocation_id_seq OWNED BY public.tlocation.id;


--
-- TOC entry 662 (class 1259 OID 73446)
-- Name: tlog_devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_devices (
    id integer NOT NULL,
    device_api_id integer NOT NULL,
    vehicle_id integer NOT NULL,
    active_device boolean NOT NULL,
    active_start_date date NOT NULL,
    active_end_date date NOT NULL,
    phone character varying(50),
    name character varying(128) NOT NULL,
    uniqueid character varying(128) NOT NULL,
    status character varying(128),
    lastupdate timestamp without time zone,
    positionid integer,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 663 (class 1259 OID 73450)
-- Name: tlog_position; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.tlog_position AS
 SELECT positions.id,
    positions.protocol,
    positions.deviceid,
    positions.servertime,
    positions.devicetime,
    positions.fixtime,
    positions.valid,
    positions.latitude,
    positions.longitude,
    positions.altitude,
    positions.speed,
    positions.course,
    positions.address,
    positions.attributes,
    positions.accuracy,
    positions.network
   FROM public.dblink('dbname=traccar port=5432 host=localhost 
                user=postgres password=*****'::text, 'SELECT id, protocol, deviceid, servertime, devicetime, fixtime, valid, 
       latitude, longitude, altitude, speed, course, address, attributes, 
       accuracy, network
  FROM public.positions'::text) positions(id integer, protocol character varying(128), deviceid integer, servertime timestamp without time zone, devicetime timestamp without time zone, fixtime timestamp without time zone, valid boolean, latitude double precision, longitude double precision, altitude double precision, speed double precision, course double precision, address character varying(512), attributes character varying(4000), accuracy double precision, network character varying(4000));


--
-- TOC entry 664 (class 1259 OID 73455)
-- Name: tlog_positions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_positions (
    id integer NOT NULL,
    protocol character varying(128),
    deviceid integer NOT NULL,
    servertime timestamp without time zone NOT NULL,
    devicetime timestamp without time zone NOT NULL,
    fixtime timestamp without time zone NOT NULL,
    valid boolean NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    altitude double precision NOT NULL,
    speed double precision NOT NULL,
    course double precision NOT NULL,
    address character varying(512),
    attributes character varying(4096) NOT NULL
);


--
-- TOC entry 665 (class 1259 OID 73461)
-- Name: tlog_protocol_ports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_protocol_ports (
    id integer NOT NULL,
    protocol_type character varying(50) NOT NULL,
    protocol_name character varying(50) NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 666 (class 1259 OID 73465)
-- Name: tlog_protocol_ports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlog_protocol_ports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8844 (class 0 OID 0)
-- Dependencies: 666
-- Name: tlog_protocol_ports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlog_protocol_ports_id_seq OWNED BY public.tlog_protocol_ports.id;


--
-- TOC entry 667 (class 1259 OID 73467)
-- Name: tlog_trips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_trips (
    id bigint NOT NULL,
    device_name character varying(128),
    uniqueid character varying(128),
    phone character varying(128),
    min_id integer,
    max_id integer,
    protocol character varying(128),
    deviceid integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    duration_time character varying(128),
    start_device_time timestamp without time zone,
    end_device_time timestamp without time zone,
    average_speed double precision,
    max_speed double precision,
    geom public.geometry(LineStringZM,900916)
);


--
-- TOC entry 668 (class 1259 OID 73473)
-- Name: tlog_trips_1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_trips_1 (
    id bigint NOT NULL,
    device_name character varying(128),
    uniqueid character varying(128),
    phone character varying(128),
    min_id integer,
    max_id integer,
    protocol character varying(128),
    deviceid integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    duration_time character varying(128),
    start_device_time timestamp without time zone,
    end_device_time timestamp without time zone,
    average_speed double precision,
    max_speed double precision,
    geom public.geometry(LineStringZM,900916)
);


--
-- TOC entry 669 (class 1259 OID 73479)
-- Name: tlog_trips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlog_trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8845 (class 0 OID 0)
-- Dependencies: 669
-- Name: tlog_trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlog_trips_id_seq OWNED BY public.tlog_trips_1.id;


--
-- TOC entry 670 (class 1259 OID 73481)
-- Name: tlog_trips_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlog_trips_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8846 (class 0 OID 0)
-- Dependencies: 670
-- Name: tlog_trips_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlog_trips_id_seq1 OWNED BY public.tlog_trips.id;


--
-- TOC entry 671 (class 1259 OID 73483)
-- Name: tlog_vehicles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_vehicles (
    id integer NOT NULL,
    department_id integer NOT NULL,
    brand character varying(50),
    type character varying(50),
    year_product integer,
    plate_number character varying(50),
    first_registration timestamp without time zone,
    number_of_seats integer,
    color character varying(50),
    engine_code character varying(50),
    destination character varying(50),
    weight character varying(50),
    type_engine character varying(50),
    volume_capacity character varying(50),
    created_date date,
    created_by integer
);


--
-- TOC entry 672 (class 1259 OID 73486)
-- Name: tlog_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlog_vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8847 (class 0 OID 0)
-- Dependencies: 672
-- Name: tlog_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlog_vehicles_id_seq OWNED BY public.tlog_vehicles.id;


--
-- TOC entry 673 (class 1259 OID 73488)
-- Name: tlog_vehicles_register; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_vehicles_register (
    id integer NOT NULL,
    vehicles_id integer NOT NULL,
    registered_date date NOT NULL,
    valide_to_date date NOT NULL,
    mileage_at_register character varying(20),
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 674 (class 1259 OID 73491)
-- Name: tlog_vehicles_register_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlog_vehicles_register_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8848 (class 0 OID 0)
-- Dependencies: 674
-- Name: tlog_vehicles_register_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlog_vehicles_register_id_seq OWNED BY public.tlog_vehicles_register.id;


--
-- TOC entry 675 (class 1259 OID 73493)
-- Name: tlog_vehicles_service_maintenance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tlog_vehicles_service_maintenance (
    id integer NOT NULL,
    vehicles_id integer NOT NULL,
    expenditure_type character varying(50),
    value double precision,
    date_service date,
    date_valid date,
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 676 (class 1259 OID 73496)
-- Name: tlog_vehicles_service_maintenance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tlog_vehicles_service_maintenance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8849 (class 0 OID 0)
-- Dependencies: 676
-- Name: tlog_vehicles_service_maintenance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tlog_vehicles_service_maintenance_id_seq OWNED BY public.tlog_vehicles_service_maintenance.id;


--
-- TOC entry 677 (class 1259 OID 73498)
-- Name: tmanagment_protocol_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmanagment_protocol_doc (
    id integer NOT NULL,
    department_id integer NOT NULL,
    protocol_no character varying(50) NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    status character varying(50),
    action_taken character varying(50),
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    note text
);


--
-- TOC entry 678 (class 1259 OID 73504)
-- Name: tmanagment_protocol_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmanagment_protocol_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8850 (class 0 OID 0)
-- Dependencies: 678
-- Name: tmanagment_protocol_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmanagment_protocol_doc_id_seq OWNED BY public.tmanagment_protocol_doc.id;


--
-- TOC entry 679 (class 1259 OID 73506)
-- Name: tmer_evaluation_perf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_evaluation_perf (
    id integer NOT NULL,
    sub_indicator_id integer NOT NULL,
    eval_date date NOT NULL,
    target double precision,
    actual double precision NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 680 (class 1259 OID 73512)
-- Name: tmer_evaluation_perf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_evaluation_perf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8851 (class 0 OID 0)
-- Dependencies: 680
-- Name: tmer_evaluation_perf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_evaluation_perf_id_seq OWNED BY public.tmer_evaluation_perf.id;


--
-- TOC entry 681 (class 1259 OID 73514)
-- Name: tmer_evaluation_strat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_evaluation_strat (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    eval_date date NOT NULL,
    program_results text NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 682 (class 1259 OID 73520)
-- Name: tmer_evaluation_strat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_evaluation_strat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8852 (class 0 OID 0)
-- Dependencies: 682
-- Name: tmer_evaluation_strat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_evaluation_strat_id_seq OWNED BY public.tmer_evaluation_strat.id;


--
-- TOC entry 683 (class 1259 OID 73522)
-- Name: tmer_finance_donor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_finance_donor (
    id integer NOT NULL,
    strategy_id integer NOT NULL,
    donor_id integer NOT NULL,
    donation_year integer NOT NULL,
    amount double precision NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 684 (class 1259 OID 73528)
-- Name: tmer_finance_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_finance_donor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8853 (class 0 OID 0)
-- Dependencies: 684
-- Name: tmer_finance_donor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_finance_donor_id_seq OWNED BY public.tmer_finance_donor.id;


--
-- TOC entry 685 (class 1259 OID 73530)
-- Name: tmer_indicator; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_indicator (
    id integer NOT NULL,
    strategy_id integer NOT NULL,
    name text NOT NULL,
    name_en text NOT NULL,
    name_sr text NOT NULL,
    type character varying(1) NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 686 (class 1259 OID 73536)
-- Name: tmer_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_indicator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8854 (class 0 OID 0)
-- Dependencies: 686
-- Name: tmer_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_indicator_id_seq OWNED BY public.tmer_indicator.id;


--
-- TOC entry 687 (class 1259 OID 73538)
-- Name: tmer_indicator_target; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_indicator_target (
    id integer NOT NULL,
    sub_indicator_id integer NOT NULL,
    year integer,
    target integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 688 (class 1259 OID 73544)
-- Name: tmer_indicator_target_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_indicator_target_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8855 (class 0 OID 0)
-- Dependencies: 688
-- Name: tmer_indicator_target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_indicator_target_id_seq OWNED BY public.tmer_indicator_target.id;


--
-- TOC entry 689 (class 1259 OID 73546)
-- Name: tmer_plan_period; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_plan_period (
    id integer NOT NULL,
    start_year integer NOT NULL,
    end_year integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 690 (class 1259 OID 73552)
-- Name: tmer_plan_period_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_plan_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8856 (class 0 OID 0)
-- Dependencies: 690
-- Name: tmer_plan_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_plan_period_id_seq OWNED BY public.tmer_plan_period.id;


--
-- TOC entry 691 (class 1259 OID 73554)
-- Name: tmer_project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_project (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    name_en character varying(100) NOT NULL,
    name_sr character varying(100),
    code character varying(1) NOT NULL,
    pillar character varying(3) NOT NULL,
    description text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 692 (class 1259 OID 73560)
-- Name: tmer_project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8857 (class 0 OID 0)
-- Dependencies: 692
-- Name: tmer_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_project_id_seq OWNED BY public.tmer_project.id;


--
-- TOC entry 693 (class 1259 OID 73562)
-- Name: tmer_ref_sub_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_ref_sub_projects (
    id integer NOT NULL,
    strategy_id integer NOT NULL,
    ref_strategy_id integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 694 (class 1259 OID 73568)
-- Name: tmer_ref_sub_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_ref_sub_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8858 (class 0 OID 0)
-- Dependencies: 694
-- Name: tmer_ref_sub_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_ref_sub_projects_id_seq OWNED BY public.tmer_ref_sub_projects.id;


--
-- TOC entry 695 (class 1259 OID 73570)
-- Name: tmer_resp_institutions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_resp_institutions (
    id integer NOT NULL,
    strategy_id integer NOT NULL,
    organisation_id integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 696 (class 1259 OID 73576)
-- Name: tmer_resp_institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_resp_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8859 (class 0 OID 0)
-- Dependencies: 696
-- Name: tmer_resp_institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_resp_institutions_id_seq OWNED BY public.tmer_resp_institutions.id;


--
-- TOC entry 697 (class 1259 OID 73578)
-- Name: tmer_strategy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_strategy (
    id integer NOT NULL,
    sub_project_id integer NOT NULL,
    plan_period_id integer NOT NULL,
    start_year integer NOT NULL,
    end_year integer,
    results text NOT NULL,
    pip_code character varying(10),
    review_time date,
    cost double precision NOT NULL,
    fully_financed boolean,
    in_negotiations_finance boolean,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 698 (class 1259 OID 73584)
-- Name: tmer_strategy_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_strategy_doc (
    id integer NOT NULL,
    strategy_id integer NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc_size bigint NOT NULL,
    doc bytea NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date
);


--
-- TOC entry 699 (class 1259 OID 73590)
-- Name: tmer_strategy_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_strategy_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8860 (class 0 OID 0)
-- Dependencies: 699
-- Name: tmer_strategy_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_strategy_doc_id_seq OWNED BY public.tmer_strategy_doc.id;


--
-- TOC entry 700 (class 1259 OID 73592)
-- Name: tmer_strategy_execution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_strategy_execution (
    id integer NOT NULL,
    strategy_id integer NOT NULL,
    status character varying(3) NOT NULL,
    execution_date date NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 701 (class 1259 OID 73598)
-- Name: tmer_strategy_execution_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_strategy_execution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8861 (class 0 OID 0)
-- Dependencies: 701
-- Name: tmer_strategy_execution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_strategy_execution_id_seq OWNED BY public.tmer_strategy_execution.id;


--
-- TOC entry 702 (class 1259 OID 73600)
-- Name: tmer_strategy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_strategy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8862 (class 0 OID 0)
-- Dependencies: 702
-- Name: tmer_strategy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_strategy_id_seq OWNED BY public.tmer_strategy.id;


--
-- TOC entry 703 (class 1259 OID 73602)
-- Name: tmer_sub_indicator; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_sub_indicator (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    name text NOT NULL,
    name_en text NOT NULL,
    name_sr text NOT NULL,
    uom_id integer NOT NULL,
    note text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 704 (class 1259 OID 73608)
-- Name: tmer_sub_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_sub_indicator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8863 (class 0 OID 0)
-- Dependencies: 704
-- Name: tmer_sub_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_sub_indicator_id_seq OWNED BY public.tmer_sub_indicator.id;


--
-- TOC entry 705 (class 1259 OID 73610)
-- Name: tmer_sub_project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmer_sub_project (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying(200) NOT NULL,
    name_en character varying(200) NOT NULL,
    name_sr character varying(200),
    priority character varying(2),
    code character varying(3) NOT NULL,
    description text,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 706 (class 1259 OID 73616)
-- Name: tmer_sub_project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tmer_sub_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8864 (class 0 OID 0)
-- Dependencies: 706
-- Name: tmer_sub_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tmer_sub_project_id_seq OWNED BY public.tmer_sub_project.id;


--
-- TOC entry 707 (class 1259 OID 73618)
-- Name: torganisation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.torganisation (
    id integer NOT NULL,
    parent_id integer,
    orga_name character varying(100) NOT NULL,
    orga_name_en character varying(100),
    orga_name_sr character varying(100),
    orga_type character(1),
    code character varying(20) NOT NULL,
    oper_level_val character varying(1) NOT NULL,
    oper_level smallint NOT NULL,
    orga_category character varying(3),
    start_date date,
    end_date date,
    logo bytea,
    CONSTRAINT torganisation_orga_type_check CHECK ((orga_type = ANY (ARRAY['O'::bpchar, 'V'::bpchar, 'D'::bpchar, 'S'::bpchar, 'W'::bpchar, 'I'::bpchar])))
);


--
-- TOC entry 708 (class 1259 OID 73625)
-- Name: torganisation_mun; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.torganisation_mun (
    id integer NOT NULL,
    org_id integer NOT NULL,
    mun_id integer NOT NULL
);


--
-- TOC entry 709 (class 1259 OID 73628)
-- Name: torganisation_tree_view; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.torganisation_tree_view AS
 WITH RECURSIVE torganisation_tree(id, parent_id, orga_name, code, path, depth) AS (
         SELECT torganisation.id,
            torganisation.parent_id,
            torganisation.orga_name,
            torganisation.code,
            (NULL::integer[] || torganisation.parent_id),
            1
           FROM public.torganisation
          WHERE (torganisation.parent_id = 100)
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.orga_name,
            t.code,
            (rt.path || t.parent_id),
            (rt.depth + 1)
           FROM (public.torganisation t
             JOIN torganisation_tree rt ON ((rt.id = t.parent_id)))
        )
 SELECT torganisation_tree.id,
    torganisation_tree.parent_id,
    torganisation_tree.orga_name,
    torganisation_tree.code,
    torganisation_tree.path,
    torganisation_tree.depth
   FROM torganisation_tree
  ORDER BY torganisation_tree.orga_name, torganisation_tree.path;


--
-- TOC entry 710 (class 1259 OID 73633)
-- Name: tparcel_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tparcel_detail (
    id bigint NOT NULL,
    parc_geom_id integer,
    old_parcel_id integer,
    cadposslist character varying(20),
    cadparcelid character varying(25),
    cadzone integer,
    parcelnr integer,
    subparcelnr smallint,
    placename character varying(150),
    culture smallint,
    culturename character varying,
    clas smallint,
    area integer,
    properytype smallint,
    forestc integer,
    mu smallint,
    ow smallint,
    owner_id integer,
    old_parc character varying(25)
);


--
-- TOC entry 711 (class 1259 OID 73639)
-- Name: tparcel_owner; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tparcel_owner (
    id bigint NOT NULL,
    cadposslist character varying(20),
    cadzone integer,
    ownerid character varying(15),
    owner_up character varying(150),
    livingplace character varying(255),
    street character varying(150),
    housenr character varying(4),
    partsn character varying,
    pers_stat character varying(250),
    pc smallint
);


--
-- TOC entry 712 (class 1259 OID 73645)
-- Name: tparty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tparty (
    id bigint NOT NULL,
    party_type character(1) NOT NULL,
    address_id bigint,
    active boolean,
    CONSTRAINT tparty_party_type_check CHECK ((party_type = ANY (ARRAY['P'::bpchar, 'O'::bpchar, 'E'::bpchar, 'D'::bpchar, 'B'::bpchar])))
);


--
-- TOC entry 713 (class 1259 OID 73649)
-- Name: tparty_relationship; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tparty_relationship (
    id bigint NOT NULL,
    from_relationship integer NOT NULL,
    to_relationship integer NOT NULL,
    from_party_role_name character varying(10) NOT NULL,
    to_party_role_name character varying(10) NOT NULL,
    start_data date NOT NULL,
    end_date date
);


--
-- TOC entry 714 (class 1259 OID 73652)
-- Name: tparty_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tparty_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8865 (class 0 OID 0)
-- Dependencies: 714
-- Name: tparty_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tparty_relationship_id_seq OWNED BY public.tparty_relationship.id;


--
-- TOC entry 715 (class 1259 OID 73654)
-- Name: tparty_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tparty_role (
    id bigint NOT NULL,
    party_id integer NOT NULL,
    role_code character varying(10) NOT NULL,
    date_from date,
    date_to date
);


--
-- TOC entry 716 (class 1259 OID 73657)
-- Name: tparty_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tparty_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8866 (class 0 OID 0)
-- Dependencies: 716
-- Name: tparty_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tparty_role_id_seq OWNED BY public.tparty_role.id;


--
-- TOC entry 717 (class 1259 OID 73659)
-- Name: tparty_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tparty_user (
    id integer NOT NULL,
    party_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 718 (class 1259 OID 73662)
-- Name: tparty_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tparty_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8867 (class 0 OID 0)
-- Dependencies: 718
-- Name: tparty_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tparty_user_id_seq OWNED BY public.tparty_user.id;


--
-- TOC entry 719 (class 1259 OID 73664)
-- Name: tperson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tperson (
    id bigint NOT NULL,
    party_id integer,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    birthdate date NOT NULL,
    personal_id character varying(20),
    gender character varying(1) NOT NULL,
    degree character varying(20),
    ethnicity character varying(3) NOT NULL,
    pers_with_lmt_abilities boolean NOT NULL,
    notes text,
    photo bytea,
    CONSTRAINT tperson_gender_check CHECK (((gender)::text = ANY (ARRAY[('M'::character varying)::text, ('F'::character varying)::text])))
);


--
-- TOC entry 720 (class 1259 OID 73671)
-- Name: tperson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tperson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8868 (class 0 OID 0)
-- Dependencies: 720
-- Name: tperson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tperson_id_seq OWNED BY public.tperson.id;


--
-- TOC entry 721 (class 1259 OID 73673)
-- Name: tperson_tree_view; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.tperson_tree_view AS
 WITH RECURSIVE tperson_tree(id, party_id, personal_id, path, depth) AS (
         SELECT tperson.id,
            tperson.party_id,
            tperson.personal_id,
            (NULL::integer[] || tperson.party_id),
            1
           FROM public.tperson
          WHERE (tperson.party_id = 1)
        UNION ALL
         SELECT t.id,
            t.party_id,
            t.personal_id,
            (rt.path || t.party_id),
            (rt.depth + 1)
           FROM (public.tperson t
             JOIN tperson_tree rt ON ((rt.id = t.party_id)))
        )
 SELECT tperson_tree.id,
    tperson_tree.party_id,
    tperson_tree.personal_id,
    tperson_tree.path,
    tperson_tree.depth
   FROM tperson_tree
  ORDER BY tperson_tree.personal_id, tperson_tree.path;


--
-- TOC entry 722 (class 1259 OID 73678)
-- Name: tprcmt_dossier_question; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_dossier_question (
    id integer NOT NULL,
    dossier_request_id integer NOT NULL,
    question text NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 723 (class 1259 OID 73684)
-- Name: tprcmt_dossier_question_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_dossier_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8869 (class 0 OID 0)
-- Dependencies: 723
-- Name: tprcmt_dossier_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_dossier_question_id_seq OWNED BY public.tprcmt_dossier_question.id;


--
-- TOC entry 724 (class 1259 OID 73686)
-- Name: tprcmt_dossier_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_dossier_request (
    id integer NOT NULL,
    tender_id integer NOT NULL,
    bidder_id integer NOT NULL,
    sent boolean,
    sent_date timestamp without time zone,
    note text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 725 (class 1259 OID 73692)
-- Name: tprcmt_dossier_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_dossier_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8870 (class 0 OID 0)
-- Dependencies: 725
-- Name: tprcmt_dossier_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_dossier_request_id_seq OWNED BY public.tprcmt_dossier_request.id;


--
-- TOC entry 726 (class 1259 OID 73694)
-- Name: tprcmt_tender_bid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_tender_bid (
    id integer NOT NULL,
    tender_request_id integer NOT NULL,
    bidder_id integer NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    selected_date timestamp without time zone,
    bid_value double precision NOT NULL,
    doc_type character varying(100),
    doc_name character varying(100),
    doc bytea,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    note text
);


--
-- TOC entry 727 (class 1259 OID 73701)
-- Name: tprcmt_tender_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_tender_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8871 (class 0 OID 0)
-- Dependencies: 727
-- Name: tprcmt_tender_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_tender_bid_id_seq OWNED BY public.tprcmt_tender_bid.id;


--
-- TOC entry 728 (class 1259 OID 73703)
-- Name: tprcmt_tender_bidder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_tender_bidder (
    id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    fiscal_number character varying(50) NOT NULL,
    address character varying(255),
    contact_phone character varying(20),
    e_mail character varying(50),
    contact_person character varying(50),
    contractor boolean,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    comments text,
    business_number character varying(50)
);


--
-- TOC entry 729 (class 1259 OID 73709)
-- Name: tprcmt_tender_bidder_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_tender_bidder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8872 (class 0 OID 0)
-- Dependencies: 729
-- Name: tprcmt_tender_bidder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_tender_bidder_id_seq OWNED BY public.tprcmt_tender_bidder.id;


--
-- TOC entry 730 (class 1259 OID 73711)
-- Name: tprcmt_tender_complaint; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_tender_complaint (
    id integer NOT NULL,
    tender_bid_id integer NOT NULL,
    complaint text NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc bytea NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 731 (class 1259 OID 73717)
-- Name: tprcmt_tender_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_tender_complaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8873 (class 0 OID 0)
-- Dependencies: 731
-- Name: tprcmt_tender_complaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_tender_complaint_id_seq OWNED BY public.tprcmt_tender_complaint.id;


--
-- TOC entry 732 (class 1259 OID 73719)
-- Name: tprcmt_tender_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_tender_request (
    id integer NOT NULL,
    declare_of_needs text NOT NULL,
    designation_of_request character varying(50) NOT NULL,
    organisation_id integer NOT NULL,
    annual_plan boolean,
    pprc_notification boolean,
    current_status integer,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 733 (class 1259 OID 73725)
-- Name: tprcmt_tender_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_tender_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8874 (class 0 OID 0)
-- Dependencies: 733
-- Name: tprcmt_tender_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_tender_request_id_seq OWNED BY public.tprcmt_tender_request.id;


--
-- TOC entry 734 (class 1259 OID 73727)
-- Name: tprcmt_tender_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_tender_status (
    id integer NOT NULL,
    tender_request_id integer NOT NULL,
    status character varying(3),
    comment text,
    created_date date NOT NULL,
    created_by integer NOT NULL
);


--
-- TOC entry 735 (class 1259 OID 73733)
-- Name: tprcmt_tender_status_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tprcmt_tender_status_doc (
    id integer NOT NULL,
    status_id integer NOT NULL,
    doc_type character varying(100) NOT NULL,
    doc_name character varying(100) NOT NULL,
    doc bytea NOT NULL,
    comment text,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL
);


--
-- TOC entry 736 (class 1259 OID 73739)
-- Name: tprcmt_tender_status_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_tender_status_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8875 (class 0 OID 0)
-- Dependencies: 736
-- Name: tprcmt_tender_status_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_tender_status_doc_id_seq OWNED BY public.tprcmt_tender_status_doc.id;


--
-- TOC entry 737 (class 1259 OID 73741)
-- Name: tprcmt_tender_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tprcmt_tender_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8876 (class 0 OID 0)
-- Dependencies: 737
-- Name: tprcmt_tender_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tprcmt_tender_status_id_seq OWNED BY public.tprcmt_tender_status.id;


--
-- TOC entry 738 (class 1259 OID 73743)
-- Name: tpublishing; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tpublishing (
    id integer NOT NULL,
    html_code text NOT NULL,
    html_code_en text,
    html_code_sr text,
    title character varying(100) NOT NULL,
    title_en character varying(100),
    title_sr character varying(100),
    important boolean,
    published_date date NOT NULL,
    published boolean NOT NULL,
    photo bytea,
    created_by integer NOT NULL,
    created_date date NOT NULL
);


--
-- TOC entry 739 (class 1259 OID 73749)
-- Name: tpublishing_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tpublishing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8877 (class 0 OID 0)
-- Dependencies: 739
-- Name: tpublishing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tpublishing_id_seq OWNED BY public.tpublishing.id;


--
-- TOC entry 740 (class 1259 OID 73751)
-- Name: tpurchase_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tpurchase_order (
    id integer NOT NULL,
    requisition_id integer,
    status_id integer,
    status_code character varying(20) NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    document_id integer,
    po_number character varying(36) NOT NULL,
    is_bpartner character(1) DEFAULT 'N'::bpchar NOT NULL,
    bpartner_id integer,
    bpartner_location_id integer,
    supplier_name character varying(100),
    supplier_site character varying(100),
    supplier_contact character varying(100),
    supplier_phone character varying(100),
    supplier_address character varying(150),
    supplier_fax character varying(50),
    supplier_email character varying(150),
    order_date timestamp without time zone,
    order_completation date,
    payment_terms_code character varying(20),
    payment_terms_name character varying(20),
    acquisition_type_code character varying(20),
    dept_contact_name character varying(100),
    dept_contact_phone character varying(100),
    dept_contact_email character varying(100),
    equipment_approver_name character varying(100),
    equipment_printed character(1),
    equipment_print_date timestamp without time zone,
    change_orders_count smallint,
    change_orders_date timestamp without time zone,
    order_original_amount numeric(22,2),
    order_initial_amount numeric(22,2),
    textmsg character varying(2000),
    dateordered timestamp without time zone NOT NULL,
    datepromised timestamp without time zone,
    dateprinted timestamp without time zone,
    isdelivered character(1),
    isinvoiced character(1),
    isprinted character(1),
    isselected character(1),
    sendemail character(1),
    bill_bpartner_id integer,
    bill_location_id integer,
    bill_user_id integer,
    pay_bpartner_id integer,
    pay_location_id integer,
    amounttendered numeric(22,2),
    amountrefunded numeric(22,2),
    promotioncode character varying(30),
    currency_id integer NOT NULL,
    paymentrule character varying(60),
    invoicerule character varying(60),
    deliveryrule character varying(60),
    deliveryviarule character varying(60),
    shipper character varying(60),
    taxamount numeric(20,5),
    freight numeric(20,5),
    totallines numeric(20,5) DEFAULT 0.0 NOT NULL,
    grandtotal numeric(20,5) DEFAULT 0.0 NOT NULL,
    isselfservice character(1),
    deliverynotes character varying(2000),
    asset_id integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT tpurchase_order_equipment_printed_check CHECK ((equipment_printed = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_isdelivered_check CHECK ((isdelivered = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_isinvoiced_check CHECK ((isinvoiced = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_isprinted_check CHECK ((isprinted = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_isselfservice_check CHECK ((isselfservice = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_sendemail_check CHECK ((sendemail = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 741 (class 1259 OID 73770)
-- Name: tpurchase_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tpurchase_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8878 (class 0 OID 0)
-- Dependencies: 741
-- Name: tpurchase_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tpurchase_order_id_seq OWNED BY public.tpurchase_order.id;


--
-- TOC entry 742 (class 1259 OID 73772)
-- Name: tpurchase_order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tpurchase_order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    status_code character(2) DEFAULT 'OP'::bpchar NOT NULL,
    bpartner_id integer,
    bpartner_location_id integer,
    item_name character varying(100) NOT NULL,
    item_number character varying(20) NOT NULL,
    item_desc character varying(255),
    unit_price numeric(20,5) DEFAULT 0.0 NOT NULL,
    line_total numeric(20,5) DEFAULT 0.0 NOT NULL,
    uom_id integer NOT NULL,
    currency_id integer NOT NULL,
    dateordered timestamp without time zone NOT NULL,
    datepromised timestamp without time zone,
    datedelivered timestamp without time zone,
    dateinvoiced timestamp without time zone,
    description character varying(2000),
    directship character(1) DEFAULT 'Y'::bpchar NOT NULL,
    shipper character varying(60),
    qtyordered numeric DEFAULT 0 NOT NULL,
    qtyreserved numeric,
    qtydelivered numeric,
    qtyrejected numeric,
    qtyinvoiced numeric,
    qtystocked numeric,
    pricelist numeric(20,5),
    priceactual numeric(20,5),
    pricelimit numeric(20,5),
    linenetamt numeric(20,5),
    discount numeric(20,5),
    freightamt numeric(20,5),
    tax_id integer NOT NULL,
    gross_unit_price numeric(20,5),
    line_gross_amount numeric(20,5),
    grosspricelist numeric(20,5),
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT tpurchase_order_item_directship_check CHECK ((directship = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_item_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tpurchase_order_item_status_code_check CHECK ((status_code = ANY (ARRAY['OP'::bpchar, 'AP'::bpchar, 'RE'::bpchar, 'CA'::bpchar, 'CL'::bpchar, 'DL'::bpchar])))
);


--
-- TOC entry 743 (class 1259 OID 73789)
-- Name: tpurchase_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tpurchase_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8879 (class 0 OID 0)
-- Dependencies: 743
-- Name: tpurchase_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tpurchase_order_item_id_seq OWNED BY public.tpurchase_order_item.id;


--
-- TOC entry 744 (class 1259 OID 73791)
-- Name: tpurchase_order_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tpurchase_order_status (
    id integer NOT NULL,
    order_id integer NOT NULL,
    status_code character varying(20) NOT NULL,
    textmsg character varying(1000),
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL
);


--
-- TOC entry 745 (class 1259 OID 73799)
-- Name: tpurchase_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tpurchase_order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8880 (class 0 OID 0)
-- Dependencies: 745
-- Name: tpurchase_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tpurchase_order_status_id_seq OWNED BY public.tpurchase_order_status.id;


--
-- TOC entry 746 (class 1259 OID 73801)
-- Name: devices; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.devices (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    uniqueid character varying(128) NOT NULL,
    lastupdate timestamp without time zone,
    positionid integer,
    groupid integer,
    attributes character varying(4000),
    phone character varying(128),
    model character varying(128),
    contact character varying(512),
    category character varying(128)
);


--
-- TOC entry 747 (class 1259 OID 73807)
-- Name: positions; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.positions (
    id integer NOT NULL,
    protocol character varying(128),
    deviceid integer NOT NULL,
    servertime timestamp without time zone NOT NULL,
    devicetime timestamp without time zone NOT NULL,
    fixtime timestamp without time zone NOT NULL,
    valid boolean NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    altitude double precision NOT NULL,
    speed double precision NOT NULL,
    course double precision NOT NULL,
    address character varying(512),
    attributes character varying(4000),
    accuracy double precision DEFAULT 0 NOT NULL,
    network character varying(4000)
);


--
-- TOC entry 748 (class 1259 OID 73814)
-- Name: trac_positions; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.trac_positions AS
 SELECT tp.id,
    tp.protocol,
    tp.servertime,
    tp.devicetime,
    tp.valid,
    tp.course,
    tp.fixtime,
    tp.latitude,
    tp.longitude,
    tp.altitude,
    tp.speed,
    d.id AS deviceid,
    d.active_device,
    d.phone,
    d.uniqueid,
    d.status,
    v.brand,
    v.type,
    v.plate_number,
    v.color
   FROM (((traccar.positions tp
     LEFT JOIN traccar.devices trd ON ((tp.deviceid = trd.id)))
     LEFT JOIN public.tlog_devices d ON (((trd.uniqueid)::text = (d.uniqueid)::text)))
     LEFT JOIN public.tlog_vehicles v ON ((v.id = d.vehicle_id)));


--
-- TOC entry 749 (class 1259 OID 73819)
-- Name: trbac_object_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8881 (class 0 OID 0)
-- Dependencies: 749
-- Name: trbac_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_object_id_seq OWNED BY public.trbac_object.id;


--
-- TOC entry 750 (class 1259 OID 73821)
-- Name: trbac_operation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_operation (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


--
-- TOC entry 751 (class 1259 OID 73824)
-- Name: trbac_operation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8882 (class 0 OID 0)
-- Dependencies: 751
-- Name: trbac_operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_operation_id_seq OWNED BY public.trbac_operation.id;


--
-- TOC entry 752 (class 1259 OID 73826)
-- Name: trbac_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_permission (
    id bigint NOT NULL,
    role_id integer NOT NULL,
    object_id integer NOT NULL,
    operation_id integer NOT NULL
);


--
-- TOC entry 753 (class 1259 OID 73829)
-- Name: trbac_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8883 (class 0 OID 0)
-- Dependencies: 753
-- Name: trbac_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_permission_id_seq OWNED BY public.trbac_permission.id;


--
-- TOC entry 754 (class 1259 OID 73831)
-- Name: trbac_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_role (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    name_en character varying(100),
    name_sr character varying(100),
    code character varying(10) NOT NULL
);


--
-- TOC entry 755 (class 1259 OID 73834)
-- Name: trbac_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8884 (class 0 OID 0)
-- Dependencies: 755
-- Name: trbac_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_role_id_seq OWNED BY public.trbac_role.id;


--
-- TOC entry 756 (class 1259 OID 73836)
-- Name: trbac_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_session (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(64) NOT NULL,
    created date DEFAULT now() NOT NULL
);


--
-- TOC entry 757 (class 1259 OID 73840)
-- Name: trbac_session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8885 (class 0 OID 0)
-- Dependencies: 757
-- Name: trbac_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_session_id_seq OWNED BY public.trbac_session.id;


--
-- TOC entry 758 (class 1259 OID 73842)
-- Name: trbac_session_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_session_role (
    id integer NOT NULL,
    role_id integer NOT NULL,
    session_id integer NOT NULL
);


--
-- TOC entry 759 (class 1259 OID 73845)
-- Name: trbac_session_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_session_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8886 (class 0 OID 0)
-- Dependencies: 759
-- Name: trbac_session_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_session_role_id_seq OWNED BY public.trbac_session_role.id;


--
-- TOC entry 760 (class 1259 OID 73847)
-- Name: trbac_user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trbac_user_role (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- TOC entry 761 (class 1259 OID 73850)
-- Name: trbac_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trbac_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8887 (class 0 OID 0)
-- Dependencies: 761
-- Name: trbac_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trbac_user_role_id_seq OWNED BY public.trbac_user_role.id;


--
-- TOC entry 762 (class 1259 OID 73852)
-- Name: tree_json; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.tree_json AS
 WITH RECURSIVE c AS (
         SELECT tfrm_activity_domain.id,
            tfrm_activity_domain.parent_id,
            tfrm_activity_domain.code,
            tfrm_activity_domain.name_al,
            tfrm_activity_domain.name_en,
            tfrm_activity_domain.name_sr,
            tfrm_activity_domain.type,
            tfrm_activity_domain.sort,
            0 AS lvl
           FROM public.tfrm_activity_domain
          WHERE ((tfrm_activity_domain.id = 1) AND (tfrm_activity_domain.parent_id IS NULL))
        UNION ALL
         SELECT tfrm_activity_domain.id,
            tfrm_activity_domain.parent_id,
            tfrm_activity_domain.code,
            tfrm_activity_domain.name_al,
            tfrm_activity_domain.name_en,
            tfrm_activity_domain.name_sr,
            tfrm_activity_domain.type,
            tfrm_activity_domain.sort,
            (c.lvl + 1) AS lvl
           FROM (public.tfrm_activity_domain
             JOIN c ON ((tfrm_activity_domain.parent_id = c.id)))
        ), maxlvl AS (
         SELECT max(c.lvl) AS maxlvl
           FROM c
        ), j AS (
         SELECT c.id AS key,
            c.parent_id,
            c.code,
            c.name_al AS title,
            c.name_en,
            c.name_sr,
            c.type,
            c.sort,
            c.lvl,
            '[]'::json AS children
           FROM c,
            maxlvl
          WHERE (c.lvl = maxlvl.maxlvl)
        UNION ALL
         SELECT (v.c).id AS id,
            (v.c).parent_id AS parent_id,
            (v.c).code AS code,
            (v.c).name_al AS name_al,
            (v.c).name_en AS name_en,
            (v.c).name_sr AS name_sr,
            (v.c).type AS type,
            (v.c).sort AS sort,
            (v.c).lvl AS lvl,
            array_to_json(array_agg(v.j)) AS children
           FROM ( SELECT c.*::record AS c,
                    j_1.*::record AS j
                   FROM (j j_1
                     JOIN c ON ((j_1.parent_id = c.id)))) v
          GROUP BY v.c
        )
 SELECT j.key,
    j.code,
    (row_to_json(j.*))::text AS json_tree
   FROM j;


--
-- TOC entry 763 (class 1259 OID 73857)
-- Name: tref_economic_code_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tref_economic_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8888 (class 0 OID 0)
-- Dependencies: 763
-- Name: tref_economic_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tref_economic_code_id_seq OWNED BY public.tref_economic_code.id;


--
-- TOC entry 764 (class 1259 OID 73859)
-- Name: tref_ekonomic_code; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tref_ekonomic_code (
    id bigint NOT NULL,
    parent_id integer,
    code character varying(20) NOT NULL,
    level smallint NOT NULL,
    name_al character varying(100) NOT NULL,
    name_en character varying(100),
    name_sr character varying(100)
);


--
-- TOC entry 765 (class 1259 OID 73862)
-- Name: tref_ekonomic_code_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tref_ekonomic_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8889 (class 0 OID 0)
-- Dependencies: 765
-- Name: tref_ekonomic_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tref_ekonomic_code_id_seq OWNED BY public.tref_ekonomic_code.id;


--
-- TOC entry 766 (class 1259 OID 73864)
-- Name: trequisition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequisition (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    requisition_nr character varying(36) NOT NULL,
    document_id integer,
    status_id integer,
    status_code character varying(20),
    organisation_id integer NOT NULL,
    requester_name character varying(100) NOT NULL,
    requester_phone character varying(100) NOT NULL,
    destination_type character(1) DEFAULT 'E'::bpchar NOT NULL,
    is_bpartner character(1) DEFAULT 'N'::bpchar NOT NULL,
    bpartner_id integer,
    supplier_name character varying(100),
    supplier_site character varying(100),
    supplier_contact character varying(100),
    supplier_phone character varying(100),
    supplier_address character varying(150),
    supplier_fax character varying(50),
    supplier_email character varying(150),
    total_amount numeric(20,5),
    currency_id integer NOT NULL,
    desired_date timestamp without time zone,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    textmsg character varying(2000),
    is_po character(1) DEFAULT 'N'::bpchar NOT NULL,
    CONSTRAINT trequisition_destination_type_check CHECK ((destination_type = ANY (ARRAY['E'::bpchar, 'I'::bpchar]))),
    CONSTRAINT trequisition_is_po_check CHECK ((is_po = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT trequisition_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 767 (class 1259 OID 73879)
-- Name: trequisition_account; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequisition_account (
    id integer NOT NULL,
    organisation_id integer NOT NULL,
    account_no character varying(50) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL
);


--
-- TOC entry 768 (class 1259 OID 73884)
-- Name: trequisition_account_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trequisition_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8890 (class 0 OID 0)
-- Dependencies: 768
-- Name: trequisition_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trequisition_account_id_seq OWNED BY public.trequisition_account.id;


--
-- TOC entry 769 (class 1259 OID 73886)
-- Name: trequisition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trequisition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8891 (class 0 OID 0)
-- Dependencies: 769
-- Name: trequisition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trequisition_id_seq OWNED BY public.trequisition.id;


--
-- TOC entry 770 (class 1259 OID 73888)
-- Name: trequisition_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequisition_item (
    id integer NOT NULL,
    requisition_id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    status_code character(2) DEFAULT 'OP'::bpchar NOT NULL,
    item_name character varying(100) NOT NULL,
    unit_of_issue_code character varying(5) NOT NULL,
    item_number character varying(100),
    quantity integer NOT NULL,
    unit_price numeric(20,5) NOT NULL,
    unit_price_amount numeric(20,5),
    item_desc character varying(255),
    uom_id integer NOT NULL,
    received_date timestamp without time zone NOT NULL,
    accept_date timestamp without time zone NOT NULL,
    need_by_date timestamp without time zone,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    textmsg character varying(255),
    CONSTRAINT trequisition_item_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT trequisition_item_status_code_check CHECK ((status_code = ANY (ARRAY['OP'::bpchar, 'AP'::bpchar, 'RE'::bpchar, 'CA'::bpchar, 'CL'::bpchar])))
);


--
-- TOC entry 771 (class 1259 OID 73900)
-- Name: trequisition_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trequisition_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8892 (class 0 OID 0)
-- Dependencies: 771
-- Name: trequisition_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trequisition_item_id_seq OWNED BY public.trequisition_item.id;


--
-- TOC entry 772 (class 1259 OID 73902)
-- Name: trequisition_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequisition_status (
    id integer NOT NULL,
    requisition_id integer NOT NULL,
    status_code character varying(20) NOT NULL,
    textmsg character varying(1000),
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL
);


--
-- TOC entry 773 (class 1259 OID 73910)
-- Name: trequisition_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trequisition_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8893 (class 0 OID 0)
-- Dependencies: 773
-- Name: trequisition_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trequisition_status_id_seq OWNED BY public.trequisition_status.id;


--
-- TOC entry 774 (class 1259 OID 73912)
-- Name: tshape_stand_treatment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tshape_stand_treatment (
    id integer NOT NULL,
    treatment_id integer NOT NULL,
    stand_id integer NOT NULL,
    treatment_date timestamp without time zone,
    treatment_area_perc double precision
);


--
-- TOC entry 775 (class 1259 OID 73915)
-- Name: tshape_stand_treatment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tshape_stand_treatment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8894 (class 0 OID 0)
-- Dependencies: 775
-- Name: tshape_stand_treatment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tshape_stand_treatment_id_seq OWNED BY public.tshape_stand_treatment.id;


--
-- TOC entry 776 (class 1259 OID 73917)
-- Name: tshape_treatment_name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tshape_treatment_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8895 (class 0 OID 0)
-- Dependencies: 776
-- Name: tshape_treatment_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tshape_treatment_name_id_seq OWNED BY public.tshape_treatment_name.id;


--
-- TOC entry 777 (class 1259 OID 73919)
-- Name: ttax; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ttax (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    name character varying(60) NOT NULL,
    taxcategory character varying(60) NOT NULL,
    description character varying(255),
    taxindicator character varying(10),
    validfrom timestamp without time zone NOT NULL,
    issummary character(1) DEFAULT 'N'::bpchar NOT NULL,
    requirestaxcertificate character(1) DEFAULT 'N'::bpchar NOT NULL,
    rate numeric NOT NULL,
    parent_tax_id integer,
    isdefault character(1) DEFAULT 'N'::bpchar NOT NULL,
    istaxexempt character(1) DEFAULT 'N'::bpchar NOT NULL,
    sopotype character(1) DEFAULT 'B'::bpchar NOT NULL,
    issalestax character(1) DEFAULT 'N'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT ttax_isdefault_check CHECK ((isdefault = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT ttax_issalestax_check CHECK ((issalestax = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT ttax_issummary_check CHECK ((issummary = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT ttax_istaxexempt_check CHECK ((istaxexempt = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT ttax_requirestaxcertificate_check CHECK ((requirestaxcertificate = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT ttax_sopotype_check CHECK ((sopotype = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 778 (class 1259 OID 73940)
-- Name: ttax_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ttax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8896 (class 0 OID 0)
-- Dependencies: 778
-- Name: ttax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ttax_id_seq OWNED BY public.ttax.id;


--
-- TOC entry 779 (class 1259 OID 73942)
-- Name: ttextdomain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ttextdomain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8897 (class 0 OID 0)
-- Dependencies: 779
-- Name: ttextdomain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ttextdomain_id_seq OWNED BY public.ttextdomain.id;


--
-- TOC entry 780 (class 1259 OID 73944)
-- Name: tunit_measurement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tunit_measurement (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    symbol character varying(10),
    unit double precision NOT NULL,
    name character varying(50) NOT NULL,
    name_en character varying(50),
    name_sr character varying(50),
    metric character varying(20),
    measurement character varying(50),
    relationship character varying(50),
    weight character(1) DEFAULT '0'::bpchar NOT NULL,
    CONSTRAINT tuom_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 781 (class 1259 OID 73950)
-- Name: tunit_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tunit_measurement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8898 (class 0 OID 0)
-- Dependencies: 781
-- Name: tunit_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tunit_measurement_id_seq OWNED BY public.tunit_measurement.id;


--
-- TOC entry 782 (class 1259 OID 73952)
-- Name: tunits_metric; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tunits_metric (
    id bigint NOT NULL,
    symbol character varying(10),
    unit double precision,
    name character varying(50),
    name_sr character varying(50),
    name_en character varying(50),
    metric character varying(20),
    measurement character varying(50),
    relationship character varying(50),
    active boolean DEFAULT true,
    weight character(1) DEFAULT '0'::bpchar NOT NULL
);


--
-- TOC entry 783 (class 1259 OID 73957)
-- Name: tunits_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tunits_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8899 (class 0 OID 0)
-- Dependencies: 783
-- Name: tunits_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tunits_metric_id_seq OWNED BY public.tunits_metric.id;


--
-- TOC entry 784 (class 1259 OID 73959)
-- Name: tuom; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuom (
    id integer NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    x12de355 character varying(4) NOT NULL,
    uomsymbol character varying(10),
    name character varying(60) NOT NULL,
    description character varying(255),
    stdprecision numeric(10,0) NOT NULL,
    costingprecision numeric(10,0) NOT NULL,
    isdefault character(1) DEFAULT 'N'::bpchar NOT NULL,
    uomtype character varying(30),
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT tuom_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 785 (class 1259 OID 73967)
-- Name: tuom_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8900 (class 0 OID 0)
-- Dependencies: 785
-- Name: tuom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuom_id_seq OWNED BY public.tuom.id;


--
-- TOC entry 786 (class 1259 OID 73969)
-- Name: tuom_trl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuom_trl (
    id integer NOT NULL,
    uom_id integer NOT NULL,
    ad_language character varying(6) NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    uomsymbol character varying(10),
    name character varying(60) NOT NULL,
    description character varying(255),
    istranslated character(1) DEFAULT 'N'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby integer NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby integer NOT NULL,
    CONSTRAINT tuom_trl_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT tuom_trl_istranslated_check CHECK ((istranslated = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);


--
-- TOC entry 787 (class 1259 OID 73978)
-- Name: tuom_trl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuom_trl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8901 (class 0 OID 0)
-- Dependencies: 787
-- Name: tuom_trl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuom_trl_id_seq OWNED BY public.tuom_trl.id;


--
-- TOC entry 788 (class 1259 OID 73980)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    username character varying(50) NOT NULL,
    birthdate date NOT NULL,
    personal_id character varying(20),
    gender character varying(1) NOT NULL,
    degree character varying(20),
    email character varying(50) NOT NULL,
    phone character varying(50),
    mobile character varying(50),
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    password_id integer NOT NULL,
    photo bytea,
    notes text,
    CONSTRAINT tuser_gender_check CHECK (((gender)::text = ANY (ARRAY[('M'::character varying)::text, ('F'::character varying)::text])))
);


--
-- TOC entry 789 (class 1259 OID 73989)
-- Name: tuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8902 (class 0 OID 0)
-- Dependencies: 789
-- Name: tuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_id_seq OWNED BY public.tuser.id;


--
-- TOC entry 790 (class 1259 OID 73991)
-- Name: tuser_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_log (
    id integer NOT NULL,
    user_id integer NOT NULL,
    password_created timestamp without time zone DEFAULT now() NOT NULL,
    password_generated boolean,
    login_trys integer,
    successful_login timestamp without time zone,
    failed_login timestamp without time zone,
    ip_access character varying(255)
);


--
-- TOC entry 791 (class 1259 OID 73995)
-- Name: tuser_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8903 (class 0 OID 0)
-- Dependencies: 791
-- Name: tuser_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_log_id_seq OWNED BY public.tuser_log.id;


--
-- TOC entry 792 (class 1259 OID 73997)
-- Name: tuser_login_attempt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_login_attempt (
    id bigint NOT NULL,
    account_name character varying(50) NOT NULL,
    password character varying(100),
    ip_number character varying(50),
    browser_type character varying(150),
    success boolean NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 793 (class 1259 OID 74001)
-- Name: tuser_login_attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_login_attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8904 (class 0 OID 0)
-- Dependencies: 793
-- Name: tuser_login_attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_login_attempt_id_seq OWNED BY public.tuser_login_attempt.id;


--
-- TOC entry 794 (class 1259 OID 74003)
-- Name: tuser_password; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_password (
    id integer NOT NULL,
    password character varying(100) NOT NULL,
    salt_value character varying(50),
    hash_value character varying(50),
    password_answer character varying(255),
    password_question character varying(255),
    password_status character varying(1) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 795 (class 1259 OID 74011)
-- Name: tuser_password_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_password_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8905 (class 0 OID 0)
-- Dependencies: 795
-- Name: tuser_password_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_password_id_seq OWNED BY public.tuser_password.id;


--
-- TOC entry 796 (class 1259 OID 74013)
-- Name: tvehicles_staff_assign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tvehicles_staff_assign (
    id integer NOT NULL,
    vehicles_id integer NOT NULL,
    employee_id integer NOT NULL,
    autorization boolean NOT NULL,
    created_by integer,
    created_time timestamp without time zone,
    date_of_autorization timestamp without time zone
);


--
-- TOC entry 797 (class 1259 OID 74016)
-- Name: tvehicles_staff_assign_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tvehicles_staff_assign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8906 (class 0 OID 0)
-- Dependencies: 797
-- Name: tvehicles_staff_assign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tvehicles_staff_assign_id_seq OWNED BY public.tvehicles_staff_assign.id;


--
-- TOC entry 798 (class 1259 OID 74018)
-- Name: tvehicles_tracking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tvehicles_tracking (
    id integer NOT NULL,
    vehicles_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    altidude double precision,
    time_location timestamp without time zone,
    status character varying(50),
    created_by integer NOT NULL,
    created_time timestamp without time zone NOT NULL
);


--
-- TOC entry 799 (class 1259 OID 74021)
-- Name: tvehicles_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tvehicles_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8907 (class 0 OID 0)
-- Dependencies: 799
-- Name: tvehicles_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tvehicles_tracking_id_seq OWNED BY public.tvehicles_tracking.id;


--
-- TOC entry 800 (class 1259 OID 74023)
-- Name: v_activity_domain_order_path; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_activity_domain_order_path AS
 WITH RECURSIVE tree AS (
         SELECT tfrm_activity_domain.id,
            tfrm_activity_domain.parent_id,
            tfrm_activity_domain.code,
            tfrm_activity_domain.name_al,
            tfrm_activity_domain.name_en,
            tfrm_activity_domain.name_sr,
            tfrm_activity_domain.type,
            tfrm_activity_domain.sort,
            (NULL::integer[] || tfrm_activity_domain.parent_id) AS path,
            (NULL::character varying[] || tfrm_activity_domain.code) AS pathcode,
            1 AS depth
           FROM public.tfrm_activity_domain
          WHERE (tfrm_activity_domain.parent_id = 1)
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.code,
            t.name_al,
            t.name_en,
            t.name_sr,
            t.type,
            t.sort,
            (rt.path || t.parent_id),
            (rt.pathcode || t.code),
            (rt.depth + 1)
           FROM (public.tfrm_activity_domain t
             JOIN tree rt ON ((rt.id = t.parent_id)))
        )
 SELECT tree.id,
    tree.parent_id,
    tree.code,
    tree.name_al,
    tree.name_en,
    tree.name_sr,
    tree.type,
    tree.sort,
    tree.path,
    tree.depth,
    tree.pathcode,
    ((((tree.path)::text || tree.id) || ', '::text) || (tree.sort)::text) AS text
   FROM tree
  ORDER BY ((tree.path || (tree.sort)::integer))::text;


--
-- TOC entry 801 (class 1259 OID 74028)
-- Name: v_annual_planning_activity; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_annual_planning_activity AS
 SELECT pl.id AS plan_id,
    act.id AS activity_id,
    act.activity_domain_id,
    stat.status AS annu_status,
    mun.id AS mun_id,
    mun.region_id,
    pl.year
   FROM (((public.tfrm_activity act
     LEFT JOIN public.tfrm_annual_planning pl ON ((pl.id = act.annual_planning_id)))
     LEFT JOIN public.tfrm_annual_planning_status stat ON ((stat.id = pl.status_id)))
     LEFT JOIN public.tgis_cadastral_municipality mun ON ((pl.mun_id = mun.id)));


--
-- TOC entry 802 (class 1259 OID 74033)
-- Name: vgeom_audit_activity_data; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgeom_audit_activity_data WITH (security_barrier='true') AS
 SELECT g.id,
    g.action,
    g.detail,
    g.diff,
    g.entity_id,
    g.entity_name,
    g.created_date,
    g.cerated_by,
        CASE
            WHEN ((g.diff ~~* '%POLYGON%'::text) AND (g.diff !~~* '%MULTIPOLYGON%'::text)) THEN public.st_geomfromtext((unnest(regexp_matches(g.diff, '(POLYGON [^'')'']+)'::text, 'g'::text)) || '))'::text), 900916)
            ELSE
            CASE
                WHEN (g.diff ~~* '%MULTIPOLYGON%'::text) THEN public.st_geomfromtext((unnest(regexp_matches(g.diff, '(MULTIPOLYGON [^'')'']+)'::text, 'g'::text)) || ')))'::text), 900916)
                ELSE NULL::public.geometry
            END
        END AS geom_diff
   FROM ( SELECT tables_aud.id,
            tables_aud.action,
            tables_aud.detail,
            tables_aud.diff,
            tables_aud.entity_id,
            tables_aud.entity_name,
            tables_aud.created_date,
            tables_aud.cerated_by
           FROM public.tables_aud
          WHERE ((tables_aud.diff ~~* '%planedGeom%'::text) AND (tables_aud.diff ~~* '%POLYGON%'::text) AND ((tables_aud.entity_name)::text ~~* 'Activity'::text))
          ORDER BY tables_aud.created_date DESC) g;


--
-- TOC entry 803 (class 1259 OID 74038)
-- Name: vgeom_audit_data; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgeom_audit_data WITH (security_barrier='true') AS
 SELECT g.id,
    g.action,
    g.detail,
    g.diff,
    g.entity_id,
    g.entity_name,
    g.created_date,
    g.cerated_by,
        CASE
            WHEN ((g.diff ~~* '%POLYGON%'::text) AND (g.diff !~~* '%MULTIPOLYGON%'::text)) THEN public.st_geomfromtext((unnest(regexp_matches(g.diff, '(POLYGON [^'')'']+)'::text, 'g'::text)) || '))'::text), 900916)
            ELSE
            CASE
                WHEN (g.diff ~~* '%MULTIPOLYGON%'::text) THEN public.st_geomfromtext((unnest(regexp_matches(g.diff, '(MULTIPOLYGON [^'')'']+)'::text, 'g'::text)) || ')))'::text), 900916)
                ELSE NULL::public.geometry
            END
        END AS geom_diff
   FROM ( SELECT tables_aud.id,
            tables_aud.action,
            tables_aud.detail,
            tables_aud.diff,
            tables_aud.entity_id,
            tables_aud.entity_name,
            tables_aud.created_date,
            tables_aud.cerated_by
           FROM public.tables_aud
          WHERE ((tables_aud.diff ~~* '%geom%'::text) AND (tables_aud.diff ~~* '%POLYGON%'::text))
          ORDER BY tables_aud.created_date DESC) g;


--
-- TOC entry 804 (class 1259 OID 74043)
-- Name: vgeom_audit_org_data; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgeom_audit_org_data WITH (security_barrier='true') AS
 SELECT g.id,
    g.action,
    g.detail,
    g.diff,
    g.entity_id,
    g.entity_name,
    g.created_date,
    g.cerated_by,
        CASE
            WHEN ((g.detail ~~* '%POLYGON%'::text) AND (g.detail !~~* '%MULTIPOLYGON%'::text)) THEN public.st_geomfromtext((unnest(regexp_matches(g.detail, '(POLYGON [^'')'']+)'::text, 'g'::text)) || '))'::text), 900916)
            ELSE
            CASE
                WHEN (g.detail ~~* '%MULTIPOLYGON%'::text) THEN public.st_geomfromtext((unnest(regexp_matches(g.detail, '(MULTIPOLYGON [^'')'']+)'::text, 'g'::text)) || ')))'::text), 900916)
                ELSE NULL::public.geometry
            END
        END AS geom_diff
   FROM ( SELECT tables_aud.id,
            tables_aud.action,
            tables_aud.detail,
            tables_aud.diff,
            tables_aud.entity_id,
            tables_aud.entity_name,
            tables_aud.created_date,
            tables_aud.cerated_by
           FROM public.tables_aud
          WHERE ((tables_aud.detail ~~* '%geom%'::text) AND (tables_aud.detail ~~* '%POLYGON%'::text))
          ORDER BY tables_aud.created_date DESC) g;


--
-- TOC entry 805 (class 1259 OID 74048)
-- Name: vgis_activity_har_im_ac; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_activity_har_im_ac AS
 SELECT a.id,
    a.activity_domain_id,
    a.annual_planning_id,
    a.activity_field,
    a.implemented_geom,
    har.stand_id,
    har.status_id
   FROM (public.tfrm_activity a
     LEFT JOIN public.tfrm_stand_harvest_activity har ON ((a.id = har.activity_id)))
  WHERE (((a.activity_field)::text = 'HAR'::text) AND (har.stand_id IN ( SELECT get_stand_id.id
           FROM public.get_stand_id('Y'::bpchar) get_stand_id(id, stand_id, stand_nr, compartment_id, comp_nr, mup_id, isactive, mu_id, mu_code, region_id, region_code))));


--
-- TOC entry 806 (class 1259 OID 74053)
-- Name: vgis_activity_har_pl_ac; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_activity_har_pl_ac AS
 SELECT a.id,
    a.activity_domain_id,
    a.annual_planning_id,
    a.activity_field,
    a.planed_geom,
    har.stand_id,
    har.status_id
   FROM (public.tfrm_activity a
     LEFT JOIN public.tfrm_stand_harvest_activity har ON ((a.id = har.activity_id)))
  WHERE (((a.activity_field)::text = 'HAR'::text) AND (har.stand_id IN ( SELECT get_stand_id.id
           FROM public.get_stand_id('Y'::bpchar) get_stand_id(id, stand_id, stand_nr, compartment_id, comp_nr, mup_id, isactive, mu_id, mu_code, region_id, region_code))));


--
-- TOC entry 807 (class 1259 OID 74058)
-- Name: vgis_activity_sil_im_ac; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_activity_sil_im_ac AS
 SELECT a.id,
    a.activity_domain_id,
    a.annual_planning_id,
    a.activity_field,
    a.implemented_geom,
    slv.stand_id,
    slv.status_id
   FROM (public.tfrm_activity a
     LEFT JOIN public.tfrm_stand_silviculture_activity slv ON ((a.id = slv.activity_id)))
  WHERE (((a.activity_field)::text = 'SLV'::text) AND (slv.stand_id IN ( SELECT get_stand_id.id
           FROM public.get_stand_id('Y'::bpchar) get_stand_id(id, stand_id, stand_nr, compartment_id, comp_nr, mup_id, isactive, mu_id, mu_code, region_id, region_code))));


--
-- TOC entry 808 (class 1259 OID 74063)
-- Name: vgis_activity_sil_pl_ac; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_activity_sil_pl_ac AS
 SELECT a.id,
    a.activity_domain_id,
    a.annual_planning_id,
    a.activity_field,
    a.planed_geom,
    slv.stand_id,
    slv.status_id
   FROM (public.tfrm_activity a
     LEFT JOIN public.tfrm_stand_silviculture_activity slv ON ((a.id = slv.activity_id)))
  WHERE (((a.activity_field)::text = 'SLV'::text) AND (slv.stand_id IN ( SELECT get_stand_id.id
           FROM public.get_stand_id('Y'::bpchar) get_stand_id(id, stand_id, stand_nr, compartment_id, comp_nr, mup_id, isactive, mu_id, mu_code, region_id, region_code))));


--
-- TOC entry 809 (class 1259 OID 74068)
-- Name: vgis_biodiv_active; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_biodiv_active AS
 SELECT n.code,
    n.name,
    n.name_en,
    n.name_sr,
    b.remarks,
    b.comp_nr,
    b.stand_nr,
    b.the_geom
   FROM (public.tgis_biodiv b
     LEFT JOIN public.tbiodiv_name n ON ((b.biodiv_id = n.id)))
  WHERE (b.stand_id IN ( SELECT get_stand_id.id
           FROM public.get_stand_id('Y'::bpchar) get_stand_id(id, stand_id, stand_nr, compartment_id, comp_nr, mup_id, isactive, mu_id, mu_code, region_id, region_code)));


--
-- TOC entry 810 (class 1259 OID 74073)
-- Name: vgis_land_lease; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_land_lease AS
 SELECT r.id,
    (((((COALESCE(c.comopany_name, ''::character varying))::text || ''::text) || (COALESCE(p.last_name, ''::character varying))::text) || ' '::text) || (COALESCE(p.first_name, ''::character varying))::text) AS comp,
    r.start_lease,
    r.end_lease,
    a.name_al AS req_type,
    b.status,
    r.price,
    r.lease_date,
    r.active,
    r.area,
    r.the_geom
   FROM ((((public.tfal_request r
     LEFT JOIN public.tfin_contractor c ON ((r.company_id = c.id)))
     LEFT JOIN public.tperson p ON ((r.person_id = p.id)))
     LEFT JOIN public.tfal_request_type a ON ((r.tfal_request_type_id = a.id)))
     LEFT JOIN public.tfal_request_status b ON ((r.current_status_id = b.id)));


--
-- TOC entry 811 (class 1259 OID 74078)
-- Name: vgis_municipality; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.vgis_municipality AS
 SELECT tgis_cadastral_municipality.id,
    tgis_cadastral_municipality.name,
    tgis_cadastral_municipality.name_sr,
    tgis_cadastral_municipality.name_en,
    tgis_cadastral_municipality.nr,
    tgis_cadastral_municipality.code,
    tgis_cadastral_municipality.region_id,
    ((public.st_dump(tgis_cadastral_municipality.the_geom)).geom)::public.geometry(Polygon,900916) AS the_geom,
    (public.st_dump(tgis_cadastral_municipality.the_geom)).path AS path
   FROM public.tgis_cadastral_municipality
  WITH NO DATA;


--
-- TOC entry 812 (class 1259 OID 74085)
-- Name: vgis_parcel_kult; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.vgis_parcel_kult AS
 SELECT p.id,
    p.cadparcelid,
    p.cadastrezoneid,
    p.area,
    p.mu,
    p.ow,
    p.old_parc,
    p.geom,
    pd.parc_label,
    pd.pers_stat
   FROM (public.tgis_parcelgeom p
     LEFT JOIN ( SELECT p_1.parc_geom_id,
            p_1.cadparcelid,
            min(p_1.owner_id) AS owner_id,
            min((po.pers_stat)::text) AS pers_stat,
            ((((p_1.parcelnr || '-'::text) || p_1.subparcelnr) || '
'::text) || array_to_string(array_agg((((p_1.culturename)::text || '-'::text) || p_1.clas)), '
'::text, ' '::text)) AS parc_label
           FROM (public.tparcel_detail p_1
             LEFT JOIN public.tparcel_owner po ON ((p_1.owner_id = po.id)))
          GROUP BY p_1.parc_geom_id, p_1.parcelnr, p_1.cadparcelid, p_1.subparcelnr) pd ON (((pd.cadparcelid)::text = (p.cadparcelid)::text)))
  WITH NO DATA;


--
-- TOC entry 813 (class 1259 OID 74093)
-- Name: vgis_pl_point; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_pl_point AS
 SELECT ok.id,
    ok.activity_domain_id,
    ok.annual_planning_id,
    ok.activity_field,
    ok.stand_id,
    ok.status_id,
    (((ok.dp).path[1] || '-'::text) || (ok.dp).path[2]) AS index,
    public.st_x((ok.dp).geom) AS x,
    public.st_y((ok.dp).geom) AS y,
    (ok.dp).geom AS geom
   FROM ( SELECT vgis_activity_har_pl_ac.id,
            vgis_activity_har_pl_ac.activity_domain_id,
            vgis_activity_har_pl_ac.annual_planning_id,
            vgis_activity_har_pl_ac.activity_field,
            vgis_activity_har_pl_ac.stand_id,
            vgis_activity_har_pl_ac.status_id,
            public.st_dumppoints(public.st_simplifypreservetopology(vgis_activity_har_pl_ac.planed_geom, (10)::double precision)) AS dp
           FROM public.vgis_activity_har_pl_ac) ok;


--
-- TOC entry 814 (class 1259 OID 74098)
-- Name: vgis_stand_active; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vgis_stand_active AS
 SELECT s.id,
    s.stand_id,
    s.stand_nr,
    s.mngm_class,
    s.stand_type,
    s.basal_area,
    s.the_geom,
    t.domtext AS mngm_name_al
   FROM (( SELECT tgis_stand.id,
            tgis_stand.stand_id,
            tgis_stand.stand_nr,
            tgis_stand.mngm_class,
            tgis_stand.stand_type,
            tgis_stand.basal_area,
            tgis_stand.the_geom
           FROM public.tgis_stand
          WHERE (tgis_stand.id IN ( SELECT get_stand_id.id
                   FROM public.get_stand_id('Y'::bpchar) get_stand_id(id, stand_id, stand_nr, compartment_id, comp_nr, mup_id, isactive, mu_id, mu_code, region_id, region_code)))) s
     LEFT JOIN ( SELECT ttextdomain.id,
            ttextdomain.domname,
            ttextdomain.domvalue,
            ttextdomain.domkey,
            ttextdomain.sort,
            ttextdomain.domtext,
            ttextdomain.domtext_en,
            ttextdomain.domtext_sr
           FROM public.ttextdomain
          WHERE ((ttextdomain.domname)::text = 'MNGMCLASS'::text)) t ON (((s.mngm_class)::text = (t.domkey)::text)));


--
-- TOC entry 815 (class 1259 OID 74103)
-- Name: vw_layers_export; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vw_layers_export AS
 SELECT pg_views.viewname
   FROM pg_views
  WHERE (pg_views.viewname ~~* 'ex%'::text);


--
-- TOC entry 816 (class 1259 OID 74107)
-- Name: wr_lumenjet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wr_lumenjet (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,900916)
);


--
-- TOC entry 817 (class 1259 OID 74113)
-- Name: attribute_aliases; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.attribute_aliases (
    id integer NOT NULL,
    deviceid integer NOT NULL,
    attribute character varying(128) NOT NULL,
    alias character varying(128) NOT NULL
);


--
-- TOC entry 818 (class 1259 OID 74116)
-- Name: attribute_aliases_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.attribute_aliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8908 (class 0 OID 0)
-- Dependencies: 818
-- Name: attribute_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.attribute_aliases_id_seq OWNED BY traccar.attribute_aliases.id;


--
-- TOC entry 819 (class 1259 OID 74118)
-- Name: calendars; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.calendars (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    data oid NOT NULL,
    attributes character varying(4000) NOT NULL
);


--
-- TOC entry 820 (class 1259 OID 74124)
-- Name: calendars_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.calendars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8909 (class 0 OID 0)
-- Dependencies: 820
-- Name: calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.calendars_id_seq OWNED BY traccar.calendars.id;


--
-- TOC entry 821 (class 1259 OID 74126)
-- Name: databasechangelog; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- TOC entry 822 (class 1259 OID 74132)
-- Name: databasechangeloglock; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- TOC entry 823 (class 1259 OID 74135)
-- Name: device_geofence; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.device_geofence (
    deviceid integer NOT NULL,
    geofenceid integer NOT NULL
);


--
-- TOC entry 824 (class 1259 OID 74138)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8910 (class 0 OID 0)
-- Dependencies: 824
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.devices_id_seq OWNED BY traccar.devices.id;


--
-- TOC entry 825 (class 1259 OID 74140)
-- Name: events; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.events (
    id integer NOT NULL,
    type character varying(128) NOT NULL,
    servertime timestamp without time zone NOT NULL,
    deviceid integer,
    positionid integer,
    geofenceid integer,
    attributes character varying(4000)
);


--
-- TOC entry 826 (class 1259 OID 74146)
-- Name: events_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8911 (class 0 OID 0)
-- Dependencies: 826
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.events_id_seq OWNED BY traccar.events.id;


--
-- TOC entry 827 (class 1259 OID 74148)
-- Name: geofences; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.geofences (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(128),
    area character varying(4096) NOT NULL,
    attributes character varying(4000),
    calendarid integer
);


--
-- TOC entry 828 (class 1259 OID 74154)
-- Name: geofences_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.geofences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8912 (class 0 OID 0)
-- Dependencies: 828
-- Name: geofences_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.geofences_id_seq OWNED BY traccar.geofences.id;


--
-- TOC entry 829 (class 1259 OID 74156)
-- Name: group_geofence; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.group_geofence (
    groupid integer NOT NULL,
    geofenceid integer NOT NULL
);


--
-- TOC entry 830 (class 1259 OID 74159)
-- Name: groups; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.groups (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    groupid integer,
    attributes character varying(4000)
);


--
-- TOC entry 831 (class 1259 OID 74165)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8913 (class 0 OID 0)
-- Dependencies: 831
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.groups_id_seq OWNED BY traccar.groups.id;


--
-- TOC entry 832 (class 1259 OID 74167)
-- Name: notifications; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.notifications (
    id integer NOT NULL,
    userid integer NOT NULL,
    type character varying(128) NOT NULL,
    attributes character varying(4000),
    web boolean DEFAULT false,
    mail boolean DEFAULT false,
    sms boolean DEFAULT false
);


--
-- TOC entry 833 (class 1259 OID 74176)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8914 (class 0 OID 0)
-- Dependencies: 833
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.notifications_id_seq OWNED BY traccar.notifications.id;


--
-- TOC entry 834 (class 1259 OID 74178)
-- Name: positions_aud; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.positions_aud (
    audit_id integer NOT NULL,
    operation character(1) NOT NULL,
    stamp timestamp without time zone NOT NULL,
    dbuser text NOT NULL,
    id integer NOT NULL,
    protocol character varying(128),
    deviceid integer NOT NULL,
    servertime timestamp without time zone NOT NULL,
    devicetime timestamp without time zone NOT NULL,
    fixtime timestamp without time zone NOT NULL,
    valid boolean NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    altitude double precision NOT NULL,
    speed double precision NOT NULL,
    course double precision NOT NULL,
    address character varying(512),
    attributes character varying(4000),
    accuracy double precision DEFAULT 0 NOT NULL,
    network character varying(4000)
);


--
-- TOC entry 835 (class 1259 OID 74185)
-- Name: positions_aud_audit_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.positions_aud_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8915 (class 0 OID 0)
-- Dependencies: 835
-- Name: positions_aud_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.positions_aud_audit_id_seq OWNED BY traccar.positions_aud.audit_id;


--
-- TOC entry 836 (class 1259 OID 74187)
-- Name: positions_aud_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.positions_aud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8916 (class 0 OID 0)
-- Dependencies: 836
-- Name: positions_aud_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.positions_aud_id_seq OWNED BY traccar.positions_aud.id;


--
-- TOC entry 837 (class 1259 OID 74189)
-- Name: positions_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8917 (class 0 OID 0)
-- Dependencies: 837
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.positions_id_seq OWNED BY traccar.positions.id;


--
-- TOC entry 838 (class 1259 OID 74191)
-- Name: server; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.server (
    id integer NOT NULL,
    registration boolean DEFAULT true NOT NULL,
    latitude double precision DEFAULT 0 NOT NULL,
    longitude double precision DEFAULT 0 NOT NULL,
    zoom integer DEFAULT 0 NOT NULL,
    map character varying(128),
    distanceunit character varying(128),
    speedunit character varying(128),
    bingkey character varying(128),
    mapurl character varying(512),
    readonly boolean DEFAULT false NOT NULL,
    twelvehourformat boolean DEFAULT false NOT NULL,
    attributes character varying(4000),
    forcesettings boolean DEFAULT false NOT NULL,
    coordinateformat character varying(128),
    devicereadonly boolean DEFAULT false,
    timezone character varying(128)
);


--
-- TOC entry 839 (class 1259 OID 74205)
-- Name: server_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8918 (class 0 OID 0)
-- Dependencies: 839
-- Name: server_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.server_id_seq OWNED BY traccar.server.id;


--
-- TOC entry 840 (class 1259 OID 74207)
-- Name: statistics; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.statistics (
    id integer NOT NULL,
    capturetime timestamp without time zone NOT NULL,
    activeusers integer DEFAULT 0 NOT NULL,
    activedevices integer DEFAULT 0 NOT NULL,
    requests integer DEFAULT 0 NOT NULL,
    messagesreceived integer DEFAULT 0 NOT NULL,
    messagesstored integer DEFAULT 0 NOT NULL,
    attributes character varying(4000) NOT NULL
);


--
-- TOC entry 841 (class 1259 OID 74218)
-- Name: statistics_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8919 (class 0 OID 0)
-- Dependencies: 841
-- Name: statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.statistics_id_seq OWNED BY traccar.statistics.id;


--
-- TOC entry 842 (class 1259 OID 74220)
-- Name: user_calendar; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.user_calendar (
    userid integer NOT NULL,
    calendarid integer NOT NULL
);


--
-- TOC entry 843 (class 1259 OID 74223)
-- Name: user_device; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.user_device (
    userid integer NOT NULL,
    deviceid integer NOT NULL
);


--
-- TOC entry 844 (class 1259 OID 74226)
-- Name: user_geofence; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.user_geofence (
    userid integer NOT NULL,
    geofenceid integer NOT NULL
);


--
-- TOC entry 845 (class 1259 OID 74229)
-- Name: user_group; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.user_group (
    userid integer NOT NULL,
    groupid integer NOT NULL
);


--
-- TOC entry 846 (class 1259 OID 74232)
-- Name: user_user; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.user_user (
    userid integer NOT NULL,
    manageduserid integer NOT NULL
);


--
-- TOC entry 847 (class 1259 OID 74235)
-- Name: users; Type: TABLE; Schema: traccar; Owner: -
--

CREATE TABLE traccar.users (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    email character varying(128) NOT NULL,
    hashedpassword character varying(128) NOT NULL,
    salt character varying(128) NOT NULL,
    readonly boolean DEFAULT false NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    map character varying(128) DEFAULT NULL::character varying,
    distanceunit character varying(128) DEFAULT NULL::character varying,
    speedunit character varying(128) DEFAULT NULL::character varying,
    latitude double precision DEFAULT 0 NOT NULL,
    longitude double precision DEFAULT 0 NOT NULL,
    zoom integer DEFAULT 0 NOT NULL,
    twelvehourformat boolean DEFAULT false NOT NULL,
    attributes character varying(4000),
    coordinateformat character varying(128),
    disabled boolean DEFAULT false,
    expirationtime timestamp without time zone,
    devicelimit integer DEFAULT '-1'::integer,
    token character varying(128),
    userlimit integer DEFAULT 0,
    devicereadonly boolean DEFAULT false,
    phone character varying(128),
    timezone character varying(128)
);


--
-- TOC entry 848 (class 1259 OID 74254)
-- Name: users_id_seq; Type: SEQUENCE; Schema: traccar; Owner: -
--

CREATE SEQUENCE traccar.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 8920 (class 0 OID 0)
-- Dependencies: 848
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: traccar; Owner: -
--

ALTER SEQUENCE traccar.users_id_seq OWNED BY traccar.users.id;


--
-- TOC entry 6310 (class 2604 OID 74256)
-- Name: ekonomic_code id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ekonomic_code ALTER COLUMN id SET DEFAULT nextval('public.ekonomic_code_id_seq'::regclass);


--
-- TOC entry 6349 (class 2604 OID 74257)
-- Name: iso_metadata id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iso_metadata ALTER COLUMN id SET DEFAULT nextval('public.iso_metadata_id_seq'::regclass);


--
-- TOC entry 6305 (class 2604 OID 74258)
-- Name: komuna id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.komuna ALTER COLUMN id SET DEFAULT nextval('public."Komuna_id_seq"'::regclass);


--
-- TOC entry 6353 (class 2604 OID 74259)
-- Name: liqenet2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.liqenet2 ALTER COLUMN id SET DEFAULT nextval('public.liqenet2_id_seq'::regclass);


--
-- TOC entry 6354 (class 2604 OID 74260)
-- Name: poligon id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poligon ALTER COLUMN id SET DEFAULT nextval('public.poligon_id_seq'::regclass);


--
-- TOC entry 6357 (class 2604 OID 74261)
-- Name: shape_biodiversity ogc_fid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_biodiversity ALTER COLUMN ogc_fid SET DEFAULT nextval('public.shape_biodiversity_ogc_fid_seq'::regclass);


--
-- TOC entry 6362 (class 2604 OID 74262)
-- Name: shape_plot_trees ogc_fid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_plot_trees ALTER COLUMN ogc_fid SET DEFAULT nextval('public.shape_plot_trees_ogc_fid_seq'::regclass);


--
-- TOC entry 6363 (class 2604 OID 74263)
-- Name: shape_plots ogc_fid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_plots ALTER COLUMN ogc_fid SET DEFAULT nextval('public.shape_plots_ogc_fid_seq'::regclass);


--
-- TOC entry 6358 (class 2604 OID 74264)
-- Name: shape_stand ogc_fid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_stand ALTER COLUMN ogc_fid SET DEFAULT nextval('public.shape_stand_ogc_fid_seq'::regclass);


--
-- TOC entry 6359 (class 2604 OID 74265)
-- Name: shape_stand id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_stand ALTER COLUMN id SET DEFAULT nextval('public.shape_stand_id_seq'::regclass);


--
-- TOC entry 6364 (class 2604 OID 74266)
-- Name: stand_temp gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stand_temp ALTER COLUMN gid SET DEFAULT nextval('public.stand_temp_gid_seq'::regclass);


--
-- TOC entry 6365 (class 2604 OID 74267)
-- Name: standfc ogc_fid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standfc ALTER COLUMN ogc_fid SET DEFAULT nextval('public.standfc_ogc_fid_seq'::regclass);


--
-- TOC entry 6366 (class 2604 OID 74268)
-- Name: tables_aud id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables_aud ALTER COLUMN id SET DEFAULT nextval('public.tables_aud_id_seq'::regclass);


--
-- TOC entry 6374 (class 2604 OID 74269)
-- Name: tad_language id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tad_language ALTER COLUMN id SET DEFAULT nextval('public.tad_language_id_seq'::regclass);


--
-- TOC entry 6378 (class 2604 OID 74270)
-- Name: taddress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taddress ALTER COLUMN id SET DEFAULT nextval('public.taddress_id_seq'::regclass);


--
-- TOC entry 6383 (class 2604 OID 74271)
-- Name: talert id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert ALTER COLUMN id SET DEFAULT nextval('public.talert_id_seq'::regclass);


--
-- TOC entry 6388 (class 2604 OID 74272)
-- Name: talertrecipient id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient ALTER COLUMN id SET DEFAULT nextval('public.talertrecipient_id_seq'::regclass);


--
-- TOC entry 6392 (class 2604 OID 74273)
-- Name: talertrule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule ALTER COLUMN id SET DEFAULT nextval('public.talertrule_id_seq'::regclass);


--
-- TOC entry 6397 (class 2604 OID 74274)
-- Name: talertrule_trl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl ALTER COLUMN id SET DEFAULT nextval('public.talertrule_trl_id_seq'::regclass);


--
-- TOC entry 6400 (class 2604 OID 74275)
-- Name: tassets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets ALTER COLUMN id SET DEFAULT nextval('public.tassets_id_seq'::regclass);


--
-- TOC entry 6401 (class 2604 OID 74276)
-- Name: tassets_devaluation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_devaluation ALTER COLUMN id SET DEFAULT nextval('public.tassets_devaluation_id_seq'::regclass);


--
-- TOC entry 6402 (class 2604 OID 74277)
-- Name: tassets_staff_assign id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_staff_assign ALTER COLUMN id SET DEFAULT nextval('public.tassets_staff_assign_id_seq'::regclass);


--
-- TOC entry 6403 (class 2604 OID 74278)
-- Name: tb_monitor_eval id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_monitor_eval ALTER COLUMN id SET DEFAULT nextval('public.tb_monitor_eval_id_seq'::regclass);


--
-- TOC entry 6404 (class 2604 OID 74279)
-- Name: tbiodiv_name id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbiodiv_name ALTER COLUMN id SET DEFAULT nextval('public.tbiodiv_name_id_seq'::regclass);


--
-- TOC entry 6415 (class 2604 OID 74280)
-- Name: tbpartner id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner ALTER COLUMN id SET DEFAULT nextval('public.tbpartner_id_seq'::regclass);


--
-- TOC entry 6424 (class 2604 OID 74281)
-- Name: tbpartner_location id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner_location ALTER COLUMN id SET DEFAULT nextval('public.tbpartner_location_id_seq'::regclass);


--
-- TOC entry 6435 (class 2604 OID 74282)
-- Name: tcurrency id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcurrency ALTER COLUMN id SET DEFAULT nextval('public.tcurrency_id_seq'::regclass);


--
-- TOC entry 6437 (class 2604 OID 74283)
-- Name: tdhpet_activity_management id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_activity_management ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_activity_management_id_seq'::regclass);


--
-- TOC entry 6438 (class 2604 OID 74284)
-- Name: tdhpet_animal_capacity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_capacity ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_animal_capacity_id_seq'::regclass);


--
-- TOC entry 6439 (class 2604 OID 74285)
-- Name: tdhpet_animal_location id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_animal_location_id_seq'::regclass);


--
-- TOC entry 6440 (class 2604 OID 74286)
-- Name: tdhpet_animal_location_detail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location_detail ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_animal_location_detail_id_seq'::regclass);


--
-- TOC entry 6441 (class 2604 OID 74287)
-- Name: tdhpet_annual_plan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_annual_plan ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_annual_plan_id_seq'::regclass);


--
-- TOC entry 6442 (class 2604 OID 74288)
-- Name: tdhpet_hunt_ground_eval id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunt_ground_eval ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_hunt_ground_eval_id_seq'::regclass);


--
-- TOC entry 6443 (class 2604 OID 74289)
-- Name: tdhpet_hunted_animal_detail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animal_detail ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_hunted_animal_detail_id_seq'::regclass);


--
-- TOC entry 6445 (class 2604 OID 74290)
-- Name: tdhpet_hunted_animals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animals ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_hunted_animals_id_seq'::regclass);


--
-- TOC entry 6306 (class 2604 OID 74291)
-- Name: tdhpet_location id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_location_id_seq'::regclass);


--
-- TOC entry 6446 (class 2604 OID 74292)
-- Name: tdhpet_location_land_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location_land_type ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_location_land_type_id_seq'::regclass);


--
-- TOC entry 6447 (class 2604 OID 74293)
-- Name: tdhpet_period_plan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_period_plan ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_period_plan_id_seq'::regclass);


--
-- TOC entry 6451 (class 2604 OID 74294)
-- Name: tdhpet_tourist_purpose id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_purpose ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_tourist_purpose_id_seq'::regclass);


--
-- TOC entry 6452 (class 2604 OID 74295)
-- Name: tdhpet_tourist_register id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_register ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_tourist_register_id_seq'::regclass);


--
-- TOC entry 6308 (class 2604 OID 74296)
-- Name: tdhpet_tourist_zone_geoms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_zone_geoms ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_tourist_zone_geoms_id_seq'::regclass);


--
-- TOC entry 6456 (class 2604 OID 74297)
-- Name: tdhpet_wild_animals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_wild_animals_id_seq'::regclass);


--
-- TOC entry 6457 (class 2604 OID 74298)
-- Name: tdhpet_wild_animals_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals_request ALTER COLUMN id SET DEFAULT nextval('public.tdhpet_wild_animals_request_id_seq'::regclass);


--
-- TOC entry 6462 (class 2604 OID 74299)
-- Name: tdoc_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoc_category ALTER COLUMN id SET DEFAULT nextval('public.tdoc_category_id_seq'::regclass);


--
-- TOC entry 6469 (class 2604 OID 74300)
-- Name: tdoctype id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoctype ALTER COLUMN id SET DEFAULT nextval('public.tdoctype_id_seq'::regclass);


--
-- TOC entry 6472 (class 2604 OID 74301)
-- Name: tdomain id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdomain ALTER COLUMN id SET DEFAULT nextval('public.tdomain_id_seq'::regclass);


--
-- TOC entry 6479 (class 2604 OID 74302)
-- Name: tdp_mngmt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt ALTER COLUMN id SET DEFAULT nextval('public.tdp_mngmt_id_seq'::regclass);


--
-- TOC entry 6484 (class 2604 OID 74303)
-- Name: tdp_mngmt_attach id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_attach ALTER COLUMN id SET DEFAULT nextval('public.tdp_mngmt_attach_id_seq'::regclass);


--
-- TOC entry 6487 (class 2604 OID 74304)
-- Name: tdp_mngmt_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_settings ALTER COLUMN id SET DEFAULT nextval('public.tdp_mngmt_settings_id_seq'::regclass);


--
-- TOC entry 6491 (class 2604 OID 74305)
-- Name: tdp_mngmt_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status ALTER COLUMN id SET DEFAULT nextval('public.tdp_mngmt_status_id_seq'::regclass);


--
-- TOC entry 6492 (class 2604 OID 74306)
-- Name: tfal_cad_parcel_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_cad_parcel_request ALTER COLUMN id SET DEFAULT nextval('public.tfal_cad_parcel_request_id_seq'::regclass);


--
-- TOC entry 6335 (class 2604 OID 74307)
-- Name: tfal_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request ALTER COLUMN id SET DEFAULT nextval('public.tfal_request_id_seq'::regclass);


--
-- TOC entry 6493 (class 2604 OID 74308)
-- Name: tfal_request_coord id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_coord ALTER COLUMN id SET DEFAULT nextval('public.tfal_request_coord_id_seq'::regclass);


--
-- TOC entry 6495 (class 2604 OID 74309)
-- Name: tfal_request_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_doc ALTER COLUMN id SET DEFAULT nextval('public.tfal_request_doc_id_seq'::regclass);


--
-- TOC entry 6342 (class 2604 OID 74310)
-- Name: tfal_request_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_status ALTER COLUMN id SET DEFAULT nextval('public.tfal_request_status_id_seq'::regclass);


--
-- TOC entry 6343 (class 2604 OID 74311)
-- Name: tfal_request_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_type ALTER COLUMN id SET DEFAULT nextval('public.tfal_request_type_id_seq'::regclass);


--
-- TOC entry 6497 (class 2604 OID 74312)
-- Name: tfin_annu_budget_alloc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_annu_budget_alloc ALTER COLUMN id SET DEFAULT nextval('public.tfin_annu_budget_alloc_id_seq'::regclass);


--
-- TOC entry 6498 (class 2604 OID 74313)
-- Name: tfin_budget_mainntenance id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_budget_mainntenance ALTER COLUMN id SET DEFAULT nextval('public.tfin_budget_mainntenance_id_seq'::regclass);


--
-- TOC entry 6499 (class 2604 OID 74314)
-- Name: tfin_contract id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract ALTER COLUMN id SET DEFAULT nextval('public.tfin_contract_id_seq'::regclass);


--
-- TOC entry 6500 (class 2604 OID 74315)
-- Name: tfin_contract_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract_doc ALTER COLUMN id SET DEFAULT nextval('public.tfin_contract_doc_id_seq'::regclass);


--
-- TOC entry 6501 (class 2604 OID 74316)
-- Name: tfin_contractor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contractor ALTER COLUMN id SET DEFAULT nextval('public.tfin_contractor_id_seq'::regclass);


--
-- TOC entry 6502 (class 2604 OID 74317)
-- Name: tfin_input id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input ALTER COLUMN id SET DEFAULT nextval('public.tfin_input_id_seq'::regclass);


--
-- TOC entry 6504 (class 2604 OID 74318)
-- Name: tfin_input_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input_status ALTER COLUMN id SET DEFAULT nextval('public.tfin_input_status_id_seq'::regclass);


--
-- TOC entry 6506 (class 2604 OID 74319)
-- Name: tfin_output id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_output ALTER COLUMN id SET DEFAULT nextval('public.tfin_output_id_seq'::regclass);


--
-- TOC entry 6507 (class 2604 OID 74320)
-- Name: tfin_payment_period id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_payment_period ALTER COLUMN id SET DEFAULT nextval('public.tfin_payment_period_id_seq'::regclass);


--
-- TOC entry 6930 (class 2604 OID 106916)
-- Name: tfin_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_type ALTER COLUMN id SET DEFAULT nextval('public.tfin_type_id_seq'::regclass);


--
-- TOC entry 6312 (class 2604 OID 74322)
-- Name: tfrm_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_activity_id_seq'::regclass);


--
-- TOC entry 6508 (class 2604 OID 74323)
-- Name: tfrm_activity_domain id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_domain ALTER COLUMN id SET DEFAULT nextval('public.tfrm_activity_domain_id_seq'::regclass);


--
-- TOC entry 6509 (class 2604 OID 74324)
-- Name: tfrm_activity_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status ALTER COLUMN id SET DEFAULT nextval('public.tfrm_activity_status_id_seq'::regclass);


--
-- TOC entry 6511 (class 2604 OID 74325)
-- Name: tfrm_activity_status_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status_doc ALTER COLUMN id SET DEFAULT nextval('public.tfrm_activity_status_doc_id_seq'::regclass);


--
-- TOC entry 6314 (class 2604 OID 74326)
-- Name: tfrm_annual_planning id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning ALTER COLUMN id SET DEFAULT nextval('public.tfrm_annual_planning_id_seq'::regclass);


--
-- TOC entry 6512 (class 2604 OID 74327)
-- Name: tfrm_annual_planning_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning_status ALTER COLUMN id SET DEFAULT nextval('public.tfrm_annual_planning_status_id_seq'::regclass);


--
-- TOC entry 6514 (class 2604 OID 74328)
-- Name: tfrm_annual_protection_plan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_protection_plan ALTER COLUMN id SET DEFAULT nextval('public.tfrm_annual_protection_plan_id_seq'::regclass);


--
-- TOC entry 6515 (class 2604 OID 74329)
-- Name: tfrm_bio_diversity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_bio_diversity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_bio_diversity_id_seq'::regclass);


--
-- TOC entry 6516 (class 2604 OID 74330)
-- Name: tfrm_bio_diversity_name id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_bio_diversity_name ALTER COLUMN id SET DEFAULT nextval('public.tfrm_bio_diversity_name_id_seq'::regclass);


--
-- TOC entry 6518 (class 2604 OID 74331)
-- Name: tfrm_confiscation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation ALTER COLUMN id SET DEFAULT nextval('public.tfrm_confiscation_id_seq'::regclass);


--
-- TOC entry 6519 (class 2604 OID 74332)
-- Name: tfrm_confiscation_detail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation_detail ALTER COLUMN id SET DEFAULT nextval('public.tfrm_confiscation_detail_id_seq'::regclass);


--
-- TOC entry 6520 (class 2604 OID 74333)
-- Name: tfrm_domain id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain ALTER COLUMN id SET DEFAULT nextval('public.tfrm_domain_id_seq'::regclass);


--
-- TOC entry 6521 (class 2604 OID 74334)
-- Name: tfrm_domain_name id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain_name ALTER COLUMN id SET DEFAULT nextval('public.tfrm_domain_name_id_seq'::regclass);


--
-- TOC entry 6522 (class 2604 OID 74335)
-- Name: tfrm_fire_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_details ALTER COLUMN id SET DEFAULT nextval('public.tfrm_fire_details_id_seq'::regclass);


--
-- TOC entry 6523 (class 2604 OID 74336)
-- Name: tfrm_fire_report id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_report ALTER COLUMN id SET DEFAULT nextval('public.tfrm_fire_report_id_seq'::regclass);


--
-- TOC entry 6526 (class 2604 OID 74337)
-- Name: tfrm_fiskos_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_data ALTER COLUMN id SET DEFAULT nextval('public.tfrm_fiskos_data_id_seq'::regclass);


--
-- TOC entry 6527 (class 2604 OID 74338)
-- Name: tfrm_fiskos_import id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_import ALTER COLUMN id SET DEFAULT nextval('public.tfrm_fiskos_import_id_seq'::regclass);


--
-- TOC entry 6530 (class 2604 OID 74339)
-- Name: tfrm_harvest_impl_transport id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_harvest_impl_transport ALTER COLUMN id SET DEFAULT nextval('public.tfrm_harvest_impl_transport_id_seq'::regclass);


--
-- TOC entry 6531 (class 2604 OID 74340)
-- Name: tfrm_insp_action_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_insp_action_type ALTER COLUMN id SET DEFAULT nextval('public.tfrm_insp_action_type_id_seq'::regclass);


--
-- TOC entry 6532 (class 2604 OID 74341)
-- Name: tfrm_inspection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection ALTER COLUMN id SET DEFAULT nextval('public.tfrm_inspection_id_seq'::regclass);


--
-- TOC entry 6533 (class 2604 OID 74342)
-- Name: tfrm_inspection_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection_doc ALTER COLUMN id SET DEFAULT nextval('public.tfrm_inspection_doc_id_seq'::regclass);


--
-- TOC entry 6534 (class 2604 OID 74343)
-- Name: tfrm_inspector id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspector ALTER COLUMN id SET DEFAULT nextval('public.tfrm_inspector_id_seq'::regclass);


--
-- TOC entry 6535 (class 2604 OID 74344)
-- Name: tfrm_landscap_plan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_landscap_plan ALTER COLUMN id SET DEFAULT nextval('public.tfrm_landscap_plan_id_seq'::regclass);


--
-- TOC entry 6536 (class 2604 OID 74345)
-- Name: tfrm_management_class id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_management_class ALTER COLUMN id SET DEFAULT nextval('public.tfrm_management_class_id_seq'::regclass);


--
-- TOC entry 6537 (class 2604 OID 74346)
-- Name: tfrm_private_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_private_activity_id_seq'::regclass);


--
-- TOC entry 6542 (class 2604 OID 74347)
-- Name: tfrm_private_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request ALTER COLUMN id SET DEFAULT nextval('public.tfrm_private_request_id_seq'::regclass);


--
-- TOC entry 6543 (class 2604 OID 74348)
-- Name: tfrm_private_request_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_doc ALTER COLUMN id SET DEFAULT nextval('public.tfrm_private_request_doc_id_seq'::regclass);


--
-- TOC entry 6545 (class 2604 OID 74349)
-- Name: tfrm_private_request_impl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_impl ALTER COLUMN id SET DEFAULT nextval('public.tfrm_private_request_impl_id_seq'::regclass);


--
-- TOC entry 6316 (class 2604 OID 74350)
-- Name: tfrm_protection_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_protection_activity_id_seq'::regclass);


--
-- TOC entry 6546 (class 2604 OID 74351)
-- Name: tfrm_protection_impl_declare id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_impl_declare ALTER COLUMN id SET DEFAULT nextval('public.tfrm_protection_impl_declare_id_seq'::regclass);


--
-- TOC entry 6318 (class 2604 OID 74352)
-- Name: tfrm_road_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_road_activity_id_seq'::regclass);


--
-- TOC entry 6547 (class 2604 OID 74353)
-- Name: tfrm_road_impl_declare id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_impl_declare ALTER COLUMN id SET DEFAULT nextval('public.tfrm_road_impl_declare_id_seq'::regclass);


--
-- TOC entry 6548 (class 2604 OID 74354)
-- Name: tfrm_seed_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_seed_activity_id_seq'::regclass);


--
-- TOC entry 6550 (class 2604 OID 74355)
-- Name: tfrm_seedling_inventory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory ALTER COLUMN id SET DEFAULT nextval('public.tfrm_seedling_inventory_id_seq'::regclass);


--
-- TOC entry 6553 (class 2604 OID 74356)
-- Name: tfrm_seedling_inventory_pos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos ALTER COLUMN id SET DEFAULT nextval('public.tfrm_seedling_inventory_pos_id_seq'::regclass);


--
-- TOC entry 6556 (class 2604 OID 74357)
-- Name: tfrm_siviculture_plan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_siviculture_plan ALTER COLUMN id SET DEFAULT nextval('public.tfrm_siviculture_plan_id_seq'::regclass);


--
-- TOC entry 6320 (class 2604 OID 74358)
-- Name: tfrm_stand_harvest_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_harvest_activity_id_seq'::regclass);


--
-- TOC entry 6557 (class 2604 OID 74359)
-- Name: tfrm_stand_harvest_impl_declare id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_impl_declare ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_harvest_impl_declare_id_seq'::regclass);


--
-- TOC entry 6558 (class 2604 OID 74360)
-- Name: tfrm_stand_harvest_marked id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_marked ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_harvest_marked_id_seq'::regclass);


--
-- TOC entry 6322 (class 2604 OID 74361)
-- Name: tfrm_stand_planting_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_planting_activity_id_seq'::regclass);


--
-- TOC entry 6559 (class 2604 OID 74362)
-- Name: tfrm_stand_planting_impl_declare id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_impl_declare ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_planting_impl_declare_id_seq'::regclass);


--
-- TOC entry 6324 (class 2604 OID 74363)
-- Name: tfrm_stand_silviculture_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_silviculture_activity_id_seq'::regclass);


--
-- TOC entry 6560 (class 2604 OID 74364)
-- Name: tfrm_stand_silviculture_impl_declare id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_impl_declare ALTER COLUMN id SET DEFAULT nextval('public.tfrm_stand_silviculture_impl_declare_id_seq'::regclass);


--
-- TOC entry 6561 (class 2604 OID 74365)
-- Name: tfrm_treatment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_treatment ALTER COLUMN id SET DEFAULT nextval('public.tfrm_treatment_id_seq'::regclass);


--
-- TOC entry 6562 (class 2604 OID 74366)
-- Name: tfrm_treatment_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_treatment_group ALTER COLUMN id SET DEFAULT nextval('public.tfrm_treatment_group_id_seq'::regclass);


--
-- TOC entry 6360 (class 2604 OID 74367)
-- Name: tfrm_tree_species id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_tree_species ALTER COLUMN id SET DEFAULT nextval('public.tfrm_tree_species_id_seq'::regclass);


--
-- TOC entry 6563 (class 2604 OID 74368)
-- Name: tfuell_consum id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfuell_consum ALTER COLUMN id SET DEFAULT nextval('public.tfuell_consum_id_seq'::regclass);


--
-- TOC entry 6564 (class 2604 OID 74369)
-- Name: tgis_af_ref_01_national_forest_inventory_4x4_4x2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_01_national_forest_inventory_4x4_4x2 ALTER COLUMN id SET DEFAULT nextval('public.tgis_af_ref_01_national_forest_inventory_4x4_4x2_id_seq'::regclass);


--
-- TOC entry 6565 (class 2604 OID 74370)
-- Name: tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100 pid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100 ALTER COLUMN pid SET DEFAULT nextval('public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_10_pid_seq'::regclass);


--
-- TOC entry 6566 (class 2604 OID 74371)
-- Name: tgis_af_ref_03_intensify_grid_inventory pid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_03_intensify_grid_inventory ALTER COLUMN pid SET DEFAULT nextval('public.tgis_af_ref_03_intensify_grid_inventory_pid_seq'::regclass);


--
-- TOC entry 6567 (class 2604 OID 74372)
-- Name: tgis_af_ref_05_potential_area_reforestation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_05_potential_area_reforestation ALTER COLUMN id SET DEFAULT nextval('public.tgis_af_ref_05_potential_area_reforestation_id_seq1'::regclass);


--
-- TOC entry 6568 (class 2604 OID 74373)
-- Name: tgis_af_ref_06_potential_area_afforestation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_06_potential_area_afforestation ALTER COLUMN id SET DEFAULT nextval('public.tgis_af_ref_06_potential_area_afforestation_id_seq1'::regclass);


--
-- TOC entry 6569 (class 2604 OID 74374)
-- Name: tgis_af_ref_06_potential_area_afforestation_ id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_06_potential_area_afforestation_ ALTER COLUMN id SET DEFAULT nextval('public.tgis_af_ref_06_potential_area_afforestation_id_seq'::regclass);


--
-- TOC entry 6311 (class 2604 OID 74375)
-- Name: tgis_af_ref_07_plantation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_07_plantation ALTER COLUMN id SET DEFAULT nextval('public.tgis_af_ref_07_plantation_id_seq'::regclass);


--
-- TOC entry 6571 (class 2604 OID 74376)
-- Name: tgis_af_ref_08_seed_stand id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_08_seed_stand ALTER COLUMN id SET DEFAULT nextval('public.tgis_af_ref_08_seed_stand_id_seq'::regclass);


--
-- TOC entry 6570 (class 2604 OID 74377)
-- Name: tgis_af_ref_09_aff_species pid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_09_aff_species ALTER COLUMN pid SET DEFAULT nextval('public.tgis_af_ref_08_aff_species_pid_seq'::regclass);


--
-- TOC entry 6572 (class 2604 OID 74378)
-- Name: tgis_af_ref_10_ref_species pid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_10_ref_species ALTER COLUMN pid SET DEFAULT nextval('public.tgis_af_ref_10_ref_species_pid_seq'::regclass);


--
-- TOC entry 6573 (class 2604 OID 74379)
-- Name: tgis_biodiv id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_biodiv ALTER COLUMN id SET DEFAULT nextval('public.tgis_biodiv_id_seq'::regclass);


--
-- TOC entry 6326 (class 2604 OID 74380)
-- Name: tgis_cadastral_municipality id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_municipality ALTER COLUMN id SET DEFAULT nextval('public.tgis_cadastral_municipality_id_seq'::regclass);


--
-- TOC entry 6574 (class 2604 OID 74381)
-- Name: tgis_cadastral_zone id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_zone ALTER COLUMN id SET DEFAULT nextval('public.tgis_cadastral_zone_id_seq'::regclass);


--
-- TOC entry 6329 (class 2604 OID 74382)
-- Name: tgis_compartment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_compartment ALTER COLUMN id SET DEFAULT nextval('public.tgis_compartment_id_seq'::regclass);


--
-- TOC entry 6330 (class 2604 OID 74383)
-- Name: tgis_management_unit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_management_unit ALTER COLUMN id SET DEFAULT nextval('public.tgis_management_unit_id_seq'::regclass);


--
-- TOC entry 6347 (class 2604 OID 74384)
-- Name: tgis_mu_period id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_mu_period ALTER COLUMN id SET DEFAULT nextval('public.tgis_mu_period_id_seq'::regclass);


--
-- TOC entry 6577 (class 2604 OID 74385)
-- Name: tgis_plot_tree id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plot_tree ALTER COLUMN id SET DEFAULT nextval('public.tgis_plot_tree_id_seq'::regclass);


--
-- TOC entry 6578 (class 2604 OID 74386)
-- Name: tgis_plots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plots ALTER COLUMN id SET DEFAULT nextval('public.tgis_plots_id_seq'::regclass);


--
-- TOC entry 6579 (class 2604 OID 74387)
-- Name: tgis_region id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_region ALTER COLUMN id SET DEFAULT nextval('public.tgis_region_id_seq'::regclass);


--
-- TOC entry 6583 (class 2604 OID 74388)
-- Name: tgis_road id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_road ALTER COLUMN id SET DEFAULT nextval('public.tgis_road_id_seq'::regclass);


--
-- TOC entry 6585 (class 2604 OID 74389)
-- Name: tgis_soil id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_soil ALTER COLUMN id SET DEFAULT nextval('public.tgis_soil_id_seq'::regclass);


--
-- TOC entry 6588 (class 2604 OID 74390)
-- Name: tgis_soil_name id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_soil_name ALTER COLUMN id SET DEFAULT nextval('public.tgis_soil_name_id_seq'::regclass);


--
-- TOC entry 6331 (class 2604 OID 74391)
-- Name: tgis_stand id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand ALTER COLUMN id SET DEFAULT nextval('public.tgis_stand_id_seq'::regclass);


--
-- TOC entry 6592 (class 2604 OID 74392)
-- Name: tgis_stand_growth id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_growth ALTER COLUMN id SET DEFAULT nextval('public.tgis_stand_growth_id_seq'::regclass);


--
-- TOC entry 6593 (class 2604 OID 74393)
-- Name: tgis_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_state ALTER COLUMN id SET DEFAULT nextval('public.tgis_state_id_seq'::regclass);


--
-- TOC entry 6597 (class 2604 OID 74394)
-- Name: tgis_subregion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_subregion ALTER COLUMN id SET DEFAULT nextval('public.tgis_subregion_id_seq'::regclass);


--
-- TOC entry 6601 (class 2604 OID 74395)
-- Name: tgis_surfacedata id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_surfacedata ALTER COLUMN id SET DEFAULT nextval('public.tgis_surfacedata_id_seq'::regclass);


--
-- TOC entry 6631 (class 2604 OID 74396)
-- Name: tgis_wr_lake id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_wr_lake ALTER COLUMN id SET DEFAULT nextval('public.tgis_wr_lake_id_seq'::regclass);


--
-- TOC entry 6632 (class 2604 OID 74397)
-- Name: tgiscadastrezone gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgiscadastrezone ALTER COLUMN gid SET DEFAULT nextval('public.tgiscadastrezone_gid_seq'::regclass);


--
-- TOC entry 6633 (class 2604 OID 74398)
-- Name: tgismun gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgismun ALTER COLUMN gid SET DEFAULT nextval('public.tgismun_gid_seq'::regclass);


--
-- TOC entry 6634 (class 2604 OID 74399)
-- Name: thrm_ann_plan_employee id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_ann_plan_employee ALTER COLUMN id SET DEFAULT nextval('public.thrm_ann_plan_employee_id_seq'::regclass);


--
-- TOC entry 6635 (class 2604 OID 74400)
-- Name: thrm_annual_plan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan ALTER COLUMN id SET DEFAULT nextval('public.thrm_annual_plan_id_seq'::regclass);


--
-- TOC entry 6636 (class 2604 OID 74401)
-- Name: thrm_annual_plan_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_doc ALTER COLUMN id SET DEFAULT nextval('public.thrm_annual_plan_doc_id_seq'::regclass);


--
-- TOC entry 6638 (class 2604 OID 74402)
-- Name: thrm_annual_plan_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_status ALTER COLUMN id SET DEFAULT nextval('public.thrm_annual_plan_status_id_seq'::regclass);


--
-- TOC entry 6640 (class 2604 OID 74403)
-- Name: thrm_attendance_record id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_attendance_record ALTER COLUMN id SET DEFAULT nextval('public.thrm_attendance_record_id_seq'::regclass);


--
-- TOC entry 6643 (class 2604 OID 74404)
-- Name: thrm_decision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision ALTER COLUMN id SET DEFAULT nextval('public.thrm_decision_id_seq'::regclass);


--
-- TOC entry 6644 (class 2604 OID 74405)
-- Name: thrm_decision_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_doc ALTER COLUMN id SET DEFAULT nextval('public.thrm_decision_doc_id_seq'::regclass);


--
-- TOC entry 6646 (class 2604 OID 74406)
-- Name: thrm_decision_employee id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_employee ALTER COLUMN id SET DEFAULT nextval('public.thrm_decision_employee_id_seq'::regclass);


--
-- TOC entry 6647 (class 2604 OID 74407)
-- Name: thrm_decision_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_status ALTER COLUMN id SET DEFAULT nextval('public.thrm_decision_status_id_seq'::regclass);


--
-- TOC entry 6649 (class 2604 OID 74408)
-- Name: thrm_decision_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_type ALTER COLUMN id SET DEFAULT nextval('public.thrm_decision_type_id_seq'::regclass);


--
-- TOC entry 6658 (class 2604 OID 74409)
-- Name: thrm_employee_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_doc ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_doc_id_seq'::regclass);


--
-- TOC entry 6661 (class 2604 OID 74410)
-- Name: thrm_employee_language id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_language ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_language_id_seq'::regclass);


--
-- TOC entry 6935 (class 2604 OID 115351)
-- Name: thrm_employee_salary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_id_seq'::regclass);


--
-- TOC entry 6928 (class 2604 OID 106365)
-- Name: thrm_employee_salary_adds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adds ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_adds_id_seq'::regclass);


--
-- TOC entry 6942 (class 2604 OID 115404)
-- Name: thrm_employee_salary_adjustment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_adjustment_id_seq'::regclass);


--
-- TOC entry 6924 (class 2604 OID 106311)
-- Name: thrm_employee_salary_bonus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_bonus ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_bonus_id_seq'::regclass);


--
-- TOC entry 6926 (class 2604 OID 106338)
-- Name: thrm_employee_salary_deductions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_deductions ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_deductions_id_seq'::regclass);


--
-- TOC entry 6939 (class 2604 OID 115372)
-- Name: thrm_employee_salary_payroll id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_payroll_id_seq'::regclass);


--
-- TOC entry 6946 (class 2604 OID 115440)
-- Name: thrm_employee_salary_payroll_adjustment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_payroll_adjustment_id_seq'::regclass);


--
-- TOC entry 6932 (class 2604 OID 115333)
-- Name: thrm_employee_salary_tax_rates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_tax_rates ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_salary_tax_rates_id_seq'::regclass);


--
-- TOC entry 6669 (class 2604 OID 74411)
-- Name: thrm_employee_skill id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_skill ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_skill_id_seq'::regclass);


--
-- TOC entry 6678 (class 2604 OID 74412)
-- Name: thrm_employee_sos_contact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_sos_contact ALTER COLUMN id SET DEFAULT nextval('public.thrm_employee_sos_contact_id_seq'::regclass);


--
-- TOC entry 6681 (class 2604 OID 74413)
-- Name: thrm_language id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_language ALTER COLUMN id SET DEFAULT nextval('public.thrm_language_id_seq'::regclass);


--
-- TOC entry 6687 (class 2604 OID 74414)
-- Name: thrm_leave id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave ALTER COLUMN id SET DEFAULT nextval('public.thrm_leave_id_seq'::regclass);


--
-- TOC entry 6691 (class 2604 OID 74415)
-- Name: thrm_leave_entitlement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_entitlement ALTER COLUMN id SET DEFAULT nextval('public.thrm_leave_entitlement_id_seq'::regclass);


--
-- TOC entry 6699 (class 2604 OID 74416)
-- Name: thrm_leave_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_type ALTER COLUMN id SET DEFAULT nextval('public.thrm_leave_type_id_seq'::regclass);


--
-- TOC entry 6702 (class 2604 OID 74417)
-- Name: thrm_nationality id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_nationality ALTER COLUMN id SET DEFAULT nextval('public.thrm_nationality_id_seq'::regclass);


--
-- TOC entry 6708 (class 2604 OID 74418)
-- Name: thrm_offical_travel id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_offical_travel ALTER COLUMN id SET DEFAULT nextval('public.thrm_offical_travel_id_seq'::regclass);


--
-- TOC entry 6714 (class 2604 OID 74419)
-- Name: timport_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timport_status ALTER COLUMN id SET DEFAULT nextval('public.timport_status_id_seq'::regclass);


--
-- TOC entry 6716 (class 2604 OID 74420)
-- Name: tlegsec_lawsuit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit ALTER COLUMN id SET DEFAULT nextval('public.tlegsec_lawsuit_id_seq'::regclass);


--
-- TOC entry 6717 (class 2604 OID 74421)
-- Name: tlegsec_lawsuit_damage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_damage ALTER COLUMN id SET DEFAULT nextval('public.tlegsec_lawsuit_damage_id_seq'::regclass);


--
-- TOC entry 6718 (class 2604 OID 74422)
-- Name: tlegsec_lawsuit_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_status ALTER COLUMN id SET DEFAULT nextval('public.tlegsec_lawsuit_status_id_seq'::regclass);


--
-- TOC entry 6720 (class 2604 OID 74423)
-- Name: tlinetemp id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlinetemp ALTER COLUMN id SET DEFAULT nextval('public.tlinetemp_id_seq'::regclass);


--
-- TOC entry 6727 (class 2604 OID 74424)
-- Name: tlocation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlocation ALTER COLUMN id SET DEFAULT nextval('public.tlocation_id_seq'::regclass);


--
-- TOC entry 6731 (class 2604 OID 74425)
-- Name: tlog_protocol_ports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_protocol_ports ALTER COLUMN id SET DEFAULT nextval('public.tlog_protocol_ports_id_seq'::regclass);


--
-- TOC entry 6733 (class 2604 OID 74426)
-- Name: tlog_trips id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_trips ALTER COLUMN id SET DEFAULT nextval('public.tlog_trips_id_seq1'::regclass);


--
-- TOC entry 6734 (class 2604 OID 74427)
-- Name: tlog_trips_1 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_trips_1 ALTER COLUMN id SET DEFAULT nextval('public.tlog_trips_id_seq'::regclass);


--
-- TOC entry 6735 (class 2604 OID 74428)
-- Name: tlog_vehicles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles ALTER COLUMN id SET DEFAULT nextval('public.tlog_vehicles_id_seq'::regclass);


--
-- TOC entry 6736 (class 2604 OID 74429)
-- Name: tlog_vehicles_register id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_register ALTER COLUMN id SET DEFAULT nextval('public.tlog_vehicles_register_id_seq'::regclass);


--
-- TOC entry 6737 (class 2604 OID 74430)
-- Name: tlog_vehicles_service_maintenance id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_service_maintenance ALTER COLUMN id SET DEFAULT nextval('public.tlog_vehicles_service_maintenance_id_seq'::regclass);


--
-- TOC entry 6738 (class 2604 OID 74431)
-- Name: tmanagment_protocol_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmanagment_protocol_doc ALTER COLUMN id SET DEFAULT nextval('public.tmanagment_protocol_doc_id_seq'::regclass);


--
-- TOC entry 6739 (class 2604 OID 74432)
-- Name: tmer_evaluation_perf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_perf ALTER COLUMN id SET DEFAULT nextval('public.tmer_evaluation_perf_id_seq'::regclass);


--
-- TOC entry 6740 (class 2604 OID 74433)
-- Name: tmer_evaluation_strat id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_strat ALTER COLUMN id SET DEFAULT nextval('public.tmer_evaluation_strat_id_seq'::regclass);


--
-- TOC entry 6741 (class 2604 OID 74434)
-- Name: tmer_finance_donor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_finance_donor ALTER COLUMN id SET DEFAULT nextval('public.tmer_finance_donor_id_seq'::regclass);


--
-- TOC entry 6742 (class 2604 OID 74435)
-- Name: tmer_indicator id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator ALTER COLUMN id SET DEFAULT nextval('public.tmer_indicator_id_seq'::regclass);


--
-- TOC entry 6743 (class 2604 OID 74436)
-- Name: tmer_indicator_target id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator_target ALTER COLUMN id SET DEFAULT nextval('public.tmer_indicator_target_id_seq'::regclass);


--
-- TOC entry 6744 (class 2604 OID 74437)
-- Name: tmer_plan_period id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_plan_period ALTER COLUMN id SET DEFAULT nextval('public.tmer_plan_period_id_seq'::regclass);


--
-- TOC entry 6745 (class 2604 OID 74438)
-- Name: tmer_project id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_project ALTER COLUMN id SET DEFAULT nextval('public.tmer_project_id_seq'::regclass);


--
-- TOC entry 6746 (class 2604 OID 74439)
-- Name: tmer_ref_sub_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_ref_sub_projects ALTER COLUMN id SET DEFAULT nextval('public.tmer_ref_sub_projects_id_seq'::regclass);


--
-- TOC entry 6747 (class 2604 OID 74440)
-- Name: tmer_resp_institutions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_resp_institutions ALTER COLUMN id SET DEFAULT nextval('public.tmer_resp_institutions_id_seq'::regclass);


--
-- TOC entry 6748 (class 2604 OID 74441)
-- Name: tmer_strategy id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy ALTER COLUMN id SET DEFAULT nextval('public.tmer_strategy_id_seq'::regclass);


--
-- TOC entry 6749 (class 2604 OID 74442)
-- Name: tmer_strategy_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_doc ALTER COLUMN id SET DEFAULT nextval('public.tmer_strategy_doc_id_seq'::regclass);


--
-- TOC entry 6750 (class 2604 OID 74443)
-- Name: tmer_strategy_execution id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_execution ALTER COLUMN id SET DEFAULT nextval('public.tmer_strategy_execution_id_seq'::regclass);


--
-- TOC entry 6751 (class 2604 OID 74444)
-- Name: tmer_sub_indicator id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_indicator ALTER COLUMN id SET DEFAULT nextval('public.tmer_sub_indicator_id_seq'::regclass);


--
-- TOC entry 6752 (class 2604 OID 74445)
-- Name: tmer_sub_project id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_project ALTER COLUMN id SET DEFAULT nextval('public.tmer_sub_project_id_seq'::regclass);


--
-- TOC entry 6755 (class 2604 OID 74446)
-- Name: tparty_relationship id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_relationship ALTER COLUMN id SET DEFAULT nextval('public.tparty_relationship_id_seq'::regclass);


--
-- TOC entry 6756 (class 2604 OID 74447)
-- Name: tparty_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_role ALTER COLUMN id SET DEFAULT nextval('public.tparty_role_id_seq'::regclass);


--
-- TOC entry 6757 (class 2604 OID 74448)
-- Name: tparty_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_user ALTER COLUMN id SET DEFAULT nextval('public.tparty_user_id_seq'::regclass);


--
-- TOC entry 6758 (class 2604 OID 74449)
-- Name: tperson id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tperson ALTER COLUMN id SET DEFAULT nextval('public.tperson_id_seq'::regclass);


--
-- TOC entry 6760 (class 2604 OID 74450)
-- Name: tprcmt_dossier_question id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_question ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_dossier_question_id_seq'::regclass);


--
-- TOC entry 6761 (class 2604 OID 74451)
-- Name: tprcmt_dossier_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_request ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_dossier_request_id_seq'::regclass);


--
-- TOC entry 6762 (class 2604 OID 74452)
-- Name: tprcmt_tender_bid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bid ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_tender_bid_id_seq'::regclass);


--
-- TOC entry 6764 (class 2604 OID 74453)
-- Name: tprcmt_tender_bidder id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bidder ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_tender_bidder_id_seq'::regclass);


--
-- TOC entry 6765 (class 2604 OID 74454)
-- Name: tprcmt_tender_complaint id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_complaint ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_tender_complaint_id_seq'::regclass);


--
-- TOC entry 6766 (class 2604 OID 74455)
-- Name: tprcmt_tender_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_request ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_tender_request_id_seq'::regclass);


--
-- TOC entry 6767 (class 2604 OID 74456)
-- Name: tprcmt_tender_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_tender_status_id_seq'::regclass);


--
-- TOC entry 6768 (class 2604 OID 74457)
-- Name: tprcmt_tender_status_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status_doc ALTER COLUMN id SET DEFAULT nextval('public.tprcmt_tender_status_doc_id_seq'::regclass);


--
-- TOC entry 6769 (class 2604 OID 74458)
-- Name: tpublishing id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpublishing ALTER COLUMN id SET DEFAULT nextval('public.tpublishing_id_seq'::regclass);


--
-- TOC entry 6776 (class 2604 OID 74459)
-- Name: tpurchase_order id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order ALTER COLUMN id SET DEFAULT nextval('public.tpurchase_order_id_seq'::regclass);


--
-- TOC entry 6792 (class 2604 OID 74460)
-- Name: tpurchase_order_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item ALTER COLUMN id SET DEFAULT nextval('public.tpurchase_order_item_id_seq'::regclass);


--
-- TOC entry 6798 (class 2604 OID 74461)
-- Name: tpurchase_order_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_status ALTER COLUMN id SET DEFAULT nextval('public.tpurchase_order_status_id_seq'::regclass);


--
-- TOC entry 6355 (class 2604 OID 74462)
-- Name: trbac_object id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_object ALTER COLUMN id SET DEFAULT nextval('public.trbac_object_id_seq'::regclass);


--
-- TOC entry 6802 (class 2604 OID 74463)
-- Name: trbac_operation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_operation ALTER COLUMN id SET DEFAULT nextval('public.trbac_operation_id_seq'::regclass);


--
-- TOC entry 6803 (class 2604 OID 74464)
-- Name: trbac_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_permission ALTER COLUMN id SET DEFAULT nextval('public.trbac_permission_id_seq'::regclass);


--
-- TOC entry 6804 (class 2604 OID 74465)
-- Name: trbac_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_role ALTER COLUMN id SET DEFAULT nextval('public.trbac_role_id_seq'::regclass);


--
-- TOC entry 6805 (class 2604 OID 74466)
-- Name: trbac_session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_session ALTER COLUMN id SET DEFAULT nextval('public.trbac_session_id_seq'::regclass);


--
-- TOC entry 6807 (class 2604 OID 74467)
-- Name: trbac_session_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_session_role ALTER COLUMN id SET DEFAULT nextval('public.trbac_session_role_id_seq'::regclass);


--
-- TOC entry 6808 (class 2604 OID 74468)
-- Name: trbac_user_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_user_role ALTER COLUMN id SET DEFAULT nextval('public.trbac_user_role_id_seq'::regclass);


--
-- TOC entry 6309 (class 2604 OID 74469)
-- Name: tref_economic_code id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_economic_code ALTER COLUMN id SET DEFAULT nextval('public.tref_economic_code_id_seq'::regclass);


--
-- TOC entry 6809 (class 2604 OID 74470)
-- Name: tref_ekonomic_code id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_ekonomic_code ALTER COLUMN id SET DEFAULT nextval('public.tref_ekonomic_code_id_seq'::regclass);


--
-- TOC entry 6816 (class 2604 OID 74471)
-- Name: trequisition id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition ALTER COLUMN id SET DEFAULT nextval('public.trequisition_id_seq'::regclass);


--
-- TOC entry 6822 (class 2604 OID 74472)
-- Name: trequisition_account id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_account ALTER COLUMN id SET DEFAULT nextval('public.trequisition_account_id_seq'::regclass);


--
-- TOC entry 6827 (class 2604 OID 74473)
-- Name: trequisition_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item ALTER COLUMN id SET DEFAULT nextval('public.trequisition_item_id_seq'::regclass);


--
-- TOC entry 6832 (class 2604 OID 74474)
-- Name: trequisition_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_status ALTER COLUMN id SET DEFAULT nextval('public.trequisition_status_id_seq'::regclass);


--
-- TOC entry 6833 (class 2604 OID 74475)
-- Name: tshape_stand_treatment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tshape_stand_treatment ALTER COLUMN id SET DEFAULT nextval('public.tshape_stand_treatment_id_seq'::regclass);


--
-- TOC entry 6361 (class 2604 OID 74476)
-- Name: tshape_treatment_name id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tshape_treatment_name ALTER COLUMN id SET DEFAULT nextval('public.tshape_treatment_name_id_seq'::regclass);


--
-- TOC entry 6843 (class 2604 OID 74477)
-- Name: ttax id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttax ALTER COLUMN id SET DEFAULT nextval('public.ttax_id_seq'::regclass);


--
-- TOC entry 6344 (class 2604 OID 74478)
-- Name: ttextdomain id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttextdomain ALTER COLUMN id SET DEFAULT nextval('public.ttextdomain_id_seq'::regclass);


--
-- TOC entry 6852 (class 2604 OID 74479)
-- Name: tunit_measurement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tunit_measurement ALTER COLUMN id SET DEFAULT nextval('public.tunit_measurement_id_seq'::regclass);


--
-- TOC entry 6856 (class 2604 OID 74480)
-- Name: tunits_metric id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tunits_metric ALTER COLUMN id SET DEFAULT nextval('public.tunits_metric_id_seq'::regclass);


--
-- TOC entry 6861 (class 2604 OID 74481)
-- Name: tuom id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom ALTER COLUMN id SET DEFAULT nextval('public.tuom_id_seq'::regclass);


--
-- TOC entry 6867 (class 2604 OID 74482)
-- Name: tuom_trl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom_trl ALTER COLUMN id SET DEFAULT nextval('public.tuom_trl_id_seq'::regclass);


--
-- TOC entry 6872 (class 2604 OID 74483)
-- Name: tuser id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser ALTER COLUMN id SET DEFAULT nextval('public.tuser_id_seq'::regclass);


--
-- TOC entry 6874 (class 2604 OID 74484)
-- Name: tuser_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_log ALTER COLUMN id SET DEFAULT nextval('public.tuser_log_id_seq'::regclass);


--
-- TOC entry 6876 (class 2604 OID 74485)
-- Name: tuser_login_attempt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_login_attempt ALTER COLUMN id SET DEFAULT nextval('public.tuser_login_attempt_id_seq'::regclass);


--
-- TOC entry 6880 (class 2604 OID 74486)
-- Name: tuser_password id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_password ALTER COLUMN id SET DEFAULT nextval('public.tuser_password_id_seq'::regclass);


--
-- TOC entry 6881 (class 2604 OID 74487)
-- Name: tvehicles_staff_assign id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_staff_assign ALTER COLUMN id SET DEFAULT nextval('public.tvehicles_staff_assign_id_seq'::regclass);


--
-- TOC entry 6882 (class 2604 OID 74488)
-- Name: tvehicles_tracking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_tracking ALTER COLUMN id SET DEFAULT nextval('public.tvehicles_tracking_id_seq'::regclass);


--
-- TOC entry 6883 (class 2604 OID 74489)
-- Name: attribute_aliases id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.attribute_aliases ALTER COLUMN id SET DEFAULT nextval('traccar.attribute_aliases_id_seq'::regclass);


--
-- TOC entry 6884 (class 2604 OID 74490)
-- Name: calendars id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.calendars ALTER COLUMN id SET DEFAULT nextval('traccar.calendars_id_seq'::regclass);


--
-- TOC entry 6799 (class 2604 OID 74491)
-- Name: devices id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.devices ALTER COLUMN id SET DEFAULT nextval('traccar.devices_id_seq'::regclass);


--
-- TOC entry 6885 (class 2604 OID 74492)
-- Name: events id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.events ALTER COLUMN id SET DEFAULT nextval('traccar.events_id_seq'::regclass);


--
-- TOC entry 6886 (class 2604 OID 74493)
-- Name: geofences id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.geofences ALTER COLUMN id SET DEFAULT nextval('traccar.geofences_id_seq'::regclass);


--
-- TOC entry 6887 (class 2604 OID 74494)
-- Name: groups id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.groups ALTER COLUMN id SET DEFAULT nextval('traccar.groups_id_seq'::regclass);


--
-- TOC entry 6888 (class 2604 OID 74495)
-- Name: notifications id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.notifications ALTER COLUMN id SET DEFAULT nextval('traccar.notifications_id_seq'::regclass);


--
-- TOC entry 6800 (class 2604 OID 74496)
-- Name: positions id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.positions ALTER COLUMN id SET DEFAULT nextval('traccar.positions_id_seq'::regclass);


--
-- TOC entry 6892 (class 2604 OID 74497)
-- Name: positions_aud audit_id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.positions_aud ALTER COLUMN audit_id SET DEFAULT nextval('traccar.positions_aud_audit_id_seq'::regclass);


--
-- TOC entry 6893 (class 2604 OID 74498)
-- Name: positions_aud id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.positions_aud ALTER COLUMN id SET DEFAULT nextval('traccar.positions_aud_id_seq'::regclass);


--
-- TOC entry 6895 (class 2604 OID 74499)
-- Name: server id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.server ALTER COLUMN id SET DEFAULT nextval('traccar.server_id_seq'::regclass);


--
-- TOC entry 6904 (class 2604 OID 74500)
-- Name: statistics id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.statistics ALTER COLUMN id SET DEFAULT nextval('traccar.statistics_id_seq'::regclass);


--
-- TOC entry 6923 (class 2604 OID 74501)
-- Name: users id; Type: DEFAULT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.users ALTER COLUMN id SET DEFAULT nextval('traccar.users_id_seq'::regclass);


--
-- TOC entry 6951 (class 2606 OID 83967)
-- Name: komuna Komuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.komuna
    ADD CONSTRAINT "Komuna_pkey" PRIMARY KEY (id);


--
-- TOC entry 7114 (class 2606 OID 83969)
-- Name: talertrule_trl alertrule_ad_language_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT alertrule_ad_language_un UNIQUE (alertrule_id, ad_language);


--
-- TOC entry 6967 (class 2606 OID 83971)
-- Name: ekonomic_code ekonomic_code_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ekonomic_code
    ADD CONSTRAINT ekonomic_code_code_key UNIQUE (code);


--
-- TOC entry 6969 (class 2606 OID 83973)
-- Name: ekonomic_code ekonomic_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ekonomic_code
    ADD CONSTRAINT ekonomic_code_pkey PRIMARY KEY (id);


--
-- TOC entry 7934 (class 2606 OID 115450)
-- Name: thrm_employee_salary_payroll_adjustment fin_type_by_payroll_constrainte; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment
    ADD CONSTRAINT fin_type_by_payroll_constrainte UNIQUE (fin_type_id, payroll_id);


--
-- TOC entry 7929 (class 2606 OID 115414)
-- Name: thrm_employee_salary_adjustment fin_type_by_salary_constrainte; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment
    ADD CONSTRAINT fin_type_by_salary_constrainte UNIQUE (salary_id, fin_type_id);


--
-- TOC entry 7048 (class 2606 OID 83975)
-- Name: iso_metadata iso_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iso_metadata
    ADD CONSTRAINT iso_metadata_pkey PRIMARY KEY (id);


--
-- TOC entry 7051 (class 2606 OID 83977)
-- Name: liqenet2 liqenet2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.liqenet2
    ADD CONSTRAINT liqenet2_pkey PRIMARY KEY (id);


--
-- TOC entry 7055 (class 2606 OID 83979)
-- Name: lumenjet lumenjet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lumenjet
    ADD CONSTRAINT lumenjet_pkey PRIMARY KEY (id);


--
-- TOC entry 7501 (class 2606 OID 83981)
-- Name: tgis_wr_river lumm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_wr_river
    ADD CONSTRAINT lumm_pkey PRIMARY KEY (id);


--
-- TOC entry 7925 (class 2606 OID 115378)
-- Name: thrm_employee_salary_payroll payroll_employee_year_month_constrainte; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll
    ADD CONSTRAINT payroll_employee_year_month_constrainte UNIQUE (employee_id, fiscal_year, pay_month);


--
-- TOC entry 7058 (class 2606 OID 83983)
-- Name: poligon poligon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poligon
    ADD CONSTRAINT poligon_pkey PRIMARY KEY (id);


--
-- TOC entry 7066 (class 2606 OID 83985)
-- Name: shape_biodiversity shape_biodiversity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_biodiversity
    ADD CONSTRAINT shape_biodiversity_pkey PRIMARY KEY (ogc_fid);


--
-- TOC entry 7082 (class 2606 OID 83987)
-- Name: shape_plot_trees shape_plot_trees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_plot_trees
    ADD CONSTRAINT shape_plot_trees_pkey PRIMARY KEY (ogc_fid);


--
-- TOC entry 7084 (class 2606 OID 83989)
-- Name: shape_plots shape_plots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_plots
    ADD CONSTRAINT shape_plots_pkey PRIMARY KEY (ogc_fid);


--
-- TOC entry 7070 (class 2606 OID 83991)
-- Name: shape_stand shape_stand_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shape_stand
    ADD CONSTRAINT shape_stand_pkey PRIMARY KEY (ogc_fid);


--
-- TOC entry 7086 (class 2606 OID 83993)
-- Name: stand_temp stand_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stand_temp
    ADD CONSTRAINT stand_temp_pkey PRIMARY KEY (gid);


--
-- TOC entry 7089 (class 2606 OID 83995)
-- Name: standfc standfc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.standfc
    ADD CONSTRAINT standfc_pkey PRIMARY KEY (ogc_fid);


--
-- TOC entry 7092 (class 2606 OID 83997)
-- Name: tables_aud tables_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables_aud
    ADD CONSTRAINT tables_aud_pkey PRIMARY KEY (id);


--
-- TOC entry 7095 (class 2606 OID 83999)
-- Name: tad_language tad_language_ad_language_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tad_language
    ADD CONSTRAINT tad_language_ad_language_un UNIQUE (ad_language);


--
-- TOC entry 7097 (class 2606 OID 84001)
-- Name: tad_language tad_language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tad_language
    ADD CONSTRAINT tad_language_pkey PRIMARY KEY (id);


--
-- TOC entry 7100 (class 2606 OID 84003)
-- Name: taddress taddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taddress
    ADD CONSTRAINT taddress_pkey PRIMARY KEY (id);


--
-- TOC entry 7103 (class 2606 OID 84005)
-- Name: taff_ref_projects taff_ref_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taff_ref_projects
    ADD CONSTRAINT taff_ref_projects_pkey PRIMARY KEY (id);


--
-- TOC entry 7106 (class 2606 OID 84007)
-- Name: talert talert_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_pkey PRIMARY KEY (id);


--
-- TOC entry 7109 (class 2606 OID 84009)
-- Name: talertrecipient talertrecipient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_pkey PRIMARY KEY (id);


--
-- TOC entry 7112 (class 2606 OID 84011)
-- Name: talertrule talertrule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule
    ADD CONSTRAINT talertrule_pkey PRIMARY KEY (id);


--
-- TOC entry 7117 (class 2606 OID 84013)
-- Name: talertrule_trl talertrule_trl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT talertrule_trl_pkey PRIMARY KEY (id);


--
-- TOC entry 7123 (class 2606 OID 84015)
-- Name: tassets_devaluation tassets_devaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_devaluation
    ADD CONSTRAINT tassets_devaluation_pkey PRIMARY KEY (id);


--
-- TOC entry 7120 (class 2606 OID 84017)
-- Name: tassets tassets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets
    ADD CONSTRAINT tassets_pkey PRIMARY KEY (id);


--
-- TOC entry 7126 (class 2606 OID 84019)
-- Name: tassets_staff_assign tassets_staff_assign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_staff_assign
    ADD CONSTRAINT tassets_staff_assign_pkey PRIMARY KEY (id);


--
-- TOC entry 7129 (class 2606 OID 84021)
-- Name: tb_monitor_eval tb_monitor_eval_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_monitor_eval
    ADD CONSTRAINT tb_monitor_eval_pkey PRIMARY KEY (id);


--
-- TOC entry 7132 (class 2606 OID 84023)
-- Name: tbiodiv_name tbiodiv_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbiodiv_name
    ADD CONSTRAINT tbiodiv_name_pkey PRIMARY KEY (id);


--
-- TOC entry 7138 (class 2606 OID 84025)
-- Name: tbpartner_location tbpartner_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner_location
    ADD CONSTRAINT tbpartner_location_pkey PRIMARY KEY (id);


--
-- TOC entry 7135 (class 2606 OID 84027)
-- Name: tbpartner tbpartner_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner
    ADD CONSTRAINT tbpartner_pkey PRIMARY KEY (id);


--
-- TOC entry 7141 (class 2606 OID 84029)
-- Name: tcurrency tcurrency_isocode; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcurrency
    ADD CONSTRAINT tcurrency_isocode UNIQUE (iso_code);


--
-- TOC entry 7143 (class 2606 OID 84031)
-- Name: tcurrency tcurrency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcurrency
    ADD CONSTRAINT tcurrency_pkey PRIMARY KEY (id);


--
-- TOC entry 7146 (class 2606 OID 84033)
-- Name: tdhpet_activity_management tdhpet_activity_management_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_activity_management
    ADD CONSTRAINT tdhpet_activity_management_pkey PRIMARY KEY (id);


--
-- TOC entry 7149 (class 2606 OID 84035)
-- Name: tdhpet_animal_capacity tdhpet_animal_capacity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_capacity
    ADD CONSTRAINT tdhpet_animal_capacity_pkey PRIMARY KEY (id);


--
-- TOC entry 7155 (class 2606 OID 84037)
-- Name: tdhpet_animal_location_detail tdhpet_animal_location_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location_detail
    ADD CONSTRAINT tdhpet_animal_location_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 7152 (class 2606 OID 84039)
-- Name: tdhpet_animal_location tdhpet_animal_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location
    ADD CONSTRAINT tdhpet_animal_location_pkey PRIMARY KEY (id);


--
-- TOC entry 7158 (class 2606 OID 84041)
-- Name: tdhpet_annual_plan tdhpet_annual_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_annual_plan
    ADD CONSTRAINT tdhpet_annual_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 7161 (class 2606 OID 84043)
-- Name: tdhpet_hunt_ground_eval tdhpet_hunt_ground_eval_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunt_ground_eval
    ADD CONSTRAINT tdhpet_hunt_ground_eval_pkey PRIMARY KEY (id);


--
-- TOC entry 7164 (class 2606 OID 84045)
-- Name: tdhpet_hunted_animal_detail tdhpet_hunted_animal_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animal_detail
    ADD CONSTRAINT tdhpet_hunted_animal_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 7167 (class 2606 OID 84047)
-- Name: tdhpet_hunted_animals tdhpet_hunted_animals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animals
    ADD CONSTRAINT tdhpet_hunted_animals_pkey PRIMARY KEY (id);


--
-- TOC entry 7170 (class 2606 OID 84049)
-- Name: tdhpet_location_land_type tdhpet_location_land_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location_land_type
    ADD CONSTRAINT tdhpet_location_land_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6956 (class 2606 OID 84051)
-- Name: tdhpet_location tdhpet_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location
    ADD CONSTRAINT tdhpet_location_pkey PRIMARY KEY (id);


--
-- TOC entry 7173 (class 2606 OID 84053)
-- Name: tdhpet_period_plan tdhpet_period_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_period_plan
    ADD CONSTRAINT tdhpet_period_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 7176 (class 2606 OID 84055)
-- Name: tdhpet_tourist_purpose tdhpet_tourist_purpose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_purpose
    ADD CONSTRAINT tdhpet_tourist_purpose_pkey PRIMARY KEY (id);


--
-- TOC entry 7179 (class 2606 OID 84057)
-- Name: tdhpet_tourist_register tdhpet_tourist_register_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_register
    ADD CONSTRAINT tdhpet_tourist_register_pkey PRIMARY KEY (id);


--
-- TOC entry 6959 (class 2606 OID 84059)
-- Name: tdhpet_tourist_zone_geoms tdhpet_tourist_zone_geoms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_zone_geoms
    ADD CONSTRAINT tdhpet_tourist_zone_geoms_pkey PRIMARY KEY (id);


--
-- TOC entry 7182 (class 2606 OID 84061)
-- Name: tdhpet_wild_animals tdhpet_wild_animals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals
    ADD CONSTRAINT tdhpet_wild_animals_pkey PRIMARY KEY (id);


--
-- TOC entry 7185 (class 2606 OID 84063)
-- Name: tdhpet_wild_animals_request tdhpet_wild_animals_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals_request
    ADD CONSTRAINT tdhpet_wild_animals_request_pkey PRIMARY KEY (id);


--
-- TOC entry 7188 (class 2606 OID 84065)
-- Name: tdoc_category tdoc_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoc_category
    ADD CONSTRAINT tdoc_category_pkey PRIMARY KEY (id);


--
-- TOC entry 7191 (class 2606 OID 84067)
-- Name: tdoctype tdoctype_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoctype
    ADD CONSTRAINT tdoctype_pkey PRIMARY KEY (id);


--
-- TOC entry 7194 (class 2606 OID 84069)
-- Name: tdomain tdomain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdomain
    ADD CONSTRAINT tdomain_pkey PRIMARY KEY (id);


--
-- TOC entry 7200 (class 2606 OID 84071)
-- Name: tdp_mngmt_attach tdp_mngmt_attach_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_attach
    ADD CONSTRAINT tdp_mngmt_attach_pkey PRIMARY KEY (id);


--
-- TOC entry 7197 (class 2606 OID 84073)
-- Name: tdp_mngmt tdp_mngmt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdp_mngmt_pkey PRIMARY KEY (id);


--
-- TOC entry 7203 (class 2606 OID 84078)
-- Name: tdp_mngmt_settings tdp_mngmt_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_settings
    ADD CONSTRAINT tdp_mngmt_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 7206 (class 2606 OID 84080)
-- Name: tdp_mngmt_status tdp_mngmt_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status
    ADD CONSTRAINT tdp_mngmt_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7209 (class 2606 OID 84082)
-- Name: tfal_cad_parcel_request tfal_cad_parcel_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_cad_parcel_request
    ADD CONSTRAINT tfal_cad_parcel_request_pkey PRIMARY KEY (id);


--
-- TOC entry 7212 (class 2606 OID 84084)
-- Name: tfal_request_coord tfal_request_coord_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_coord
    ADD CONSTRAINT tfal_request_coord_pkey PRIMARY KEY (id);


--
-- TOC entry 7215 (class 2606 OID 84086)
-- Name: tfal_request_doc tfal_request_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_doc
    ADD CONSTRAINT tfal_request_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7028 (class 2606 OID 84088)
-- Name: tfal_request tfal_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request
    ADD CONSTRAINT tfal_request_pkey PRIMARY KEY (id);


--
-- TOC entry 7031 (class 2606 OID 84090)
-- Name: tfal_request_status tfal_request_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_status
    ADD CONSTRAINT tfal_request_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7034 (class 2606 OID 84092)
-- Name: tfal_request_type tfal_request_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_type
    ADD CONSTRAINT tfal_request_type_pkey PRIMARY KEY (id);


--
-- TOC entry 7218 (class 2606 OID 84094)
-- Name: tfin_annu_budget_alloc tfin_annu_budget_alloc_municipality_id_month_year_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_annu_budget_alloc
    ADD CONSTRAINT tfin_annu_budget_alloc_municipality_id_month_year_key UNIQUE (municipality_id, month, year);


--
-- TOC entry 7220 (class 2606 OID 84096)
-- Name: tfin_annu_budget_alloc tfin_annu_budget_alloc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_annu_budget_alloc
    ADD CONSTRAINT tfin_annu_budget_alloc_pkey PRIMARY KEY (id);


--
-- TOC entry 7223 (class 2606 OID 84098)
-- Name: tfin_budget_mainntenance tfin_budget_mainntenance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_budget_mainntenance
    ADD CONSTRAINT tfin_budget_mainntenance_pkey PRIMARY KEY (id);


--
-- TOC entry 7229 (class 2606 OID 84100)
-- Name: tfin_contract_doc tfin_contract_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract_doc
    ADD CONSTRAINT tfin_contract_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7226 (class 2606 OID 84102)
-- Name: tfin_contract tfin_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract
    ADD CONSTRAINT tfin_contract_pkey PRIMARY KEY (id);


--
-- TOC entry 7232 (class 2606 OID 84104)
-- Name: tfin_contractor tfin_contractor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contractor
    ADD CONSTRAINT tfin_contractor_pkey PRIMARY KEY (id);


--
-- TOC entry 7235 (class 2606 OID 84106)
-- Name: tfin_input tfin_input_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input
    ADD CONSTRAINT tfin_input_pkey PRIMARY KEY (id);


--
-- TOC entry 7238 (class 2606 OID 84108)
-- Name: tfin_input_status tfin_input_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input_status
    ADD CONSTRAINT tfin_input_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7241 (class 2606 OID 84110)
-- Name: tfin_output tfin_output_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_output
    ADD CONSTRAINT tfin_output_pkey PRIMARY KEY (id);


--
-- TOC entry 7244 (class 2606 OID 84112)
-- Name: tfin_payment_period tfin_payment_period_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_payment_period
    ADD CONSTRAINT tfin_payment_period_pkey PRIMARY KEY (id);


--
-- TOC entry 7914 (class 2606 OID 106924)
-- Name: tfin_type tfin_type_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_type
    ADD CONSTRAINT tfin_type_code_key UNIQUE (code);


--
-- TOC entry 7916 (class 2606 OID 106922)
-- Name: tfin_type tfin_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_type
    ADD CONSTRAINT tfin_type_pkey PRIMARY KEY (id);


--
-- TOC entry 7247 (class 2606 OID 84118)
-- Name: tfrm_activity_domain tfrm_activity_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_domain
    ADD CONSTRAINT tfrm_activity_domain_pkey PRIMARY KEY (id);


--
-- TOC entry 6979 (class 2606 OID 84120)
-- Name: tfrm_activity tfrm_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity
    ADD CONSTRAINT tfrm_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7253 (class 2606 OID 84122)
-- Name: tfrm_activity_status_doc tfrm_activity_status_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status_doc
    ADD CONSTRAINT tfrm_activity_status_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7250 (class 2606 OID 84124)
-- Name: tfrm_activity_status tfrm_activity_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status
    ADD CONSTRAINT tfrm_activity_status_pkey PRIMARY KEY (id);


--
-- TOC entry 6982 (class 2606 OID 84126)
-- Name: tfrm_annual_planning tfrm_annual_planning_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning
    ADD CONSTRAINT tfrm_annual_planning_pkey PRIMARY KEY (id);


--
-- TOC entry 7256 (class 2606 OID 84128)
-- Name: tfrm_annual_planning_status tfrm_annual_planning_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning_status
    ADD CONSTRAINT tfrm_annual_planning_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7259 (class 2606 OID 84130)
-- Name: tfrm_annual_protection_plan tfrm_annual_protection_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_protection_plan
    ADD CONSTRAINT tfrm_annual_protection_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 7265 (class 2606 OID 84132)
-- Name: tfrm_bio_diversity_name tfrm_bio_diversity_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_bio_diversity_name
    ADD CONSTRAINT tfrm_bio_diversity_name_pkey PRIMARY KEY (id);


--
-- TOC entry 7262 (class 2606 OID 84134)
-- Name: tfrm_bio_diversity tfrm_bio_diversity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_bio_diversity
    ADD CONSTRAINT tfrm_bio_diversity_pkey PRIMARY KEY (id);


--
-- TOC entry 7271 (class 2606 OID 84136)
-- Name: tfrm_confiscation_detail tfrm_confiscation_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation_detail
    ADD CONSTRAINT tfrm_confiscation_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 7268 (class 2606 OID 84138)
-- Name: tfrm_confiscation tfrm_confiscation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation
    ADD CONSTRAINT tfrm_confiscation_pkey PRIMARY KEY (id);


--
-- TOC entry 7274 (class 2606 OID 84140)
-- Name: tfrm_domain tfrm_domain_domain_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain
    ADD CONSTRAINT tfrm_domain_domain_code_key UNIQUE (domain_code);


--
-- TOC entry 7276 (class 2606 OID 84142)
-- Name: tfrm_domain tfrm_domain_domain_value_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain
    ADD CONSTRAINT tfrm_domain_domain_value_key UNIQUE (domain_value);


--
-- TOC entry 7281 (class 2606 OID 84144)
-- Name: tfrm_domain_name tfrm_domain_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain_name
    ADD CONSTRAINT tfrm_domain_name_pkey PRIMARY KEY (id);


--
-- TOC entry 7278 (class 2606 OID 84146)
-- Name: tfrm_domain tfrm_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain
    ADD CONSTRAINT tfrm_domain_pkey PRIMARY KEY (id);


--
-- TOC entry 7074 (class 2606 OID 84148)
-- Name: tfrm_estimate_volume tfrm_estimate_volume_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_estimate_volume
    ADD CONSTRAINT tfrm_estimate_volume_pkey PRIMARY KEY (code);


--
-- TOC entry 7284 (class 2606 OID 84150)
-- Name: tfrm_fire_details tfrm_fire_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_details
    ADD CONSTRAINT tfrm_fire_details_pkey PRIMARY KEY (id);


--
-- TOC entry 7288 (class 2606 OID 84152)
-- Name: tfrm_fire_point tfrm_fire_point_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_point
    ADD CONSTRAINT tfrm_fire_point_pkey PRIMARY KEY (id);


--
-- TOC entry 7292 (class 2606 OID 84154)
-- Name: tfrm_fire_polygon tfrm_fire_polygon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_polygon
    ADD CONSTRAINT tfrm_fire_polygon_pkey PRIMARY KEY (id);


--
-- TOC entry 7295 (class 2606 OID 84156)
-- Name: tfrm_fire_report tfrm_fire_report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_report
    ADD CONSTRAINT tfrm_fire_report_pkey PRIMARY KEY (id);


--
-- TOC entry 7298 (class 2606 OID 84158)
-- Name: tfrm_fiskos_data tfrm_fiskos_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_data
    ADD CONSTRAINT tfrm_fiskos_data_pkey PRIMARY KEY (id);


--
-- TOC entry 7301 (class 2606 OID 84160)
-- Name: tfrm_fiskos_import tfrm_fiskos_import_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_import
    ADD CONSTRAINT tfrm_fiskos_import_pkey PRIMARY KEY (id);


--
-- TOC entry 7304 (class 2606 OID 84162)
-- Name: tfrm_harvest_impl_transport tfrm_harvest_impl_transport_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_harvest_impl_transport
    ADD CONSTRAINT tfrm_harvest_impl_transport_pkey PRIMARY KEY (id);


--
-- TOC entry 7307 (class 2606 OID 84164)
-- Name: tfrm_insp_action_type tfrm_insp_action_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_insp_action_type
    ADD CONSTRAINT tfrm_insp_action_type_pkey PRIMARY KEY (id);


--
-- TOC entry 7313 (class 2606 OID 84166)
-- Name: tfrm_inspection_doc tfrm_inspection_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection_doc
    ADD CONSTRAINT tfrm_inspection_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7310 (class 2606 OID 84168)
-- Name: tfrm_inspection tfrm_inspection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection
    ADD CONSTRAINT tfrm_inspection_pkey PRIMARY KEY (id);


--
-- TOC entry 7316 (class 2606 OID 84170)
-- Name: tfrm_inspector tfrm_inspector_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspector
    ADD CONSTRAINT tfrm_inspector_pkey PRIMARY KEY (id);


--
-- TOC entry 7319 (class 2606 OID 84172)
-- Name: tfrm_landscap_plan tfrm_landscap_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_landscap_plan
    ADD CONSTRAINT tfrm_landscap_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 7322 (class 2606 OID 84174)
-- Name: tfrm_management_class tfrm_management_class_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_management_class
    ADD CONSTRAINT tfrm_management_class_pkey PRIMARY KEY (id);


--
-- TOC entry 7325 (class 2606 OID 84176)
-- Name: tfrm_private_activity tfrm_private_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity
    ADD CONSTRAINT tfrm_private_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7331 (class 2606 OID 84178)
-- Name: tfrm_private_request_doc tfrm_private_request_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_doc
    ADD CONSTRAINT tfrm_private_request_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7334 (class 2606 OID 84180)
-- Name: tfrm_private_request_impl tfrm_private_request_impl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_impl
    ADD CONSTRAINT tfrm_private_request_impl_pkey PRIMARY KEY (id);


--
-- TOC entry 7328 (class 2606 OID 84182)
-- Name: tfrm_private_request tfrm_private_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_pkey PRIMARY KEY (id);


--
-- TOC entry 6985 (class 2606 OID 84184)
-- Name: tfrm_protection_activity tfrm_protection_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7338 (class 2606 OID 84186)
-- Name: tfrm_protection_impl_declare tfrm_protection_impl_declare_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_impl_declare
    ADD CONSTRAINT tfrm_protection_impl_declare_pkey PRIMARY KEY (id);


--
-- TOC entry 6988 (class 2606 OID 84188)
-- Name: tfrm_road_activity tfrm_road_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity
    ADD CONSTRAINT tfrm_road_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7341 (class 2606 OID 84190)
-- Name: tfrm_road_impl_declare tfrm_road_impl_declare_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_impl_declare
    ADD CONSTRAINT tfrm_road_impl_declare_pkey PRIMARY KEY (id);


--
-- TOC entry 7344 (class 2606 OID 84192)
-- Name: tfrm_seed_activity tfrm_seed_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7346 (class 2606 OID 84194)
-- Name: tfrm_seed_activity tfrm_seed_activity_year_prod_type_tree_species_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_year_prod_type_tree_species_id_key UNIQUE (year, prod_type, tree_species_id);


--
-- TOC entry 7349 (class 2606 OID 84196)
-- Name: tfrm_seedling_inventory tfrm_seedling_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory
    ADD CONSTRAINT tfrm_seedling_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 7352 (class 2606 OID 84198)
-- Name: tfrm_seedling_inventory_pos tfrm_seedling_inventory_pos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos
    ADD CONSTRAINT tfrm_seedling_inventory_pos_pkey PRIMARY KEY (id);


--
-- TOC entry 7355 (class 2606 OID 84200)
-- Name: tfrm_siviculture_plan tfrm_siviculture_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_siviculture_plan
    ADD CONSTRAINT tfrm_siviculture_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 6991 (class 2606 OID 84202)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7358 (class 2606 OID 84204)
-- Name: tfrm_stand_harvest_impl_declare tfrm_stand_harvest_impl_declare_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_impl_declare
    ADD CONSTRAINT tfrm_stand_harvest_impl_declare_pkey PRIMARY KEY (id);


--
-- TOC entry 7361 (class 2606 OID 84206)
-- Name: tfrm_stand_harvest_marked tfrm_stand_harvest_marked_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_marked
    ADD CONSTRAINT tfrm_stand_harvest_marked_pkey PRIMARY KEY (id);


--
-- TOC entry 6994 (class 2606 OID 84208)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7365 (class 2606 OID 84210)
-- Name: tfrm_stand_planting_impl_declare tfrm_stand_planting_impl_declare_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_impl_declare
    ADD CONSTRAINT tfrm_stand_planting_impl_declare_pkey PRIMARY KEY (id);


--
-- TOC entry 6997 (class 2606 OID 84212)
-- Name: tfrm_stand_silviculture_activity tfrm_stand_silviculture_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity
    ADD CONSTRAINT tfrm_stand_silviculture_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 7369 (class 2606 OID 84214)
-- Name: tfrm_stand_silviculture_impl_declare tfrm_stand_silviculture_impl_declare_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_impl_declare
    ADD CONSTRAINT tfrm_stand_silviculture_impl_declare_pkey PRIMARY KEY (id);


--
-- TOC entry 7375 (class 2606 OID 84216)
-- Name: tfrm_treatment_group tfrm_treatment_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_treatment_group
    ADD CONSTRAINT tfrm_treatment_group_pkey PRIMARY KEY (id);


--
-- TOC entry 7372 (class 2606 OID 84218)
-- Name: tfrm_treatment tfrm_treatment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_treatment
    ADD CONSTRAINT tfrm_treatment_pkey PRIMARY KEY (id);


--
-- TOC entry 7077 (class 2606 OID 84220)
-- Name: tfrm_tree_species tfrm_tree_species_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_tree_species
    ADD CONSTRAINT tfrm_tree_species_pkey PRIMARY KEY (id);


--
-- TOC entry 7378 (class 2606 OID 84222)
-- Name: tfuell_consum tfuell_consum_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfuell_consum
    ADD CONSTRAINT tfuell_consum_pkey PRIMARY KEY (id);


--
-- TOC entry 7394 (class 2606 OID 84224)
-- Name: tgis_af_ref_01_national_forest_inventory_4x4_4x2 tgis_af_ref_01_national_forest_inventory_4x4_4x2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_01_national_forest_inventory_4x4_4x2
    ADD CONSTRAINT tgis_af_ref_01_national_forest_inventory_4x4_4x2_pkey PRIMARY KEY (id);


--
-- TOC entry 7397 (class 2606 OID 84226)
-- Name: tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100 tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100
    ADD CONSTRAINT tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x1_pkey PRIMARY KEY (pid);


--
-- TOC entry 7401 (class 2606 OID 84228)
-- Name: tgis_af_ref_03_intensify_grid_inventory tgis_af_ref_03_intensify_grid_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_03_intensify_grid_inventory
    ADD CONSTRAINT tgis_af_ref_03_intensify_grid_inventory_pkey PRIMARY KEY (pid);


--
-- TOC entry 7406 (class 2606 OID 84230)
-- Name: tgis_af_ref_04_forest_type_fmp tgis_af_ref_04_forest_type_fmp_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_04_forest_type_fmp
    ADD CONSTRAINT tgis_af_ref_04_forest_type_fmp_pkey1 PRIMARY KEY (id);


--
-- TOC entry 7410 (class 2606 OID 84232)
-- Name: tgis_af_ref_05_potential_area_reforestation tgis_af_ref_05_potential_area_reforestation_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_05_potential_area_reforestation
    ADD CONSTRAINT tgis_af_ref_05_potential_area_reforestation_pkey1 PRIMARY KEY (id);


--
-- TOC entry 7416 (class 2606 OID 84234)
-- Name: tgis_af_ref_06_potential_area_afforestation_ tgis_af_ref_06_potential_area_afforestation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_06_potential_area_afforestation_
    ADD CONSTRAINT tgis_af_ref_06_potential_area_afforestation_pkey PRIMARY KEY (id);


--
-- TOC entry 7413 (class 2606 OID 84236)
-- Name: tgis_af_ref_06_potential_area_afforestation tgis_af_ref_06_potential_area_afforestation_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_06_potential_area_afforestation
    ADD CONSTRAINT tgis_af_ref_06_potential_area_afforestation_pkey1 PRIMARY KEY (id);


--
-- TOC entry 6974 (class 2606 OID 84238)
-- Name: tgis_af_ref_07_plantation tgis_af_ref_07_plantation_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_07_plantation
    ADD CONSTRAINT tgis_af_ref_07_plantation_pkey1 PRIMARY KEY (id);


--
-- TOC entry 7419 (class 2606 OID 84240)
-- Name: tgis_af_ref_09_aff_species tgis_af_ref_08_aff_species_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_09_aff_species
    ADD CONSTRAINT tgis_af_ref_08_aff_species_pkey PRIMARY KEY (pid);


--
-- TOC entry 7422 (class 2606 OID 84242)
-- Name: tgis_af_ref_08_seed_stand tgis_af_ref_08_seed_stand_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_08_seed_stand
    ADD CONSTRAINT tgis_af_ref_08_seed_stand_pkey PRIMARY KEY (id);


--
-- TOC entry 7425 (class 2606 OID 84244)
-- Name: tgis_af_ref_10_ref_species tgis_af_ref_10_ref_species_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_af_ref_10_ref_species
    ADD CONSTRAINT tgis_af_ref_10_ref_species_pkey PRIMARY KEY (pid);


--
-- TOC entry 7429 (class 2606 OID 84246)
-- Name: tgis_biodiv tgis_biodiv_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_biodiv
    ADD CONSTRAINT tgis_biodiv_pkey PRIMARY KEY (id);


--
-- TOC entry 7001 (class 2606 OID 84248)
-- Name: tgis_cadastral_municipality tgis_cadastral_municipality_nr_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_municipality
    ADD CONSTRAINT tgis_cadastral_municipality_nr_key UNIQUE (nr);


--
-- TOC entry 7003 (class 2606 OID 84250)
-- Name: tgis_cadastral_municipality tgis_cadastral_municipality_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_municipality
    ADD CONSTRAINT tgis_cadastral_municipality_pkey PRIMARY KEY (id);


--
-- TOC entry 7437 (class 2606 OID 84252)
-- Name: tgis_cadastral_zone tgis_cadastral_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_zone
    ADD CONSTRAINT tgis_cadastral_zone_pkey PRIMARY KEY (id);


--
-- TOC entry 7008 (class 2606 OID 84254)
-- Name: tgis_compartment tgis_compartment_mu_id_mup_id_comp_nr_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_compartment
    ADD CONSTRAINT tgis_compartment_mu_id_mup_id_comp_nr_key UNIQUE (mu_id, mup_id, comp_nr);


--
-- TOC entry 7011 (class 2606 OID 84256)
-- Name: tgis_compartment tgis_compartment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_compartment
    ADD CONSTRAINT tgis_compartment_pkey PRIMARY KEY (id);


--
-- TOC entry 7016 (class 2606 OID 84258)
-- Name: tgis_management_unit tgis_management_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_management_unit
    ADD CONSTRAINT tgis_management_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 7044 (class 2606 OID 84262)
-- Name: tgis_mu_period tgis_mu_period_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_mu_period
    ADD CONSTRAINT tgis_mu_period_pkey PRIMARY KEY (id);


--
-- TOC entry 7444 (class 2606 OID 84266)
-- Name: tgis_parcelgeom tgis_parcelgeom_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_parcelgeom
    ADD CONSTRAINT tgis_parcelgeom_pkey PRIMARY KEY (id);


--
-- TOC entry 7449 (class 2606 OID 84268)
-- Name: tgis_plot_tree tgis_plot_tree_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plot_tree
    ADD CONSTRAINT tgis_plot_tree_pkey PRIMARY KEY (id);


--
-- TOC entry 7453 (class 2606 OID 84270)
-- Name: tgis_plots tgis_plots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plots
    ADD CONSTRAINT tgis_plots_pkey PRIMARY KEY (id);


--
-- TOC entry 7455 (class 2606 OID 84272)
-- Name: tgis_plots tgis_plots_stand_id_plot_nr_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plots
    ADD CONSTRAINT tgis_plots_stand_id_plot_nr_key UNIQUE (stand_id, plot_nr);


--
-- TOC entry 7459 (class 2606 OID 84274)
-- Name: tgis_region tgis_region_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_region
    ADD CONSTRAINT tgis_region_pkey PRIMARY KEY (id);


--
-- TOC entry 7463 (class 2606 OID 84276)
-- Name: tgis_road tgis_road_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_road
    ADD CONSTRAINT tgis_road_pkey PRIMARY KEY (id);


--
-- TOC entry 7470 (class 2606 OID 84278)
-- Name: tgis_soil_name tgis_soil_name_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_soil_name
    ADD CONSTRAINT tgis_soil_name_code_key UNIQUE (code);


--
-- TOC entry 7472 (class 2606 OID 84280)
-- Name: tgis_soil_name tgis_soil_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_soil_name
    ADD CONSTRAINT tgis_soil_name_pkey PRIMARY KEY (id);


--
-- TOC entry 7466 (class 2606 OID 84282)
-- Name: tgis_soil tgis_soil_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_soil
    ADD CONSTRAINT tgis_soil_pkey PRIMARY KEY (id);


--
-- TOC entry 7476 (class 2606 OID 84284)
-- Name: tgis_stand_aud tgis_stand_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_aud
    ADD CONSTRAINT tgis_stand_aud_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 7479 (class 2606 OID 84286)
-- Name: tgis_stand_growth tgis_stand_growth_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_growth
    ADD CONSTRAINT tgis_stand_growth_pkey PRIMARY KEY (id);


--
-- TOC entry 7022 (class 2606 OID 84288)
-- Name: tgis_stand tgis_stand_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_pkey PRIMARY KEY (id);


--
-- TOC entry 7483 (class 2606 OID 84290)
-- Name: tgis_state tgis_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_state
    ADD CONSTRAINT tgis_state_pkey PRIMARY KEY (id);


--
-- TOC entry 7488 (class 2606 OID 84292)
-- Name: tgis_subregion tgis_subregion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_subregion
    ADD CONSTRAINT tgis_subregion_pkey PRIMARY KEY (id);


--
-- TOC entry 7493 (class 2606 OID 84294)
-- Name: tgis_surfacedata tgis_surfacedata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_surfacedata
    ADD CONSTRAINT tgis_surfacedata_pkey PRIMARY KEY (id);


--
-- TOC entry 7498 (class 2606 OID 84296)
-- Name: tgis_wr_lake tgis_wr_lake_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_wr_lake
    ADD CONSTRAINT tgis_wr_lake_pkey PRIMARY KEY (id);


--
-- TOC entry 7506 (class 2606 OID 84298)
-- Name: tgis_zonat_mbrojtura_ammk tgis_zonat_mbrojtura_ammk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_zonat_mbrojtura_ammk
    ADD CONSTRAINT tgis_zonat_mbrojtura_ammk_pkey PRIMARY KEY (id);


--
-- TOC entry 7509 (class 2606 OID 84300)
-- Name: tgiscadastrezone tgiscadastrezone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgiscadastrezone
    ADD CONSTRAINT tgiscadastrezone_pkey PRIMARY KEY (gid);


--
-- TOC entry 7512 (class 2606 OID 84302)
-- Name: tgismun tgismun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgismun
    ADD CONSTRAINT tgismun_pkey PRIMARY KEY (gid);


--
-- TOC entry 7515 (class 2606 OID 84304)
-- Name: thrm_ann_plan_employee thrm_ann_plan_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_ann_plan_employee
    ADD CONSTRAINT thrm_ann_plan_employee_pkey PRIMARY KEY (id);


--
-- TOC entry 7521 (class 2606 OID 84306)
-- Name: thrm_annual_plan_doc thrm_annual_plan_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_doc
    ADD CONSTRAINT thrm_annual_plan_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7518 (class 2606 OID 84309)
-- Name: thrm_annual_plan thrm_annual_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan
    ADD CONSTRAINT thrm_annual_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 7524 (class 2606 OID 84311)
-- Name: thrm_annual_plan_status thrm_annual_plan_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_status
    ADD CONSTRAINT thrm_annual_plan_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7527 (class 2606 OID 84313)
-- Name: thrm_attendance_record thrm_attendance_record_employee_id_punch_in_utc_time_punch__key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_attendance_record
    ADD CONSTRAINT thrm_attendance_record_employee_id_punch_in_utc_time_punch__key UNIQUE (employee_id, punch_in_utc_time, punch_out_utc_time);


--
-- TOC entry 7529 (class 2606 OID 84315)
-- Name: thrm_attendance_record thrm_attendance_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_attendance_record
    ADD CONSTRAINT thrm_attendance_record_pkey PRIMARY KEY (id);


--
-- TOC entry 7535 (class 2606 OID 84317)
-- Name: thrm_decision_doc thrm_decision_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_doc
    ADD CONSTRAINT thrm_decision_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7538 (class 2606 OID 84319)
-- Name: thrm_decision_employee thrm_decision_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_employee
    ADD CONSTRAINT thrm_decision_employee_pkey PRIMARY KEY (id);


--
-- TOC entry 7532 (class 2606 OID 84321)
-- Name: thrm_decision thrm_decision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision
    ADD CONSTRAINT thrm_decision_pkey PRIMARY KEY (id);


--
-- TOC entry 7541 (class 2606 OID 84323)
-- Name: thrm_decision_status thrm_decision_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_status
    ADD CONSTRAINT thrm_decision_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7544 (class 2606 OID 84325)
-- Name: thrm_decision_type thrm_decision_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_type
    ADD CONSTRAINT thrm_decision_type_pkey PRIMARY KEY (id);


--
-- TOC entry 7550 (class 2606 OID 84327)
-- Name: thrm_employee_doc thrm_employee_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_doc
    ADD CONSTRAINT thrm_employee_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7553 (class 2606 OID 84329)
-- Name: thrm_employee_language thrm_employee_language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_language
    ADD CONSTRAINT thrm_employee_language_pkey PRIMARY KEY (id);


--
-- TOC entry 7547 (class 2606 OID 84331)
-- Name: thrm_employee thrm_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee
    ADD CONSTRAINT thrm_employee_pkey PRIMARY KEY (id);


--
-- TOC entry 7911 (class 2606 OID 106371)
-- Name: thrm_employee_salary_adds thrm_employee_salary_adds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adds
    ADD CONSTRAINT thrm_employee_salary_adds_pkey PRIMARY KEY (id);


--
-- TOC entry 7932 (class 2606 OID 115412)
-- Name: thrm_employee_salary_adjustment thrm_employee_salary_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment
    ADD CONSTRAINT thrm_employee_salary_adjustment_pkey PRIMARY KEY (id);


--
-- TOC entry 7905 (class 2606 OID 106317)
-- Name: thrm_employee_salary_bonus thrm_employee_salary_bonus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_bonus
    ADD CONSTRAINT thrm_employee_salary_bonus_pkey PRIMARY KEY (id);


--
-- TOC entry 7908 (class 2606 OID 106344)
-- Name: thrm_employee_salary_deductions thrm_employee_salary_deductions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_deductions
    ADD CONSTRAINT thrm_employee_salary_deductions_pkey PRIMARY KEY (id);


--
-- TOC entry 7937 (class 2606 OID 115448)
-- Name: thrm_employee_salary_payroll_adjustment thrm_employee_salary_payroll_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment
    ADD CONSTRAINT thrm_employee_salary_payroll_adjustment_pkey PRIMARY KEY (id);


--
-- TOC entry 7927 (class 2606 OID 115376)
-- Name: thrm_employee_salary_payroll thrm_employee_salary_payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll
    ADD CONSTRAINT thrm_employee_salary_payroll_pkey PRIMARY KEY (id);


--
-- TOC entry 7922 (class 2606 OID 115356)
-- Name: thrm_employee_salary thrm_employee_salary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary
    ADD CONSTRAINT thrm_employee_salary_pkey PRIMARY KEY (id);


--
-- TOC entry 7919 (class 2606 OID 115340)
-- Name: thrm_employee_salary_tax_rates thrm_employee_salary_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_tax_rates
    ADD CONSTRAINT thrm_employee_salary_tax_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 7556 (class 2606 OID 84333)
-- Name: thrm_employee_skill thrm_employee_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_skill
    ADD CONSTRAINT thrm_employee_skill_pkey PRIMARY KEY (id);


--
-- TOC entry 7559 (class 2606 OID 84335)
-- Name: thrm_employee_sos_contact thrm_employee_sos_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_sos_contact
    ADD CONSTRAINT thrm_employee_sos_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 7562 (class 2606 OID 84337)
-- Name: thrm_language thrm_language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_language
    ADD CONSTRAINT thrm_language_pkey PRIMARY KEY (id);


--
-- TOC entry 7568 (class 2606 OID 84339)
-- Name: thrm_leave_entitlement thrm_leave_entitlement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_entitlement
    ADD CONSTRAINT thrm_leave_entitlement_pkey PRIMARY KEY (id);


--
-- TOC entry 7565 (class 2606 OID 84341)
-- Name: thrm_leave thrm_leave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave
    ADD CONSTRAINT thrm_leave_pkey PRIMARY KEY (id);


--
-- TOC entry 7571 (class 2606 OID 84343)
-- Name: thrm_leave_type thrm_leave_type_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_type
    ADD CONSTRAINT thrm_leave_type_code_key UNIQUE (code);


--
-- TOC entry 7573 (class 2606 OID 84345)
-- Name: thrm_leave_type thrm_leave_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_type
    ADD CONSTRAINT thrm_leave_type_pkey PRIMARY KEY (id);


--
-- TOC entry 7576 (class 2606 OID 84347)
-- Name: thrm_nationality thrm_nationality_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_nationality
    ADD CONSTRAINT thrm_nationality_pkey PRIMARY KEY (id);


--
-- TOC entry 7579 (class 2606 OID 84349)
-- Name: thrm_offical_travel thrm_offical_travel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_offical_travel
    ADD CONSTRAINT thrm_offical_travel_pkey PRIMARY KEY (id);


--
-- TOC entry 7582 (class 2606 OID 84351)
-- Name: timport_status timport_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timport_status
    ADD CONSTRAINT timport_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7585 (class 2606 OID 84353)
-- Name: tkfis_gen_documents tkfis_gen_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tkfis_gen_documents
    ADD CONSTRAINT tkfis_gen_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 7587 (class 2606 OID 84355)
-- Name: tkfis_gen_documents tkfis_gen_documents_uid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tkfis_gen_documents
    ADD CONSTRAINT tkfis_gen_documents_uid_key UNIQUE (uid);


--
-- TOC entry 7387 (class 2606 OID 84357)
-- Name: tlayers_gis tlayers_gis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlayers_gis
    ADD CONSTRAINT tlayers_gis_pkey PRIMARY KEY (id);


--
-- TOC entry 7595 (class 2606 OID 84359)
-- Name: tlegsec_lawsuit_damage tlegsec_lawsuit_damage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_damage
    ADD CONSTRAINT tlegsec_lawsuit_damage_pkey PRIMARY KEY (id);


--
-- TOC entry 7590 (class 2606 OID 84361)
-- Name: tlegsec_lawsuit tlegsec_lawsuit_lawsuit_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit
    ADD CONSTRAINT tlegsec_lawsuit_lawsuit_no_key UNIQUE (lawsuit_no);


--
-- TOC entry 7592 (class 2606 OID 84363)
-- Name: tlegsec_lawsuit tlegsec_lawsuit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit
    ADD CONSTRAINT tlegsec_lawsuit_pkey PRIMARY KEY (id);


--
-- TOC entry 7598 (class 2606 OID 84365)
-- Name: tlegsec_lawsuit_status tlegsec_lawsuit_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_status
    ADD CONSTRAINT tlegsec_lawsuit_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7601 (class 2606 OID 84367)
-- Name: tlinetemp tlinetemp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlinetemp
    ADD CONSTRAINT tlinetemp_pkey PRIMARY KEY (id);


--
-- TOC entry 7604 (class 2606 OID 84369)
-- Name: tlocation tlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlocation
    ADD CONSTRAINT tlocation_pkey PRIMARY KEY (id);


--
-- TOC entry 7607 (class 2606 OID 84371)
-- Name: tlog_devices tlog_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_devices
    ADD CONSTRAINT tlog_devices_pkey PRIMARY KEY (id);


--
-- TOC entry 7610 (class 2606 OID 84373)
-- Name: tlog_positions tlog_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_positions
    ADD CONSTRAINT tlog_positions_pkey PRIMARY KEY (id);


--
-- TOC entry 7613 (class 2606 OID 84375)
-- Name: tlog_protocol_ports tlog_protocol_ports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_protocol_ports
    ADD CONSTRAINT tlog_protocol_ports_pkey PRIMARY KEY (id);


--
-- TOC entry 7618 (class 2606 OID 84377)
-- Name: tlog_trips tlog_trips_id_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_trips
    ADD CONSTRAINT tlog_trips_id_pkey PRIMARY KEY (id);


--
-- TOC entry 7622 (class 2606 OID 84379)
-- Name: tlog_trips_1 tlog_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_trips_1
    ADD CONSTRAINT tlog_trips_pkey PRIMARY KEY (id);


--
-- TOC entry 7625 (class 2606 OID 84381)
-- Name: tlog_vehicles tlog_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles
    ADD CONSTRAINT tlog_vehicles_pkey PRIMARY KEY (id);


--
-- TOC entry 7628 (class 2606 OID 84383)
-- Name: tlog_vehicles_register tlog_vehicles_register_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_register
    ADD CONSTRAINT tlog_vehicles_register_pkey PRIMARY KEY (id);


--
-- TOC entry 7631 (class 2606 OID 84385)
-- Name: tlog_vehicles_service_maintenance tlog_vehicles_service_maintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_service_maintenance
    ADD CONSTRAINT tlog_vehicles_service_maintenance_pkey PRIMARY KEY (id);


--
-- TOC entry 7634 (class 2606 OID 84387)
-- Name: tmanagment_protocol_doc tmanagment_protocol_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmanagment_protocol_doc
    ADD CONSTRAINT tmanagment_protocol_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7636 (class 2606 OID 84389)
-- Name: tmanagment_protocol_doc tmanagment_protocol_doc_protocol_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmanagment_protocol_doc
    ADD CONSTRAINT tmanagment_protocol_doc_protocol_no_key UNIQUE (protocol_no);


--
-- TOC entry 7639 (class 2606 OID 84391)
-- Name: tmer_evaluation_perf tmer_evaluation_perf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_perf
    ADD CONSTRAINT tmer_evaluation_perf_pkey PRIMARY KEY (id);


--
-- TOC entry 7642 (class 2606 OID 84393)
-- Name: tmer_evaluation_strat tmer_evaluation_strat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_strat
    ADD CONSTRAINT tmer_evaluation_strat_pkey PRIMARY KEY (id);


--
-- TOC entry 7645 (class 2606 OID 84395)
-- Name: tmer_finance_donor tmer_finance_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_finance_donor
    ADD CONSTRAINT tmer_finance_donor_pkey PRIMARY KEY (id);


--
-- TOC entry 7648 (class 2606 OID 84397)
-- Name: tmer_indicator tmer_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator
    ADD CONSTRAINT tmer_indicator_pkey PRIMARY KEY (id);


--
-- TOC entry 7651 (class 2606 OID 84399)
-- Name: tmer_indicator_target tmer_indicator_target_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator_target
    ADD CONSTRAINT tmer_indicator_target_pkey PRIMARY KEY (id);


--
-- TOC entry 7654 (class 2606 OID 84401)
-- Name: tmer_plan_period tmer_plan_period_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_plan_period
    ADD CONSTRAINT tmer_plan_period_pkey PRIMARY KEY (id);


--
-- TOC entry 7657 (class 2606 OID 84403)
-- Name: tmer_project tmer_project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_project
    ADD CONSTRAINT tmer_project_pkey PRIMARY KEY (id);


--
-- TOC entry 7660 (class 2606 OID 84405)
-- Name: tmer_ref_sub_projects tmer_ref_sub_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_ref_sub_projects
    ADD CONSTRAINT tmer_ref_sub_projects_pkey PRIMARY KEY (id);


--
-- TOC entry 7663 (class 2606 OID 84407)
-- Name: tmer_resp_institutions tmer_resp_institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_resp_institutions
    ADD CONSTRAINT tmer_resp_institutions_pkey PRIMARY KEY (id);


--
-- TOC entry 7669 (class 2606 OID 84409)
-- Name: tmer_strategy_doc tmer_strategy_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_doc
    ADD CONSTRAINT tmer_strategy_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7672 (class 2606 OID 84411)
-- Name: tmer_strategy_execution tmer_strategy_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_execution
    ADD CONSTRAINT tmer_strategy_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 7666 (class 2606 OID 84413)
-- Name: tmer_strategy tmer_strategy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy
    ADD CONSTRAINT tmer_strategy_pkey PRIMARY KEY (id);


--
-- TOC entry 7675 (class 2606 OID 84415)
-- Name: tmer_sub_indicator tmer_sub_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_indicator
    ADD CONSTRAINT tmer_sub_indicator_pkey PRIMARY KEY (id);


--
-- TOC entry 7678 (class 2606 OID 84417)
-- Name: tmer_sub_project tmer_sub_project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_project
    ADD CONSTRAINT tmer_sub_project_pkey PRIMARY KEY (id);


--
-- TOC entry 7684 (class 2606 OID 84419)
-- Name: torganisation_mun torganisation_mun_org_id_mun_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torganisation_mun
    ADD CONSTRAINT torganisation_mun_org_id_mun_id_key UNIQUE (org_id, mun_id);


--
-- TOC entry 7686 (class 2606 OID 84421)
-- Name: torganisation_mun torganisation_mun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torganisation_mun
    ADD CONSTRAINT torganisation_mun_pkey PRIMARY KEY (id);


--
-- TOC entry 7681 (class 2606 OID 84423)
-- Name: torganisation torganisation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torganisation
    ADD CONSTRAINT torganisation_pkey PRIMARY KEY (id);


--
-- TOC entry 7689 (class 2606 OID 84425)
-- Name: tparcel_detail tparcel_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparcel_detail
    ADD CONSTRAINT tparcel_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 7692 (class 2606 OID 84427)
-- Name: tparcel_owner tparcel_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparcel_owner
    ADD CONSTRAINT tparcel_owner_pkey PRIMARY KEY (id);


--
-- TOC entry 7695 (class 2606 OID 84429)
-- Name: tparty tparty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty
    ADD CONSTRAINT tparty_pkey PRIMARY KEY (id);


--
-- TOC entry 7698 (class 2606 OID 84431)
-- Name: tparty_relationship tparty_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_relationship
    ADD CONSTRAINT tparty_relationship_pkey PRIMARY KEY (id);


--
-- TOC entry 7701 (class 2606 OID 84433)
-- Name: tparty_role tparty_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_role
    ADD CONSTRAINT tparty_role_pkey PRIMARY KEY (id);


--
-- TOC entry 7704 (class 2606 OID 84435)
-- Name: tparty_user tparty_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_user
    ADD CONSTRAINT tparty_user_pkey PRIMARY KEY (id);


--
-- TOC entry 7706 (class 2606 OID 84437)
-- Name: tparty_user tparty_user_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_user
    ADD CONSTRAINT tparty_user_user_id_key UNIQUE (user_id);


--
-- TOC entry 7709 (class 2606 OID 84439)
-- Name: tperson tperson_personal_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tperson
    ADD CONSTRAINT tperson_personal_id_key UNIQUE (personal_id);


--
-- TOC entry 7711 (class 2606 OID 84441)
-- Name: tperson tperson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tperson
    ADD CONSTRAINT tperson_pkey PRIMARY KEY (id);


--
-- TOC entry 7714 (class 2606 OID 84443)
-- Name: tprcmt_dossier_question tprcmt_dossier_question_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_question
    ADD CONSTRAINT tprcmt_dossier_question_pkey PRIMARY KEY (id);


--
-- TOC entry 7717 (class 2606 OID 84445)
-- Name: tprcmt_dossier_request tprcmt_dossier_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_request
    ADD CONSTRAINT tprcmt_dossier_request_pkey PRIMARY KEY (id);


--
-- TOC entry 7720 (class 2606 OID 84447)
-- Name: tprcmt_tender_bid tprcmt_tender_bid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bid
    ADD CONSTRAINT tprcmt_tender_bid_pkey PRIMARY KEY (id);


--
-- TOC entry 7723 (class 2606 OID 84449)
-- Name: tprcmt_tender_bidder tprcmt_tender_bidder_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bidder
    ADD CONSTRAINT tprcmt_tender_bidder_pkey PRIMARY KEY (id);


--
-- TOC entry 7726 (class 2606 OID 84451)
-- Name: tprcmt_tender_complaint tprcmt_tender_complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_complaint
    ADD CONSTRAINT tprcmt_tender_complaint_pkey PRIMARY KEY (id);


--
-- TOC entry 7729 (class 2606 OID 84454)
-- Name: tprcmt_tender_request tprcmt_tender_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_request
    ADD CONSTRAINT tprcmt_tender_request_pkey PRIMARY KEY (id);


--
-- TOC entry 7735 (class 2606 OID 84456)
-- Name: tprcmt_tender_status_doc tprcmt_tender_status_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status_doc
    ADD CONSTRAINT tprcmt_tender_status_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 7732 (class 2606 OID 84458)
-- Name: tprcmt_tender_status tprcmt_tender_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status
    ADD CONSTRAINT tprcmt_tender_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7738 (class 2606 OID 84460)
-- Name: tpublishing tpublishing_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpublishing
    ADD CONSTRAINT tpublishing_pkey PRIMARY KEY (id);


--
-- TOC entry 7746 (class 2606 OID 84462)
-- Name: tpurchase_order_item tpurchase_order_item_order_id_item_number; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_order_id_item_number UNIQUE (order_id, item_number);


--
-- TOC entry 7748 (class 2606 OID 84464)
-- Name: tpurchase_order_item tpurchase_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_pkey PRIMARY KEY (id);


--
-- TOC entry 7741 (class 2606 OID 84466)
-- Name: tpurchase_order tpurchase_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_pkey PRIMARY KEY (id);


--
-- TOC entry 7743 (class 2606 OID 84468)
-- Name: tpurchase_order tpurchase_order_po_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_po_number_key UNIQUE (po_number);


--
-- TOC entry 7751 (class 2606 OID 84470)
-- Name: tpurchase_order_status tpurchase_order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_status
    ADD CONSTRAINT tpurchase_order_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7062 (class 2606 OID 84472)
-- Name: trbac_object trbac_object_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_object
    ADD CONSTRAINT trbac_object_code_key UNIQUE (code);


--
-- TOC entry 7064 (class 2606 OID 84474)
-- Name: trbac_object trbac_object_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_object
    ADD CONSTRAINT trbac_object_pkey PRIMARY KEY (id);


--
-- TOC entry 7761 (class 2606 OID 84476)
-- Name: trbac_operation trbac_operation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_operation
    ADD CONSTRAINT trbac_operation_name_key UNIQUE (name);


--
-- TOC entry 7763 (class 2606 OID 84478)
-- Name: trbac_operation trbac_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_operation
    ADD CONSTRAINT trbac_operation_pkey PRIMARY KEY (id);


--
-- TOC entry 7769 (class 2606 OID 84480)
-- Name: trbac_permission trbac_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_permission
    ADD CONSTRAINT trbac_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 7771 (class 2606 OID 84482)
-- Name: trbac_permission trbac_permission_role_id_object_id_operation_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_permission
    ADD CONSTRAINT trbac_permission_role_id_object_id_operation_id_key UNIQUE (role_id, object_id, operation_id);


--
-- TOC entry 7776 (class 2606 OID 84484)
-- Name: trbac_role trbac_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_role
    ADD CONSTRAINT trbac_role_pkey PRIMARY KEY (id);


--
-- TOC entry 7779 (class 2606 OID 84486)
-- Name: trbac_session trbac_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_session
    ADD CONSTRAINT trbac_session_pkey PRIMARY KEY (id);


--
-- TOC entry 7784 (class 2606 OID 84488)
-- Name: trbac_session_role trbac_session_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_session_role
    ADD CONSTRAINT trbac_session_role_pkey PRIMARY KEY (id);


--
-- TOC entry 7786 (class 2606 OID 84490)
-- Name: trbac_session_role trbac_session_role_role_id_session_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_session_role
    ADD CONSTRAINT trbac_session_role_role_id_session_id_key UNIQUE (role_id, session_id);


--
-- TOC entry 7791 (class 2606 OID 84492)
-- Name: trbac_user_role trbac_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_user_role
    ADD CONSTRAINT trbac_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 7793 (class 2606 OID 84494)
-- Name: trbac_user_role trbac_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_user_role
    ADD CONSTRAINT trbac_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- TOC entry 6963 (class 2606 OID 84496)
-- Name: tref_economic_code tref_economic_code_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_economic_code
    ADD CONSTRAINT tref_economic_code_code_key UNIQUE (code);


--
-- TOC entry 6965 (class 2606 OID 84498)
-- Name: tref_economic_code tref_economic_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_economic_code
    ADD CONSTRAINT tref_economic_code_pkey PRIMARY KEY (id);


--
-- TOC entry 7797 (class 2606 OID 84500)
-- Name: tref_ekonomic_code tref_ekonomic_code_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_ekonomic_code
    ADD CONSTRAINT tref_ekonomic_code_code_key UNIQUE (code);


--
-- TOC entry 7799 (class 2606 OID 84502)
-- Name: tref_ekonomic_code tref_ekonomic_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_ekonomic_code
    ADD CONSTRAINT tref_ekonomic_code_pkey PRIMARY KEY (id);


--
-- TOC entry 7807 (class 2606 OID 84504)
-- Name: trequisition_account trequisition_account_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_account
    ADD CONSTRAINT trequisition_account_pkey PRIMARY KEY (id);


--
-- TOC entry 7810 (class 2606 OID 84506)
-- Name: trequisition_item trequisition_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item
    ADD CONSTRAINT trequisition_item_pkey PRIMARY KEY (id);


--
-- TOC entry 7812 (class 2606 OID 84508)
-- Name: trequisition_item trequisition_item_requisition_id_item_number; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item
    ADD CONSTRAINT trequisition_item_requisition_id_item_number UNIQUE (requisition_id, item_number);


--
-- TOC entry 7802 (class 2606 OID 84510)
-- Name: trequisition trequisition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_pkey PRIMARY KEY (id);


--
-- TOC entry 7804 (class 2606 OID 84512)
-- Name: trequisition trequisition_requisition_nr_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_requisition_nr_key UNIQUE (requisition_nr);


--
-- TOC entry 7815 (class 2606 OID 84514)
-- Name: trequisition_status trequisition_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_status
    ADD CONSTRAINT trequisition_status_pkey PRIMARY KEY (id);


--
-- TOC entry 7818 (class 2606 OID 84516)
-- Name: tshape_stand_treatment tshape_stand_treatment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tshape_stand_treatment
    ADD CONSTRAINT tshape_stand_treatment_pkey PRIMARY KEY (id);


--
-- TOC entry 7080 (class 2606 OID 84518)
-- Name: tshape_treatment_name tshape_treatment_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tshape_treatment_name
    ADD CONSTRAINT tshape_treatment_name_pkey PRIMARY KEY (id);


--
-- TOC entry 7821 (class 2606 OID 84520)
-- Name: ttax ttax_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttax
    ADD CONSTRAINT ttax_pkey PRIMARY KEY (id);


--
-- TOC entry 7037 (class 2606 OID 84522)
-- Name: ttextdomain ttextdomain_domname_domvalue_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttextdomain
    ADD CONSTRAINT ttextdomain_domname_domvalue_key UNIQUE (domname, domvalue);


--
-- TOC entry 7039 (class 2606 OID 84524)
-- Name: ttextdomain ttextdomain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttextdomain
    ADD CONSTRAINT ttextdomain_pkey PRIMARY KEY (id);


--
-- TOC entry 7824 (class 2606 OID 84526)
-- Name: tunit_measurement tunit_measurement_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tunit_measurement
    ADD CONSTRAINT tunit_measurement_name_key UNIQUE (name);


--
-- TOC entry 7826 (class 2606 OID 84528)
-- Name: tunit_measurement tunit_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tunit_measurement
    ADD CONSTRAINT tunit_measurement_pkey PRIMARY KEY (id);


--
-- TOC entry 7829 (class 2606 OID 84530)
-- Name: tunits_metric tunits_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tunits_metric
    ADD CONSTRAINT tunits_metric_pkey PRIMARY KEY (id);


--
-- TOC entry 7832 (class 2606 OID 84532)
-- Name: tuom tuom_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom
    ADD CONSTRAINT tuom_pkey PRIMARY KEY (id);


--
-- TOC entry 7835 (class 2606 OID 84534)
-- Name: tuom_trl tuom_trl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom_trl
    ADD CONSTRAINT tuom_trl_pkey PRIMARY KEY (id);


--
-- TOC entry 7844 (class 2606 OID 84536)
-- Name: tuser_log tuser_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_log
    ADD CONSTRAINT tuser_log_pkey PRIMARY KEY (id);


--
-- TOC entry 7846 (class 2606 OID 84538)
-- Name: tuser_log tuser_log_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_log
    ADD CONSTRAINT tuser_log_user_id_key UNIQUE (user_id);


--
-- TOC entry 7849 (class 2606 OID 84540)
-- Name: tuser_login_attempt tuser_login_attempt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_login_attempt
    ADD CONSTRAINT tuser_login_attempt_pkey PRIMARY KEY (id);


--
-- TOC entry 7852 (class 2606 OID 84542)
-- Name: tuser_password tuser_password_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_password
    ADD CONSTRAINT tuser_password_pkey PRIMARY KEY (id);


--
-- TOC entry 7839 (class 2606 OID 84544)
-- Name: tuser tuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_pkey PRIMARY KEY (id);


--
-- TOC entry 7841 (class 2606 OID 84546)
-- Name: tuser tuser_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_username_key UNIQUE (username);


--
-- TOC entry 7855 (class 2606 OID 84548)
-- Name: tvehicles_staff_assign tvehicles_staff_assign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_staff_assign
    ADD CONSTRAINT tvehicles_staff_assign_pkey PRIMARY KEY (id);


--
-- TOC entry 7858 (class 2606 OID 84550)
-- Name: tvehicles_tracking tvehicles_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_tracking
    ADD CONSTRAINT tvehicles_tracking_pkey PRIMARY KEY (id);


--
-- TOC entry 7866 (class 2606 OID 84552)
-- Name: wr_lumenjet wr_lumenjet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wr_lumenjet
    ADD CONSTRAINT wr_lumenjet_pkey PRIMARY KEY (id);


--
-- TOC entry 7868 (class 2606 OID 84554)
-- Name: attribute_aliases pk_attribute_aliases; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.attribute_aliases
    ADD CONSTRAINT pk_attribute_aliases PRIMARY KEY (id);


--
-- TOC entry 7872 (class 2606 OID 84556)
-- Name: calendars pk_calendars; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.calendars
    ADD CONSTRAINT pk_calendars PRIMARY KEY (id);


--
-- TOC entry 7875 (class 2606 OID 84558)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 7753 (class 2606 OID 84560)
-- Name: devices pk_devices; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.devices
    ADD CONSTRAINT pk_devices PRIMARY KEY (id);


--
-- TOC entry 7878 (class 2606 OID 84562)
-- Name: events pk_events; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.events
    ADD CONSTRAINT pk_events PRIMARY KEY (id);


--
-- TOC entry 7880 (class 2606 OID 84564)
-- Name: geofences pk_geofences; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.geofences
    ADD CONSTRAINT pk_geofences PRIMARY KEY (id);


--
-- TOC entry 7883 (class 2606 OID 84566)
-- Name: groups pk_groups; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.groups
    ADD CONSTRAINT pk_groups PRIMARY KEY (id);


--
-- TOC entry 7885 (class 2606 OID 84568)
-- Name: notifications pk_notifications; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.notifications
    ADD CONSTRAINT pk_notifications PRIMARY KEY (id);


--
-- TOC entry 7757 (class 2606 OID 84570)
-- Name: positions pk_positions; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.positions
    ADD CONSTRAINT pk_positions PRIMARY KEY (id);


--
-- TOC entry 7889 (class 2606 OID 84572)
-- Name: server pk_server; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.server
    ADD CONSTRAINT pk_server PRIMARY KEY (id);


--
-- TOC entry 7891 (class 2606 OID 84574)
-- Name: statistics pk_statistics; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.statistics
    ADD CONSTRAINT pk_statistics PRIMARY KEY (id);


--
-- TOC entry 7900 (class 2606 OID 84576)
-- Name: users pk_users; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- TOC entry 7887 (class 2606 OID 84578)
-- Name: positions_aud positions_aud_pkey; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.positions_aud
    ADD CONSTRAINT positions_aud_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 7755 (class 2606 OID 84580)
-- Name: devices uk_device_uniqueid; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.devices
    ADD CONSTRAINT uk_device_uniqueid UNIQUE (uniqueid);


--
-- TOC entry 7870 (class 2606 OID 84582)
-- Name: attribute_aliases uk_deviceid_attribute; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.attribute_aliases
    ADD CONSTRAINT uk_deviceid_attribute UNIQUE (deviceid, attribute);


--
-- TOC entry 7902 (class 2606 OID 84584)
-- Name: users uk_user_email; Type: CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.users
    ADD CONSTRAINT uk_user_email UNIQUE (email);


--
-- TOC entry 6970 (class 1259 OID 123924)
-- Name: idx_ekonomic_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ekonomic_code_id ON public.ekonomic_code USING btree (id);


--
-- TOC entry 7046 (class 1259 OID 124050)
-- Name: idx_iso_metadata_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_iso_metadata_id ON public.iso_metadata USING btree (id);


--
-- TOC entry 6952 (class 1259 OID 124051)
-- Name: idx_komuna_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_komuna_id ON public.komuna USING btree (id);


--
-- TOC entry 7049 (class 1259 OID 124052)
-- Name: idx_liqenet2_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_liqenet2_id ON public.liqenet2 USING btree (id);


--
-- TOC entry 7053 (class 1259 OID 124053)
-- Name: idx_lumenjet_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lumenjet_id ON public.lumenjet USING btree (id);


--
-- TOC entry 7056 (class 1259 OID 124054)
-- Name: idx_poligon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_poligon_id ON public.poligon USING btree (id);


--
-- TOC entry 7068 (class 1259 OID 124055)
-- Name: idx_shape_stand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_shape_stand_id ON public.shape_stand USING btree (id);


--
-- TOC entry 7090 (class 1259 OID 124056)
-- Name: idx_tables_aud_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tables_aud_id ON public.tables_aud USING btree (id);


--
-- TOC entry 7093 (class 1259 OID 124057)
-- Name: idx_tad_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tad_language_id ON public.tad_language USING btree (id);


--
-- TOC entry 7098 (class 1259 OID 124058)
-- Name: idx_taddress_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taddress_id ON public.taddress USING btree (id);


--
-- TOC entry 7101 (class 1259 OID 124059)
-- Name: idx_taff_ref_projects_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taff_ref_projects_id ON public.taff_ref_projects USING btree (id);


--
-- TOC entry 7104 (class 1259 OID 124060)
-- Name: idx_talert_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_talert_id ON public.talert USING btree (id);


--
-- TOC entry 7107 (class 1259 OID 124061)
-- Name: idx_talertrecipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_talertrecipient_id ON public.talertrecipient USING btree (id);


--
-- TOC entry 7110 (class 1259 OID 124062)
-- Name: idx_talertrule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_talertrule_id ON public.talertrule USING btree (id);


--
-- TOC entry 7115 (class 1259 OID 124063)
-- Name: idx_talertrule_trl_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_talertrule_trl_id ON public.talertrule_trl USING btree (id);


--
-- TOC entry 7121 (class 1259 OID 124065)
-- Name: idx_tassets_devaluation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tassets_devaluation_id ON public.tassets_devaluation USING btree (id);


--
-- TOC entry 7118 (class 1259 OID 124064)
-- Name: idx_tassets_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tassets_id ON public.tassets USING btree (id);


--
-- TOC entry 7124 (class 1259 OID 124066)
-- Name: idx_tassets_staff_assign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tassets_staff_assign_id ON public.tassets_staff_assign USING btree (id);


--
-- TOC entry 7127 (class 1259 OID 124067)
-- Name: idx_tb_monitor_eval_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tb_monitor_eval_id ON public.tb_monitor_eval USING btree (id);


--
-- TOC entry 7130 (class 1259 OID 124068)
-- Name: idx_tbiodiv_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tbiodiv_name_id ON public.tbiodiv_name USING btree (id);


--
-- TOC entry 7133 (class 1259 OID 124069)
-- Name: idx_tbpartner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tbpartner_id ON public.tbpartner USING btree (id);


--
-- TOC entry 7136 (class 1259 OID 124070)
-- Name: idx_tbpartner_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tbpartner_location_id ON public.tbpartner_location USING btree (id);


--
-- TOC entry 7139 (class 1259 OID 124071)
-- Name: idx_tcurrency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tcurrency_id ON public.tcurrency USING btree (id);


--
-- TOC entry 7144 (class 1259 OID 124072)
-- Name: idx_tdhpet_activity_management_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_activity_management_id ON public.tdhpet_activity_management USING btree (id);


--
-- TOC entry 7147 (class 1259 OID 124073)
-- Name: idx_tdhpet_animal_capacity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_animal_capacity_id ON public.tdhpet_animal_capacity USING btree (id);


--
-- TOC entry 7153 (class 1259 OID 124075)
-- Name: idx_tdhpet_animal_location_detail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_animal_location_detail_id ON public.tdhpet_animal_location_detail USING btree (id);


--
-- TOC entry 7150 (class 1259 OID 124074)
-- Name: idx_tdhpet_animal_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_animal_location_id ON public.tdhpet_animal_location USING btree (id);


--
-- TOC entry 7156 (class 1259 OID 124076)
-- Name: idx_tdhpet_annual_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_annual_plan_id ON public.tdhpet_annual_plan USING btree (id);


--
-- TOC entry 7159 (class 1259 OID 124077)
-- Name: idx_tdhpet_hunt_ground_eval_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_hunt_ground_eval_id ON public.tdhpet_hunt_ground_eval USING btree (id);


--
-- TOC entry 7162 (class 1259 OID 124078)
-- Name: idx_tdhpet_hunted_animal_detail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_hunted_animal_detail_id ON public.tdhpet_hunted_animal_detail USING btree (id);


--
-- TOC entry 7165 (class 1259 OID 124079)
-- Name: idx_tdhpet_hunted_animals_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_hunted_animals_id ON public.tdhpet_hunted_animals USING btree (id);


--
-- TOC entry 6953 (class 1259 OID 124080)
-- Name: idx_tdhpet_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_location_id ON public.tdhpet_location USING btree (id);


--
-- TOC entry 7168 (class 1259 OID 124081)
-- Name: idx_tdhpet_location_land_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_location_land_type_id ON public.tdhpet_location_land_type USING btree (id);


--
-- TOC entry 7171 (class 1259 OID 124082)
-- Name: idx_tdhpet_period_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_period_plan_id ON public.tdhpet_period_plan USING btree (id);


--
-- TOC entry 7174 (class 1259 OID 124083)
-- Name: idx_tdhpet_tourist_purpose_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_tourist_purpose_id ON public.tdhpet_tourist_purpose USING btree (id);


--
-- TOC entry 7177 (class 1259 OID 124084)
-- Name: idx_tdhpet_tourist_register_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_tourist_register_id ON public.tdhpet_tourist_register USING btree (id);


--
-- TOC entry 6957 (class 1259 OID 124085)
-- Name: idx_tdhpet_tourist_zone_geoms_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_tourist_zone_geoms_id ON public.tdhpet_tourist_zone_geoms USING btree (id);


--
-- TOC entry 7180 (class 1259 OID 124086)
-- Name: idx_tdhpet_wild_animals_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_wild_animals_id ON public.tdhpet_wild_animals USING btree (id);


--
-- TOC entry 7183 (class 1259 OID 124087)
-- Name: idx_tdhpet_wild_animals_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdhpet_wild_animals_request_id ON public.tdhpet_wild_animals_request USING btree (id);


--
-- TOC entry 7186 (class 1259 OID 124088)
-- Name: idx_tdoc_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdoc_category_id ON public.tdoc_category USING btree (id);


--
-- TOC entry 7189 (class 1259 OID 124089)
-- Name: idx_tdoctype_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdoctype_id ON public.tdoctype USING btree (id);


--
-- TOC entry 7192 (class 1259 OID 124090)
-- Name: idx_tdomain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdomain_id ON public.tdomain USING btree (id);


--
-- TOC entry 7198 (class 1259 OID 124092)
-- Name: idx_tdp_mngmt_attach_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdp_mngmt_attach_id ON public.tdp_mngmt_attach USING btree (id);


--
-- TOC entry 7195 (class 1259 OID 124091)
-- Name: idx_tdp_mngmt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdp_mngmt_id ON public.tdp_mngmt USING btree (id);


--
-- TOC entry 7201 (class 1259 OID 124093)
-- Name: idx_tdp_mngmt_settings_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdp_mngmt_settings_id ON public.tdp_mngmt_settings USING btree (id);


--
-- TOC entry 7204 (class 1259 OID 124094)
-- Name: idx_tdp_mngmt_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tdp_mngmt_status_id ON public.tdp_mngmt_status USING btree (id);


--
-- TOC entry 7207 (class 1259 OID 124095)
-- Name: idx_tfal_cad_parcel_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfal_cad_parcel_request_id ON public.tfal_cad_parcel_request USING btree (id);


--
-- TOC entry 7210 (class 1259 OID 124097)
-- Name: idx_tfal_request_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfal_request_coord_id ON public.tfal_request_coord USING btree (id);


--
-- TOC entry 7213 (class 1259 OID 124098)
-- Name: idx_tfal_request_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfal_request_doc_id ON public.tfal_request_doc USING btree (id);


--
-- TOC entry 7025 (class 1259 OID 124096)
-- Name: idx_tfal_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfal_request_id ON public.tfal_request USING btree (id);


--
-- TOC entry 7029 (class 1259 OID 124099)
-- Name: idx_tfal_request_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfal_request_status_id ON public.tfal_request_status USING btree (id);


--
-- TOC entry 7032 (class 1259 OID 124100)
-- Name: idx_tfal_request_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfal_request_type_id ON public.tfal_request_type USING btree (id);


--
-- TOC entry 7216 (class 1259 OID 124101)
-- Name: idx_tfin_annu_budget_alloc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_annu_budget_alloc_id ON public.tfin_annu_budget_alloc USING btree (id);


--
-- TOC entry 7221 (class 1259 OID 124102)
-- Name: idx_tfin_budget_mainntenance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_budget_mainntenance_id ON public.tfin_budget_mainntenance USING btree (id);


--
-- TOC entry 7227 (class 1259 OID 124104)
-- Name: idx_tfin_contract_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_contract_doc_id ON public.tfin_contract_doc USING btree (id);


--
-- TOC entry 7224 (class 1259 OID 124103)
-- Name: idx_tfin_contract_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_contract_id ON public.tfin_contract USING btree (id);


--
-- TOC entry 7230 (class 1259 OID 124105)
-- Name: idx_tfin_contractor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_contractor_id ON public.tfin_contractor USING btree (id);


--
-- TOC entry 7233 (class 1259 OID 124106)
-- Name: idx_tfin_input_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_input_id ON public.tfin_input USING btree (id);


--
-- TOC entry 7236 (class 1259 OID 124107)
-- Name: idx_tfin_input_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_input_status_id ON public.tfin_input_status USING btree (id);


--
-- TOC entry 7239 (class 1259 OID 124108)
-- Name: idx_tfin_output_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_output_id ON public.tfin_output USING btree (id);


--
-- TOC entry 7242 (class 1259 OID 124109)
-- Name: idx_tfin_payment_period_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_payment_period_id ON public.tfin_payment_period USING btree (id);


--
-- TOC entry 7912 (class 1259 OID 124110)
-- Name: idx_tfin_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfin_type_id ON public.tfin_type USING btree (id);


--
-- TOC entry 7245 (class 1259 OID 124112)
-- Name: idx_tfrm_activity_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_activity_domain_id ON public.tfrm_activity_domain USING btree (id);


--
-- TOC entry 6975 (class 1259 OID 124111)
-- Name: idx_tfrm_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_activity_id ON public.tfrm_activity USING btree (id);


--
-- TOC entry 7251 (class 1259 OID 124114)
-- Name: idx_tfrm_activity_status_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_activity_status_doc_id ON public.tfrm_activity_status_doc USING btree (id);


--
-- TOC entry 7248 (class 1259 OID 124113)
-- Name: idx_tfrm_activity_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_activity_status_id ON public.tfrm_activity_status USING btree (id);


--
-- TOC entry 6980 (class 1259 OID 124115)
-- Name: idx_tfrm_annual_planning_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_annual_planning_id ON public.tfrm_annual_planning USING btree (id);


--
-- TOC entry 7254 (class 1259 OID 124116)
-- Name: idx_tfrm_annual_planning_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_annual_planning_status_id ON public.tfrm_annual_planning_status USING btree (id);


--
-- TOC entry 7257 (class 1259 OID 124117)
-- Name: idx_tfrm_annual_protection_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_annual_protection_plan_id ON public.tfrm_annual_protection_plan USING btree (id);


--
-- TOC entry 7260 (class 1259 OID 124118)
-- Name: idx_tfrm_bio_diversity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_bio_diversity_id ON public.tfrm_bio_diversity USING btree (id);


--
-- TOC entry 7263 (class 1259 OID 124119)
-- Name: idx_tfrm_bio_diversity_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_bio_diversity_name_id ON public.tfrm_bio_diversity_name USING btree (id);


--
-- TOC entry 7269 (class 1259 OID 124121)
-- Name: idx_tfrm_confiscation_detail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_confiscation_detail_id ON public.tfrm_confiscation_detail USING btree (id);


--
-- TOC entry 7266 (class 1259 OID 124120)
-- Name: idx_tfrm_confiscation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_confiscation_id ON public.tfrm_confiscation USING btree (id);


--
-- TOC entry 7272 (class 1259 OID 124122)
-- Name: idx_tfrm_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_domain_id ON public.tfrm_domain USING btree (id);


--
-- TOC entry 7279 (class 1259 OID 124123)
-- Name: idx_tfrm_domain_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_domain_name_id ON public.tfrm_domain_name USING btree (id);


--
-- TOC entry 7282 (class 1259 OID 124124)
-- Name: idx_tfrm_fire_details_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_fire_details_id ON public.tfrm_fire_details USING btree (id);


--
-- TOC entry 7285 (class 1259 OID 124125)
-- Name: idx_tfrm_fire_point_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_fire_point_id ON public.tfrm_fire_point USING btree (id);


--
-- TOC entry 7289 (class 1259 OID 124126)
-- Name: idx_tfrm_fire_polygon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_fire_polygon_id ON public.tfrm_fire_polygon USING btree (id);


--
-- TOC entry 7293 (class 1259 OID 124127)
-- Name: idx_tfrm_fire_report_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_fire_report_id ON public.tfrm_fire_report USING btree (id);


--
-- TOC entry 7296 (class 1259 OID 124128)
-- Name: idx_tfrm_fiskos_data_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_fiskos_data_id ON public.tfrm_fiskos_data USING btree (id);


--
-- TOC entry 7299 (class 1259 OID 124129)
-- Name: idx_tfrm_fiskos_import_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_fiskos_import_id ON public.tfrm_fiskos_import USING btree (id);


--
-- TOC entry 7302 (class 1259 OID 124130)
-- Name: idx_tfrm_harvest_impl_transport_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_harvest_impl_transport_id ON public.tfrm_harvest_impl_transport USING btree (id);


--
-- TOC entry 7305 (class 1259 OID 124131)
-- Name: idx_tfrm_insp_action_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_insp_action_type_id ON public.tfrm_insp_action_type USING btree (id);


--
-- TOC entry 7311 (class 1259 OID 124133)
-- Name: idx_tfrm_inspection_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_inspection_doc_id ON public.tfrm_inspection_doc USING btree (id);


--
-- TOC entry 7308 (class 1259 OID 124132)
-- Name: idx_tfrm_inspection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_inspection_id ON public.tfrm_inspection USING btree (id);


--
-- TOC entry 7314 (class 1259 OID 124134)
-- Name: idx_tfrm_inspector_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_inspector_id ON public.tfrm_inspector USING btree (id);


--
-- TOC entry 7317 (class 1259 OID 124135)
-- Name: idx_tfrm_landscap_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_landscap_plan_id ON public.tfrm_landscap_plan USING btree (id);


--
-- TOC entry 7320 (class 1259 OID 124136)
-- Name: idx_tfrm_management_class_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_management_class_id ON public.tfrm_management_class USING btree (id);


--
-- TOC entry 7323 (class 1259 OID 124137)
-- Name: idx_tfrm_private_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_private_activity_id ON public.tfrm_private_activity USING btree (id);


--
-- TOC entry 7329 (class 1259 OID 124139)
-- Name: idx_tfrm_private_request_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_private_request_doc_id ON public.tfrm_private_request_doc USING btree (id);


--
-- TOC entry 7326 (class 1259 OID 124138)
-- Name: idx_tfrm_private_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_private_request_id ON public.tfrm_private_request USING btree (id);


--
-- TOC entry 7332 (class 1259 OID 124140)
-- Name: idx_tfrm_private_request_impl_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_private_request_impl_id ON public.tfrm_private_request_impl USING btree (id);


--
-- TOC entry 6983 (class 1259 OID 124141)
-- Name: idx_tfrm_protection_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_protection_activity_id ON public.tfrm_protection_activity USING btree (id);


--
-- TOC entry 7335 (class 1259 OID 124142)
-- Name: idx_tfrm_protection_impl_declare_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_protection_impl_declare_id ON public.tfrm_protection_impl_declare USING btree (id);


--
-- TOC entry 6986 (class 1259 OID 124143)
-- Name: idx_tfrm_road_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_road_activity_id ON public.tfrm_road_activity USING btree (id);


--
-- TOC entry 7339 (class 1259 OID 124144)
-- Name: idx_tfrm_road_impl_declare_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_road_impl_declare_id ON public.tfrm_road_impl_declare USING btree (id);


--
-- TOC entry 7342 (class 1259 OID 124145)
-- Name: idx_tfrm_seed_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_seed_activity_id ON public.tfrm_seed_activity USING btree (id);


--
-- TOC entry 7347 (class 1259 OID 124146)
-- Name: idx_tfrm_seedling_inventory_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_seedling_inventory_id ON public.tfrm_seedling_inventory USING btree (id);


--
-- TOC entry 7350 (class 1259 OID 124147)
-- Name: idx_tfrm_seedling_inventory_pos_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_seedling_inventory_pos_id ON public.tfrm_seedling_inventory_pos USING btree (id);


--
-- TOC entry 7353 (class 1259 OID 124148)
-- Name: idx_tfrm_siviculture_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_siviculture_plan_id ON public.tfrm_siviculture_plan USING btree (id);


--
-- TOC entry 6989 (class 1259 OID 124149)
-- Name: idx_tfrm_stand_harvest_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_harvest_activity_id ON public.tfrm_stand_harvest_activity USING btree (id);


--
-- TOC entry 7356 (class 1259 OID 124150)
-- Name: idx_tfrm_stand_harvest_impl_declare_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_harvest_impl_declare_id ON public.tfrm_stand_harvest_impl_declare USING btree (id);


--
-- TOC entry 7359 (class 1259 OID 124151)
-- Name: idx_tfrm_stand_harvest_marked_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_harvest_marked_id ON public.tfrm_stand_harvest_marked USING btree (id);


--
-- TOC entry 6992 (class 1259 OID 124152)
-- Name: idx_tfrm_stand_planting_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_planting_activity_id ON public.tfrm_stand_planting_activity USING btree (id);


--
-- TOC entry 7362 (class 1259 OID 124153)
-- Name: idx_tfrm_stand_planting_impl_declare_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_planting_impl_declare_id ON public.tfrm_stand_planting_impl_declare USING btree (id);


--
-- TOC entry 6995 (class 1259 OID 124154)
-- Name: idx_tfrm_stand_silviculture_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_silviculture_activity_id ON public.tfrm_stand_silviculture_activity USING btree (id);


--
-- TOC entry 7366 (class 1259 OID 124155)
-- Name: idx_tfrm_stand_silviculture_impl_declare_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_stand_silviculture_impl_declare_id ON public.tfrm_stand_silviculture_impl_declare USING btree (id);


--
-- TOC entry 7373 (class 1259 OID 124157)
-- Name: idx_tfrm_treatment_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_treatment_group_id ON public.tfrm_treatment_group USING btree (id);


--
-- TOC entry 7370 (class 1259 OID 124156)
-- Name: idx_tfrm_treatment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_treatment_id ON public.tfrm_treatment USING btree (id);


--
-- TOC entry 7075 (class 1259 OID 124158)
-- Name: idx_tfrm_tree_species_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfrm_tree_species_id ON public.tfrm_tree_species USING btree (id);


--
-- TOC entry 7376 (class 1259 OID 124159)
-- Name: idx_tfuell_consum_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tfuell_consum_id ON public.tfuell_consum USING btree (id);


--
-- TOC entry 7391 (class 1259 OID 124160)
-- Name: idx_tgis_af_ref_01_national_forest_inventory_4x4_4x2_objectid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_af_ref_01_national_forest_inventory_4x4_4x2_objectid ON public.tgis_af_ref_01_national_forest_inventory_4x4_4x2 USING btree (objectid);


--
-- TOC entry 7398 (class 1259 OID 124161)
-- Name: idx_tgis_af_ref_03_intensify_grid_inventory_objectid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_af_ref_03_intensify_grid_inventory_objectid ON public.tgis_af_ref_03_intensify_grid_inventory USING btree (objectid);


--
-- TOC entry 7426 (class 1259 OID 124162)
-- Name: idx_tgis_biodiv_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_biodiv_id ON public.tgis_biodiv USING btree (id);


--
-- TOC entry 6998 (class 1259 OID 124163)
-- Name: idx_tgis_cadastral_municipality_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_cadastral_municipality_id ON public.tgis_cadastral_municipality USING btree (id);


--
-- TOC entry 7430 (class 1259 OID 124164)
-- Name: idx_tgis_cadastral_zone_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_cadastral_zone_id ON public.tgis_cadastral_zone USING btree (id);


--
-- TOC entry 7004 (class 1259 OID 124165)
-- Name: idx_tgis_compartment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_compartment_id ON public.tgis_compartment USING btree (id);


--
-- TOC entry 7013 (class 1259 OID 124166)
-- Name: idx_tgis_management_unit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_management_unit_id ON public.tgis_management_unit USING btree (id);


--
-- TOC entry 7438 (class 1259 OID 124167)
-- Name: idx_tgis_ms_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_ms_id ON public.tgis_ms USING btree (id);


--
-- TOC entry 7040 (class 1259 OID 124168)
-- Name: idx_tgis_mu_period_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_mu_period_id ON public.tgis_mu_period USING btree (id);


--
-- TOC entry 7445 (class 1259 OID 124170)
-- Name: idx_tgis_parcelgeom3_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_parcelgeom3_id ON public.tgis_parcelgeom3 USING btree (id);


--
-- TOC entry 7439 (class 1259 OID 124169)
-- Name: idx_tgis_parcelgeom_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_parcelgeom_id ON public.tgis_parcelgeom USING btree (id);


--
-- TOC entry 7447 (class 1259 OID 124171)
-- Name: idx_tgis_plot_tree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_plot_tree_id ON public.tgis_plot_tree USING btree (id);


--
-- TOC entry 7450 (class 1259 OID 124172)
-- Name: idx_tgis_plots_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_plots_id ON public.tgis_plots USING btree (id);


--
-- TOC entry 7456 (class 1259 OID 124173)
-- Name: idx_tgis_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_region_id ON public.tgis_region USING btree (id);


--
-- TOC entry 7460 (class 1259 OID 124174)
-- Name: idx_tgis_road_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_road_id ON public.tgis_road USING btree (id);


--
-- TOC entry 7464 (class 1259 OID 124175)
-- Name: idx_tgis_soil_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_soil_id ON public.tgis_soil USING btree (id);


--
-- TOC entry 7468 (class 1259 OID 124176)
-- Name: idx_tgis_soil_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_soil_name_id ON public.tgis_soil_name USING btree (id);


--
-- TOC entry 7473 (class 1259 OID 124178)
-- Name: idx_tgis_stand_aud_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_stand_aud_id ON public.tgis_stand_aud USING btree (id);


--
-- TOC entry 7477 (class 1259 OID 124179)
-- Name: idx_tgis_stand_growth_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_stand_growth_id ON public.tgis_stand_growth USING btree (id);


--
-- TOC entry 7018 (class 1259 OID 124177)
-- Name: idx_tgis_stand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_stand_id ON public.tgis_stand USING btree (id);


--
-- TOC entry 7480 (class 1259 OID 124180)
-- Name: idx_tgis_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_state_id ON public.tgis_state USING btree (id);


--
-- TOC entry 7485 (class 1259 OID 124181)
-- Name: idx_tgis_subregion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_subregion_id ON public.tgis_subregion USING btree (id);


--
-- TOC entry 7489 (class 1259 OID 124182)
-- Name: idx_tgis_surfacedata_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_surfacedata_id ON public.tgis_surfacedata USING btree (id);


--
-- TOC entry 7495 (class 1259 OID 124183)
-- Name: idx_tgis_wr_lake_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_wr_lake_id ON public.tgis_wr_lake USING btree (id);


--
-- TOC entry 7499 (class 1259 OID 124184)
-- Name: idx_tgis_wr_river_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_wr_river_id ON public.tgis_wr_river USING btree (id);


--
-- TOC entry 7503 (class 1259 OID 124185)
-- Name: idx_tgis_zonat_mbrojtura_ammk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tgis_zonat_mbrojtura_ammk_id ON public.tgis_zonat_mbrojtura_ammk USING btree (id);


--
-- TOC entry 7513 (class 1259 OID 124186)
-- Name: idx_thrm_ann_plan_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_ann_plan_employee_id ON public.thrm_ann_plan_employee USING btree (id);


--
-- TOC entry 7519 (class 1259 OID 124188)
-- Name: idx_thrm_annual_plan_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_annual_plan_doc_id ON public.thrm_annual_plan_doc USING btree (id);


--
-- TOC entry 7516 (class 1259 OID 124187)
-- Name: idx_thrm_annual_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_annual_plan_id ON public.thrm_annual_plan USING btree (id);


--
-- TOC entry 7522 (class 1259 OID 124189)
-- Name: idx_thrm_annual_plan_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_annual_plan_status_id ON public.thrm_annual_plan_status USING btree (id);


--
-- TOC entry 7525 (class 1259 OID 124190)
-- Name: idx_thrm_attendance_record_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_attendance_record_id ON public.thrm_attendance_record USING btree (id);


--
-- TOC entry 7533 (class 1259 OID 124192)
-- Name: idx_thrm_decision_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_decision_doc_id ON public.thrm_decision_doc USING btree (id);


--
-- TOC entry 7536 (class 1259 OID 124193)
-- Name: idx_thrm_decision_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_decision_employee_id ON public.thrm_decision_employee USING btree (id);


--
-- TOC entry 7530 (class 1259 OID 124191)
-- Name: idx_thrm_decision_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_decision_id ON public.thrm_decision USING btree (id);


--
-- TOC entry 7539 (class 1259 OID 124194)
-- Name: idx_thrm_decision_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_decision_status_id ON public.thrm_decision_status USING btree (id);


--
-- TOC entry 7542 (class 1259 OID 124195)
-- Name: idx_thrm_decision_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_decision_type_id ON public.thrm_decision_type USING btree (id);


--
-- TOC entry 7548 (class 1259 OID 124197)
-- Name: idx_thrm_employee_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_doc_id ON public.thrm_employee_doc USING btree (id);


--
-- TOC entry 7545 (class 1259 OID 124196)
-- Name: idx_thrm_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_id ON public.thrm_employee USING btree (id);


--
-- TOC entry 7551 (class 1259 OID 124198)
-- Name: idx_thrm_employee_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_language_id ON public.thrm_employee_language USING btree (id);


--
-- TOC entry 7909 (class 1259 OID 124200)
-- Name: idx_thrm_employee_salary_adds_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_adds_id ON public.thrm_employee_salary_adds USING btree (id);


--
-- TOC entry 7930 (class 1259 OID 124201)
-- Name: idx_thrm_employee_salary_adjustment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_adjustment_id ON public.thrm_employee_salary_adjustment USING btree (id);


--
-- TOC entry 7903 (class 1259 OID 124202)
-- Name: idx_thrm_employee_salary_bonus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_bonus_id ON public.thrm_employee_salary_bonus USING btree (id);


--
-- TOC entry 7906 (class 1259 OID 124203)
-- Name: idx_thrm_employee_salary_deductions_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_deductions_id ON public.thrm_employee_salary_deductions USING btree (id);


--
-- TOC entry 7920 (class 1259 OID 124199)
-- Name: idx_thrm_employee_salary_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_id ON public.thrm_employee_salary USING btree (id);


--
-- TOC entry 7935 (class 1259 OID 124205)
-- Name: idx_thrm_employee_salary_payroll_adjustment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_payroll_adjustment_id ON public.thrm_employee_salary_payroll_adjustment USING btree (id);


--
-- TOC entry 7923 (class 1259 OID 124204)
-- Name: idx_thrm_employee_salary_payroll_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_payroll_id ON public.thrm_employee_salary_payroll USING btree (id);


--
-- TOC entry 7917 (class 1259 OID 124206)
-- Name: idx_thrm_employee_salary_tax_rates_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_salary_tax_rates_id ON public.thrm_employee_salary_tax_rates USING btree (id);


--
-- TOC entry 7554 (class 1259 OID 124207)
-- Name: idx_thrm_employee_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_skill_id ON public.thrm_employee_skill USING btree (id);


--
-- TOC entry 7557 (class 1259 OID 124208)
-- Name: idx_thrm_employee_sos_contact_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_employee_sos_contact_id ON public.thrm_employee_sos_contact USING btree (id);


--
-- TOC entry 7560 (class 1259 OID 124209)
-- Name: idx_thrm_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_language_id ON public.thrm_language USING btree (id);


--
-- TOC entry 7566 (class 1259 OID 124211)
-- Name: idx_thrm_leave_entitlement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_leave_entitlement_id ON public.thrm_leave_entitlement USING btree (id);


--
-- TOC entry 7563 (class 1259 OID 124210)
-- Name: idx_thrm_leave_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_leave_id ON public.thrm_leave USING btree (id);


--
-- TOC entry 7569 (class 1259 OID 124212)
-- Name: idx_thrm_leave_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_leave_type_id ON public.thrm_leave_type USING btree (id);


--
-- TOC entry 7574 (class 1259 OID 124213)
-- Name: idx_thrm_nationality_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_nationality_id ON public.thrm_nationality USING btree (id);


--
-- TOC entry 7577 (class 1259 OID 124214)
-- Name: idx_thrm_offical_travel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_thrm_offical_travel_id ON public.thrm_offical_travel USING btree (id);


--
-- TOC entry 7580 (class 1259 OID 124215)
-- Name: idx_timport_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_timport_status_id ON public.timport_status USING btree (id);


--
-- TOC entry 7583 (class 1259 OID 124216)
-- Name: idx_tkfis_gen_documents_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tkfis_gen_documents_id ON public.tkfis_gen_documents USING btree (id);


--
-- TOC entry 7379 (class 1259 OID 124217)
-- Name: idx_tlayers_gis_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlayers_gis_id ON public.tlayers_gis USING btree (id);


--
-- TOC entry 7593 (class 1259 OID 124219)
-- Name: idx_tlegsec_lawsuit_damage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlegsec_lawsuit_damage_id ON public.tlegsec_lawsuit_damage USING btree (id);


--
-- TOC entry 7588 (class 1259 OID 124218)
-- Name: idx_tlegsec_lawsuit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlegsec_lawsuit_id ON public.tlegsec_lawsuit USING btree (id);


--
-- TOC entry 7596 (class 1259 OID 124220)
-- Name: idx_tlegsec_lawsuit_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlegsec_lawsuit_status_id ON public.tlegsec_lawsuit_status USING btree (id);


--
-- TOC entry 7599 (class 1259 OID 124221)
-- Name: idx_tlinetemp_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlinetemp_id ON public.tlinetemp USING btree (id);


--
-- TOC entry 7602 (class 1259 OID 124222)
-- Name: idx_tlocation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlocation_id ON public.tlocation USING btree (id);


--
-- TOC entry 7605 (class 1259 OID 124223)
-- Name: idx_tlog_devices_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_devices_id ON public.tlog_devices USING btree (id);


--
-- TOC entry 7608 (class 1259 OID 124224)
-- Name: idx_tlog_positions_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_positions_id ON public.tlog_positions USING btree (id);


--
-- TOC entry 7611 (class 1259 OID 124225)
-- Name: idx_tlog_protocol_ports_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_protocol_ports_id ON public.tlog_protocol_ports USING btree (id);


--
-- TOC entry 7620 (class 1259 OID 124227)
-- Name: idx_tlog_trips_1_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_trips_1_id ON public.tlog_trips_1 USING btree (id);


--
-- TOC entry 7614 (class 1259 OID 124226)
-- Name: idx_tlog_trips_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_trips_id ON public.tlog_trips USING btree (id);


--
-- TOC entry 7623 (class 1259 OID 124228)
-- Name: idx_tlog_vehicles_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_vehicles_id ON public.tlog_vehicles USING btree (id);


--
-- TOC entry 7626 (class 1259 OID 124229)
-- Name: idx_tlog_vehicles_register_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_vehicles_register_id ON public.tlog_vehicles_register USING btree (id);


--
-- TOC entry 7629 (class 1259 OID 124230)
-- Name: idx_tlog_vehicles_service_maintenance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tlog_vehicles_service_maintenance_id ON public.tlog_vehicles_service_maintenance USING btree (id);


--
-- TOC entry 7632 (class 1259 OID 124231)
-- Name: idx_tmanagment_protocol_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmanagment_protocol_doc_id ON public.tmanagment_protocol_doc USING btree (id);


--
-- TOC entry 7637 (class 1259 OID 124232)
-- Name: idx_tmer_evaluation_perf_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_evaluation_perf_id ON public.tmer_evaluation_perf USING btree (id);


--
-- TOC entry 7640 (class 1259 OID 124233)
-- Name: idx_tmer_evaluation_strat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_evaluation_strat_id ON public.tmer_evaluation_strat USING btree (id);


--
-- TOC entry 7643 (class 1259 OID 124234)
-- Name: idx_tmer_finance_donor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_finance_donor_id ON public.tmer_finance_donor USING btree (id);


--
-- TOC entry 7646 (class 1259 OID 124235)
-- Name: idx_tmer_indicator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_indicator_id ON public.tmer_indicator USING btree (id);


--
-- TOC entry 7649 (class 1259 OID 124236)
-- Name: idx_tmer_indicator_target_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_indicator_target_id ON public.tmer_indicator_target USING btree (id);


--
-- TOC entry 7652 (class 1259 OID 124237)
-- Name: idx_tmer_plan_period_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_plan_period_id ON public.tmer_plan_period USING btree (id);


--
-- TOC entry 7655 (class 1259 OID 124238)
-- Name: idx_tmer_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_project_id ON public.tmer_project USING btree (id);


--
-- TOC entry 7658 (class 1259 OID 124239)
-- Name: idx_tmer_ref_sub_projects_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_ref_sub_projects_id ON public.tmer_ref_sub_projects USING btree (id);


--
-- TOC entry 7661 (class 1259 OID 124240)
-- Name: idx_tmer_resp_institutions_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_resp_institutions_id ON public.tmer_resp_institutions USING btree (id);


--
-- TOC entry 7667 (class 1259 OID 124242)
-- Name: idx_tmer_strategy_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_strategy_doc_id ON public.tmer_strategy_doc USING btree (id);


--
-- TOC entry 7670 (class 1259 OID 124243)
-- Name: idx_tmer_strategy_execution_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_strategy_execution_id ON public.tmer_strategy_execution USING btree (id);


--
-- TOC entry 7664 (class 1259 OID 124241)
-- Name: idx_tmer_strategy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_strategy_id ON public.tmer_strategy USING btree (id);


--
-- TOC entry 7673 (class 1259 OID 124244)
-- Name: idx_tmer_sub_indicator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_sub_indicator_id ON public.tmer_sub_indicator USING btree (id);


--
-- TOC entry 7676 (class 1259 OID 124245)
-- Name: idx_tmer_sub_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tmer_sub_project_id ON public.tmer_sub_project USING btree (id);


--
-- TOC entry 7679 (class 1259 OID 124246)
-- Name: idx_torganisation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_torganisation_id ON public.torganisation USING btree (id);


--
-- TOC entry 7682 (class 1259 OID 124247)
-- Name: idx_torganisation_mun_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_torganisation_mun_id ON public.torganisation_mun USING btree (id);


--
-- TOC entry 7687 (class 1259 OID 124248)
-- Name: idx_tparcel_detail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tparcel_detail_id ON public.tparcel_detail USING btree (id);


--
-- TOC entry 7690 (class 1259 OID 124249)
-- Name: idx_tparcel_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tparcel_owner_id ON public.tparcel_owner USING btree (id);


--
-- TOC entry 7693 (class 1259 OID 124250)
-- Name: idx_tparty_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tparty_id ON public.tparty USING btree (id);


--
-- TOC entry 7696 (class 1259 OID 124251)
-- Name: idx_tparty_relationship_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tparty_relationship_id ON public.tparty_relationship USING btree (id);


--
-- TOC entry 7699 (class 1259 OID 124252)
-- Name: idx_tparty_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tparty_role_id ON public.tparty_role USING btree (id);


--
-- TOC entry 7702 (class 1259 OID 124253)
-- Name: idx_tparty_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tparty_user_id ON public.tparty_user USING btree (id);


--
-- TOC entry 7707 (class 1259 OID 124254)
-- Name: idx_tperson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tperson_id ON public.tperson USING btree (id);


--
-- TOC entry 7712 (class 1259 OID 124255)
-- Name: idx_tprcmt_dossier_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_dossier_question_id ON public.tprcmt_dossier_question USING btree (id);


--
-- TOC entry 7715 (class 1259 OID 124256)
-- Name: idx_tprcmt_dossier_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_dossier_request_id ON public.tprcmt_dossier_request USING btree (id);


--
-- TOC entry 7718 (class 1259 OID 124257)
-- Name: idx_tprcmt_tender_bid_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_tender_bid_id ON public.tprcmt_tender_bid USING btree (id);


--
-- TOC entry 7721 (class 1259 OID 124258)
-- Name: idx_tprcmt_tender_bidder_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_tender_bidder_id ON public.tprcmt_tender_bidder USING btree (id);


--
-- TOC entry 7724 (class 1259 OID 124259)
-- Name: idx_tprcmt_tender_complaint_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_tender_complaint_id ON public.tprcmt_tender_complaint USING btree (id);


--
-- TOC entry 7727 (class 1259 OID 124260)
-- Name: idx_tprcmt_tender_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_tender_request_id ON public.tprcmt_tender_request USING btree (id);


--
-- TOC entry 7733 (class 1259 OID 124262)
-- Name: idx_tprcmt_tender_status_doc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_tender_status_doc_id ON public.tprcmt_tender_status_doc USING btree (id);


--
-- TOC entry 7730 (class 1259 OID 124261)
-- Name: idx_tprcmt_tender_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tprcmt_tender_status_id ON public.tprcmt_tender_status USING btree (id);


--
-- TOC entry 7736 (class 1259 OID 124263)
-- Name: idx_tpublishing_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tpublishing_id ON public.tpublishing USING btree (id);


--
-- TOC entry 7739 (class 1259 OID 124264)
-- Name: idx_tpurchase_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tpurchase_order_id ON public.tpurchase_order USING btree (id);


--
-- TOC entry 7744 (class 1259 OID 124265)
-- Name: idx_tpurchase_order_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tpurchase_order_item_id ON public.tpurchase_order_item USING btree (id);


--
-- TOC entry 7749 (class 1259 OID 124266)
-- Name: idx_tpurchase_order_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tpurchase_order_status_id ON public.tpurchase_order_status USING btree (id);


--
-- TOC entry 7060 (class 1259 OID 124267)
-- Name: idx_trbac_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_object_id ON public.trbac_object USING btree (id);


--
-- TOC entry 7759 (class 1259 OID 124268)
-- Name: idx_trbac_operation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_operation_id ON public.trbac_operation USING btree (id);


--
-- TOC entry 7764 (class 1259 OID 124269)
-- Name: idx_trbac_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_permission_id ON public.trbac_permission USING btree (id);


--
-- TOC entry 7765 (class 1259 OID 84585)
-- Name: idx_trbac_permission_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_permission_object_id ON public.trbac_permission USING btree (object_id);


--
-- TOC entry 7766 (class 1259 OID 84586)
-- Name: idx_trbac_permission_operation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_permission_operation_id ON public.trbac_permission USING btree (operation_id);


--
-- TOC entry 7767 (class 1259 OID 84587)
-- Name: idx_trbac_permission_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_permission_role_id ON public.trbac_permission USING btree (role_id);


--
-- TOC entry 7772 (class 1259 OID 84588)
-- Name: idx_trbac_role_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_role_code ON public.trbac_role USING btree (code);


--
-- TOC entry 7773 (class 1259 OID 124270)
-- Name: idx_trbac_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_role_id ON public.trbac_role USING btree (id);


--
-- TOC entry 7774 (class 1259 OID 84589)
-- Name: idx_trbac_role_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_role_name ON public.trbac_role USING btree (name);


--
-- TOC entry 7777 (class 1259 OID 124271)
-- Name: idx_trbac_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_session_id ON public.trbac_session USING btree (id);


--
-- TOC entry 7780 (class 1259 OID 124272)
-- Name: idx_trbac_session_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_session_role_id ON public.trbac_session_role USING btree (id);


--
-- TOC entry 7781 (class 1259 OID 84590)
-- Name: idx_trbac_session_role_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_session_role_role_id ON public.trbac_session_role USING btree (role_id);


--
-- TOC entry 7782 (class 1259 OID 84591)
-- Name: idx_trbac_session_role_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_session_role_session_id ON public.trbac_session_role USING btree (session_id);


--
-- TOC entry 7787 (class 1259 OID 84592)
-- Name: idx_trbac_user_role_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_user_role_1 ON public.trbac_user_role USING btree (user_id);


--
-- TOC entry 7788 (class 1259 OID 84593)
-- Name: idx_trbac_user_role_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_user_role_2 ON public.trbac_user_role USING btree (role_id);


--
-- TOC entry 7789 (class 1259 OID 124273)
-- Name: idx_trbac_user_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trbac_user_role_id ON public.trbac_user_role USING btree (id);


--
-- TOC entry 6960 (class 1259 OID 124274)
-- Name: idx_tref_economic_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tref_economic_code_id ON public.tref_economic_code USING btree (id);


--
-- TOC entry 7794 (class 1259 OID 124275)
-- Name: idx_tref_ekonomic_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tref_ekonomic_code_id ON public.tref_ekonomic_code USING btree (id);


--
-- TOC entry 7805 (class 1259 OID 124277)
-- Name: idx_trequisition_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trequisition_account_id ON public.trequisition_account USING btree (id);


--
-- TOC entry 7800 (class 1259 OID 124276)
-- Name: idx_trequisition_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trequisition_id ON public.trequisition USING btree (id);


--
-- TOC entry 7808 (class 1259 OID 124278)
-- Name: idx_trequisition_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trequisition_item_id ON public.trequisition_item USING btree (id);


--
-- TOC entry 7813 (class 1259 OID 124279)
-- Name: idx_trequisition_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_trequisition_status_id ON public.trequisition_status USING btree (id);


--
-- TOC entry 7816 (class 1259 OID 124280)
-- Name: idx_tshape_stand_treatment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tshape_stand_treatment_id ON public.tshape_stand_treatment USING btree (id);


--
-- TOC entry 7078 (class 1259 OID 124281)
-- Name: idx_tshape_treatment_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tshape_treatment_name_id ON public.tshape_treatment_name USING btree (id);


--
-- TOC entry 7819 (class 1259 OID 124282)
-- Name: idx_ttax_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ttax_id ON public.ttax USING btree (id);


--
-- TOC entry 7035 (class 1259 OID 124283)
-- Name: idx_ttextdomain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ttextdomain_id ON public.ttextdomain USING btree (id);


--
-- TOC entry 7822 (class 1259 OID 124284)
-- Name: idx_tunit_measurement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tunit_measurement_id ON public.tunit_measurement USING btree (id);


--
-- TOC entry 7827 (class 1259 OID 124285)
-- Name: idx_tunits_metric_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tunits_metric_id ON public.tunits_metric USING btree (id);


--
-- TOC entry 7830 (class 1259 OID 124286)
-- Name: idx_tuom_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuom_id ON public.tuom USING btree (id);


--
-- TOC entry 7833 (class 1259 OID 124287)
-- Name: idx_tuom_trl_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuom_trl_id ON public.tuom_trl USING btree (id);


--
-- TOC entry 7836 (class 1259 OID 124288)
-- Name: idx_tuser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuser_id ON public.tuser USING btree (id);


--
-- TOC entry 7842 (class 1259 OID 124289)
-- Name: idx_tuser_log_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuser_log_id ON public.tuser_log USING btree (id);


--
-- TOC entry 7847 (class 1259 OID 124290)
-- Name: idx_tuser_login_attempt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuser_login_attempt_id ON public.tuser_login_attempt USING btree (id);


--
-- TOC entry 7850 (class 1259 OID 124291)
-- Name: idx_tuser_password_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuser_password_id ON public.tuser_password USING btree (id);


--
-- TOC entry 7837 (class 1259 OID 84594)
-- Name: idx_tuser_username; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tuser_username ON public.tuser USING btree (username);


--
-- TOC entry 7853 (class 1259 OID 124292)
-- Name: idx_tvehicles_staff_assign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tvehicles_staff_assign_id ON public.tvehicles_staff_assign USING btree (id);


--
-- TOC entry 7856 (class 1259 OID 124293)
-- Name: idx_tvehicles_tracking_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tvehicles_tracking_id ON public.tvehicles_tracking USING btree (id);


--
-- TOC entry 7864 (class 1259 OID 124297)
-- Name: idx_wr_lumenjet_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wr_lumenjet_id ON public.wr_lumenjet USING btree (id);


--
-- TOC entry 7071 (class 1259 OID 84595)
-- Name: shape_stand_stand_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shape_stand_stand_id_idx ON public.shape_stand USING btree (stand_id);


--
-- TOC entry 7072 (class 1259 OID 84596)
-- Name: shape_stand_wkb_geometry_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shape_stand_wkb_geometry_idx ON public.shape_stand USING gist (wkb_geometry);


--
-- TOC entry 7052 (class 1259 OID 84597)
-- Name: sidx_liqenet2_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_liqenet2_geom ON public.liqenet2 USING gist (geom);


--
-- TOC entry 7502 (class 1259 OID 84598)
-- Name: sidx_lumm_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_lumm_geom ON public.tgis_wr_river USING gist (geom);


--
-- TOC entry 7059 (class 1259 OID 84599)
-- Name: sidx_poligon_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_poligon_the_geom ON public.poligon USING gist (the_geom);


--
-- TOC entry 7067 (class 1259 OID 84600)
-- Name: sidx_shape_biodiversity_wkb_geometry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_shape_biodiversity_wkb_geometry ON public.shape_biodiversity USING gist (wkb_geometry);


--
-- TOC entry 6954 (class 1259 OID 84601)
-- Name: sidx_tdhpet_location_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tdhpet_location_the_geom ON public.tdhpet_location USING gist (the_geom);


--
-- TOC entry 7026 (class 1259 OID 84602)
-- Name: sidx_tfal_request_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfal_request_the_geom ON public.tfal_request USING gist (the_geom);


--
-- TOC entry 6976 (class 1259 OID 84603)
-- Name: sidx_tfrm_activity_implemented_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_activity_implemented_geom ON public.tfrm_activity USING gist (implemented_geom);


--
-- TOC entry 6977 (class 1259 OID 84604)
-- Name: sidx_tfrm_activity_planed_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_activity_planed_geom ON public.tfrm_activity USING gist (planed_geom);


--
-- TOC entry 7286 (class 1259 OID 84605)
-- Name: sidx_tfrm_fire_point_point; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_fire_point_point ON public.tfrm_fire_point USING gist (point);


--
-- TOC entry 7290 (class 1259 OID 84606)
-- Name: sidx_tfrm_fire_polygon_polygon; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_fire_polygon_polygon ON public.tfrm_fire_polygon USING gist (polygon);


--
-- TOC entry 7336 (class 1259 OID 84607)
-- Name: sidx_tfrm_protection_impl_declare_im_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_protection_impl_declare_im_geom ON public.tfrm_protection_impl_declare USING gist (im_geom);


--
-- TOC entry 7363 (class 1259 OID 84608)
-- Name: sidx_tfrm_stand_planting_impl_declare_im_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_stand_planting_impl_declare_im_geom ON public.tfrm_stand_planting_impl_declare USING gist (im_geom);


--
-- TOC entry 7367 (class 1259 OID 84609)
-- Name: sidx_tfrm_stand_silviculture_impl_declare_im_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tfrm_stand_silviculture_impl_declare_im_geom ON public.tfrm_stand_silviculture_impl_declare USING gist (im_geom);


--
-- TOC entry 7392 (class 1259 OID 84610)
-- Name: sidx_tgis_af_ref_01_national_forest_inventory_4x4_4x2_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_01_national_forest_inventory_4x4_4x2_geom ON public.tgis_af_ref_01_national_forest_inventory_4x4_4x2 USING gist (geom);


--
-- TOC entry 7395 (class 1259 OID 84611)
-- Name: sidx_tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x1 ON public.tgis_af_ref_02_intensify_grid_inventory_sample_plots_100x100 USING gist (geom);


--
-- TOC entry 7399 (class 1259 OID 84612)
-- Name: sidx_tgis_af_ref_03_intensify_grid_inventory_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_03_intensify_grid_inventory_geom ON public.tgis_af_ref_03_intensify_grid_inventory USING gist (geom);


--
-- TOC entry 7414 (class 1259 OID 84613)
-- Name: sidx_tgis_af_ref_06_potential_area_afforestation__geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_06_potential_area_afforestation__geom ON public.tgis_af_ref_06_potential_area_afforestation_ USING gist (geom);


--
-- TOC entry 7411 (class 1259 OID 84614)
-- Name: sidx_tgis_af_ref_06_potential_area_afforestation_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_06_potential_area_afforestation_geom ON public.tgis_af_ref_06_potential_area_afforestation USING gist (geom);


--
-- TOC entry 7417 (class 1259 OID 84615)
-- Name: sidx_tgis_af_ref_08_aff_species_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_08_aff_species_geom ON public.tgis_af_ref_09_aff_species USING gist (geom);


--
-- TOC entry 7420 (class 1259 OID 84616)
-- Name: sidx_tgis_af_ref_08_seed_stand_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_08_seed_stand_geom ON public.tgis_af_ref_08_seed_stand USING gist (geom);


--
-- TOC entry 7423 (class 1259 OID 84617)
-- Name: sidx_tgis_af_ref_10_ref_species_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_af_ref_10_ref_species_geom ON public.tgis_af_ref_10_ref_species USING gist (geom);


--
-- TOC entry 7427 (class 1259 OID 84618)
-- Name: sidx_tgis_biodiv_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_biodiv_the_geom ON public.tgis_biodiv USING gist (the_geom);


--
-- TOC entry 6999 (class 1259 OID 84619)
-- Name: sidx_tgis_cadastral_municipality_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_cadastral_municipality_the_geom ON public.tgis_cadastral_municipality USING gist (the_geom);


--
-- TOC entry 7431 (class 1259 OID 84620)
-- Name: sidx_tgis_cadastral_zone_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_cadastral_zone_geom ON public.tgis_cadastral_zone USING gist (geom);


--
-- TOC entry 7432 (class 1259 OID 84621)
-- Name: sidx_tgis_cadastral_zone_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_cadastral_zone_the_geom ON public.tgis_cadastral_zone USING gist (the_geom);


--
-- TOC entry 7446 (class 1259 OID 84622)
-- Name: sidx_tgis_parcelgeom3_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_parcelgeom3_geom ON public.tgis_parcelgeom3 USING gist (geom);


--
-- TOC entry 7451 (class 1259 OID 84623)
-- Name: sidx_tgis_plots_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_plots_geom ON public.tgis_plots USING gist (geom);


--
-- TOC entry 7457 (class 1259 OID 84624)
-- Name: sidx_tgis_region_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_region_the_geom ON public.tgis_region USING gist (the_geom);


--
-- TOC entry 7461 (class 1259 OID 84625)
-- Name: sidx_tgis_road_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_road_the_geom ON public.tgis_road USING gist (the_geom);


--
-- TOC entry 7474 (class 1259 OID 84626)
-- Name: sidx_tgis_stand_aud_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_stand_aud_the_geom ON public.tgis_stand_aud USING gist (the_geom);


--
-- TOC entry 7486 (class 1259 OID 84627)
-- Name: sidx_tgis_subregion_the_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_subregion_the_geom ON public.tgis_subregion USING gist (the_geom);


--
-- TOC entry 7496 (class 1259 OID 84628)
-- Name: sidx_tgis_wr_lake_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_wr_lake_geom ON public.tgis_wr_lake USING gist (geom);


--
-- TOC entry 7504 (class 1259 OID 84629)
-- Name: sidx_tgis_zonat_mbrojtura_ammk_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_tgis_zonat_mbrojtura_ammk_geom ON public.tgis_zonat_mbrojtura_ammk USING gist (geom);


--
-- TOC entry 7087 (class 1259 OID 84630)
-- Name: standfc_geom_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX standfc_geom_geom_idx ON public.standfc USING gist (geom);


--
-- TOC entry 7402 (class 1259 OID 84631)
-- Name: tgis_af_ref_04_forest_type_fmp_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_04_forest_type_fmp_geom_idx ON public.tgis_af_ref_04_forest_type_fmp USING gist (geom);


--
-- TOC entry 7403 (class 1259 OID 84632)
-- Name: tgis_af_ref_04_forest_type_fmp_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_04_forest_type_fmp_id_idx ON public.tgis_af_ref_04_forest_type_fmp USING btree (id);


--
-- TOC entry 7404 (class 1259 OID 84633)
-- Name: tgis_af_ref_04_forest_type_fmp_mc_gr_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_04_forest_type_fmp_mc_gr_idx1 ON public.tgis_af_ref_04_forest_type_fmp USING btree (mc_gr);


--
-- TOC entry 7407 (class 1259 OID 84634)
-- Name: tgis_af_ref_05_potential_area_reforestation_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_05_potential_area_reforestation_geom_idx ON public.tgis_af_ref_05_potential_area_reforestation USING gist (geom);


--
-- TOC entry 7408 (class 1259 OID 84635)
-- Name: tgis_af_ref_05_potential_area_reforestation_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_05_potential_area_reforestation_id_idx ON public.tgis_af_ref_05_potential_area_reforestation USING btree (id);


--
-- TOC entry 6971 (class 1259 OID 84636)
-- Name: tgis_af_ref_07_plantation_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_07_plantation_geom_idx ON public.tgis_af_ref_07_plantation USING gist (geom);


--
-- TOC entry 6972 (class 1259 OID 84637)
-- Name: tgis_af_ref_07_plantation_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_af_ref_07_plantation_id_idx ON public.tgis_af_ref_07_plantation USING btree (id);


--
-- TOC entry 7433 (class 1259 OID 115486)
-- Name: tgis_cadastral_zone_cad_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_cadastral_zone_cad_id_idx ON public.tgis_cadastral_zone USING btree (cad_id);


--
-- TOC entry 7434 (class 1259 OID 115487)
-- Name: tgis_cadastral_zone_municipality_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_cadastral_zone_municipality_id_idx ON public.tgis_cadastral_zone USING btree (municipality_id);


--
-- TOC entry 7435 (class 1259 OID 115485)
-- Name: tgis_cadastral_zone_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_cadastral_zone_name_idx ON public.tgis_cadastral_zone USING btree (name);


--
-- TOC entry 7005 (class 1259 OID 84638)
-- Name: tgis_compartment_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_compartment_id_idx ON public.tgis_compartment USING btree (id);


--
-- TOC entry 7006 (class 1259 OID 84639)
-- Name: tgis_compartment_mu_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_compartment_mu_id_idx ON public.tgis_compartment USING btree (mu_id);


--
-- TOC entry 7009 (class 1259 OID 84640)
-- Name: tgis_compartment_mup_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_compartment_mup_id_idx ON public.tgis_compartment USING btree (mup_id);


--
-- TOC entry 7012 (class 1259 OID 84641)
-- Name: tgis_compartment_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_compartment_the_geom_idx ON public.tgis_compartment USING gist (the_geom);


--
-- TOC entry 7014 (class 1259 OID 84642)
-- Name: tgis_management_unit_mu_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tgis_management_unit_mu_name_idx ON public.tgis_management_unit USING btree (mu_name);


--
-- TOC entry 7017 (class 1259 OID 84643)
-- Name: tgis_management_unit_region_id_mu_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tgis_management_unit_region_id_mu_code_idx ON public.tgis_management_unit USING btree (region_id, mu_code);


--
-- TOC entry 7041 (class 1259 OID 84644)
-- Name: tgis_mu_period_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_mu_period_id_idx ON public.tgis_mu_period USING btree (id);


--
-- TOC entry 7042 (class 1259 OID 84645)
-- Name: tgis_mu_period_mu_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_mu_period_mu_id_idx ON public.tgis_mu_period USING btree (mu_id);


--
-- TOC entry 7045 (class 1259 OID 84646)
-- Name: tgis_mu_period_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_mu_period_the_geom_idx ON public.tgis_mu_period USING gist (the_geom);


--
-- TOC entry 7440 (class 1259 OID 84647)
-- Name: tgis_parcelgeom_cadparcelid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_parcelgeom_cadparcelid_idx ON public.tgis_parcelgeom USING btree (cadparcelid);


--
-- TOC entry 7441 (class 1259 OID 84648)
-- Name: tgis_parcelgeom_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_parcelgeom_geom_idx ON public.tgis_parcelgeom USING gist (geom);


--
-- TOC entry 7442 (class 1259 OID 84649)
-- Name: tgis_parcelgeom_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_parcelgeom_id_idx ON public.tgis_parcelgeom USING btree (id);


--
-- TOC entry 7467 (class 1259 OID 84650)
-- Name: tgis_soil_the_geom_gist; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_soil_the_geom_gist ON public.tgis_soil USING gist (the_geom);


--
-- TOC entry 7019 (class 1259 OID 84651)
-- Name: tgis_stand_compartment_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_stand_compartment_id_idx ON public.tgis_stand USING btree (compartment_id);


--
-- TOC entry 7020 (class 1259 OID 84652)
-- Name: tgis_stand_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_stand_id_idx ON public.tgis_stand USING btree (id);


--
-- TOC entry 7023 (class 1259 OID 84653)
-- Name: tgis_stand_stand_nr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_stand_stand_nr_idx ON public.tgis_stand USING btree (stand_nr);


--
-- TOC entry 7024 (class 1259 OID 84654)
-- Name: tgis_stand_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_stand_the_geom_idx ON public.tgis_stand USING gist (the_geom);


--
-- TOC entry 7481 (class 1259 OID 84655)
-- Name: tgis_state_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_state_id_idx ON public.tgis_state USING btree (id);


--
-- TOC entry 7484 (class 1259 OID 84656)
-- Name: tgis_state_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_state_the_geom_idx ON public.tgis_state USING gist (the_geom);


--
-- TOC entry 7490 (class 1259 OID 84657)
-- Name: tgis_surfacedata_elev_gist; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_surfacedata_elev_gist ON public.tgis_surfacedata USING gist (public.st_convexhull(elevation));


--
-- TOC entry 7491 (class 1259 OID 84658)
-- Name: tgis_surfacedata_expostion_gist; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_surfacedata_expostion_gist ON public.tgis_surfacedata USING gist (public.st_convexhull(exposition));


--
-- TOC entry 7494 (class 1259 OID 84659)
-- Name: tgis_surfacedata_slope_gist; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgis_surfacedata_slope_gist ON public.tgis_surfacedata USING gist (public.st_convexhull(slope));


--
-- TOC entry 7507 (class 1259 OID 84660)
-- Name: tgiscadastrezone_geom_gist; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgiscadastrezone_geom_gist ON public.tgiscadastrezone USING gist (geom);


--
-- TOC entry 7510 (class 1259 OID 84661)
-- Name: tgismun_geom_gist; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tgismun_geom_gist ON public.tgismun USING gist (geom);


--
-- TOC entry 7380 (class 1259 OID 115480)
-- Name: tlayers_gis_feature_type_layer_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_feature_type_layer_idx ON public.tlayers_gis USING btree (feature_type_layer);


--
-- TOC entry 7381 (class 1259 OID 115478)
-- Name: tlayers_gis_featurens_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_featurens_idx ON public.tlayers_gis USING btree (featurens);


--
-- TOC entry 7382 (class 1259 OID 115473)
-- Name: tlayers_gis_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_id_idx ON public.tlayers_gis USING btree (id);


--
-- TOC entry 7383 (class 1259 OID 115477)
-- Name: tlayers_gis_is_base_layer_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_is_base_layer_idx ON public.tlayers_gis USING btree (is_base_layer);


--
-- TOC entry 7384 (class 1259 OID 115484)
-- Name: tlayers_gis_module_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_module_idx ON public.tlayers_gis USING btree (module);


--
-- TOC entry 7385 (class 1259 OID 115474)
-- Name: tlayers_gis_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_parent_id_idx ON public.tlayers_gis USING btree (parent_id);


--
-- TOC entry 7388 (class 1259 OID 115476)
-- Name: tlayers_gis_service_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_service_type_idx ON public.tlayers_gis USING btree (service_type);


--
-- TOC entry 7389 (class 1259 OID 115479)
-- Name: tlayers_gis_store_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_store_idx ON public.tlayers_gis USING btree (store);


--
-- TOC entry 7390 (class 1259 OID 115475)
-- Name: tlayers_gis_url_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlayers_gis_url_idx ON public.tlayers_gis USING btree (url);


--
-- TOC entry 7615 (class 1259 OID 84662)
-- Name: tlog_trips_device_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlog_trips_device_name_idx ON public.tlog_trips USING btree (device_name);


--
-- TOC entry 7616 (class 1259 OID 84663)
-- Name: tlog_trips_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlog_trips_geom_idx ON public.tlog_trips USING gist (geom);


--
-- TOC entry 7619 (class 1259 OID 84664)
-- Name: tlog_trips_uniqueid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tlog_trips_uniqueid_idx ON public.tlog_trips USING btree (uniqueid);


--
-- TOC entry 6961 (class 1259 OID 84665)
-- Name: tref_economic_code_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tref_economic_code_code_idx ON public.tref_economic_code USING btree (code);


--
-- TOC entry 7795 (class 1259 OID 84666)
-- Name: tref_ekonomic_code_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tref_ekonomic_code_code_idx ON public.tref_ekonomic_code USING btree (code);


--
-- TOC entry 7859 (class 1259 OID 84667)
-- Name: vgis_municipality_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vgis_municipality_name_idx ON public.vgis_municipality USING btree (name);


--
-- TOC entry 7860 (class 1259 OID 84668)
-- Name: vgis_municipality_nr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vgis_municipality_nr_idx ON public.vgis_municipality USING btree (nr);


--
-- TOC entry 7861 (class 1259 OID 84669)
-- Name: vgis_municipality_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vgis_municipality_the_geom_idx ON public.vgis_municipality USING gist (the_geom);


--
-- TOC entry 7862 (class 1259 OID 84670)
-- Name: vgis_parcel_kult_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vgis_parcel_kult_geom_idx ON public.vgis_parcel_kult USING gist (geom);


--
-- TOC entry 7863 (class 1259 OID 84671)
-- Name: vgis_parcel_kult_pers_stat_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vgis_parcel_kult_pers_stat_idx ON public.vgis_parcel_kult USING btree (pers_stat);


--
-- TOC entry 7873 (class 1259 OID 84672)
-- Name: databasechangelog_id_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX databasechangelog_id_idx ON traccar.databasechangelog USING btree (id);


--
-- TOC entry 7876 (class 1259 OID 84673)
-- Name: device_geofence_deviceid_geofenceid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX device_geofence_deviceid_geofenceid_idx ON traccar.device_geofence USING btree (deviceid, geofenceid);


--
-- TOC entry 7881 (class 1259 OID 84674)
-- Name: group_geofence_groupid_geofenceid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX group_geofence_groupid_geofenceid_idx ON traccar.group_geofence USING btree (groupid, geofenceid);


--
-- TOC entry 7758 (class 1259 OID 84675)
-- Name: position_deviceid_fixtime; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX position_deviceid_fixtime ON traccar.positions USING btree (deviceid, fixtime);


--
-- TOC entry 7892 (class 1259 OID 84676)
-- Name: user_calendar_userid_calendarid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_calendar_userid_calendarid_idx ON traccar.user_calendar USING btree (userid, calendarid);


--
-- TOC entry 7893 (class 1259 OID 84677)
-- Name: user_device_user_id; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_device_user_id ON traccar.user_device USING btree (userid);


--
-- TOC entry 7894 (class 1259 OID 84678)
-- Name: user_geofence_userid_geofenceid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_geofence_userid_geofenceid_idx ON traccar.user_geofence USING btree (userid, geofenceid);


--
-- TOC entry 7895 (class 1259 OID 84679)
-- Name: user_group_groupid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_group_groupid_idx ON traccar.user_group USING btree (groupid);


--
-- TOC entry 7896 (class 1259 OID 84680)
-- Name: user_group_userid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_group_userid_idx ON traccar.user_group USING btree (userid);


--
-- TOC entry 7897 (class 1259 OID 84681)
-- Name: user_user_manageduserid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_user_manageduserid_idx ON traccar.user_user USING btree (manageduserid);


--
-- TOC entry 7898 (class 1259 OID 84682)
-- Name: user_user_userid_idx; Type: INDEX; Schema: traccar; Owner: -
--

CREATE INDEX user_user_userid_idx ON traccar.user_user USING btree (userid);


--
-- TOC entry 8466 (class 2620 OID 84683)
-- Name: iso_metadata_reference update_imr_timestamp; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_imr_timestamp BEFORE UPDATE ON public.iso_metadata_reference FOR EACH ROW EXECUTE PROCEDURE public.update_imr_timestamp_column();


--
-- TOC entry 8467 (class 2620 OID 84684)
-- Name: positions positions_aud; Type: TRIGGER; Schema: traccar; Owner: -
--

CREATE TRIGGER positions_aud AFTER INSERT OR DELETE OR UPDATE ON traccar.positions FOR EACH ROW EXECUTE PROCEDURE public.positions_aud();


--
-- TOC entry 7944 (class 2606 OID 84685)
-- Name: ekonomic_code ekonomic_code_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ekonomic_code
    ADD CONSTRAINT ekonomic_code_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.ekonomic_code(id);


--
-- TOC entry 8005 (class 2606 OID 84690)
-- Name: iso_metadata_reference iso_metadata_reference_md_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iso_metadata_reference
    ADD CONSTRAINT iso_metadata_reference_md_file_id_fkey FOREIGN KEY (md_file_id) REFERENCES public.iso_metadata(id);


--
-- TOC entry 8006 (class 2606 OID 84695)
-- Name: iso_metadata_reference iso_metadata_reference_md_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iso_metadata_reference
    ADD CONSTRAINT iso_metadata_reference_md_parent_id_fkey FOREIGN KEY (md_parent_id) REFERENCES public.iso_metadata(id);


--
-- TOC entry 8007 (class 2606 OID 84700)
-- Name: tad_language tad_language_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tad_language
    ADD CONSTRAINT tad_language_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8008 (class 2606 OID 84705)
-- Name: tad_language tad_language_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tad_language
    ADD CONSTRAINT tad_language_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8009 (class 2606 OID 84710)
-- Name: taff_ref_projects taff_ref_projects_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taff_ref_projects
    ADD CONSTRAINT taff_ref_projects_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8010 (class 2606 OID 84715)
-- Name: taff_ref_projects taff_ref_refer_id_projects; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taff_ref_projects
    ADD CONSTRAINT taff_ref_refer_id_projects FOREIGN KEY (refer_id) REFERENCES public.taff_ref_projects(id);


--
-- TOC entry 8011 (class 2606 OID 84720)
-- Name: talert talert_alertrule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_alertrule_id FOREIGN KEY (alertrule_id) REFERENCES public.talertrule(id);


--
-- TOC entry 8012 (class 2606 OID 84725)
-- Name: talert talert_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8013 (class 2606 OID 84730)
-- Name: talert talert_org_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_org_id FOREIGN KEY (org_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8014 (class 2606 OID 84735)
-- Name: talert talert_person_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_person_id FOREIGN KEY (person_id) REFERENCES public.tperson(id);


--
-- TOC entry 8015 (class 2606 OID 84740)
-- Name: talert talert_role_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_role_id FOREIGN KEY (role_id) REFERENCES public.trbac_role(id);


--
-- TOC entry 8016 (class 2606 OID 84745)
-- Name: talert talert_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talert
    ADD CONSTRAINT talert_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8017 (class 2606 OID 84750)
-- Name: talertrecipient talertrecipient_alertrule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_alertrule_id FOREIGN KEY (alertrule_id) REFERENCES public.talertrule(id) ON DELETE CASCADE;


--
-- TOC entry 8018 (class 2606 OID 84755)
-- Name: talertrecipient talertrecipient_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8019 (class 2606 OID 84760)
-- Name: talertrecipient talertrecipient_org_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_org_id FOREIGN KEY (org_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8020 (class 2606 OID 84765)
-- Name: talertrecipient talertrecipient_person_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_person_id FOREIGN KEY (person_id) REFERENCES public.tperson(id);


--
-- TOC entry 8021 (class 2606 OID 84770)
-- Name: talertrecipient talertrecipient_role_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_role_id FOREIGN KEY (role_id) REFERENCES public.trbac_role(id);


--
-- TOC entry 8022 (class 2606 OID 84775)
-- Name: talertrecipient talertrecipient_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrecipient
    ADD CONSTRAINT talertrecipient_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8023 (class 2606 OID 84780)
-- Name: talertrule talertrule_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule
    ADD CONSTRAINT talertrule_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8024 (class 2606 OID 84785)
-- Name: talertrule talertrule_org_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule
    ADD CONSTRAINT talertrule_org_id FOREIGN KEY (org_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8026 (class 2606 OID 84790)
-- Name: talertrule_trl talertrule_trl_alertrule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT talertrule_trl_alertrule_id FOREIGN KEY (alertrule_id) REFERENCES public.talertrule(id) ON DELETE CASCADE;


--
-- TOC entry 8027 (class 2606 OID 84795)
-- Name: talertrule_trl talertrule_trl_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT talertrule_trl_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8028 (class 2606 OID 84800)
-- Name: talertrule_trl talertrule_trl_language; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT talertrule_trl_language FOREIGN KEY (ad_language) REFERENCES public.tad_language(ad_language);


--
-- TOC entry 8029 (class 2606 OID 84805)
-- Name: talertrule_trl talertrule_trl_org_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT talertrule_trl_org_id FOREIGN KEY (org_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8030 (class 2606 OID 84810)
-- Name: talertrule_trl talertrule_trl_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule_trl
    ADD CONSTRAINT talertrule_trl_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8025 (class 2606 OID 84815)
-- Name: talertrule talertrule_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talertrule
    ADD CONSTRAINT talertrule_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8031 (class 2606 OID 84820)
-- Name: tassets tassets_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets
    ADD CONSTRAINT tassets_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8032 (class 2606 OID 84825)
-- Name: tassets tassets_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets
    ADD CONSTRAINT tassets_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8033 (class 2606 OID 84830)
-- Name: tassets_devaluation tassets_devaluation_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_devaluation
    ADD CONSTRAINT tassets_devaluation_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.tassets(id);


--
-- TOC entry 8034 (class 2606 OID 84835)
-- Name: tassets_devaluation tassets_devaluation_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_devaluation
    ADD CONSTRAINT tassets_devaluation_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8035 (class 2606 OID 84840)
-- Name: tassets_staff_assign tassets_staff_assign_assets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_staff_assign
    ADD CONSTRAINT tassets_staff_assign_assets_id_fkey FOREIGN KEY (assets_id) REFERENCES public.tassets(id);


--
-- TOC entry 8036 (class 2606 OID 84845)
-- Name: tassets_staff_assign tassets_staff_assign_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_staff_assign
    ADD CONSTRAINT tassets_staff_assign_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8037 (class 2606 OID 84850)
-- Name: tassets_staff_assign tassets_staff_assign_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tassets_staff_assign
    ADD CONSTRAINT tassets_staff_assign_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8038 (class 2606 OID 84855)
-- Name: tb_monitor_eval tb_monitor_eval_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_monitor_eval
    ADD CONSTRAINT tb_monitor_eval_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8039 (class 2606 OID 84860)
-- Name: tbpartner tbpartner_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner
    ADD CONSTRAINT tbpartner_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8042 (class 2606 OID 84865)
-- Name: tbpartner_location tbpartner_location_bpartner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner_location
    ADD CONSTRAINT tbpartner_location_bpartner_id FOREIGN KEY (bpartner_id) REFERENCES public.tbpartner(id) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 8043 (class 2606 OID 84870)
-- Name: tbpartner_location tbpartner_location_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner_location
    ADD CONSTRAINT tbpartner_location_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8044 (class 2606 OID 84875)
-- Name: tbpartner_location tbpartner_location_location_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner_location
    ADD CONSTRAINT tbpartner_location_location_id FOREIGN KEY (location_id) REFERENCES public.tlocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 8045 (class 2606 OID 84880)
-- Name: tbpartner_location tbpartner_location_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner_location
    ADD CONSTRAINT tbpartner_location_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8040 (class 2606 OID 84885)
-- Name: tbpartner tbpartner_party_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner
    ADD CONSTRAINT tbpartner_party_id_fkey FOREIGN KEY (party_id) REFERENCES public.tparty(id);


--
-- TOC entry 8041 (class 2606 OID 84890)
-- Name: tbpartner tbpartner_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbpartner
    ADD CONSTRAINT tbpartner_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8046 (class 2606 OID 84895)
-- Name: tcurrency tcurrency_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcurrency
    ADD CONSTRAINT tcurrency_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8047 (class 2606 OID 84900)
-- Name: tcurrency tcurrency_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcurrency
    ADD CONSTRAINT tcurrency_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8048 (class 2606 OID 84905)
-- Name: tdhpet_activity_management tdhpet_activity_management_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_activity_management
    ADD CONSTRAINT tdhpet_activity_management_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.tdhpet_wild_animals(id);


--
-- TOC entry 8049 (class 2606 OID 84910)
-- Name: tdhpet_activity_management tdhpet_activity_management_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_activity_management
    ADD CONSTRAINT tdhpet_activity_management_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8050 (class 2606 OID 84915)
-- Name: tdhpet_activity_management tdhpet_activity_management_prod_area_for_hunt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_activity_management
    ADD CONSTRAINT tdhpet_activity_management_prod_area_for_hunt_id_fkey FOREIGN KEY (prod_area_for_hunt_id) REFERENCES public.tdhpet_location(id);


--
-- TOC entry 8051 (class 2606 OID 84920)
-- Name: tdhpet_animal_capacity tdhpet_animal_capacity_animal_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_capacity
    ADD CONSTRAINT tdhpet_animal_capacity_animal_location_id_fkey FOREIGN KEY (animal_location_id) REFERENCES public.tdhpet_animal_location(id);


--
-- TOC entry 8052 (class 2606 OID 84925)
-- Name: tdhpet_animal_capacity tdhpet_animal_capacity_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_capacity
    ADD CONSTRAINT tdhpet_animal_capacity_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8053 (class 2606 OID 84930)
-- Name: tdhpet_animal_location tdhpet_animal_location_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location
    ADD CONSTRAINT tdhpet_animal_location_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.tdhpet_wild_animals(id);


--
-- TOC entry 8054 (class 2606 OID 84935)
-- Name: tdhpet_animal_location tdhpet_animal_location_annu_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location
    ADD CONSTRAINT tdhpet_animal_location_annu_plan_id_fkey FOREIGN KEY (annu_plan_id) REFERENCES public.tdhpet_annual_plan(id);


--
-- TOC entry 8055 (class 2606 OID 84940)
-- Name: tdhpet_animal_location tdhpet_animal_location_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location
    ADD CONSTRAINT tdhpet_animal_location_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8056 (class 2606 OID 84945)
-- Name: tdhpet_animal_location_detail tdhpet_animal_location_detail_animal_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location_detail
    ADD CONSTRAINT tdhpet_animal_location_detail_animal_location_id_fkey FOREIGN KEY (animal_location_id) REFERENCES public.tdhpet_animal_location(id);


--
-- TOC entry 8057 (class 2606 OID 84950)
-- Name: tdhpet_animal_location_detail tdhpet_animal_location_detail_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_animal_location_detail
    ADD CONSTRAINT tdhpet_animal_location_detail_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8058 (class 2606 OID 84955)
-- Name: tdhpet_annual_plan tdhpet_annual_plan_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_annual_plan
    ADD CONSTRAINT tdhpet_annual_plan_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8059 (class 2606 OID 84960)
-- Name: tdhpet_annual_plan tdhpet_annual_plan_period_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_annual_plan
    ADD CONSTRAINT tdhpet_annual_plan_period_plan_id_fkey FOREIGN KEY (period_plan_id) REFERENCES public.tdhpet_period_plan(id);


--
-- TOC entry 8060 (class 2606 OID 84965)
-- Name: tdhpet_hunt_ground_eval tdhpet_hunt_ground_eval_animal_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunt_ground_eval
    ADD CONSTRAINT tdhpet_hunt_ground_eval_animal_location_id_fkey FOREIGN KEY (animal_location_id) REFERENCES public.tdhpet_animal_location(id);


--
-- TOC entry 8061 (class 2606 OID 84970)
-- Name: tdhpet_hunt_ground_eval tdhpet_hunt_ground_eval_animal_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunt_ground_eval
    ADD CONSTRAINT tdhpet_hunt_ground_eval_animal_request_id_fkey FOREIGN KEY (animal_request_id) REFERENCES public.tdhpet_wild_animals_request(id);


--
-- TOC entry 8062 (class 2606 OID 84975)
-- Name: tdhpet_hunt_ground_eval tdhpet_hunt_ground_eval_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunt_ground_eval
    ADD CONSTRAINT tdhpet_hunt_ground_eval_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8063 (class 2606 OID 84980)
-- Name: tdhpet_hunted_animal_detail tdhpet_hunted_animal_detail_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animal_detail
    ADD CONSTRAINT tdhpet_hunted_animal_detail_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8064 (class 2606 OID 84985)
-- Name: tdhpet_hunted_animal_detail tdhpet_hunted_animal_detail_hunted_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animal_detail
    ADD CONSTRAINT tdhpet_hunted_animal_detail_hunted_animal_id_fkey FOREIGN KEY (hunted_animal_id) REFERENCES public.tdhpet_hunted_animals(id);


--
-- TOC entry 8065 (class 2606 OID 84990)
-- Name: tdhpet_hunted_animals tdhpet_hunted_animals_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animals
    ADD CONSTRAINT tdhpet_hunted_animals_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.tdhpet_wild_animals(id);


--
-- TOC entry 8066 (class 2606 OID 84995)
-- Name: tdhpet_hunted_animals tdhpet_hunted_animals_annu_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animals
    ADD CONSTRAINT tdhpet_hunted_animals_annu_plan_id_fkey FOREIGN KEY (annu_plan_id) REFERENCES public.tdhpet_annual_plan(id);


--
-- TOC entry 8067 (class 2606 OID 85000)
-- Name: tdhpet_hunted_animals tdhpet_hunted_animals_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_hunted_animals
    ADD CONSTRAINT tdhpet_hunted_animals_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 7938 (class 2606 OID 85005)
-- Name: tdhpet_location tdhpet_location_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location
    ADD CONSTRAINT tdhpet_location_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8068 (class 2606 OID 85010)
-- Name: tdhpet_location_land_type tdhpet_location_land_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location_land_type
    ADD CONSTRAINT tdhpet_location_land_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8069 (class 2606 OID 85015)
-- Name: tdhpet_location_land_type tdhpet_location_land_type_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location_land_type
    ADD CONSTRAINT tdhpet_location_land_type_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.tdhpet_location(id);


--
-- TOC entry 7939 (class 2606 OID 85020)
-- Name: tdhpet_location tdhpet_location_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location
    ADD CONSTRAINT tdhpet_location_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 7940 (class 2606 OID 85025)
-- Name: tdhpet_location tdhpet_location_superintend_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_location
    ADD CONSTRAINT tdhpet_location_superintend_by_fkey FOREIGN KEY (superintend_by) REFERENCES public.tperson(id);


--
-- TOC entry 8070 (class 2606 OID 85030)
-- Name: tdhpet_period_plan tdhpet_period_plan_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_period_plan
    ADD CONSTRAINT tdhpet_period_plan_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8071 (class 2606 OID 85035)
-- Name: tdhpet_period_plan tdhpet_period_plan_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_period_plan
    ADD CONSTRAINT tdhpet_period_plan_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.tdhpet_location(id);


--
-- TOC entry 8072 (class 2606 OID 85040)
-- Name: tdhpet_tourist_purpose tdhpet_tourist_purpose_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_purpose
    ADD CONSTRAINT tdhpet_tourist_purpose_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8073 (class 2606 OID 85045)
-- Name: tdhpet_tourist_register tdhpet_tourist_register_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_register
    ADD CONSTRAINT tdhpet_tourist_register_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8074 (class 2606 OID 85050)
-- Name: tdhpet_tourist_register tdhpet_tourist_register_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_register
    ADD CONSTRAINT tdhpet_tourist_register_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.tdhpet_location(id);


--
-- TOC entry 8075 (class 2606 OID 85055)
-- Name: tdhpet_tourist_register tdhpet_tourist_register_purpose_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_register
    ADD CONSTRAINT tdhpet_tourist_register_purpose_id_fkey FOREIGN KEY (purpose_id) REFERENCES public.tdhpet_tourist_purpose(id);


--
-- TOC entry 7941 (class 2606 OID 85060)
-- Name: tdhpet_tourist_zone_geoms tdhpet_tourist_zone_geoms_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_zone_geoms
    ADD CONSTRAINT tdhpet_tourist_zone_geoms_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 7942 (class 2606 OID 85065)
-- Name: tdhpet_tourist_zone_geoms tdhpet_tourist_zone_geoms_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_tourist_zone_geoms
    ADD CONSTRAINT tdhpet_tourist_zone_geoms_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.tdhpet_location(id);


--
-- TOC entry 8076 (class 2606 OID 85070)
-- Name: tdhpet_wild_animals tdhpet_wild_animals_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals
    ADD CONSTRAINT tdhpet_wild_animals_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8077 (class 2606 OID 85075)
-- Name: tdhpet_wild_animals_request tdhpet_wild_animals_request_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals_request
    ADD CONSTRAINT tdhpet_wild_animals_request_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.tdhpet_wild_animals(id);


--
-- TOC entry 8078 (class 2606 OID 85080)
-- Name: tdhpet_wild_animals_request tdhpet_wild_animals_request_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdhpet_wild_animals_request
    ADD CONSTRAINT tdhpet_wild_animals_request_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8079 (class 2606 OID 85085)
-- Name: tdoc_category tdoc_category_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoc_category
    ADD CONSTRAINT tdoc_category_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8080 (class 2606 OID 85090)
-- Name: tdoc_category tdoc_category_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoc_category
    ADD CONSTRAINT tdoc_category_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8081 (class 2606 OID 85095)
-- Name: tdoctype tdoctype_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoctype
    ADD CONSTRAINT tdoctype_category_id FOREIGN KEY (category_id) REFERENCES public.tdoc_category(id);


--
-- TOC entry 8082 (class 2606 OID 85100)
-- Name: tdoctype tdoctype_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoctype
    ADD CONSTRAINT tdoctype_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8084 (class 2606 OID 85105)
-- Name: tdp_mngmt tdoctype_doctype_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdoctype_doctype_id FOREIGN KEY (doctype_id) REFERENCES public.tdoctype(id);


--
-- TOC entry 8083 (class 2606 OID 85110)
-- Name: tdoctype tdoctype_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdoctype
    ADD CONSTRAINT tdoctype_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8085 (class 2606 OID 85115)
-- Name: tdp_mngmt tdp_mngmt_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdp_mngmt_activity_id_fkey FOREIGN KEY (status_id) REFERENCES public.tdp_mngmt_status(id);


--
-- TOC entry 8090 (class 2606 OID 85120)
-- Name: tdp_mngmt_attach tdp_mngmt_attach_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_attach
    ADD CONSTRAINT tdp_mngmt_attach_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8091 (class 2606 OID 85125)
-- Name: tdp_mngmt_attach tdp_mngmt_attach_dp_mngm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_attach
    ADD CONSTRAINT tdp_mngmt_attach_dp_mngm_id_fkey FOREIGN KEY (dp_mngm_id) REFERENCES public.tdp_mngmt(id);


--
-- TOC entry 8092 (class 2606 OID 85130)
-- Name: tdp_mngmt_attach tdp_mngmt_attach_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_attach
    ADD CONSTRAINT tdp_mngmt_attach_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8086 (class 2606 OID 85135)
-- Name: tdp_mngmt tdp_mngmt_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdp_mngmt_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8087 (class 2606 OID 85140)
-- Name: tdp_mngmt tdp_mngmt_department_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdp_mngmt_department_id FOREIGN KEY (department_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8088 (class 2606 OID 85145)
-- Name: tdp_mngmt tdp_mngmt_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdp_mngmt_owner_id FOREIGN KEY (owner_id) REFERENCES public.tperson(id);


--
-- TOC entry 8093 (class 2606 OID 85150)
-- Name: tdp_mngmt_settings tdp_mngmt_settings_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_settings
    ADD CONSTRAINT tdp_mngmt_settings_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8094 (class 2606 OID 85155)
-- Name: tdp_mngmt_settings tdp_mngmt_settings_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_settings
    ADD CONSTRAINT tdp_mngmt_settings_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8095 (class 2606 OID 85160)
-- Name: tdp_mngmt_status tdp_mngmt_status_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status
    ADD CONSTRAINT tdp_mngmt_status_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8096 (class 2606 OID 85165)
-- Name: tdp_mngmt_status tdp_mngmt_status_dp_mngm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status
    ADD CONSTRAINT tdp_mngmt_status_dp_mngm_id_fkey FOREIGN KEY (dp_mngm_id) REFERENCES public.tdp_mngmt(id);


--
-- TOC entry 8097 (class 2606 OID 85170)
-- Name: tdp_mngmt_status tdp_mngmt_status_from_dpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status
    ADD CONSTRAINT tdp_mngmt_status_from_dpt_id_fkey FOREIGN KEY (from_dpt_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8098 (class 2606 OID 85175)
-- Name: tdp_mngmt_status tdp_mngmt_status_to_dpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status
    ADD CONSTRAINT tdp_mngmt_status_to_dpt_id_fkey FOREIGN KEY (to_dpt_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8099 (class 2606 OID 85180)
-- Name: tdp_mngmt_status tdp_mngmt_status_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt_status
    ADD CONSTRAINT tdp_mngmt_status_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8089 (class 2606 OID 85185)
-- Name: tdp_mngmt tdp_mngmt_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdp_mngmt
    ADD CONSTRAINT tdp_mngmt_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8100 (class 2606 OID 85190)
-- Name: tfal_cad_parcel_request tfal_cad_parcel_request_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_cad_parcel_request
    ADD CONSTRAINT tfal_cad_parcel_request_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.tfal_request(id);


--
-- TOC entry 7994 (class 2606 OID 85195)
-- Name: tfal_request tfal_request_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request
    ADD CONSTRAINT tfal_request_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.tfin_contractor(id);


--
-- TOC entry 8101 (class 2606 OID 85200)
-- Name: tfal_request_coord tfal_request_coord_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_coord
    ADD CONSTRAINT tfal_request_coord_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.tfal_request(id);


--
-- TOC entry 7995 (class 2606 OID 85205)
-- Name: tfal_request tfal_request_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request
    ADD CONSTRAINT tfal_request_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8102 (class 2606 OID 85210)
-- Name: tfal_request_doc tfal_request_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_doc
    ADD CONSTRAINT tfal_request_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8103 (class 2606 OID 85215)
-- Name: tfal_request_doc tfal_request_doc_request_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_doc
    ADD CONSTRAINT tfal_request_doc_request_status_id_fkey FOREIGN KEY (request_status_id) REFERENCES public.tfal_request_status(id);


--
-- TOC entry 7996 (class 2606 OID 85220)
-- Name: tfal_request tfal_request_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request
    ADD CONSTRAINT tfal_request_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.tperson(id);


--
-- TOC entry 7999 (class 2606 OID 85225)
-- Name: tfal_request_status tfal_request_status_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_status
    ADD CONSTRAINT tfal_request_status_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.tperson(id);


--
-- TOC entry 7997 (class 2606 OID 85230)
-- Name: tfal_request tfal_request_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request
    ADD CONSTRAINT tfal_request_status_id_fkey FOREIGN KEY (current_status_id) REFERENCES public.tfal_request_status(id);


--
-- TOC entry 8000 (class 2606 OID 85235)
-- Name: tfal_request_status tfal_request_status_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_status
    ADD CONSTRAINT tfal_request_status_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.tfal_request(id);


--
-- TOC entry 7998 (class 2606 OID 85240)
-- Name: tfal_request tfal_request_tfal_request_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request
    ADD CONSTRAINT tfal_request_tfal_request_type_id_fkey FOREIGN KEY (tfal_request_type_id) REFERENCES public.tfal_request_type(id);


--
-- TOC entry 8001 (class 2606 OID 85245)
-- Name: tfal_request_type tfal_request_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfal_request_type
    ADD CONSTRAINT tfal_request_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8104 (class 2606 OID 85250)
-- Name: tfin_annu_budget_alloc tfin_annu_budget_alloc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_annu_budget_alloc
    ADD CONSTRAINT tfin_annu_budget_alloc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8105 (class 2606 OID 85255)
-- Name: tfin_annu_budget_alloc tfin_annu_budget_alloc_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_annu_budget_alloc
    ADD CONSTRAINT tfin_annu_budget_alloc_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8106 (class 2606 OID 85260)
-- Name: tfin_budget_mainntenance tfin_budget_mainntenance_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_budget_mainntenance
    ADD CONSTRAINT tfin_budget_mainntenance_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8107 (class 2606 OID 106940)
-- Name: tfin_budget_mainntenance tfin_budget_mainntenance_fin_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_budget_mainntenance
    ADD CONSTRAINT tfin_budget_mainntenance_fin_type_id_fkey FOREIGN KEY (fin_type_id) REFERENCES public.tfin_type(id);


--
-- TOC entry 8108 (class 2606 OID 85265)
-- Name: tfin_contract tfin_contract_contractor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract
    ADD CONSTRAINT tfin_contract_contractor_id_fkey FOREIGN KEY (contractor_id) REFERENCES public.tfin_contractor(id);


--
-- TOC entry 8109 (class 2606 OID 85270)
-- Name: tfin_contract tfin_contract_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract
    ADD CONSTRAINT tfin_contract_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8111 (class 2606 OID 85275)
-- Name: tfin_contract_doc tfin_contract_doc_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract_doc
    ADD CONSTRAINT tfin_contract_doc_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.tfin_contract(id);


--
-- TOC entry 8112 (class 2606 OID 85280)
-- Name: tfin_contract_doc tfin_contract_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract_doc
    ADD CONSTRAINT tfin_contract_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8110 (class 2606 OID 85285)
-- Name: tfin_contract tfin_contract_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contract
    ADD CONSTRAINT tfin_contract_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8113 (class 2606 OID 85290)
-- Name: tfin_contractor tfin_contractor_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_contractor
    ADD CONSTRAINT tfin_contractor_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8114 (class 2606 OID 85295)
-- Name: tfin_input tfin_input_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input
    ADD CONSTRAINT tfin_input_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8118 (class 2606 OID 85300)
-- Name: tfin_input_status tfin_input_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input_status
    ADD CONSTRAINT tfin_input_id_fkey FOREIGN KEY (input_id) REFERENCES public.tfin_input(id);


--
-- TOC entry 8117 (class 2606 OID 106930)
-- Name: tfin_input tfin_input_input_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input
    ADD CONSTRAINT tfin_input_input_type_id_fkey FOREIGN KEY (input_type_id) REFERENCES public.tfin_type(id);


--
-- TOC entry 8115 (class 2606 OID 85310)
-- Name: tfin_input tfin_input_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input
    ADD CONSTRAINT tfin_input_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8119 (class 2606 OID 85315)
-- Name: tfin_input_status tfin_input_status_create_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input_status
    ADD CONSTRAINT tfin_input_status_create_by_fkey FOREIGN KEY (create_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8116 (class 2606 OID 85320)
-- Name: tfin_input tfin_input_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_input
    ADD CONSTRAINT tfin_input_status_id_fkey FOREIGN KEY (current_status) REFERENCES public.tfin_input_status(id);


--
-- TOC entry 8120 (class 2606 OID 85325)
-- Name: tfin_output tfin_output_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_output
    ADD CONSTRAINT tfin_output_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8121 (class 2606 OID 85330)
-- Name: tfin_output tfin_output_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_output
    ADD CONSTRAINT tfin_output_department_fkey FOREIGN KEY (department) REFERENCES public.torganisation(id);


--
-- TOC entry 8122 (class 2606 OID 106935)
-- Name: tfin_output tfin_output_expenditure_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_output
    ADD CONSTRAINT tfin_output_expenditure_type_fkey FOREIGN KEY (expenditure_type) REFERENCES public.tfin_type(id);


--
-- TOC entry 8123 (class 2606 OID 85340)
-- Name: tfin_payment_period tfin_payment_period_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_payment_period
    ADD CONSTRAINT tfin_payment_period_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.tfin_contract(id);


--
-- TOC entry 8124 (class 2606 OID 85345)
-- Name: tfin_payment_period tfin_payment_period_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_payment_period
    ADD CONSTRAINT tfin_payment_period_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8450 (class 2606 OID 106925)
-- Name: tfin_type tfin_type_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfin_type
    ADD CONSTRAINT tfin_type_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tfin_type(id);


--
-- TOC entry 7945 (class 2606 OID 85355)
-- Name: tfrm_activity tfrm_activity_activity_domain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity
    ADD CONSTRAINT tfrm_activity_activity_domain_id_fkey FOREIGN KEY (activity_domain_id) REFERENCES public.tfrm_activity_domain(id);


--
-- TOC entry 7946 (class 2606 OID 85360)
-- Name: tfrm_activity tfrm_activity_annual_planning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity
    ADD CONSTRAINT tfrm_activity_annual_planning_id_fkey FOREIGN KEY (annual_planning_id) REFERENCES public.tfrm_annual_planning(id);


--
-- TOC entry 7947 (class 2606 OID 85365)
-- Name: tfrm_activity tfrm_activity_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity
    ADD CONSTRAINT tfrm_activity_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8125 (class 2606 OID 85370)
-- Name: tfrm_activity_status tfrm_activity_status_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status
    ADD CONSTRAINT tfrm_activity_status_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 8126 (class 2606 OID 85375)
-- Name: tfrm_activity_status tfrm_activity_status_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status
    ADD CONSTRAINT tfrm_activity_status_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8127 (class 2606 OID 85380)
-- Name: tfrm_activity_status_doc tfrm_activity_status_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status_doc
    ADD CONSTRAINT tfrm_activity_status_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8128 (class 2606 OID 85385)
-- Name: tfrm_activity_status_doc tfrm_activity_status_doc_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_activity_status_doc
    ADD CONSTRAINT tfrm_activity_status_doc_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 7948 (class 2606 OID 85390)
-- Name: tfrm_annual_planning tfrm_annual_planning_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning
    ADD CONSTRAINT tfrm_annual_planning_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7949 (class 2606 OID 85395)
-- Name: tfrm_annual_planning tfrm_annual_planning_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning
    ADD CONSTRAINT tfrm_annual_planning_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8129 (class 2606 OID 85400)
-- Name: tfrm_annual_planning_status tfrm_annual_planning_status_annual_planning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning_status
    ADD CONSTRAINT tfrm_annual_planning_status_annual_planning_id_fkey FOREIGN KEY (annual_planning_id) REFERENCES public.tfrm_annual_planning(id);


--
-- TOC entry 8130 (class 2606 OID 85405)
-- Name: tfrm_annual_planning_status tfrm_annual_planning_status_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning_status
    ADD CONSTRAINT tfrm_annual_planning_status_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7950 (class 2606 OID 85410)
-- Name: tfrm_annual_planning tfrm_annual_planning_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_planning
    ADD CONSTRAINT tfrm_annual_planning_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_annual_planning_status(id);


--
-- TOC entry 8131 (class 2606 OID 85415)
-- Name: tfrm_annual_protection_plan tfrm_annual_protection_plan_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_protection_plan
    ADD CONSTRAINT tfrm_annual_protection_plan_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 8132 (class 2606 OID 85420)
-- Name: tfrm_annual_protection_plan tfrm_annual_protection_plan_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_annual_protection_plan
    ADD CONSTRAINT tfrm_annual_protection_plan_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8134 (class 2606 OID 85425)
-- Name: tfrm_bio_diversity_name tfrm_bio_diversity_name_bio_div_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_bio_diversity_name
    ADD CONSTRAINT tfrm_bio_diversity_name_bio_div_id_fkey FOREIGN KEY (bio_div_id) REFERENCES public.tfrm_bio_diversity(id);


--
-- TOC entry 8133 (class 2606 OID 85430)
-- Name: tfrm_bio_diversity tfrm_bio_diversity_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_bio_diversity
    ADD CONSTRAINT tfrm_bio_diversity_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 8135 (class 2606 OID 85435)
-- Name: tfrm_confiscation tfrm_confiscation_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation
    ADD CONSTRAINT tfrm_confiscation_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8137 (class 2606 OID 85440)
-- Name: tfrm_confiscation_detail tfrm_confiscation_detail_confiscation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation_detail
    ADD CONSTRAINT tfrm_confiscation_detail_confiscation_id_fkey FOREIGN KEY (confiscation_id) REFERENCES public.tfrm_confiscation(id);


--
-- TOC entry 8138 (class 2606 OID 85445)
-- Name: tfrm_confiscation_detail tfrm_confiscation_detail_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation_detail
    ADD CONSTRAINT tfrm_confiscation_detail_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8136 (class 2606 OID 85450)
-- Name: tfrm_confiscation tfrm_confiscation_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_confiscation
    ADD CONSTRAINT tfrm_confiscation_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8139 (class 2606 OID 85455)
-- Name: tfrm_domain_name tfrm_domain_name_domain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_domain_name
    ADD CONSTRAINT tfrm_domain_name_domain_id_fkey FOREIGN KEY (domain_id) REFERENCES public.tfrm_domain(id);


--
-- TOC entry 8140 (class 2606 OID 85460)
-- Name: tfrm_fire_details tfrm_fire_details_comp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_details
    ADD CONSTRAINT tfrm_fire_details_comp_id_fkey FOREIGN KEY (comp_id) REFERENCES public.tgis_compartment(id);


--
-- TOC entry 8141 (class 2606 OID 85465)
-- Name: tfrm_fire_details tfrm_fire_details_fire_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_details
    ADD CONSTRAINT tfrm_fire_details_fire_report_id_fkey FOREIGN KEY (fire_report_id) REFERENCES public.tfrm_fire_report(id);


--
-- TOC entry 8142 (class 2606 OID 85470)
-- Name: tfrm_fire_details tfrm_fire_details_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_details
    ADD CONSTRAINT tfrm_fire_details_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 8143 (class 2606 OID 85475)
-- Name: tfrm_fire_point tfrm_fire_point_fire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_point
    ADD CONSTRAINT tfrm_fire_point_fire_id_fkey FOREIGN KEY (fire_id) REFERENCES public.tfrm_fire_report(id);


--
-- TOC entry 8144 (class 2606 OID 85480)
-- Name: tfrm_fire_polygon tfrm_fire_polygon_fire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_polygon
    ADD CONSTRAINT tfrm_fire_polygon_fire_id_fkey FOREIGN KEY (fire_id) REFERENCES public.tfrm_fire_report(id);


--
-- TOC entry 8145 (class 2606 OID 85485)
-- Name: tfrm_fire_report tfrm_fire_report_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_report
    ADD CONSTRAINT tfrm_fire_report_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8146 (class 2606 OID 85490)
-- Name: tfrm_fire_report tfrm_fire_report_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_report
    ADD CONSTRAINT tfrm_fire_report_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 8147 (class 2606 OID 85495)
-- Name: tfrm_fire_report tfrm_fire_report_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_report
    ADD CONSTRAINT tfrm_fire_report_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8148 (class 2606 OID 85500)
-- Name: tfrm_fire_report tfrm_fire_report_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fire_report
    ADD CONSTRAINT tfrm_fire_report_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.tgis_region(id);


--
-- TOC entry 8149 (class 2606 OID 85505)
-- Name: tfrm_fiskos_data tfrm_fiskos_data_import_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_data
    ADD CONSTRAINT tfrm_fiskos_data_import_id_fkey FOREIGN KEY (import_id) REFERENCES public.tfrm_fiskos_import(id);


--
-- TOC entry 8150 (class 2606 OID 85510)
-- Name: tfrm_fiskos_data tfrm_fiskos_data_imported_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_data
    ADD CONSTRAINT tfrm_fiskos_data_imported_by_fkey FOREIGN KEY (imported_by) REFERENCES public.tperson(id);


--
-- TOC entry 8151 (class 2606 OID 85515)
-- Name: tfrm_fiskos_data tfrm_fiskos_data_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_data
    ADD CONSTRAINT tfrm_fiskos_data_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 8152 (class 2606 OID 85520)
-- Name: tfrm_fiskos_data tfrm_fiskos_data_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_data
    ADD CONSTRAINT tfrm_fiskos_data_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8153 (class 2606 OID 85525)
-- Name: tfrm_fiskos_import tfrm_fiskos_import_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_import
    ADD CONSTRAINT tfrm_fiskos_import_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.tperson(id);


--
-- TOC entry 8154 (class 2606 OID 85530)
-- Name: tfrm_fiskos_import tfrm_fiskos_import_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_import
    ADD CONSTRAINT tfrm_fiskos_import_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8155 (class 2606 OID 85535)
-- Name: tfrm_fiskos_import tfrm_fiskos_import_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_import
    ADD CONSTRAINT tfrm_fiskos_import_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 8156 (class 2606 OID 85540)
-- Name: tfrm_fiskos_import tfrm_fiskos_import_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_fiskos_import
    ADD CONSTRAINT tfrm_fiskos_import_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.tgis_region(id);


--
-- TOC entry 8157 (class 2606 OID 85545)
-- Name: tfrm_harvest_impl_transport tfrm_harvest_impl_transport_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_harvest_impl_transport
    ADD CONSTRAINT tfrm_harvest_impl_transport_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8158 (class 2606 OID 85550)
-- Name: tfrm_inspection tfrm_inspection_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection
    ADD CONSTRAINT tfrm_inspection_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8163 (class 2606 OID 85555)
-- Name: tfrm_inspection_doc tfrm_inspection_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection_doc
    ADD CONSTRAINT tfrm_inspection_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8164 (class 2606 OID 85560)
-- Name: tfrm_inspection_doc tfrm_inspection_doc_inspection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection_doc
    ADD CONSTRAINT tfrm_inspection_doc_inspection_id_fkey FOREIGN KEY (inspection_id) REFERENCES public.tfrm_inspection(id);


--
-- TOC entry 8159 (class 2606 OID 85565)
-- Name: tfrm_inspection tfrm_inspection_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection
    ADD CONSTRAINT tfrm_inspection_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8160 (class 2606 OID 85570)
-- Name: tfrm_inspection tfrm_inspection_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection
    ADD CONSTRAINT tfrm_inspection_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tfrm_inspection(id);


--
-- TOC entry 8161 (class 2606 OID 85575)
-- Name: tfrm_inspection tfrm_inspection_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection
    ADD CONSTRAINT tfrm_inspection_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.tgis_region(id);


--
-- TOC entry 8162 (class 2606 OID 85580)
-- Name: tfrm_inspection tfrm_inspection_type_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspection
    ADD CONSTRAINT tfrm_inspection_type_action_fkey FOREIGN KEY (type_action) REFERENCES public.tfrm_insp_action_type(id);


--
-- TOC entry 8165 (class 2606 OID 85585)
-- Name: tfrm_inspector tfrm_inspector_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspector
    ADD CONSTRAINT tfrm_inspector_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8166 (class 2606 OID 85590)
-- Name: tfrm_inspector tfrm_inspector_office_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_inspector
    ADD CONSTRAINT tfrm_inspector_office_activity_id_fkey FOREIGN KEY (office_activity_id) REFERENCES public.tfrm_inspection(id);


--
-- TOC entry 8167 (class 2606 OID 85595)
-- Name: tfrm_private_activity tfrm_private_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity
    ADD CONSTRAINT tfrm_private_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 8168 (class 2606 OID 85600)
-- Name: tfrm_private_activity tfrm_private_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity
    ADD CONSTRAINT tfrm_private_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8169 (class 2606 OID 85605)
-- Name: tfrm_private_activity tfrm_private_activity_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity
    ADD CONSTRAINT tfrm_private_activity_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8170 (class 2606 OID 85610)
-- Name: tfrm_private_activity tfrm_private_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity
    ADD CONSTRAINT tfrm_private_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8171 (class 2606 OID 85615)
-- Name: tfrm_private_activity tfrm_private_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_activity
    ADD CONSTRAINT tfrm_private_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 8172 (class 2606 OID 85620)
-- Name: tfrm_private_request tfrm_private_request_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 8173 (class 2606 OID 85625)
-- Name: tfrm_private_request tfrm_private_request_alw_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_alw_created_by_fkey FOREIGN KEY (alw_created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8174 (class 2606 OID 85630)
-- Name: tfrm_private_request tfrm_private_request_ap_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_ap_created_by_fkey FOREIGN KEY (ap_created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8175 (class 2606 OID 85635)
-- Name: tfrm_private_request tfrm_private_request_auth_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_auth_person_id_fkey FOREIGN KEY (auth_person_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8176 (class 2606 OID 85640)
-- Name: tfrm_private_request tfrm_private_request_cad_zone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_cad_zone_id_fkey FOREIGN KEY (cad_zone_id) REFERENCES public.tgis_cadastral_zone(id);


--
-- TOC entry 8182 (class 2606 OID 85645)
-- Name: tfrm_private_request_doc tfrm_private_request_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_doc
    ADD CONSTRAINT tfrm_private_request_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8183 (class 2606 OID 85650)
-- Name: tfrm_private_request_doc tfrm_private_request_doc_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_doc
    ADD CONSTRAINT tfrm_private_request_doc_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.tfrm_private_request(id);


--
-- TOC entry 8184 (class 2606 OID 85655)
-- Name: tfrm_private_request_impl tfrm_private_request_impl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_impl
    ADD CONSTRAINT tfrm_private_request_impl_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8185 (class 2606 OID 85660)
-- Name: tfrm_private_request_impl tfrm_private_request_impl_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_impl
    ADD CONSTRAINT tfrm_private_request_impl_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.tfrm_private_request(id);


--
-- TOC entry 8186 (class 2606 OID 85665)
-- Name: tfrm_private_request_impl tfrm_private_request_impl_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request_impl
    ADD CONSTRAINT tfrm_private_request_impl_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8177 (class 2606 OID 85670)
-- Name: tfrm_private_request tfrm_private_request_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8178 (class 2606 OID 85675)
-- Name: tfrm_private_request tfrm_private_request_parcel_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_parcel_detail_id_fkey FOREIGN KEY (parcel_detail_id) REFERENCES public.tparcel_detail(id);


--
-- TOC entry 8179 (class 2606 OID 85680)
-- Name: tfrm_private_request tfrm_private_request_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8180 (class 2606 OID 85685)
-- Name: tfrm_private_request tfrm_private_request_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_requester_id_fkey FOREIGN KEY (requester_id) REFERENCES public.tperson(id);


--
-- TOC entry 8181 (class 2606 OID 85690)
-- Name: tfrm_private_request tfrm_private_request_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_private_request
    ADD CONSTRAINT tfrm_private_request_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 7951 (class 2606 OID 85695)
-- Name: tfrm_protection_activity tfrm_protection_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 7952 (class 2606 OID 85700)
-- Name: tfrm_protection_activity tfrm_protection_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7953 (class 2606 OID 85705)
-- Name: tfrm_protection_activity tfrm_protection_activity_measure_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_measure_unit_id_fkey FOREIGN KEY (measure_unit_id) REFERENCES public.tunits_metric(id);


--
-- TOC entry 7954 (class 2606 OID 85710)
-- Name: tfrm_protection_activity tfrm_protection_activity_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 7955 (class 2606 OID 85715)
-- Name: tfrm_protection_activity tfrm_protection_activity_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 7956 (class 2606 OID 85720)
-- Name: tfrm_protection_activity tfrm_protection_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7957 (class 2606 OID 85725)
-- Name: tfrm_protection_activity tfrm_protection_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_activity
    ADD CONSTRAINT tfrm_protection_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 8187 (class 2606 OID 85730)
-- Name: tfrm_protection_impl_declare tfrm_protection_impl_declare_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_impl_declare
    ADD CONSTRAINT tfrm_protection_impl_declare_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8188 (class 2606 OID 85735)
-- Name: tfrm_protection_impl_declare tfrm_protection_impl_declare_protection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_protection_impl_declare
    ADD CONSTRAINT tfrm_protection_impl_declare_protection_id_fkey FOREIGN KEY (protection_id) REFERENCES public.tfrm_protection_activity(id);


--
-- TOC entry 7958 (class 2606 OID 85740)
-- Name: tfrm_road_activity tfrm_road_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity
    ADD CONSTRAINT tfrm_road_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 7959 (class 2606 OID 85745)
-- Name: tfrm_road_activity tfrm_road_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity
    ADD CONSTRAINT tfrm_road_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7960 (class 2606 OID 85750)
-- Name: tfrm_road_activity tfrm_road_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity
    ADD CONSTRAINT tfrm_road_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7961 (class 2606 OID 85755)
-- Name: tfrm_road_activity tfrm_road_activity_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity
    ADD CONSTRAINT tfrm_road_activity_road_id_fkey FOREIGN KEY (road_id) REFERENCES public.tgis_road(id);


--
-- TOC entry 7962 (class 2606 OID 85760)
-- Name: tfrm_road_activity tfrm_road_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_activity
    ADD CONSTRAINT tfrm_road_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 8189 (class 2606 OID 85765)
-- Name: tfrm_road_impl_declare tfrm_road_impl_declare_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_impl_declare
    ADD CONSTRAINT tfrm_road_impl_declare_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8190 (class 2606 OID 85770)
-- Name: tfrm_road_impl_declare tfrm_road_impl_declare_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_road_impl_declare
    ADD CONSTRAINT tfrm_road_impl_declare_road_id_fkey FOREIGN KEY (road_id) REFERENCES public.tfrm_road_activity(id);


--
-- TOC entry 8191 (class 2606 OID 85775)
-- Name: tfrm_seed_activity tfrm_seed_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 8192 (class 2606 OID 85780)
-- Name: tfrm_seed_activity tfrm_seed_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8193 (class 2606 OID 85785)
-- Name: tfrm_seed_activity tfrm_seed_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8194 (class 2606 OID 85790)
-- Name: tfrm_seed_activity tfrm_seed_activity_pr_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_pr_created_by_fkey FOREIGN KEY (pr_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8195 (class 2606 OID 85795)
-- Name: tfrm_seed_activity tfrm_seed_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 8196 (class 2606 OID 85800)
-- Name: tfrm_seed_activity tfrm_seed_activity_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seed_activity
    ADD CONSTRAINT tfrm_seed_activity_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8197 (class 2606 OID 85805)
-- Name: tfrm_seedling_inventory tfrm_seedling_inventory_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory
    ADD CONSTRAINT tfrm_seedling_inventory_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.tperson(id);


--
-- TOC entry 8198 (class 2606 OID 85810)
-- Name: tfrm_seedling_inventory tfrm_seedling_inventory_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory
    ADD CONSTRAINT tfrm_seedling_inventory_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8201 (class 2606 OID 85815)
-- Name: tfrm_seedling_inventory_pos tfrm_seedling_inventory_pos_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos
    ADD CONSTRAINT tfrm_seedling_inventory_pos_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.tperson(id);


--
-- TOC entry 8202 (class 2606 OID 85820)
-- Name: tfrm_seedling_inventory_pos tfrm_seedling_inventory_pos_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos
    ADD CONSTRAINT tfrm_seedling_inventory_pos_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.tperson(id);


--
-- TOC entry 8203 (class 2606 OID 85825)
-- Name: tfrm_seedling_inventory_pos tfrm_seedling_inventory_pos_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos
    ADD CONSTRAINT tfrm_seedling_inventory_pos_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8204 (class 2606 OID 85830)
-- Name: tfrm_seedling_inventory_pos tfrm_seedling_inventory_pos_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos
    ADD CONSTRAINT tfrm_seedling_inventory_pos_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.tfrm_seedling_inventory(id);


--
-- TOC entry 8205 (class 2606 OID 85835)
-- Name: tfrm_seedling_inventory_pos tfrm_seedling_inventory_pos_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory_pos
    ADD CONSTRAINT tfrm_seedling_inventory_pos_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8199 (class 2606 OID 85840)
-- Name: tfrm_seedling_inventory tfrm_seedling_inventory_seed_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory
    ADD CONSTRAINT tfrm_seedling_inventory_seed_activity_id_fkey FOREIGN KEY (seed_activity_id) REFERENCES public.tfrm_seed_activity(id);


--
-- TOC entry 8200 (class 2606 OID 85845)
-- Name: tfrm_seedling_inventory tfrm_seedling_inventory_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_seedling_inventory
    ADD CONSTRAINT tfrm_seedling_inventory_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7963 (class 2606 OID 85850)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 7964 (class 2606 OID 85855)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7965 (class 2606 OID 85860)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7966 (class 2606 OID 85865)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 7967 (class 2606 OID 85870)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 7968 (class 2606 OID 85875)
-- Name: tfrm_stand_harvest_activity tfrm_stand_harvest_activity_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_activity
    ADD CONSTRAINT tfrm_stand_harvest_activity_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8206 (class 2606 OID 85880)
-- Name: tfrm_stand_harvest_impl_declare tfrm_stand_harvest_impl_declare_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_impl_declare
    ADD CONSTRAINT tfrm_stand_harvest_impl_declare_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8207 (class 2606 OID 85885)
-- Name: tfrm_stand_harvest_impl_declare tfrm_stand_harvest_impl_declare_harvest_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_impl_declare
    ADD CONSTRAINT tfrm_stand_harvest_impl_declare_harvest_activity_id_fkey FOREIGN KEY (harvest_activity_id) REFERENCES public.tfrm_stand_harvest_activity(id);


--
-- TOC entry 8208 (class 2606 OID 85890)
-- Name: tfrm_stand_harvest_impl_declare tfrm_stand_harvest_impl_declare_transport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_impl_declare
    ADD CONSTRAINT tfrm_stand_harvest_impl_declare_transport_id_fkey FOREIGN KEY (transport_id) REFERENCES public.tfrm_harvest_impl_transport(id);


--
-- TOC entry 8209 (class 2606 OID 85895)
-- Name: tfrm_stand_harvest_marked tfrm_stand_harvest_marked_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_marked
    ADD CONSTRAINT tfrm_stand_harvest_marked_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8210 (class 2606 OID 85900)
-- Name: tfrm_stand_harvest_marked tfrm_stand_harvest_marked_harvest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_marked
    ADD CONSTRAINT tfrm_stand_harvest_marked_harvest_id_fkey FOREIGN KEY (harvest_id) REFERENCES public.tfrm_stand_harvest_activity(id);


--
-- TOC entry 8211 (class 2606 OID 85905)
-- Name: tfrm_stand_harvest_marked tfrm_stand_harvest_marked_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_harvest_marked
    ADD CONSTRAINT tfrm_stand_harvest_marked_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7969 (class 2606 OID 85910)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 7970 (class 2606 OID 85915)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_im_contr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_im_contr_id_fkey FOREIGN KEY (im_contr_id) REFERENCES public.tfin_contractor(id);


--
-- TOC entry 7971 (class 2606 OID 85920)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7972 (class 2606 OID 85925)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_inventory_pos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_inventory_pos_id_fkey FOREIGN KEY (inventory_pos_id) REFERENCES public.tfrm_seedling_inventory_pos(id);


--
-- TOC entry 7973 (class 2606 OID 85930)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7974 (class 2606 OID 85935)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 7975 (class 2606 OID 85940)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 7976 (class 2606 OID 85945)
-- Name: tfrm_stand_planting_activity tfrm_stand_planting_activity_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_activity
    ADD CONSTRAINT tfrm_stand_planting_activity_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8212 (class 2606 OID 85950)
-- Name: tfrm_stand_planting_impl_declare tfrm_stand_planting_impl_declare_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_impl_declare
    ADD CONSTRAINT tfrm_stand_planting_impl_declare_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8213 (class 2606 OID 85955)
-- Name: tfrm_stand_planting_impl_declare tfrm_stand_planting_impl_declare_plant_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_planting_impl_declare
    ADD CONSTRAINT tfrm_stand_planting_impl_declare_plant_activity_id_fkey FOREIGN KEY (plant_activity_id) REFERENCES public.tfrm_stand_planting_activity(id);


--
-- TOC entry 7977 (class 2606 OID 85960)
-- Name: tfrm_stand_silviculture_activity tfrm_stand_silviculture_activity_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity
    ADD CONSTRAINT tfrm_stand_silviculture_activity_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.tfrm_activity(id);


--
-- TOC entry 7978 (class 2606 OID 85965)
-- Name: tfrm_stand_silviculture_activity tfrm_stand_silviculture_activity_im_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity
    ADD CONSTRAINT tfrm_stand_silviculture_activity_im_created_by_fkey FOREIGN KEY (im_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7979 (class 2606 OID 85970)
-- Name: tfrm_stand_silviculture_activity tfrm_stand_silviculture_activity_pl_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity
    ADD CONSTRAINT tfrm_stand_silviculture_activity_pl_created_by_fkey FOREIGN KEY (pl_created_by) REFERENCES public.tperson(id);


--
-- TOC entry 7980 (class 2606 OID 85975)
-- Name: tfrm_stand_silviculture_activity tfrm_stand_silviculture_activity_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity
    ADD CONSTRAINT tfrm_stand_silviculture_activity_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 7981 (class 2606 OID 85980)
-- Name: tfrm_stand_silviculture_activity tfrm_stand_silviculture_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_activity
    ADD CONSTRAINT tfrm_stand_silviculture_activity_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tfrm_activity_status(id);


--
-- TOC entry 8214 (class 2606 OID 85985)
-- Name: tfrm_stand_silviculture_impl_declare tfrm_stand_silviculture_impl_declare_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_impl_declare
    ADD CONSTRAINT tfrm_stand_silviculture_impl_declare_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8215 (class 2606 OID 85990)
-- Name: tfrm_stand_silviculture_impl_declare tfrm_stand_silviculture_impl_declare_slv_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_stand_silviculture_impl_declare
    ADD CONSTRAINT tfrm_stand_silviculture_impl_declare_slv_activity_id_fkey FOREIGN KEY (slv_activity_id) REFERENCES public.tfrm_stand_silviculture_activity(id);


--
-- TOC entry 8216 (class 2606 OID 85995)
-- Name: tfrm_treatment tfrm_treatment_treat_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfrm_treatment
    ADD CONSTRAINT tfrm_treatment_treat_group_id_fkey FOREIGN KEY (treat_group_id) REFERENCES public.tfrm_treatment_group(id);


--
-- TOC entry 8217 (class 2606 OID 86000)
-- Name: tfuell_consum tfuell_consum_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfuell_consum
    ADD CONSTRAINT tfuell_consum_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8218 (class 2606 OID 86005)
-- Name: tfuell_consum tfuell_consum_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfuell_consum
    ADD CONSTRAINT tfuell_consum_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8219 (class 2606 OID 86010)
-- Name: tfuell_consum tfuell_consum_vehicles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tfuell_consum
    ADD CONSTRAINT tfuell_consum_vehicles_id_fkey FOREIGN KEY (vehicles_id) REFERENCES public.tlog_vehicles(id);


--
-- TOC entry 8221 (class 2606 OID 86015)
-- Name: tgis_biodiv tgis_biodiv_biodiv_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_biodiv
    ADD CONSTRAINT tgis_biodiv_biodiv_id_fkey FOREIGN KEY (biodiv_id) REFERENCES public.tbiodiv_name(id);


--
-- TOC entry 8222 (class 2606 OID 86020)
-- Name: tgis_biodiv tgis_biodiv_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_biodiv
    ADD CONSTRAINT tgis_biodiv_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 7982 (class 2606 OID 86025)
-- Name: tgis_cadastral_municipality tgis_cadastral_municipality_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_municipality
    ADD CONSTRAINT tgis_cadastral_municipality_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.tgis_region(id);


--
-- TOC entry 8223 (class 2606 OID 86030)
-- Name: tgis_cadastral_zone tgis_cadastral_zone_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_cadastral_zone
    ADD CONSTRAINT tgis_cadastral_zone_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 7983 (class 2606 OID 86035)
-- Name: tgis_compartment tgis_compartment_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_compartment
    ADD CONSTRAINT tgis_compartment_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 7984 (class 2606 OID 86040)
-- Name: tgis_compartment tgis_compartment_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_compartment
    ADD CONSTRAINT tgis_compartment_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 7985 (class 2606 OID 86045)
-- Name: tgis_compartment tgis_compartment_mup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_compartment
    ADD CONSTRAINT tgis_compartment_mup_id_fkey FOREIGN KEY (mup_id) REFERENCES public.tgis_mu_period(id);


--
-- TOC entry 7986 (class 2606 OID 86050)
-- Name: tgis_management_unit tgis_management_unit_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_management_unit
    ADD CONSTRAINT tgis_management_unit_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.tgis_region(id);


--
-- TOC entry 8002 (class 2606 OID 86055)
-- Name: tgis_mu_period tgis_mu_period_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_mu_period
    ADD CONSTRAINT tgis_mu_period_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8003 (class 2606 OID 86060)
-- Name: tgis_mu_period tgis_mu_period_mu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_mu_period
    ADD CONSTRAINT tgis_mu_period_mu_id_fkey FOREIGN KEY (mu_id) REFERENCES public.tgis_management_unit(id);


--
-- TOC entry 8004 (class 2606 OID 86065)
-- Name: tgis_mu_period tgis_mu_period_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_mu_period
    ADD CONSTRAINT tgis_mu_period_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8224 (class 2606 OID 86070)
-- Name: tgis_plot_tree tgis_plot_tree_plot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plot_tree
    ADD CONSTRAINT tgis_plot_tree_plot_id_fkey FOREIGN KEY (plot_id) REFERENCES public.tgis_plots(id);


--
-- TOC entry 8225 (class 2606 OID 86075)
-- Name: tgis_plots tgis_plots_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_plots
    ADD CONSTRAINT tgis_plots_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 8226 (class 2606 OID 86080)
-- Name: tgis_road tgis_road_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_road
    ADD CONSTRAINT tgis_road_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8227 (class 2606 OID 86085)
-- Name: tgis_road tgis_road_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_road
    ADD CONSTRAINT tgis_road_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8228 (class 2606 OID 86090)
-- Name: tgis_stand_aud tgis_stand_aud_compartment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_aud
    ADD CONSTRAINT tgis_stand_aud_compartment_id_fkey FOREIGN KEY (compartment_id) REFERENCES public.tgis_compartment(id);


--
-- TOC entry 8229 (class 2606 OID 86095)
-- Name: tgis_stand_aud tgis_stand_aud_estemate_volume_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_aud
    ADD CONSTRAINT tgis_stand_aud_estemate_volume_fkey FOREIGN KEY (estemate_volume) REFERENCES public.tfrm_estimate_volume(code);


--
-- TOC entry 8230 (class 2606 OID 86100)
-- Name: tgis_stand_aud tgis_stand_aud_tree1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_aud
    ADD CONSTRAINT tgis_stand_aud_tree1_fkey FOREIGN KEY (tree1) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8231 (class 2606 OID 86105)
-- Name: tgis_stand_aud tgis_stand_aud_tree2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_aud
    ADD CONSTRAINT tgis_stand_aud_tree2_fkey FOREIGN KEY (tree2) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8232 (class 2606 OID 86110)
-- Name: tgis_stand_aud tgis_stand_aud_tree3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_aud
    ADD CONSTRAINT tgis_stand_aud_tree3_fkey FOREIGN KEY (tree3) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7987 (class 2606 OID 86115)
-- Name: tgis_stand tgis_stand_compartment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_compartment_id_fkey FOREIGN KEY (compartment_id) REFERENCES public.tgis_compartment(id);


--
-- TOC entry 7988 (class 2606 OID 86120)
-- Name: tgis_stand tgis_stand_conifer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_conifer_fkey FOREIGN KEY (conifer) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7989 (class 2606 OID 86125)
-- Name: tgis_stand tgis_stand_decidouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_decidouse_fkey FOREIGN KEY (decidouse) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7990 (class 2606 OID 86130)
-- Name: tgis_stand tgis_stand_estemate_volume_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_estemate_volume_fkey FOREIGN KEY (estemate_volume) REFERENCES public.tfrm_estimate_volume(code);


--
-- TOC entry 8233 (class 2606 OID 86135)
-- Name: tgis_stand_growth tgis_stand_growth_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_growth
    ADD CONSTRAINT tgis_stand_growth_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8234 (class 2606 OID 86140)
-- Name: tgis_stand_growth tgis_stand_growth_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand_growth
    ADD CONSTRAINT tgis_stand_growth_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 7991 (class 2606 OID 86145)
-- Name: tgis_stand tgis_stand_tree1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_tree1_fkey FOREIGN KEY (tree1) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7992 (class 2606 OID 86150)
-- Name: tgis_stand tgis_stand_tree2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_tree2_fkey FOREIGN KEY (tree2) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 7993 (class 2606 OID 86155)
-- Name: tgis_stand tgis_stand_tree3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_stand
    ADD CONSTRAINT tgis_stand_tree3_fkey FOREIGN KEY (tree3) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8235 (class 2606 OID 86160)
-- Name: tgis_subregion tgis_subregion_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tgis_subregion
    ADD CONSTRAINT tgis_subregion_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.tgis_region(id);


--
-- TOC entry 8236 (class 2606 OID 86165)
-- Name: thrm_ann_plan_employee thrm_ann_plan_employee_ann_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_ann_plan_employee
    ADD CONSTRAINT thrm_ann_plan_employee_ann_plan_id_fkey FOREIGN KEY (ann_plan_id) REFERENCES public.thrm_annual_plan(id);


--
-- TOC entry 8237 (class 2606 OID 86170)
-- Name: thrm_ann_plan_employee thrm_ann_plan_employee_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_ann_plan_employee
    ADD CONSTRAINT thrm_ann_plan_employee_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8239 (class 2606 OID 86175)
-- Name: thrm_annual_plan_doc thrm_annual_plan_doc_annual_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_doc
    ADD CONSTRAINT thrm_annual_plan_doc_annual_plan_id_fkey FOREIGN KEY (annual_plan_id) REFERENCES public.thrm_annual_plan(id);


--
-- TOC entry 8240 (class 2606 OID 86180)
-- Name: thrm_annual_plan_doc thrm_annual_plan_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_doc
    ADD CONSTRAINT thrm_annual_plan_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8241 (class 2606 OID 86185)
-- Name: thrm_annual_plan_status thrm_annual_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_status
    ADD CONSTRAINT thrm_annual_plan_id_fkey FOREIGN KEY (annual_plan_id) REFERENCES public.thrm_annual_plan(id);


--
-- TOC entry 8242 (class 2606 OID 86190)
-- Name: thrm_annual_plan_status thrm_annual_plan_status_create_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan_status
    ADD CONSTRAINT thrm_annual_plan_status_create_by_fkey FOREIGN KEY (create_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8238 (class 2606 OID 86195)
-- Name: thrm_annual_plan thrm_annual_plan_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_annual_plan
    ADD CONSTRAINT thrm_annual_plan_status_id_fkey FOREIGN KEY (current_status) REFERENCES public.thrm_annual_plan_status(id);


--
-- TOC entry 8243 (class 2606 OID 86200)
-- Name: thrm_attendance_record thrm_attendance_record_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_attendance_record
    ADD CONSTRAINT thrm_attendance_record_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8244 (class 2606 OID 86205)
-- Name: thrm_attendance_record thrm_attendance_record_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_attendance_record
    ADD CONSTRAINT thrm_attendance_record_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8245 (class 2606 OID 86210)
-- Name: thrm_attendance_record thrm_attendance_record_supervisor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_attendance_record
    ADD CONSTRAINT thrm_attendance_record_supervisor_id_fkey FOREIGN KEY (supervisor_id) REFERENCES public.tperson(id);


--
-- TOC entry 8246 (class 2606 OID 86215)
-- Name: thrm_decision thrm_decision_decision_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision
    ADD CONSTRAINT thrm_decision_decision_type_fkey FOREIGN KEY (decision_type) REFERENCES public.thrm_decision_type(id);


--
-- TOC entry 8248 (class 2606 OID 86220)
-- Name: thrm_decision_doc thrm_decision_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_doc
    ADD CONSTRAINT thrm_decision_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8249 (class 2606 OID 86225)
-- Name: thrm_decision_doc thrm_decision_doc_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_doc
    ADD CONSTRAINT thrm_decision_doc_decision_id_fkey FOREIGN KEY (decision_id) REFERENCES public.thrm_decision(id);


--
-- TOC entry 8250 (class 2606 OID 86230)
-- Name: thrm_decision_employee thrm_decision_employee_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_employee
    ADD CONSTRAINT thrm_decision_employee_decision_id_fkey FOREIGN KEY (decision_id) REFERENCES public.thrm_decision(id);


--
-- TOC entry 8251 (class 2606 OID 86235)
-- Name: thrm_decision_employee thrm_decision_employee_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_employee
    ADD CONSTRAINT thrm_decision_employee_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8252 (class 2606 OID 86240)
-- Name: thrm_decision_status thrm_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_status
    ADD CONSTRAINT thrm_decision_id_fkey FOREIGN KEY (decision_id) REFERENCES public.thrm_decision(id);


--
-- TOC entry 8253 (class 2606 OID 86245)
-- Name: thrm_decision_status thrm_decision_status_create_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_status
    ADD CONSTRAINT thrm_decision_status_create_by_fkey FOREIGN KEY (create_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8247 (class 2606 OID 86250)
-- Name: thrm_decision thrm_decision_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision
    ADD CONSTRAINT thrm_decision_status_id_fkey FOREIGN KEY (current_status) REFERENCES public.thrm_decision_status(id);


--
-- TOC entry 8254 (class 2606 OID 86255)
-- Name: thrm_decision_type thrm_decision_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_decision_type
    ADD CONSTRAINT thrm_decision_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8255 (class 2606 OID 86260)
-- Name: thrm_employee thrm_employee_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee
    ADD CONSTRAINT thrm_employee_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8258 (class 2606 OID 86265)
-- Name: thrm_employee_doc thrm_employee_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_doc
    ADD CONSTRAINT thrm_employee_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8259 (class 2606 OID 86270)
-- Name: thrm_employee_doc thrm_employee_doc_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_doc
    ADD CONSTRAINT thrm_employee_doc_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8260 (class 2606 OID 86275)
-- Name: thrm_employee_language thrm_employee_language_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_language
    ADD CONSTRAINT thrm_employee_language_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8261 (class 2606 OID 86280)
-- Name: thrm_employee_language thrm_employee_language_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_language
    ADD CONSTRAINT thrm_employee_language_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.thrm_language(id);


--
-- TOC entry 8256 (class 2606 OID 86285)
-- Name: thrm_employee thrm_employee_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee
    ADD CONSTRAINT thrm_employee_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8257 (class 2606 OID 86290)
-- Name: thrm_employee thrm_employee_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee
    ADD CONSTRAINT thrm_employee_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.tperson(id);


--
-- TOC entry 8449 (class 2606 OID 106382)
-- Name: thrm_employee_salary_adds thrm_employee_salary_adds_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adds
    ADD CONSTRAINT thrm_employee_salary_adds_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8448 (class 2606 OID 106372)
-- Name: thrm_employee_salary_adds thrm_employee_salary_adds_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adds
    ADD CONSTRAINT thrm_employee_salary_adds_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8461 (class 2606 OID 115430)
-- Name: thrm_employee_salary_adjustment thrm_employee_salary_adjustment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment
    ADD CONSTRAINT thrm_employee_salary_adjustment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8458 (class 2606 OID 115415)
-- Name: thrm_employee_salary_adjustment thrm_employee_salary_adjustment_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment
    ADD CONSTRAINT thrm_employee_salary_adjustment_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8460 (class 2606 OID 115425)
-- Name: thrm_employee_salary_adjustment thrm_employee_salary_adjustment_fin_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment
    ADD CONSTRAINT thrm_employee_salary_adjustment_fin_type_id_fkey FOREIGN KEY (fin_type_id) REFERENCES public.tfin_type(id);


--
-- TOC entry 8459 (class 2606 OID 115420)
-- Name: thrm_employee_salary_adjustment thrm_employee_salary_adjustment_salary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_adjustment
    ADD CONSTRAINT thrm_employee_salary_adjustment_salary_id_fkey FOREIGN KEY (salary_id) REFERENCES public.thrm_employee_salary(id);


--
-- TOC entry 8445 (class 2606 OID 106328)
-- Name: thrm_employee_salary_bonus thrm_employee_salary_bonus_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_bonus
    ADD CONSTRAINT thrm_employee_salary_bonus_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8444 (class 2606 OID 106318)
-- Name: thrm_employee_salary_bonus thrm_employee_salary_bonus_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_bonus
    ADD CONSTRAINT thrm_employee_salary_bonus_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8453 (class 2606 OID 115362)
-- Name: thrm_employee_salary thrm_employee_salary_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary
    ADD CONSTRAINT thrm_employee_salary_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8447 (class 2606 OID 106355)
-- Name: thrm_employee_salary_deductions thrm_employee_salary_deductions_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_deductions
    ADD CONSTRAINT thrm_employee_salary_deductions_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8446 (class 2606 OID 106345)
-- Name: thrm_employee_salary_deductions thrm_employee_salary_deductions_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_deductions
    ADD CONSTRAINT thrm_employee_salary_deductions_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8452 (class 2606 OID 115357)
-- Name: thrm_employee_salary thrm_employee_salary_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary
    ADD CONSTRAINT thrm_employee_salary_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8465 (class 2606 OID 115466)
-- Name: thrm_employee_salary_payroll_adjustment thrm_employee_salary_payroll_adjustment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment
    ADD CONSTRAINT thrm_employee_salary_payroll_adjustment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8462 (class 2606 OID 115451)
-- Name: thrm_employee_salary_payroll_adjustment thrm_employee_salary_payroll_adjustment_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment
    ADD CONSTRAINT thrm_employee_salary_payroll_adjustment_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8464 (class 2606 OID 115461)
-- Name: thrm_employee_salary_payroll_adjustment thrm_employee_salary_payroll_adjustment_fin_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment
    ADD CONSTRAINT thrm_employee_salary_payroll_adjustment_fin_type_id_fkey FOREIGN KEY (fin_type_id) REFERENCES public.tfin_type(id);


--
-- TOC entry 8463 (class 2606 OID 115456)
-- Name: thrm_employee_salary_payroll_adjustment thrm_employee_salary_payroll_adjustment_payroll_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll_adjustment
    ADD CONSTRAINT thrm_employee_salary_payroll_adjustment_payroll_id_fkey FOREIGN KEY (payroll_id) REFERENCES public.thrm_employee_salary_payroll(id);


--
-- TOC entry 8457 (class 2606 OID 115394)
-- Name: thrm_employee_salary_payroll thrm_employee_salary_payroll_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll
    ADD CONSTRAINT thrm_employee_salary_payroll_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8454 (class 2606 OID 115379)
-- Name: thrm_employee_salary_payroll thrm_employee_salary_payroll_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll
    ADD CONSTRAINT thrm_employee_salary_payroll_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8456 (class 2606 OID 115389)
-- Name: thrm_employee_salary_payroll thrm_employee_salary_payroll_fin_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll
    ADD CONSTRAINT thrm_employee_salary_payroll_fin_type_id_fkey FOREIGN KEY (fin_type_id) REFERENCES public.tfin_type(id);


--
-- TOC entry 8455 (class 2606 OID 115384)
-- Name: thrm_employee_salary_payroll thrm_employee_salary_payroll_salary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_payroll
    ADD CONSTRAINT thrm_employee_salary_payroll_salary_id_fkey FOREIGN KEY (salary_id) REFERENCES public.thrm_employee_salary(id);


--
-- TOC entry 8451 (class 2606 OID 115341)
-- Name: thrm_employee_salary_tax_rates thrm_employee_salary_tax_rates_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_salary_tax_rates
    ADD CONSTRAINT thrm_employee_salary_tax_rates_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8262 (class 2606 OID 86295)
-- Name: thrm_employee_skill thrm_employee_skill_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_skill
    ADD CONSTRAINT thrm_employee_skill_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8263 (class 2606 OID 86300)
-- Name: thrm_employee_skill thrm_employee_skill_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_skill
    ADD CONSTRAINT thrm_employee_skill_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8264 (class 2606 OID 86305)
-- Name: thrm_employee_sos_contact thrm_employee_sos_contact_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_sos_contact
    ADD CONSTRAINT thrm_employee_sos_contact_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8265 (class 2606 OID 86310)
-- Name: thrm_employee_sos_contact thrm_employee_sos_contact_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_employee_sos_contact
    ADD CONSTRAINT thrm_employee_sos_contact_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8266 (class 2606 OID 86315)
-- Name: thrm_leave thrm_leave_approved_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave
    ADD CONSTRAINT thrm_leave_approved_user_id_fkey FOREIGN KEY (approved_user_id) REFERENCES public.tparty(id);


--
-- TOC entry 8267 (class 2606 OID 86320)
-- Name: thrm_leave thrm_leave_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave
    ADD CONSTRAINT thrm_leave_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8268 (class 2606 OID 86325)
-- Name: thrm_leave thrm_leave_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave
    ADD CONSTRAINT thrm_leave_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8270 (class 2606 OID 86330)
-- Name: thrm_leave_entitlement thrm_leave_entitlement_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_entitlement
    ADD CONSTRAINT thrm_leave_entitlement_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8271 (class 2606 OID 86335)
-- Name: thrm_leave_entitlement thrm_leave_entitlement_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_entitlement
    ADD CONSTRAINT thrm_leave_entitlement_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8272 (class 2606 OID 86340)
-- Name: thrm_leave_entitlement thrm_leave_entitlement_leave_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_entitlement
    ADD CONSTRAINT thrm_leave_entitlement_leave_type_id_fkey FOREIGN KEY (leave_type_id) REFERENCES public.thrm_leave_type(id);


--
-- TOC entry 8269 (class 2606 OID 86345)
-- Name: thrm_leave thrm_leave_leave_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave
    ADD CONSTRAINT thrm_leave_leave_type_id_fkey FOREIGN KEY (leave_type_id) REFERENCES public.thrm_leave_type(id);


--
-- TOC entry 8273 (class 2606 OID 86350)
-- Name: thrm_leave_type thrm_leave_type_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_leave_type
    ADD CONSTRAINT thrm_leave_type_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8274 (class 2606 OID 86355)
-- Name: thrm_offical_travel thrm_offical_travel_approved_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_offical_travel
    ADD CONSTRAINT thrm_offical_travel_approved_user_id_fkey FOREIGN KEY (approved_user_id) REFERENCES public.tparty(id);


--
-- TOC entry 8275 (class 2606 OID 86360)
-- Name: thrm_offical_travel thrm_offical_travel_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_offical_travel
    ADD CONSTRAINT thrm_offical_travel_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8276 (class 2606 OID 86365)
-- Name: thrm_offical_travel thrm_offical_travel_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_offical_travel
    ADD CONSTRAINT thrm_offical_travel_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8277 (class 2606 OID 86370)
-- Name: thrm_offical_travel thrm_offical_travel_requested_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thrm_offical_travel
    ADD CONSTRAINT thrm_offical_travel_requested_user_id_fkey FOREIGN KEY (requested_user_id) REFERENCES public.tparty(id);


--
-- TOC entry 8278 (class 2606 OID 86375)
-- Name: timport_status timport_status_end_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timport_status
    ADD CONSTRAINT timport_status_end_user_fkey FOREIGN KEY (end_user) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8279 (class 2606 OID 86380)
-- Name: timport_status timport_status_mup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timport_status
    ADD CONSTRAINT timport_status_mup_id_fkey FOREIGN KEY (mup_id) REFERENCES public.tgis_mu_period(id);


--
-- TOC entry 8280 (class 2606 OID 86385)
-- Name: timport_status timport_status_start_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timport_status
    ADD CONSTRAINT timport_status_start_user_fkey FOREIGN KEY (start_user) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8281 (class 2606 OID 86390)
-- Name: tkfis_gen_documents tkfis_gen_documents_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tkfis_gen_documents
    ADD CONSTRAINT tkfis_gen_documents_by_fkey FOREIGN KEY (generated_by) REFERENCES public.tperson(id);


--
-- TOC entry 8220 (class 2606 OID 86395)
-- Name: tlayers_gis tlayers_gis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlayers_gis
    ADD CONSTRAINT tlayers_gis_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tlayers_gis(id);


--
-- TOC entry 8282 (class 2606 OID 86400)
-- Name: tlegsec_lawsuit tlegsec_lawsuit_claimant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit
    ADD CONSTRAINT tlegsec_lawsuit_claimant_id_fkey FOREIGN KEY (claimant_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8285 (class 2606 OID 86405)
-- Name: tlegsec_lawsuit_damage tlegsec_lawsuit_damage_lawsuit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_damage
    ADD CONSTRAINT tlegsec_lawsuit_damage_lawsuit_id_fkey FOREIGN KEY (lawsuit_id) REFERENCES public.tlegsec_lawsuit(id);


--
-- TOC entry 8286 (class 2606 OID 86410)
-- Name: tlegsec_lawsuit_damage tlegsec_lawsuit_damage_tree_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_damage
    ADD CONSTRAINT tlegsec_lawsuit_damage_tree_species_id_fkey FOREIGN KEY (tree_species_id) REFERENCES public.tfrm_tree_species(id);


--
-- TOC entry 8287 (class 2606 OID 86415)
-- Name: tlegsec_lawsuit_status tlegsec_lawsuit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_status
    ADD CONSTRAINT tlegsec_lawsuit_id_fkey FOREIGN KEY (lawsuit_id) REFERENCES public.tlegsec_lawsuit(id);


--
-- TOC entry 8283 (class 2606 OID 86420)
-- Name: tlegsec_lawsuit tlegsec_lawsuit_office_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit
    ADD CONSTRAINT tlegsec_lawsuit_office_id_fkey FOREIGN KEY (office_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8288 (class 2606 OID 86425)
-- Name: tlegsec_lawsuit_status tlegsec_lawsuit_status_create_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit_status
    ADD CONSTRAINT tlegsec_lawsuit_status_create_by_fkey FOREIGN KEY (create_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8284 (class 2606 OID 86430)
-- Name: tlegsec_lawsuit tlegsec_lawsuit_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlegsec_lawsuit
    ADD CONSTRAINT tlegsec_lawsuit_status_id_fkey FOREIGN KEY (current_status) REFERENCES public.tlegsec_lawsuit_status(id);


--
-- TOC entry 8289 (class 2606 OID 86435)
-- Name: tlinetemp tlinetemp_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlinetemp
    ADD CONSTRAINT tlinetemp_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.tperson(id);


--
-- TOC entry 8290 (class 2606 OID 86440)
-- Name: tlinetemp tlinetemp_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlinetemp
    ADD CONSTRAINT tlinetemp_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8291 (class 2606 OID 86445)
-- Name: tlocation tlocation_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlocation
    ADD CONSTRAINT tlocation_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8292 (class 2606 OID 86450)
-- Name: tlocation tlocation_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlocation
    ADD CONSTRAINT tlocation_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8293 (class 2606 OID 86455)
-- Name: tlog_devices tlog_devices_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_devices
    ADD CONSTRAINT tlog_devices_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8294 (class 2606 OID 86460)
-- Name: tlog_devices tlog_devices_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_devices
    ADD CONSTRAINT tlog_devices_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.tlog_vehicles(id);


--
-- TOC entry 8295 (class 2606 OID 86465)
-- Name: tlog_protocol_ports tlog_protocol_ports_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_protocol_ports
    ADD CONSTRAINT tlog_protocol_ports_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8296 (class 2606 OID 86470)
-- Name: tlog_vehicles tlog_vehicles_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles
    ADD CONSTRAINT tlog_vehicles_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8297 (class 2606 OID 86475)
-- Name: tlog_vehicles_register tlog_vehicles_register_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_register
    ADD CONSTRAINT tlog_vehicles_register_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8298 (class 2606 OID 86480)
-- Name: tlog_vehicles_register tlog_vehicles_register_vehicles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_register
    ADD CONSTRAINT tlog_vehicles_register_vehicles_id_fkey FOREIGN KEY (vehicles_id) REFERENCES public.tlog_vehicles(id);


--
-- TOC entry 8299 (class 2606 OID 86485)
-- Name: tlog_vehicles_service_maintenance tlog_vehicles_service_maintenance_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_service_maintenance
    ADD CONSTRAINT tlog_vehicles_service_maintenance_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8300 (class 2606 OID 86490)
-- Name: tlog_vehicles_service_maintenance tlog_vehicles_service_maintenance_vehicles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tlog_vehicles_service_maintenance
    ADD CONSTRAINT tlog_vehicles_service_maintenance_vehicles_id_fkey FOREIGN KEY (vehicles_id) REFERENCES public.tlog_vehicles(id);


--
-- TOC entry 8301 (class 2606 OID 86495)
-- Name: tmanagment_protocol_doc tmanagment_protocol_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmanagment_protocol_doc
    ADD CONSTRAINT tmanagment_protocol_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tparty(id);


--
-- TOC entry 8302 (class 2606 OID 86500)
-- Name: tmanagment_protocol_doc tmanagment_protocol_doc_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmanagment_protocol_doc
    ADD CONSTRAINT tmanagment_protocol_doc_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.tparty(id);


--
-- TOC entry 8303 (class 2606 OID 86505)
-- Name: tmer_evaluation_perf tmer_evaluation_perf_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_perf
    ADD CONSTRAINT tmer_evaluation_perf_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8304 (class 2606 OID 86510)
-- Name: tmer_evaluation_perf tmer_evaluation_perf_sub_indicator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_perf
    ADD CONSTRAINT tmer_evaluation_perf_sub_indicator_id_fkey FOREIGN KEY (sub_indicator_id) REFERENCES public.tmer_sub_indicator(id);


--
-- TOC entry 8305 (class 2606 OID 86515)
-- Name: tmer_evaluation_strat tmer_evaluation_strat_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_strat
    ADD CONSTRAINT tmer_evaluation_strat_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8306 (class 2606 OID 86520)
-- Name: tmer_evaluation_strat tmer_evaluation_strat_indicator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_evaluation_strat
    ADD CONSTRAINT tmer_evaluation_strat_indicator_id_fkey FOREIGN KEY (indicator_id) REFERENCES public.tmer_indicator(id);


--
-- TOC entry 8307 (class 2606 OID 86525)
-- Name: tmer_finance_donor tmer_finance_donor_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_finance_donor
    ADD CONSTRAINT tmer_finance_donor_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8308 (class 2606 OID 86530)
-- Name: tmer_finance_donor tmer_finance_donor_donor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_finance_donor
    ADD CONSTRAINT tmer_finance_donor_donor_id_fkey FOREIGN KEY (donor_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8309 (class 2606 OID 86535)
-- Name: tmer_finance_donor tmer_finance_donor_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_finance_donor
    ADD CONSTRAINT tmer_finance_donor_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8310 (class 2606 OID 86540)
-- Name: tmer_indicator tmer_indicator_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator
    ADD CONSTRAINT tmer_indicator_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8311 (class 2606 OID 86545)
-- Name: tmer_indicator tmer_indicator_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator
    ADD CONSTRAINT tmer_indicator_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8312 (class 2606 OID 86550)
-- Name: tmer_indicator_target tmer_indicator_target_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator_target
    ADD CONSTRAINT tmer_indicator_target_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8313 (class 2606 OID 86555)
-- Name: tmer_indicator_target tmer_indicator_target_sub_indicator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_indicator_target
    ADD CONSTRAINT tmer_indicator_target_sub_indicator_id_fkey FOREIGN KEY (sub_indicator_id) REFERENCES public.tmer_sub_indicator(id);


--
-- TOC entry 8314 (class 2606 OID 86560)
-- Name: tmer_plan_period tmer_plan_period_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_plan_period
    ADD CONSTRAINT tmer_plan_period_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8315 (class 2606 OID 86565)
-- Name: tmer_project tmer_project_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_project
    ADD CONSTRAINT tmer_project_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8316 (class 2606 OID 86570)
-- Name: tmer_ref_sub_projects tmer_ref_sub_projects_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_ref_sub_projects
    ADD CONSTRAINT tmer_ref_sub_projects_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8317 (class 2606 OID 86575)
-- Name: tmer_ref_sub_projects tmer_ref_sub_projects_ref_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_ref_sub_projects
    ADD CONSTRAINT tmer_ref_sub_projects_ref_strategy_id_fkey FOREIGN KEY (ref_strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8318 (class 2606 OID 86580)
-- Name: tmer_ref_sub_projects tmer_ref_sub_projects_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_ref_sub_projects
    ADD CONSTRAINT tmer_ref_sub_projects_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8319 (class 2606 OID 86585)
-- Name: tmer_resp_institutions tmer_resp_institutions_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_resp_institutions
    ADD CONSTRAINT tmer_resp_institutions_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8320 (class 2606 OID 86590)
-- Name: tmer_resp_institutions tmer_resp_institutions_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_resp_institutions
    ADD CONSTRAINT tmer_resp_institutions_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8321 (class 2606 OID 86595)
-- Name: tmer_resp_institutions tmer_resp_institutions_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_resp_institutions
    ADD CONSTRAINT tmer_resp_institutions_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8322 (class 2606 OID 86600)
-- Name: tmer_strategy tmer_strategy_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy
    ADD CONSTRAINT tmer_strategy_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8325 (class 2606 OID 86605)
-- Name: tmer_strategy_doc tmer_strategy_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_doc
    ADD CONSTRAINT tmer_strategy_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8326 (class 2606 OID 86610)
-- Name: tmer_strategy_doc tmer_strategy_doc_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_doc
    ADD CONSTRAINT tmer_strategy_doc_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8327 (class 2606 OID 86615)
-- Name: tmer_strategy_execution tmer_strategy_execution_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_execution
    ADD CONSTRAINT tmer_strategy_execution_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8328 (class 2606 OID 86620)
-- Name: tmer_strategy_execution tmer_strategy_execution_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy_execution
    ADD CONSTRAINT tmer_strategy_execution_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.tmer_strategy(id);


--
-- TOC entry 8323 (class 2606 OID 86625)
-- Name: tmer_strategy tmer_strategy_plan_period_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy
    ADD CONSTRAINT tmer_strategy_plan_period_id_fkey FOREIGN KEY (plan_period_id) REFERENCES public.tmer_plan_period(id);


--
-- TOC entry 8324 (class 2606 OID 86630)
-- Name: tmer_strategy tmer_strategy_sub_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_strategy
    ADD CONSTRAINT tmer_strategy_sub_project_id_fkey FOREIGN KEY (sub_project_id) REFERENCES public.tmer_sub_project(id);


--
-- TOC entry 8329 (class 2606 OID 86635)
-- Name: tmer_sub_indicator tmer_sub_indicator_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_indicator
    ADD CONSTRAINT tmer_sub_indicator_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8330 (class 2606 OID 86640)
-- Name: tmer_sub_indicator tmer_sub_indicator_indicator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_indicator
    ADD CONSTRAINT tmer_sub_indicator_indicator_id_fkey FOREIGN KEY (indicator_id) REFERENCES public.tmer_indicator(id);


--
-- TOC entry 8331 (class 2606 OID 86645)
-- Name: tmer_sub_indicator tmer_sub_indicator_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_indicator
    ADD CONSTRAINT tmer_sub_indicator_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.tuom(id);


--
-- TOC entry 8332 (class 2606 OID 86650)
-- Name: tmer_sub_project tmer_sub_project_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_project
    ADD CONSTRAINT tmer_sub_project_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8333 (class 2606 OID 86655)
-- Name: tmer_sub_project tmer_sub_project_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmer_sub_project
    ADD CONSTRAINT tmer_sub_project_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.tmer_project(id);


--
-- TOC entry 8335 (class 2606 OID 86660)
-- Name: torganisation_mun torganisation_mun_mun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torganisation_mun
    ADD CONSTRAINT torganisation_mun_mun_id_fkey FOREIGN KEY (mun_id) REFERENCES public.tgis_cadastral_municipality(id);


--
-- TOC entry 8336 (class 2606 OID 86665)
-- Name: torganisation_mun torganisation_mun_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torganisation_mun
    ADD CONSTRAINT torganisation_mun_org_id_fkey FOREIGN KEY (org_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8334 (class 2606 OID 86670)
-- Name: torganisation torganisation_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torganisation
    ADD CONSTRAINT torganisation_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tparty(id);


--
-- TOC entry 8337 (class 2606 OID 86675)
-- Name: tparcel_detail tparcel_detail_old_parcel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparcel_detail
    ADD CONSTRAINT tparcel_detail_old_parcel_id_fkey FOREIGN KEY (old_parcel_id) REFERENCES public.tgis_parcelgeom(id);


--
-- TOC entry 8338 (class 2606 OID 86680)
-- Name: tparcel_detail tparcel_detail_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparcel_detail
    ADD CONSTRAINT tparcel_detail_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.tparcel_owner(id);


--
-- TOC entry 8339 (class 2606 OID 86685)
-- Name: tparcel_detail tparcel_detail_parc_geom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparcel_detail
    ADD CONSTRAINT tparcel_detail_parc_geom_id_fkey FOREIGN KEY (parc_geom_id) REFERENCES public.tgis_parcelgeom(id);


--
-- TOC entry 8340 (class 2606 OID 86690)
-- Name: tparty tparty_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty
    ADD CONSTRAINT tparty_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.taddress(id);


--
-- TOC entry 8341 (class 2606 OID 86695)
-- Name: tparty_relationship tparty_relationship_from_relationship_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_relationship
    ADD CONSTRAINT tparty_relationship_from_relationship_fkey FOREIGN KEY (from_relationship) REFERENCES public.tparty(id);


--
-- TOC entry 8342 (class 2606 OID 86700)
-- Name: tparty_relationship tparty_relationship_to_relationship_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_relationship
    ADD CONSTRAINT tparty_relationship_to_relationship_fkey FOREIGN KEY (to_relationship) REFERENCES public.tparty(id);


--
-- TOC entry 8343 (class 2606 OID 86705)
-- Name: tparty_role tparty_role_party_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_role
    ADD CONSTRAINT tparty_role_party_id_fkey FOREIGN KEY (party_id) REFERENCES public.tparty(id);


--
-- TOC entry 8344 (class 2606 OID 86710)
-- Name: tparty_user tparty_user_party_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_user
    ADD CONSTRAINT tparty_user_party_id_fkey FOREIGN KEY (party_id) REFERENCES public.tparty(id);


--
-- TOC entry 8345 (class 2606 OID 86715)
-- Name: tparty_user tparty_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tparty_user
    ADD CONSTRAINT tparty_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.tuser(id);


--
-- TOC entry 8346 (class 2606 OID 86720)
-- Name: tperson tperson_party_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tperson
    ADD CONSTRAINT tperson_party_id_fkey FOREIGN KEY (party_id) REFERENCES public.tparty(id) ON DELETE CASCADE;


--
-- TOC entry 8347 (class 2606 OID 86725)
-- Name: tprcmt_dossier_question tprcmt_dossier_question_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_question
    ADD CONSTRAINT tprcmt_dossier_question_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8348 (class 2606 OID 86730)
-- Name: tprcmt_dossier_question tprcmt_dossier_question_dossier_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_question
    ADD CONSTRAINT tprcmt_dossier_question_dossier_request_id_fkey FOREIGN KEY (dossier_request_id) REFERENCES public.tprcmt_dossier_request(id);


--
-- TOC entry 8349 (class 2606 OID 86735)
-- Name: tprcmt_dossier_request tprcmt_dossier_request_bidder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_request
    ADD CONSTRAINT tprcmt_dossier_request_bidder_id_fkey FOREIGN KEY (bidder_id) REFERENCES public.tprcmt_tender_bidder(id);


--
-- TOC entry 8350 (class 2606 OID 86740)
-- Name: tprcmt_dossier_request tprcmt_dossier_request_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_request
    ADD CONSTRAINT tprcmt_dossier_request_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8351 (class 2606 OID 86745)
-- Name: tprcmt_dossier_request tprcmt_dossier_request_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_dossier_request
    ADD CONSTRAINT tprcmt_dossier_request_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES public.tprcmt_tender_request(id);


--
-- TOC entry 8352 (class 2606 OID 86750)
-- Name: tprcmt_tender_bid tprcmt_tender_bid_bidder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bid
    ADD CONSTRAINT tprcmt_tender_bid_bidder_id_fkey FOREIGN KEY (bidder_id) REFERENCES public.tprcmt_tender_bidder(id);


--
-- TOC entry 8353 (class 2606 OID 86755)
-- Name: tprcmt_tender_bid tprcmt_tender_bid_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bid
    ADD CONSTRAINT tprcmt_tender_bid_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8354 (class 2606 OID 86760)
-- Name: tprcmt_tender_bid tprcmt_tender_bid_tender_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bid
    ADD CONSTRAINT tprcmt_tender_bid_tender_request_id_fkey FOREIGN KEY (tender_request_id) REFERENCES public.tprcmt_tender_request(id);


--
-- TOC entry 8355 (class 2606 OID 86765)
-- Name: tprcmt_tender_bidder tprcmt_tender_bidder_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_bidder
    ADD CONSTRAINT tprcmt_tender_bidder_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8356 (class 2606 OID 86770)
-- Name: tprcmt_tender_complaint tprcmt_tender_complaint_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_complaint
    ADD CONSTRAINT tprcmt_tender_complaint_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8357 (class 2606 OID 86775)
-- Name: tprcmt_tender_complaint tprcmt_tender_complaint_tender_bid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_complaint
    ADD CONSTRAINT tprcmt_tender_complaint_tender_bid_id_fkey FOREIGN KEY (tender_bid_id) REFERENCES public.tprcmt_tender_bid(id);


--
-- TOC entry 8359 (class 2606 OID 86780)
-- Name: tprcmt_tender_request tprcmt_tender_request_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_request
    ADD CONSTRAINT tprcmt_tender_request_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8360 (class 2606 OID 86785)
-- Name: tprcmt_tender_request tprcmt_tender_request_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_request
    ADD CONSTRAINT tprcmt_tender_request_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8362 (class 2606 OID 86790)
-- Name: tprcmt_tender_status tprcmt_tender_status_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status
    ADD CONSTRAINT tprcmt_tender_status_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8363 (class 2606 OID 86795)
-- Name: tprcmt_tender_status_doc tprcmt_tender_status_doc_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status_doc
    ADD CONSTRAINT tprcmt_tender_status_doc_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8364 (class 2606 OID 86800)
-- Name: tprcmt_tender_status_doc tprcmt_tender_status_doc_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status_doc
    ADD CONSTRAINT tprcmt_tender_status_doc_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tprcmt_tender_status(id);


--
-- TOC entry 8365 (class 2606 OID 86805)
-- Name: tpublishing tpublishing_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpublishing
    ADD CONSTRAINT tpublishing_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.tperson(id);


--
-- TOC entry 8366 (class 2606 OID 86810)
-- Name: tpurchase_order tpurchase_order_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.tassets(id);


--
-- TOC entry 8367 (class 2606 OID 86815)
-- Name: tpurchase_order tpurchase_order_bpartner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_bpartner_id_fkey FOREIGN KEY (bpartner_id) REFERENCES public.tbpartner(id);


--
-- TOC entry 8368 (class 2606 OID 86820)
-- Name: tpurchase_order tpurchase_order_bpartner_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_bpartner_location_id_fkey FOREIGN KEY (bpartner_location_id) REFERENCES public.tbpartner_location(id);


--
-- TOC entry 8369 (class 2606 OID 86825)
-- Name: tpurchase_order tpurchase_order_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8370 (class 2606 OID 86830)
-- Name: tpurchase_order tpurchase_order_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.tcurrency(id);


--
-- TOC entry 8371 (class 2606 OID 86835)
-- Name: tpurchase_order tpurchase_order_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.tdp_mngmt(id);


--
-- TOC entry 8375 (class 2606 OID 86840)
-- Name: tpurchase_order_item tpurchase_order_item_bpartner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_bpartner_id_fkey FOREIGN KEY (bpartner_id) REFERENCES public.tbpartner(id);


--
-- TOC entry 8376 (class 2606 OID 86845)
-- Name: tpurchase_order_item tpurchase_order_item_bpartner_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_bpartner_location_id_fkey FOREIGN KEY (bpartner_location_id) REFERENCES public.tbpartner_location(id);


--
-- TOC entry 8377 (class 2606 OID 86850)
-- Name: tpurchase_order_item tpurchase_order_item_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8378 (class 2606 OID 86855)
-- Name: tpurchase_order_item tpurchase_order_item_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.tcurrency(id);


--
-- TOC entry 8379 (class 2606 OID 86860)
-- Name: tpurchase_order_item tpurchase_order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.tpurchase_order(id);


--
-- TOC entry 8380 (class 2606 OID 86865)
-- Name: tpurchase_order_item tpurchase_order_item_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.ttax(id);


--
-- TOC entry 8381 (class 2606 OID 86870)
-- Name: tpurchase_order_item tpurchase_order_item_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.tuom(id);


--
-- TOC entry 8382 (class 2606 OID 86875)
-- Name: tpurchase_order_item tpurchase_order_item_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_item
    ADD CONSTRAINT tpurchase_order_item_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8372 (class 2606 OID 86880)
-- Name: tpurchase_order tpurchase_order_requisition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_requisition_id_fkey FOREIGN KEY (requisition_id) REFERENCES public.trequisition(id);


--
-- TOC entry 8383 (class 2606 OID 86885)
-- Name: tpurchase_order_status tpurchase_order_status_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_status
    ADD CONSTRAINT tpurchase_order_status_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8373 (class 2606 OID 86890)
-- Name: tpurchase_order tpurchase_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tpurchase_order_status(id);


--
-- TOC entry 8384 (class 2606 OID 86895)
-- Name: tpurchase_order_status tpurchase_order_status_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_status
    ADD CONSTRAINT tpurchase_order_status_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.tpurchase_order(id);


--
-- TOC entry 8385 (class 2606 OID 86900)
-- Name: tpurchase_order_status tpurchase_order_status_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order_status
    ADD CONSTRAINT tpurchase_order_status_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8374 (class 2606 OID 86905)
-- Name: tpurchase_order tpurchase_order_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tpurchase_order
    ADD CONSTRAINT tpurchase_order_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8388 (class 2606 OID 86910)
-- Name: trbac_permission trbac_permission_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_permission
    ADD CONSTRAINT trbac_permission_object_id_fkey FOREIGN KEY (object_id) REFERENCES public.trbac_object(id);


--
-- TOC entry 8389 (class 2606 OID 86915)
-- Name: trbac_permission trbac_permission_operation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_permission
    ADD CONSTRAINT trbac_permission_operation_id_fkey FOREIGN KEY (operation_id) REFERENCES public.trbac_operation(id);


--
-- TOC entry 8390 (class 2606 OID 86920)
-- Name: trbac_permission trbac_permission_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_permission
    ADD CONSTRAINT trbac_permission_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.trbac_role(id);


--
-- TOC entry 8391 (class 2606 OID 86925)
-- Name: trbac_session trbac_session_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_session
    ADD CONSTRAINT trbac_session_user FOREIGN KEY (user_id) REFERENCES public.tuser(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 8392 (class 2606 OID 86930)
-- Name: trbac_user_role trbac_user_role_role; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_user_role
    ADD CONSTRAINT trbac_user_role_role FOREIGN KEY (role_id) REFERENCES public.trbac_role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 8393 (class 2606 OID 86935)
-- Name: trbac_user_role trbac_user_role_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trbac_user_role
    ADD CONSTRAINT trbac_user_role_user FOREIGN KEY (user_id) REFERENCES public.tuser(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7943 (class 2606 OID 86940)
-- Name: tref_economic_code tref_economic_code_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_economic_code
    ADD CONSTRAINT tref_economic_code_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tref_economic_code(id);


--
-- TOC entry 8394 (class 2606 OID 86945)
-- Name: tref_ekonomic_code tref_ekonomic_code_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tref_ekonomic_code
    ADD CONSTRAINT tref_ekonomic_code_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tref_ekonomic_code(id);


--
-- TOC entry 8402 (class 2606 OID 86950)
-- Name: trequisition_account trequisition_account_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_account
    ADD CONSTRAINT trequisition_account_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8403 (class 2606 OID 86955)
-- Name: trequisition_account trequisition_account_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_account
    ADD CONSTRAINT trequisition_account_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8398 (class 2606 OID 86960)
-- Name: trequisition trequisition_bpartner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_bpartner_id_fkey FOREIGN KEY (bpartner_id) REFERENCES public.tbpartner(id);


--
-- TOC entry 8399 (class 2606 OID 86965)
-- Name: trequisition trequisition_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8400 (class 2606 OID 86970)
-- Name: trequisition trequisition_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.tcurrency(id);


--
-- TOC entry 8401 (class 2606 OID 86975)
-- Name: trequisition trequisition_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.tdp_mngmt(id);


--
-- TOC entry 8404 (class 2606 OID 86980)
-- Name: trequisition_item trequisition_item_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item
    ADD CONSTRAINT trequisition_item_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8405 (class 2606 OID 86985)
-- Name: trequisition_item trequisition_item_requisition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item
    ADD CONSTRAINT trequisition_item_requisition_id_fkey FOREIGN KEY (requisition_id) REFERENCES public.trequisition(id);


--
-- TOC entry 8406 (class 2606 OID 86990)
-- Name: trequisition_item trequisition_item_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item
    ADD CONSTRAINT trequisition_item_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.tuom(id);


--
-- TOC entry 8407 (class 2606 OID 86995)
-- Name: trequisition_item trequisition_item_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_item
    ADD CONSTRAINT trequisition_item_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8395 (class 2606 OID 87000)
-- Name: trequisition trequisition_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.torganisation(id);


--
-- TOC entry 8408 (class 2606 OID 87005)
-- Name: trequisition_status trequisition_status_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_status
    ADD CONSTRAINT trequisition_status_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8396 (class 2606 OID 87010)
-- Name: trequisition trequisition_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.trequisition_status(id);


--
-- TOC entry 8409 (class 2606 OID 87015)
-- Name: trequisition_status trequisition_status_requisition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_status
    ADD CONSTRAINT trequisition_status_requisition_id_fkey FOREIGN KEY (requisition_id) REFERENCES public.trequisition(id);


--
-- TOC entry 8410 (class 2606 OID 87020)
-- Name: trequisition_status trequisition_status_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition_status
    ADD CONSTRAINT trequisition_status_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8397 (class 2606 OID 87025)
-- Name: trequisition trequisition_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequisition
    ADD CONSTRAINT trequisition_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8411 (class 2606 OID 87030)
-- Name: tshape_stand_treatment tshape_stand_treatment_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tshape_stand_treatment
    ADD CONSTRAINT tshape_stand_treatment_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES public.tgis_stand(id);


--
-- TOC entry 8412 (class 2606 OID 87035)
-- Name: tshape_stand_treatment tshape_stand_treatment_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tshape_stand_treatment
    ADD CONSTRAINT tshape_stand_treatment_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.tshape_treatment_name(id);


--
-- TOC entry 8413 (class 2606 OID 87040)
-- Name: tuom tuom_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom
    ADD CONSTRAINT tuom_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8415 (class 2606 OID 87045)
-- Name: tuom_trl tuom_trl_ad_language; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom_trl
    ADD CONSTRAINT tuom_trl_ad_language FOREIGN KEY (ad_language) REFERENCES public.tad_language(ad_language) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 8416 (class 2606 OID 87050)
-- Name: tuom_trl tuom_trl_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom_trl
    ADD CONSTRAINT tuom_trl_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tperson(id);


--
-- TOC entry 8417 (class 2606 OID 87055)
-- Name: tuom_trl tuom_trl_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom_trl
    ADD CONSTRAINT tuom_trl_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.tuom(id);


--
-- TOC entry 8418 (class 2606 OID 87060)
-- Name: tuom_trl tuom_trl_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom_trl
    ADD CONSTRAINT tuom_trl_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8414 (class 2606 OID 87065)
-- Name: tuom tuom_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuom
    ADD CONSTRAINT tuom_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES public.tperson(id);


--
-- TOC entry 8420 (class 2606 OID 87070)
-- Name: tuser_log tuser_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_log
    ADD CONSTRAINT tuser_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.tuser(id);


--
-- TOC entry 8419 (class 2606 OID 87075)
-- Name: tuser tuser_password_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_password_id_fkey FOREIGN KEY (password_id) REFERENCES public.tuser_password(id);


--
-- TOC entry 8421 (class 2606 OID 87080)
-- Name: tvehicles_staff_assign tvehicles_staff_assign_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_staff_assign
    ADD CONSTRAINT tvehicles_staff_assign_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8422 (class 2606 OID 87085)
-- Name: tvehicles_staff_assign tvehicles_staff_assign_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_staff_assign
    ADD CONSTRAINT tvehicles_staff_assign_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.thrm_employee(id);


--
-- TOC entry 8423 (class 2606 OID 87090)
-- Name: tvehicles_staff_assign tvehicles_staff_assign_vehicles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_staff_assign
    ADD CONSTRAINT tvehicles_staff_assign_vehicles_id_fkey FOREIGN KEY (vehicles_id) REFERENCES public.tlog_vehicles(id);


--
-- TOC entry 8424 (class 2606 OID 87095)
-- Name: tvehicles_tracking tvehicles_tracking_vehicles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tvehicles_tracking
    ADD CONSTRAINT tvehicles_tracking_vehicles_id_fkey FOREIGN KEY (vehicles_id) REFERENCES public.tlog_vehicles(id);


--
-- TOC entry 8361 (class 2606 OID 87100)
-- Name: tprcmt_tender_status tw_tender_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_status
    ADD CONSTRAINT tw_tender_request_id_fkey FOREIGN KEY (tender_request_id) REFERENCES public.tprcmt_tender_request(id);


--
-- TOC entry 8358 (class 2606 OID 87105)
-- Name: tprcmt_tender_request tw_tender_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tprcmt_tender_request
    ADD CONSTRAINT tw_tender_status_id_fkey FOREIGN KEY (current_status) REFERENCES public.tprcmt_tender_status(id);


--
-- TOC entry 8425 (class 2606 OID 87110)
-- Name: attribute_aliases fk_attribute_aliases_deviceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.attribute_aliases
    ADD CONSTRAINT fk_attribute_aliases_deviceid FOREIGN KEY (deviceid) REFERENCES traccar.devices(id) ON DELETE CASCADE;


--
-- TOC entry 8386 (class 2606 OID 87115)
-- Name: devices fk_device_group_groupid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.devices
    ADD CONSTRAINT fk_device_group_groupid FOREIGN KEY (groupid) REFERENCES traccar.groups(id) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- TOC entry 8428 (class 2606 OID 87120)
-- Name: events fk_event_deviceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.events
    ADD CONSTRAINT fk_event_deviceid FOREIGN KEY (deviceid) REFERENCES traccar.devices(id) ON DELETE CASCADE;


--
-- TOC entry 8429 (class 2606 OID 87125)
-- Name: geofences fk_geofence_calendar_calendarid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.geofences
    ADD CONSTRAINT fk_geofence_calendar_calendarid FOREIGN KEY (calendarid) REFERENCES traccar.calendars(id) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- TOC entry 8430 (class 2606 OID 87130)
-- Name: group_geofence fk_group_geofence_geofenceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.group_geofence
    ADD CONSTRAINT fk_group_geofence_geofenceid FOREIGN KEY (geofenceid) REFERENCES traccar.geofences(id) ON DELETE CASCADE;


--
-- TOC entry 8431 (class 2606 OID 87135)
-- Name: group_geofence fk_group_geofence_groupid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.group_geofence
    ADD CONSTRAINT fk_group_geofence_groupid FOREIGN KEY (groupid) REFERENCES traccar.groups(id) ON DELETE CASCADE;


--
-- TOC entry 8432 (class 2606 OID 87140)
-- Name: groups fk_group_group_groupid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.groups
    ADD CONSTRAINT fk_group_group_groupid FOREIGN KEY (groupid) REFERENCES traccar.groups(id) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- TOC entry 8433 (class 2606 OID 87145)
-- Name: notifications fk_notifications_userid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.notifications
    ADD CONSTRAINT fk_notifications_userid FOREIGN KEY (userid) REFERENCES traccar.users(id) ON DELETE CASCADE;


--
-- TOC entry 8387 (class 2606 OID 87150)
-- Name: positions fk_position_deviceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.positions
    ADD CONSTRAINT fk_position_deviceid FOREIGN KEY (deviceid) REFERENCES traccar.devices(id) ON DELETE CASCADE;


--
-- TOC entry 8434 (class 2606 OID 87155)
-- Name: user_calendar fk_user_calendar_geofenceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_calendar
    ADD CONSTRAINT fk_user_calendar_geofenceid FOREIGN KEY (calendarid) REFERENCES traccar.calendars(id) ON DELETE CASCADE;


--
-- TOC entry 8435 (class 2606 OID 87160)
-- Name: user_calendar fk_user_calendar_userid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_calendar
    ADD CONSTRAINT fk_user_calendar_userid FOREIGN KEY (userid) REFERENCES traccar.users(id) ON DELETE CASCADE;


--
-- TOC entry 8436 (class 2606 OID 87165)
-- Name: user_device fk_user_device_deviceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_device
    ADD CONSTRAINT fk_user_device_deviceid FOREIGN KEY (deviceid) REFERENCES traccar.devices(id) ON DELETE CASCADE;


--
-- TOC entry 8426 (class 2606 OID 87170)
-- Name: device_geofence fk_user_device_geofence_deviceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.device_geofence
    ADD CONSTRAINT fk_user_device_geofence_deviceid FOREIGN KEY (deviceid) REFERENCES traccar.devices(id) ON DELETE CASCADE;


--
-- TOC entry 8427 (class 2606 OID 87175)
-- Name: device_geofence fk_user_device_geofence_geofenceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.device_geofence
    ADD CONSTRAINT fk_user_device_geofence_geofenceid FOREIGN KEY (geofenceid) REFERENCES traccar.geofences(id) ON DELETE CASCADE;


--
-- TOC entry 8437 (class 2606 OID 87180)
-- Name: user_device fk_user_device_userid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_device
    ADD CONSTRAINT fk_user_device_userid FOREIGN KEY (userid) REFERENCES traccar.users(id) ON DELETE CASCADE;


--
-- TOC entry 8438 (class 2606 OID 87185)
-- Name: user_geofence fk_user_geofence_geofenceid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_geofence
    ADD CONSTRAINT fk_user_geofence_geofenceid FOREIGN KEY (geofenceid) REFERENCES traccar.geofences(id) ON DELETE CASCADE;


--
-- TOC entry 8439 (class 2606 OID 87190)
-- Name: user_geofence fk_user_geofence_userid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_geofence
    ADD CONSTRAINT fk_user_geofence_userid FOREIGN KEY (userid) REFERENCES traccar.users(id) ON DELETE CASCADE;


--
-- TOC entry 8440 (class 2606 OID 87195)
-- Name: user_group fk_user_group_groupid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_group
    ADD CONSTRAINT fk_user_group_groupid FOREIGN KEY (groupid) REFERENCES traccar.groups(id) ON DELETE CASCADE;


--
-- TOC entry 8441 (class 2606 OID 87200)
-- Name: user_group fk_user_group_userid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_group
    ADD CONSTRAINT fk_user_group_userid FOREIGN KEY (userid) REFERENCES traccar.users(id) ON DELETE CASCADE;


--
-- TOC entry 8442 (class 2606 OID 87205)
-- Name: user_user fk_user_user_manageduserid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_user
    ADD CONSTRAINT fk_user_user_manageduserid FOREIGN KEY (manageduserid) REFERENCES traccar.users(id) ON DELETE CASCADE;


--
-- TOC entry 8443 (class 2606 OID 87210)
-- Name: user_user fk_user_user_userid; Type: FK CONSTRAINT; Schema: traccar; Owner: -
--

ALTER TABLE ONLY traccar.user_user
    ADD CONSTRAINT fk_user_user_userid FOREIGN KEY (userid) REFERENCES traccar.users(id) ON DELETE CASCADE;


-- Completed on 2020-10-16 13:59:11

--
-- PostgreSQL database dump complete
--

