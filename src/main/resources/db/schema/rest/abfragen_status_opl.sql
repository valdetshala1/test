--KFA in status SUBMIT, APPROVED
--http://www.infoq.com/articles/seven-fallacies-of-bpm/
--http://docs.oracle.com/cd/E13228_01/fscm9pbr0/eng/psbooks/scin/chapter.htm?File=scin/htm/scin03.htm
--http://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/oim/oim_11g/Custom_Approval_Process_for_Role_Assignment/custom_approval_process_for_role_request.htm

select * from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id 
where s.status_code in ('NEW')

select count(h.*) from tfrm_stand_harvest_activity as h left join tfrm_activity as a on h.activity_id = a.id left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id where a.operation_level >= 1

-- KFA OPL = 1, Regional OPL = 2
select h.* from tfrm_stand_harvest_activity as h left join tfrm_activity as a on h.activity_id = a.id left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id 
left join thrm_employee as e on a.created_by = e.id 
where a.operation_level >= 1 and e.organisation_id = 100


select h.* from tfrm_stand_harvest_activity as h left join tfrm_activity as a on h.activity_id = a.id left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id 
left join thrm_employee as e on a.created_by = e.id left join tfrm_activity_status as s on h.status_id = s.id
where a.operation_level >= 1 and s.status != 'NEW'


select * from torganisation where id = 201

select h.* from tfrm_stand_harvest_activity as h left join tfrm_activity as a on h.activity_id = a.id left join 
tfrm_annual_planning as ap on a.annual_planning_id = ap.id left join thrm_employee as e on a.created_by = e.id 
where a.operation_level >= 2 and e.organisation_id = 201 and a.annual_planning_id = 1

/*

1) find from activity created_by the appropriate organisation
2) find from logged employee the appropriate organisation
3) if level > 1 and organisation are not identical, then filter the results

*/


select e.organisation_id from tfrm_activity as a left join thrm_employee as e on a.created_by = e.id where e.organisation_id = 100
select thrm_employee 



select a.*, s.* from tfrm_activity as a 
left join tfrm_annual_planning as p on a.annual_planning_id = p.id 
left join tfrm_activity_status s on a.id = s.activity_id 
where s.status = 'NEW' and p.id = 1

select a.*, s.* from tfrm_activity as a 
left join tfrm_annual_planning as p on a.annual_planning_id = p.id 
left join tfrm_activity_status s on a.id = s.activity_id 
where s.status = 'SUB' and p.id = 1

regional.offcier-pz@gmx.de

