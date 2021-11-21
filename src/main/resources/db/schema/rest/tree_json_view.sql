-- View: tree_json

-- DROP VIEW tree_json;

CREATE OR REPLACE VIEW tree_json AS 
 WITH RECURSIVE c AS (
                 SELECT tfrm_activity_domain.id, tfrm_activity_domain.parent_id, 
                    tfrm_activity_domain.code, tfrm_activity_domain.name_al, 
                    tfrm_activity_domain.name_en, tfrm_activity_domain.name_sr, 
                    tfrm_activity_domain.type, tfrm_activity_domain.sort, 
                    0 AS lvl
                   FROM tfrm_activity_domain
                  WHERE tfrm_activity_domain.id = 1 AND tfrm_activity_domain.parent_id IS NULL
        UNION ALL 
                 SELECT tfrm_activity_domain.id, tfrm_activity_domain.parent_id, 
                    tfrm_activity_domain.code, tfrm_activity_domain.name_al, 
                    tfrm_activity_domain.name_en, tfrm_activity_domain.name_sr, 
                    tfrm_activity_domain.type, tfrm_activity_domain.sort, 
                    c.lvl + 1 AS lvl
                   FROM tfrm_activity_domain
              JOIN c ON tfrm_activity_domain.parent_id = c.id
        ), maxlvl AS (
         SELECT max(c.lvl) AS maxlvl
           FROM c
        ), j AS (
                 SELECT c.id AS key, c.parent_id, c.code, c.name_al AS title, 
                    c.name_en, c.name_sr, c.type, c.sort, c.lvl, 
                    '[]'::json AS children
                   FROM c, maxlvl
                  WHERE c.lvl = maxlvl.maxlvl
        UNION ALL 
                 SELECT (v.c).id AS id, (v.c).parent_id AS parent_id, 
                    (v.c).code AS code, (v.c).name_al AS name_al, 
                    (v.c).name_en AS name_en, (v.c).name_sr AS name_sr, 
                    (v.c).type AS type, (v.c).sort AS sort, (v.c).lvl AS lvl, 
                    array_to_json(array_agg(v.j)) AS children
                   FROM ( SELECT c.*::record AS c, j.*::record AS j
                           FROM j
                      JOIN c ON j.parent_id = c.id) v
                  GROUP BY v.c
        )
 SELECT j.key, j.code, row_to_json(j.*)::text AS json_tree
   FROM j;

ALTER TABLE tree_json
  OWNER TO postgres;

