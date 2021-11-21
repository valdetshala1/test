--select * from tfin_output
--select * from tfin_annu_budget_alloc
--select * from tfin_budget_mainntenance

ALTER TABLE tfin_budget_mainntenance ADD budget_year INTEGER;



-- Creating function to get parent data for ekonomik code 
-- Used in Birt Report
CREATE FUNCTION parent_code(integer) RETURNS text AS $$
    select  code||'-'||name_al as cat from tfin_type ft where id = (
select parent_id from tfin_type ft where id = $1);
$$ LANGUAGE SQL;