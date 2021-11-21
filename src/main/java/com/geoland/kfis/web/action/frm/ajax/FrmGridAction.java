package com.geoland.kfis.web.action.frm.ajax;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.crypto.spec.SecretKeySpec;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.dao.services.RbacObjectDAO;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.logic.security.BoUserSecurity;
import com.geoland.kfis.logic.tree.ActivityDomainNode;
import com.geoland.kfis.logic.tree.ActivityDomainTree;
import com.geoland.kfis.logic.tree.AffRefProjectsNode;
import com.geoland.kfis.logic.tree.AffRefProjectsTree;
import com.geoland.kfis.logic.tree.InspectionNode;
import com.geoland.kfis.logic.tree.InspectionTree;
import com.geoland.kfis.logic.tree.LayerGisNode;
import com.geoland.kfis.logic.tree.LayerGisTree;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AffRefProjects;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.Confiscation;
import com.geoland.kfis.model.ConfiscationDetail;
import com.geoland.kfis.model.DecisionStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.FireDetails;
import com.geoland.kfis.model.FireReport;
import com.geoland.kfis.model.InspActionType;
import com.geoland.kfis.model.Inspection;
import com.geoland.kfis.model.InspectionDoc;
import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.OrganisationMun;
import com.geoland.kfis.model.PrivateActivity;
import com.geoland.kfis.model.PrivateRequest;
import com.geoland.kfis.model.PrivateRequestDoc;
import com.geoland.kfis.model.PrivateRequestImpl;
import com.geoland.kfis.model.ProtectionActivity;
import com.geoland.kfis.model.ProtectionImplDeclare;
import com.geoland.kfis.model.Road;
import com.geoland.kfis.model.RoadActivity;
import com.geoland.kfis.model.RoadImplDeclare;
import com.geoland.kfis.model.SeedActivity;
import com.geoland.kfis.model.SeedlingInventory;
import com.geoland.kfis.model.ShapeStandBiodiversity;
import com.geoland.kfis.model.ShapeStandTreatment;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.StandHarvestActivity;
import com.geoland.kfis.model.StandHarvestImplDeclare;
import com.geoland.kfis.model.StandHarvestImplTransport;
import com.geoland.kfis.model.StandHarvestMarked;
import com.geoland.kfis.model.StandPlantingActivity;
import com.geoland.kfis.model.StandPlantingImplDeclare;
import com.geoland.kfis.model.StandSilvicultureActivity;
import com.geoland.kfis.model.StandSilvicultureImplDeclare;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.model.view.ActivityDomainView;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.ActivityDomainDAO;
import com.geoland.kfis.persistence.dao.services.ActivityStatusDAO;
import com.geoland.kfis.persistence.dao.services.ActivityStatusDocDAO;
import com.geoland.kfis.persistence.dao.services.AffRefProjectsDAO;
import com.geoland.kfis.persistence.dao.services.AnnualPlanningDAO;
import com.geoland.kfis.persistence.dao.services.CompartmentDAO;
import com.geoland.kfis.persistence.dao.services.ConfiscationDAO;
import com.geoland.kfis.persistence.dao.services.ConfiscationDetailDAO;
import com.geoland.kfis.persistence.dao.services.FireDetailsDAO;
import com.geoland.kfis.persistence.dao.services.FireReportDAO;
import com.geoland.kfis.persistence.dao.services.InspActionTypeDAO;
import com.geoland.kfis.persistence.dao.services.InspectionDAO;
import com.geoland.kfis.persistence.dao.services.InspectionDocDAO;
import com.geoland.kfis.persistence.dao.services.LayersGisDAO;
import com.geoland.kfis.persistence.dao.services.ManagementUnitPeriodDAO;
import com.geoland.kfis.persistence.dao.services.PrivateActivityDAO;
import com.geoland.kfis.persistence.dao.services.PrivateRequestDAO;
import com.geoland.kfis.persistence.dao.services.PrivateRequestDocDAO;
import com.geoland.kfis.persistence.dao.services.PrivateRequestImplDAO;
import com.geoland.kfis.persistence.dao.services.ProtectionActivityDAO;
import com.geoland.kfis.persistence.dao.services.ProtectionImplDeclareDAO;
import com.geoland.kfis.persistence.dao.services.RoadActivityDAO;
import com.geoland.kfis.persistence.dao.services.RoadDAO;
import com.geoland.kfis.persistence.dao.services.RoadImplDeclareDAO;
import com.geoland.kfis.persistence.dao.services.SeedActivityDAO;
import com.geoland.kfis.persistence.dao.services.SeedlingInventoryDAO;
import com.geoland.kfis.persistence.dao.services.ShapeStandBiodiversityDAO;
import com.geoland.kfis.persistence.dao.services.ShapeStandTreatmentDAO;
import com.geoland.kfis.persistence.dao.services.StandDAO;
import com.geoland.kfis.persistence.dao.services.StandHarvestActivityDAO;
import com.geoland.kfis.persistence.dao.services.StandHarvestImplDeclareDAO;
import com.geoland.kfis.persistence.dao.services.StandHarvestMarkedDAO;
import com.geoland.kfis.persistence.dao.services.StandPlantingActivityDAO;
import com.geoland.kfis.persistence.dao.services.StandPlantingImplDeclareDAO;
import com.geoland.kfis.persistence.dao.services.StandSilvicultureActivityDAO;
import com.geoland.kfis.persistence.dao.services.StandSilvicultureImplDeclareDAO;
import com.geoland.kfis.persistence.dao.services.TreeSpeciesDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Employeerole;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
import com.geoland.kfis.web.action.frm.compartment.tree.LayersGisTree;
import com.mchange.v1.util.StringTokenizerUtils;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.io.WKTWriter;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

// TODO: Auto-generated Javadoc
/**
 * The Class FrmGridAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @created 4:08:48 PM
 * @Version 1.0
 */
public class FrmGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Get Annual Planning.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualPlanning() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//print(request);
		try{
			
			String sqlQuery="";
			String countQuery="";
			String mun_id = request.getParameter("mun_id");
			String lang=getLocale().getLanguage();
			String status = request.getParameter("status_icon");
			String year = request.getParameter("year");
			AnnualPlanningDAO dao = DAOFactory.getFactory().getAnnualPlanningDAO();
//			short opl = getUser().getOperationalLevel();
			Long orgId = 0L;
			if(getUser().getOrganisation()!=null) {
				orgId = getUser().getOrganisation().getId();
			}
			
			Character opl_val = getUser().getOrganisation().getOperLevelVal();
			
			String condtion = getCondition();
			if(filterParams!=null) {
				Iterator it=filterParams.entrySet().iterator();
				  while (it.hasNext()) {
					  Map.Entry pair = (Map.Entry)it.next();
					  if(pair.getKey().toString().equalsIgnoreCase("status_icon")) {
						  status=pair.getValue().toString();
					  }else if(pair.getKey().toString().equalsIgnoreCase("year")) {
						  year=pair.getValue().toString();
					  }
				  }
				
			}
			countQuery="select count(distinct(p.*)) from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id left join tgis_cadastral_municipality as m on m.id = mun_id "+ 
						" left join torganisation_mun org_mun on org_mun.mun_id=m.id where p.id is not null ";
			sqlQuery="select distinct(p.*),m.name,s.status from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id left join tgis_cadastral_municipality as m on m.id = mun_id "+ 
						" left join torganisation_mun org_mun on org_mun.mun_id=m.id  where p.id is not null ";
			
			if(opl_val=='C'){
				if(!isForestInstituteUser()){
				countQuery+= " and (s.status!='NEW' or p.mun_id is null) "; 
				sqlQuery+= " and (s.status!='NEW'  or p.mun_id is null) ";
				}else{
					countQuery+= " and p.mun_id is null"; 
					sqlQuery+= " and p.mun_id is null";
				}
			}else{
				countQuery+=" and  org_mun.org_id ="+orgId;
				sqlQuery+=" and org_mun.org_id ="+orgId;
				if(opl_val=='M'){
					countQuery+=" and s.status='APR'";
					sqlQuery+=" and s.status='APR'";
				}
			}
			if(StringUtils.isNotEmpty(mun_id)){
				countQuery += " and p.mun_id = " + mun_id;
				sqlQuery += " and p.mun_id = " + mun_id;
			}

			
			if(StringUtils.isNotEmpty(status)){
				countQuery += " and s.status ilike'" + status + "'";
				sqlQuery += " and s.status ilike '" + status + "'";
			}
			
			
			if(StringUtils.isNotEmpty(year)){
				countQuery += " and p.year = " + year;
		 		sqlQuery += " and p.year = " + year;
			}
			
		
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("status_icon")){
					ob_field = "s.status";
				}else if(ob_field.equals("mun_name")){
					ob_field = "m.name";
				}else if(ob_field.equals("tree_species")){
				}else if(ob_field.equals("status_icon")){
					
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<AnnualPlanning> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (AnnualPlanning o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("status_icon", getStatusIcon(o.getAnnualPlanningStatus().getStatus(),lang));
				if(o.getCadastralMunicipality()!=null){
					jsonObject.element("mun_id", o.getCadastralMunicipality().getId());
					jsonObject.element("mun_name", o.getCadastralMunicipality().getName());
				}
				jsonObject.element("year", o.getYear());
				jsonObject.element("created_by_id", o.getPerson().getId());
				jsonObject.element("created_by", o.getPerson().getFirstName()+" "+o.getPerson().getLastName());
				jsonObject.element("remarks", o.getRemarks());
				jsonObject.element("status_id", o.getAnnualPlanningStatus().getId());
				jsonObject.element("status", o.getAnnualPlanningStatus().getStatus());
				jsonObject.element("status_remarks", o.getAnnualPlanningStatus().getRemarks());				
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.annualPlanning", e);
			throw new BusinessException("FrmGridAction.annualPlanning", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Gets the status icon.
	 *
	 * @param statusCode the status code
	 * @param status the status
	 * @return icon
	 */
	private String getStatusIcon(String statusCode, String status){
		String icon = "status_" + statusCode.toLowerCase() + ".png";
		String content = "<img src='img/status/" + icon + "' border='0' alt='" + status + "'" + " title='" + status + "'" + "style='display: block; margin-left: auto; margin-right: auto;' align='center'/>";
		return content;
	}
	
	/**
	 * Gets the status icon.
	 *
	 * @param status the status
	 * @param language the language
	 * @return icon
	 */
	private String getStatusIcon(Activitystatus status,String language){
		String icon = "status_" + status.getDOMKEY().toLowerCase() + ".png";
		String title="al".equals(language)?status.getDOMTEXT():"en".equals(language)?status.getDOMTEXT_EN():status.getDOMTEXT_SR();
		String content = "<img src='img/status/" + icon + "' border='0' alt='" + title + "'" + " title='" + title + "'" + "style='display: block; margin-left: auto; margin-right: auto;' align='center'/>";
		return content;
	}
	
	/**
	 * Compartmen's.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void compartmens() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request= ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String language = getLocale().getLanguage();
			String sqlQuery="";
			String countQuery="";
			String mup_id = request.getParameter("mup_id");
			
			String region_names = request.getParameter("region_name");
			String comp_nrs = request.getParameter("comp_nr");
			if(StringUtils.isNotEmpty(mup_id)){
			
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			CompartmentDAO dao = DAOFactory.getFactory().getCompartmentDAO();
			
			countQuery = "select count(*) from tgis_compartment c left join tgis_cadastral_municipality as cm on cm.id=c.mun_id  where c.mup_id="+mup_id;
			sqlQuery = "select c.id,c.mun_id,cm.name,cm.name_en,cm.name_sr,c.comp_nr,c.remarks,comp.count as nr_stands ,(case when trunc(st_area(c.the_geom)/10000) > 0 " +
					"then trunc(st_area(c.the_geom)/10000)||'ha 'else '' end || trunc(((st_area(c.the_geom)/10000)-trunc(st_area(c.the_geom)/10000))*100)|| 'ar '||" +
					" round(((st_area(c.the_geom)/100)-trunc(st_area(c.the_geom)/100))\\:\\:numeric*100,2)||'m\u00B2')\\:\\:varchar as area_mask" +
					" from tgis_compartment c left join tgis_cadastral_municipality as cm on cm.id=c.mun_id left join" +
					" (select compartment_id,count(*) from tgis_stand where (status is null or status  not ilike 'DEL') group by compartment_id )comp on comp.compartment_id=c.id where c.mup_id="+mup_id; 
			
			
			if(getUser().getOperationalLevelVal()=='R'){
				Set<OrganisationMun> m=getUser().getOrganisation().getOrganisationMuns();
				OrganisationMun om=m.iterator().next();
				if(om!=null){
					Long reg_id=om.getCadastralMunicipality().getRegion().getId();
					countQuery+=" and cm.region_id="+reg_id;
					sqlQuery+=" and cm.region_id="+reg_id;
				}
			}
			
			String condtion = getCondition();
			if(filterParams!=null) {
				Iterator it=filterParams.entrySet().iterator();
				  while (it.hasNext()) {
					  Map.Entry pair = (Map.Entry)it.next();
					  if(pair.getKey().toString().equalsIgnoreCase("comp_nr")) {
						  comp_nrs=pair.getValue().toString();
					  }else if(pair.getKey().toString().equalsIgnoreCase("region_name")) {
						  region_names=pair.getValue().toString();
					  }
				  }
				
			}
			
			
			 if(StringUtils.isNotEmpty(region_names)){
				 countQuery+=" and (cm.name like '%"+region_names+"%' or cm.name_en like '%"+region_names+"%' OR cm.name_sr like '%"+region_names+"%')";
				 sqlQuery+=" and (cm.name like '%"+region_names+"%' or cm.name_en like '%"+region_names+"%' OR cm.name_sr like '%"+region_names+"%')";
			 }
			 if(StringUtils.isNotEmpty(comp_nrs)){
				 countQuery+=" and c.comp_nr='"+comp_nrs+"'";
				 sqlQuery+=" and c.comp_nr='"+comp_nrs+"'";
			 }
//			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
//				String order_by=getSidx();
//				if(order_by.equals("mu_name"))
//					order_by="mu.mu_name";
//				else if(order_by.equals("mun_name"))
//						order_by="cm.name";
//				else if(order_by.equals("region"))
//						order_by="cm.region_id";
//				else order_by=getSidx();
//				sqlQuery += " order by " + order_by + " " + getSord();
//			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			SQLQuery SQLQuery = s.createSQLQuery(sqlQuery);
			SQLQuery.addScalar("id", LongType.INSTANCE);
			SQLQuery.addScalar("name", StringType.INSTANCE);
			SQLQuery.addScalar("name_en", StringType.INSTANCE);
			SQLQuery.addScalar("name_sr", StringType.INSTANCE);
			SQLQuery.addScalar("comp_nr", StringType.INSTANCE);
			SQLQuery.addScalar("remarks", StringType.INSTANCE);
			SQLQuery.addScalar("nr_stands", IntegerType.INSTANCE);
			SQLQuery.addScalar("area_mask", StringType.INSTANCE);
			SQLQuery.addScalar("mun_id", LongType.INSTANCE);

			
			
			List list = SQLQuery.list();
//			List<Compartment> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				Long id = (Long) obj[0];
				String name = (String) obj[1];
				String name_en = (String) obj[2];
				String name_sr = (String) obj[3];
				String comp_nr = (String) obj[4];
				String remarks = (String) obj[5];
				Integer nr_stands = (Integer) obj[6];
				String area_mask = (String) obj[7];
				Long mun_id= (Long) obj[8];
				CadastralMunicipality mun= DAOFactory.getFactory().getCadastralMunicipalityDAO().get(mun_id);
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", id);
				String region_name = "al".equals(language)?name:"en".equals(language)?name_en:name_sr;
				jsonObject.element("region_name", region_name);
				jsonObject.element("comp_nr", comp_nr);
				jsonObject.element("note", remarks);
				jsonObject.element("nr_stands", nr_stands);
				jsonObject.element("area_mask", area_mask);
				jsonObject.element("mun_id", mun_id);
				String mun_name = "al".equals(language)?mun.getName():"en".equals(language)?mun.getNameEn():mun.getNameSr();
				jsonObject.element("mun_name", mun_name);
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.compartmens", e);
			throw new BusinessException("FrmGridAction.compartmens", e);
		} finally {
			out.close();
		}		
	}	

	
	
	/*
	forest_typ, stock_level, access_type, basal_area, estabilished_year, stand_height,
	stand_acres,perimeter,stand_type,crowncover,slope,littercov,age,origin,conifer,conifer_bon,
	decidouse,decidouse_bon,trees,volume_m3ha,conifer_perc,decidouse_perc,
	perc_0_30,perc_30_50,perc_50_70,perc_70_100,incr_perc,m2_ha,ds_con,ds_bro,
	cl1_perc_con,cl2_perc_con,cl3_perc_con,cl4_perc_con,
	cl1_perc_dec,cl2_perc_dec,cl3_perc_dec,cl4_perc_dec,
	damage_perc,estemate_volume,estimate_trees_per_ha,height_mean,
	tree1,tree2,tree3,survey_date,remarks,
	the_geom,the_geom_area,the_geom_length
	*/	
	/**
	 * Stand's.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void stands() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try{
			String language = getLocale().getLanguage();
			String sqlQuery = "";
			String countQuery = "";
			
			HttpServletRequest request=ServletActionContext.getRequest();

			String comp_id =  request.getParameter("comp_id");
			String mun_id = request.getParameter("mun_id");
			String stand_id = request.getParameter("stand_id");
			String for_harvest = request.getParameter("for_harvest");
			
			String comp_nr=request.getParameter("comp_nr");
			String stand_nr=request.getParameter("stand_nr");
			
			StandDAO dao = DAOFactory.getFactory().getStandDAO();
			
			
			String condtion = getCondition();
			if(filterParams!=null) {
				Iterator it=filterParams.entrySet().iterator();
				  while (it.hasNext()) {
					  Map.Entry pair = (Map.Entry)it.next();
					  if(pair.getKey().toString().equalsIgnoreCase("comp_nr")) {
						  comp_nr=pair.getValue().toString();
					  }else if(pair.getKey().toString().equalsIgnoreCase("stand_nr")) {
						  stand_nr=pair.getValue().toString();
					  }
				  }
				
			}
			
			countQuery = "select count(st.*) from tgis_stand as st " +
					" left join tgis_compartment as co on co.id = st.compartment_id " +
					" left join tgis_mu_period as mup on co.mup_id = mup.id " +
					" left join tgis_cadastral_municipality as cm on cm.id=co.mun_id where mup.isactive='Y' and (status is null or status  not ilike 'DEL')  ";
			sqlQuery = "select st.*,co.comp_nr from (select * from tgis_stand where status is null or status  not ilike 'DEL') as st " +
					" left join tgis_compartment as co on co.id = st.compartment_id " +
					" left join tgis_mu_period as mup on co.mup_id = mup.id " +
					" left join tgis_cadastral_municipality as cm on cm.id=co.mun_id where mup.isactive='Y' ";
			
			if(StringUtils.isNotEmpty(mun_id)){        
				
				countQuery = "select count(st.*) from tgis_stand as st left join tgis_compartment as co on co.id = st.compartment_id "+
						"left join tgis_mu_period as mup on mup.id = co.mup_id " +
						"where co.mun_id = " + mun_id + " and mup.isactive = 'Y' and  (status is null or status  not ilike 'DEL') ";			
				
				sqlQuery = "select st.id, st. compartment_id, st. stand_id, st. stand_nr,co.comp_nr, st. mngm_class, st. no_plots, " +
						"st.  minehazard, st. layers, st. access_type, st. basal_area, st. stand_type, st. crowncover, st. slope," +
						"st. littercov, st. age, st. origin, st. conifer, st. conifer_bon, st. decidouse, st.decidouse_bon, " +
						"st. trees, st. volume_m3ha, st. conifer_perc, st. decidouse_perc, st.perc_0_30, st. perc_30_50, " +
						"st. perc_50_70, st. perc_70_100, st. incr_perc, st. m2_ha, st. ds_con, st. ds_bro, " +
						"st. cl1_perc_con, st. cl2_perc_con, st. cl3_perc_con, st. cl4_perc_con, st. cl1_perc_dec, " +
						"st. cl2_perc_dec, st. cl3_perc_dec, st. cl4_perc_dec, st. damage_perc, st. estemate_volume, " +
						"st. estimate_trees_per_ha, st. height_mean, st.tree1, st. tree2, st. tree3, st. survey_date, null as the_geom, " +
						"st. remarks,st.status  from (select * from tgis_stand where status is null or status  not ilike 'DEL') as st left join tgis_compartment as co on co.id = st.compartment_id "+
						"left join tgis_mu_period as mup on mup.id = co.mup_id " +
						"where co.mun_id = " + mun_id + " and mup.isactive = 'Y'   ";
				
				if(StringUtils.isNotEmpty(comp_id)){
					countQuery += " and comp_nr = '" + comp_id+"'";
					sqlQuery += " and comp_nr = '" + comp_id+"'";
				}
				if(StringUtils.isNotEmpty(stand_id)){
					countQuery += " and stand_id='"+stand_id+"'";
					sqlQuery += " and stand_id='"+stand_id+"'"; 
				}
				if(StringUtils.isNotEmpty(for_harvest) && for_harvest!=null && for_harvest.equals("true")){
					countQuery+=" and ((st.volume_m3ha is not null and st.volume_m3ha!=0)  OR (st.estemate_volume is not null and st.estemate_volume!=0)) ";
					sqlQuery+=" and ((st.volume_m3ha is not null and st.volume_m3ha!=0)  OR (st.estemate_volume is not null and st.estemate_volume!=0)) ";
				}
			}else{

				if(StringUtils.isNotEmpty(comp_id)){
					countQuery += " and compartment_id="+comp_id;
					sqlQuery += " and compartment_id="+comp_id; 
				}
				if(StringUtils.isNotEmpty(stand_id)){
					countQuery += " and stand_id="+stand_id;
					sqlQuery += " and stand_id="+stand_id; 
				}
				if(getUser().getOperationalLevelVal()=='R'){
					Set<OrganisationMun> m=getUser().getOrganisation().getOrganisationMuns();
					OrganisationMun om=m.iterator().next();
					if(om!=null){
						Long reg_id=om.getCadastralMunicipality().getRegion().getId();
						countQuery+=" and cm.region_id="+reg_id;
						sqlQuery+=" and cm.region_id="+reg_id;
					}
				}

			}
			
			/*
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				sqlQuery += " order by st." + getSidx() + " " + getSord();
			}
			*/
			if(StringUtils.isNotEmpty(comp_nr)){
				countQuery += " and co.comp_nr ilike '%"+comp_nr+"%' ";
				sqlQuery += " and co.comp_nr ilike '%"+comp_nr+"%' ";
			}
			if(StringUtils.isNotEmpty(stand_nr)){
				countQuery += " and st.stand_nr ilike '%"+stand_nr+"%'";
				sqlQuery += " and st.stand_nr ilike '%"+stand_nr+"%' ";
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<Stand> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for (Stand o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("comp_objectid", o.getCompartment().getId());
				jsonObject.element("comp_id", o.getCompartment().getId());
				jsonObject.element("comp_nr", o.getCompartment().getCompNr());
				jsonObject.element("stand_id", o.getStandId());
				jsonObject.element("mgmt_unit", o.getCompartment().getManagementUnit().getMuName());
				if(o.getMngmClass()!=null){
					if("en".equals(language))
						jsonObject.element("mngmclass", o.getMngmClass().getDOMTEXT_EN());
					else if("sr".equals(language))
						jsonObject.element("mngmclass", o.getMngmClass().getDOMTEXT_SR());
					else jsonObject.element("mngmclass", o.getMngmClass().getDOMTEXT());
				}
				//jsonObject.element("forest_typ", o.getForestTyp());
				//jsonObject.element("stock_level", o.getStockLevel());
				jsonObject.element("access_type", "en".equals(language)?o.getAccessType().getDOMTEXT_EN():"sr".equals(language)?o.getAccessType().getDOMTEXT_SR():o.getAccessType().getDOMTEXT());
				jsonObject.element("basal_area", o.getBasalArea());
				//jsonObject.element("estabilished_year", o.getEstabilishedYear());
				//jsonObject.element("stand_height", o.getStandHeight());
				//jsonObject.element("stand_acres", o.getStandAcres());
				//jsonObject.element("perimeter", o.getPerimeter());
				jsonObject.element("stand_type", "en".equals(language)?o.getStandType().getDOMTEXT_EN():"sr".equals(language)?o.getStandType().getDOMTEXT_SR():o.getStandType().getDOMTEXT());
				jsonObject.element("crowncover", o.getCrowncover());
				jsonObject.element("slope", o.getSlope());
				jsonObject.element("stand_nr", o.getStandNr());
				jsonObject.element("comp_nr", o.getCompartment().getCompNr());
				jsonObject.element("littercov", o.getLittercov());
				jsonObject.element("age", o.getAge());
				jsonObject.element("origin", o.getOrigin());
				jsonObject.element("conifer", o.getTreeSpeciesByConifer()!=null?o.getTreeSpeciesByConifer().getNameAl():"");
				jsonObject.element("conifer_bon", o.getConiferBon());
				jsonObject.element("decidouse", o.getTreeSpeciesByDecidouse()!=null?o.getTreeSpeciesByDecidouse().getNameAl():"");
				jsonObject.element("decidouse_bon", o.getDecidouseBon());
				jsonObject.element("trees", o.getTrees());
				jsonObject.element("volume_m3ha", o.getVolumeM3ha());
				jsonObject.element("conifer_perc", o.getConiferPerc());
				jsonObject.element("decidouse_perc", o.getDecidousePerc());
				jsonObject.element("perc_0_30", o.getPerc030());				
				jsonObject.element("perc_30_50", o.getPerc3050());
				jsonObject.element("perc_50_70", o.getPerc5070());
				jsonObject.element("perc_70_100", o.getPerc70100());
				jsonObject.element("incr_perc", o.getIncrPerc());
				jsonObject.element("m2_ha", o.getM2Ha());
				jsonObject.element("ds_con", o.getDsCon());
				jsonObject.element("ds_bro", o.getDsBro());
				jsonObject.element("cl1_perc_con", o.getCl1PercCon());
				jsonObject.element("cl2_perc_con", o.getCl2PercCon());
				jsonObject.element("cl3_perc_con", o.getCl3PercCon());
				jsonObject.element("cl4_perc_con", o.getCl4PercCon());
				jsonObject.element("cl1_perc_dec", o.getCl1PercDec());
				jsonObject.element("cl2_perc_dec", o.getCl2PercDec());
				jsonObject.element("cl3_perc_dec", o.getCl3PercDec());
				jsonObject.element("cl4_perc_dec", o.getCl4PercDec());
				jsonObject.element("damage_perc", o.getDamagePerc());
				if(o.getEstimateVolume()!=null) 
					jsonObject.element("estemate_volume", o.getEstimateVolume().getCode());
				jsonObject.element("estimate_trees_per_ha", (o.getEstimateTreesPerHa()!=null && !"fake".equals(o.getEstimateTreesPerHa().getDOMTEXT().toString())) ?o.getEstimateTreesPerHa().getDOMTEXT():"");
				jsonObject.element("height_mean", o.getHeightMean());
				
				if("en".equals(language)){
				jsonObject.element("tree1", o.getTreeSpeciesByTree1()!=null?o.getTreeSpeciesByTree1().getNameEn():"");
				jsonObject.element("tree2", o.getTreeSpeciesByTree2()!=null?o.getTreeSpeciesByTree2().getNameEn():"");
				jsonObject.element("tree3", o.getTreeSpeciesByTree3()!=null?o.getTreeSpeciesByTree3().getNameEn():"");
				}else if("sr".equals(language)){
					jsonObject.element("tree1", o.getTreeSpeciesByTree1()!=null?o.getTreeSpeciesByTree1().getNameSr():"");
					jsonObject.element("tree2", o.getTreeSpeciesByTree2()!=null?o.getTreeSpeciesByTree2().getNameSr():"");
					jsonObject.element("tree3", o.getTreeSpeciesByTree3()!=null?o.getTreeSpeciesByTree3().getNameSr():"");
				}else{
					jsonObject.element("tree1", o.getTreeSpeciesByTree1()!=null?o.getTreeSpeciesByTree1().getNameAl():"");
					jsonObject.element("tree2", o.getTreeSpeciesByTree2()!=null?o.getTreeSpeciesByTree2().getNameAl():"");
					jsonObject.element("tree3", o.getTreeSpeciesByTree3()!=null?o.getTreeSpeciesByTree3().getNameAl():"");
				}
				
				if(o.getSurveyDate()!=null)
					jsonObject.element("survey_date", DATE_FORMAT.format(o.getSurveyDate()));
				jsonObject.element("remarks", o.getRemarks());
				jsonObject.element("region", o.getCompartment().getManagementUnit().getRegion().getName());
				jsonObject.element("municipality", o.getCompartment().getCadastralMunicipality().getName());
				jsonObject.element("status", o.getStatus());

				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.stands", e);
			throw new BusinessException("FrmGridAction.stands", e);
		} finally {
			out.close();
		}		
	}	
	
	
	
	/**
	 * standActivity.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void standActivity() throws IOException, BusinessException {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try{
			
			String annualplanId = request.getParameter("annualplanId");
			String comp_nr=request.getParameter("comp_nr");
			String stand_nr=request.getParameter("stand_nr");
			
			if(StringUtils.isNotEmpty(annualplanId)){
			
				String lang = getLocale().getLanguage().toLowerCase();
				String sqlQuery="";
				String countQuery="";
				
				StandHarvestActivityDAO dao = DAOFactory.getFactory().getStandHarvestActivityDAO();
				Long orgId = getUser().getOrganisation().getId();
				Character opl_val = getUser().getOrganisation().getOperLevelVal();

				countQuery="select count(h.*) from tfrm_stand_harvest_activity as h left join tgis_stand as st on  h.stand_id=st.id left join tgis_compartment as co on co.id = st.compartment_id  "+
					" left join tfrm_activity as a on h.activity_id = a.id "+
					" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
					" left join tfrm_activity_status as s on h.status_id = s.id  "+
					" left join tfrm_tree_species as t on t.id = h.tree_species_id "+
					" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
				sqlQuery="select h.* from tfrm_stand_harvest_activity as h left join tgis_stand as st on  h.stand_id=st.id left join tgis_compartment as co on co.id = st.compartment_id "+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id  "+
						" left join tfrm_tree_species as t on t.id = h.tree_species_id "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
				if(opl_val=='C'){
					countQuery+=" where s.status!='NEW' ";
					sqlQuery+=" where s.status!='NEW' ";
				}else{
					countQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
								" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
								" where org_mun.org_id ="+orgId;
					sqlQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
							" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
							" where org_mun.org_id ="+orgId;
					if(opl_val=='M'){
						countQuery+=" and s.status='TER'";
						sqlQuery+=" and s.status='TER'";
					}
				}
				
				countQuery+=" and a.annual_planning_id = "+annualplanId;
				sqlQuery+=" and a.annual_planning_id = "+annualplanId;
				
				String activity_id = request.getParameter("activity_id");
				if(StringUtils.isNotEmpty(activity_id)){
					countQuery += " and a.activity_domain_id = " + activity_id;
					sqlQuery += " and a.activity_domain_id = " + activity_id;
				}
				
				String tree_species_id = request.getParameter("tree_species_id");
				if(StringUtils.isNotEmpty(tree_species_id)){
					countQuery += " and h.tree_species_id = " + tree_species_id;
					sqlQuery += " and h.tree_species_id = " + tree_species_id;
				}					
					
				String status = request.getParameter("status_icon");
				if(StringUtils.isNotEmpty(status)){
					countQuery += " and s.status = '" + status + "'";
					sqlQuery += " and s.status = '" + status + "'";
				}				
				
				if(StringUtils.isNotEmpty(comp_nr)){
					countQuery += " and co.comp_nr ilike '"+comp_nr+"' ";
					sqlQuery += " and co.comp_nr ilike '"+comp_nr+"' ";
				}
				if(StringUtils.isNotEmpty(stand_nr)){
					countQuery += " and st.stand_nr ilike '"+stand_nr+"' ";
					sqlQuery += " and st.stand_nr ilike '"+stand_nr+"' ";
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("status_icon")){
						ob_field = "s.status";
					}else if(ob_field.equals("activity")){
						ob_field = "ad.name_"+lang;
					}else if(ob_field.equals("tree_species")){
						ob_field = "t.name_"+lang;
					}else if(ob_field.equals("status_icon")){
						
					}
				
					sqlQuery += " order by " + ob_field + " " + getSord();
				}

				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<StandHarvestActivity> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (StandHarvestActivity o : list) {
	
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("status_icon", getStatusIcon(o.getActivityStatus().getStatus(),lang));
					jsonObject.element("activity_id", o.getActivity().getId());
					
					if("en".equals(lang)){
						jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
					}else if("al".equals(lang)){
						jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
					}else{
						jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
					}
					
					jsonObject.element("annual_planning_id", o.getActivity().getAnnualPlanning().getId());
					jsonObject.element("municipality", o.getActivity().getAnnualPlanning().getCadastralMunicipality().getName());
					
					jsonObject.element("stand_id", o.getStand().getStandId());
					jsonObject.element("stand_nr", o.getStand().getStandNr());
					jsonObject.element("comp_nr", o.getStand().getCompartment().getCompNr());
					jsonObject.element("comp_id", o.getStand().getCompartment().getId());
					jsonObject.element("status_id", o.getActivityStatus().getId());
					jsonObject.element("status_code", o.getActivityStatus().getStatus().getDOMKEY());
					jsonObject.element("tree_species_id", o.getTreeSpecies().getId());
					if("al".equals(lang)){
						jsonObject.element("tree_species", o.getTreeSpecies().getNameAl());
					}else if("sr".equals(lang)){
						jsonObject.element("tree_species", o.getTreeSpecies().getNameSr());	
					}else{
						jsonObject.element("tree_species", o.getTreeSpecies().getNameEn());
					}
					jsonObject.element("work_stage", o.getWorkStage());
					jsonObject.element("remakrs", o.getRemarks());
					
					jsonObject.element("pl_tech_volume", o.getPlTechVolume());
					jsonObject.element("pl_fire_volume", o.getPlFireVolume());
					jsonObject.element("pl_pulp_volume", o.getPlPulpVolume());
					if(o.getPlCreatedDate()!=null)
						jsonObject.element("pl_created_date", DATE_FORMAT.format(o.getPlCreatedDate()));
					jsonObject.element("pl_created_by", o.getPersonByPlCreatedBy().getFirstName()+" "+o.getPersonByPlCreatedBy().getLastName());
					
					jsonObject.element("im_tech_volume", o.getImTechVolume());
					jsonObject.element("im_fire_volume", o.getImFireVolume());
					jsonObject.element("im_pulp_volume", o.getImPulpVolume());
					if(o.getImCreatedDate()!=null)
						jsonObject.element("im_created_date",  DATE_FORMAT.format(o.getImCreatedDate()));
					if(o.getPersonByImCreatedBy()!=null)
						jsonObject.element("im_created_by", o.getPersonByImCreatedBy().getFirstName()+" "+o.getPersonByImCreatedBy().getLastName());
					
					jsonObject.element("damage_volume", o.getDamageVolume());
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
	
				out.append(data.toString());
				out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.standActivity", e);
			throw new BusinessException("FrmGridAction.standActivity", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * protection.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void protection() throws IOException, BusinessException {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			//print(request);
			String annualplanId = request.getParameter("annualplanId");
			if(StringUtils.isNotEmpty(annualplanId)){
				String lang = getLocale().getLanguage().toLowerCase();
				String sqlQuery="";
				String countQuery="";
				
				ProtectionActivityDAO dao=DAOFactory.getFactory().getProtectionActivityDAO();
//				countQuery ="select count(*) from tfrm_protection_activity";
//				sqlQuery ="select * from tfrm_protection_activity"; //order by comp_id asc
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					sqlQuery += " order by " + getSidx() + " " + getSord();
				}
				Long orgId = getUser().getOrganisation().getId();
				Character opl_val = getUser().getOrganisation().getOperLevelVal();

				countQuery="select count(h.*) from tfrm_protection_activity as h "+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id"+
						" left join tunits_metric as un on un.id = h.measure_unit_id"+
						" left join tgis_management_unit as mu on mu.id = h.mu_id";
				sqlQuery="select h.* from tfrm_protection_activity as h "+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id  "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id"+
						" left join tunits_metric as un on un.id = h.measure_unit_id"+
						" left join tgis_management_unit as mu on mu.id = h.mu_id";
				if(opl_val=='C'){
					countQuery+=" where s.status!='NEW' ";
					sqlQuery+=" where s.status!='NEW'";
				}else{
					countQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
								" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
								" where org_mun.org_id ="+orgId;
					sqlQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
							" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
							" where org_mun.org_id ="+orgId;
					if(opl_val=='M'){
						countQuery+=" and s.status='APR'";
						sqlQuery+=" and s.status='APR'";
					}
				}
				
				countQuery+=" and a.annual_planning_id = "+annualplanId;
				sqlQuery+=" and a.annual_planning_id = "+annualplanId;
				
				String activity_id = request.getParameter("activity_id");
				if(StringUtils.isNotEmpty(activity_id)){
					countQuery += " and a.activity_domain_id = " + activity_id;
					sqlQuery += " and a.activity_domain_id = " + activity_id;
				}
				
				String status = request.getParameter("status_icon");
				if(StringUtils.isNotEmpty(status)){
					countQuery += " and s.status = '" + status + "'";
					sqlQuery += " and s.status = '" + status + "'";
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("status_icon")){
						ob_field = "s.status";
					}else if(ob_field.equals("activity")){
						ob_field = "ad.name_"+lang;
					}else if(ob_field.equals("units_metric")){
						ob_field = ("al".equals(lang)?"un.name":"en".equals(lang)?"un.name_en":"un.name_sr");
					}else if(ob_field.equals("management_unit")){
						ob_field="mu.mu_name";
					}
					
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				
				List<ProtectionActivity> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (ProtectionActivity o:list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("activity_id", o.getActivity().getId());
					if("en".equals(lang)){
						jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
					}else if("al".equals(lang)){
						jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
					}else{
						jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
					}
					jsonObject.element("status_icon", getStatusIcon(o.getActivityStatus().getStatus(),lang));
					jsonObject.element("status_id", o.getActivityStatus().getId());
					jsonObject.element("cadastralMunicipality", o.getCadastralMunicipality().getName());
					jsonObject.element("work_stage", o.getWorkStage());
					jsonObject.element("units_metric", o.getUnitsMetric().getName());
					jsonObject.element("management_unit", o.getManagementUnit().getMuName());
					jsonObject.element("pl_value", o.getPlValue());
					jsonObject.element("im_value", o.getImValue());
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.protection", e);
			throw new BusinessException("FrmGridAction.protection", e);
		} finally {
			out.close();
		}		
	}	
	
	
	
	/**
	 * silviculture.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void silviculture() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String annualplanId = request.getParameter("annualplanId");
			String comp_nr=request.getParameter("comp_nr");
			String stand_nr=request.getParameter("stand_nr");
			if(StringUtils.isNotEmpty(annualplanId)){
			
				String lang = getLocale().getLanguage().toLowerCase();
				String sqlQuery="";
				String countQuery="";
				
				StandSilvicultureActivityDAO dao=DAOFactory.getFactory().getStandSilvicultureActivityDAO();
				Long orgId = getUser().getOrganisation().getId();
				Character opl_val = getUser().getOrganisation().getOperLevelVal();
			
				countQuery="select count(h.*) from tfrm_stand_silviculture_activity as h  left join tgis_stand as st on  h.stand_id=st.id left join tgis_compartment as co on co.id = st.compartment_id 	"+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
				sqlQuery="select h.* from tfrm_stand_silviculture_activity as h  left join tgis_stand as st on  h.stand_id=st.id left join tgis_compartment as co on co.id = st.compartment_id 	 "+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id  "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
				if(opl_val=='C'){
					countQuery+=" where s.status!='NEW' ";
					sqlQuery+=" where s.status!='NEW' ";
				}else{
					countQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
								" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
								" where org_mun.org_id ="+orgId;
					sqlQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
							" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
							" where org_mun.org_id ="+orgId;
					if(opl_val=='M'){
						countQuery+=" and s.status='APR'";
						sqlQuery+=" and s.status='APR'";
					}
				}
				
				countQuery+=" and a.annual_planning_id = "+annualplanId;
				sqlQuery+=" and a.annual_planning_id = "+annualplanId;
				
				String status = request.getParameter("status_icon");
				if(StringUtils.isNotEmpty(status)){
					countQuery += " and s.status = '" + status + "'";
					sqlQuery += " and s.status = '" + status + "'";
				}
				String activity_id = request.getParameter("activity_id");
				if(StringUtils.isNotEmpty(activity_id)){
					countQuery += " and a.activity_domain_id = " + activity_id;
					sqlQuery += " and a.activity_domain_id = " + activity_id;
				}
				String tree_species_group = request.getParameter("tree_species_group");
				if(StringUtils.isNotEmpty(tree_species_group)){
					countQuery += " and h.tree_species_group = " + tree_species_group;
					sqlQuery += " and h.tree_species_group = " + tree_species_group;
				}
				if(StringUtils.isNotEmpty(comp_nr)){
					countQuery += " and co.comp_nr ilike '"+comp_nr+"' ";
					sqlQuery += " and co.comp_nr ilike '"+comp_nr+"' ";
				}
				if(StringUtils.isNotEmpty(stand_nr)){
					countQuery += " and st.stand_nr ilike '"+stand_nr+"' ";
					sqlQuery += " and st.stand_nr ilike '"+stand_nr+"' ";
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("status_icon")){
						ob_field = "s.status";
					}else if(ob_field.equals("activity")){
						ob_field = "ad.name_"+getLocale().getLanguage();
					}else if(ob_field.equals("tree_species_group")){
						ob_field = "h.tree_species_group";
					}
				
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<StandSilvicultureActivity> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (StandSilvicultureActivity o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("activity_id", o.getActivity().getId());
				jsonObject.element("status_icon", getStatusIcon(o.getActivityStatus().getStatus(),lang));

				if("en".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
				}else{
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
				}
				if(o.getTreeSpeciesGroup()!=null){
					if("en".equals(lang)){
						jsonObject.element("tree_species_group", o.getTreeSpeciesGroup().getDOMTEXT_EN());
					}else if("al".equals(lang)){
						jsonObject.element("tree_species_group", o.getTreeSpeciesGroup().getDOMTEXT());
					}else{
						jsonObject.element("tree_species_group", o.getTreeSpeciesGroup().getDOMTEXT_SR());
					}
				}
				jsonObject.element("status_id", o.getActivityStatus().getId());
				jsonObject.element("stand_id", o.getStand().getStandId());
				jsonObject.element("stand_nr", o.getStand().getStandNr());
				jsonObject.element("comp_nr", o.getStand().getCompartment().getCompNr());
				//jsonObject.element("comp_id", o.getStand().getCompartment().getCompId());
				jsonObject.element("work_stage", o.getWorkStage());
				jsonObject.element("pl_area", o.getPlArea());
				if(o.getPlCreatedDate()!=null)
					jsonObject.element("pl_created_date", DATE_FORMAT.format(o.getPlCreatedDate()));
				jsonObject.element("pl_created_by", o.getPersonByPlCreatedBy().getFirstName()+" "+o.getPersonByPlCreatedBy().getLastName());
				jsonObject.element("im_area", o.getImArea());
				if(o.getImCreatedDate()!=null)
					jsonObject.element("im_created_date", DATE_FORMAT.format(o.getImCreatedDate()));
				if(o.getPersonByImCreatedBy()!=null)
					jsonObject.element("im_created_by", o.getPersonByImCreatedBy().getFirstName()+" "+o.getPersonByImCreatedBy().getLastName());
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.silviculture", e);
			throw new BusinessException("FrmGridAction.silviculture", e);
		} finally {
			out.close();
		}
	}	

	/**
	 * standActivity.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void planting() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request=ServletActionContext.getRequest();
		try{
			//print(request);
			String lang = getLocale().getLanguage().toLowerCase();
			String annualplanId = request.getParameter("annualplanId");
			String comp_nr=request.getParameter("comp_nr");
			String stand_nr=request.getParameter("stand_nr");
			if(StringUtils.isNotEmpty(annualplanId)){
			
			String sqlQuery="";
			String countQuery="";
			
			StandPlantingActivityDAO dao=DAOFactory.getFactory().getStandPlantingActivityDAO();
			
			Long orgId = getUser().getOrganisation().getId();			
			Character opl_val = getUser().getOrganisation().getOperLevelVal();

			countQuery="select count(h.*) from tfrm_stand_planting_activity as h  left join tgis_stand as st on  h.stand_id=st.id left join tgis_compartment as co on co.id = st.compartment_id 	"+
					" left join tfrm_activity as a on h.activity_id = a.id "+
					" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
					" left join tfrm_activity_status as s on h.status_id = s.id "+
					" left join tfrm_tree_species as t on t.id = h.tree_species_id "+
					" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
			sqlQuery="select h.* from tfrm_stand_planting_activity as h   left join tgis_stand as st on  h.stand_id=st.id left join tgis_compartment as co on co.id = st.compartment_id 	"+
					" left join tfrm_activity as a on h.activity_id = a.id "+
					" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
					" left join tfrm_activity_status as s on h.status_id = s.id  "+
					" left join tfrm_tree_species as t on t.id = h.tree_species_id "+
					" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
			if(opl_val=='C'){
				countQuery+=" where s.status!='NEW' ";
				sqlQuery+=" where s.status!='NEW' ";
			}else{
				countQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
							" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
							" where org_mun.org_id ="+orgId;
				sqlQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
						" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
						" where org_mun.org_id ="+orgId;
				if(opl_val=='M'){
					countQuery+=" and s.status='APR'";
					sqlQuery+=" and s.status='APR'";
				}
			}
			
			countQuery+=" and a.annual_planning_id = "+annualplanId;
			sqlQuery+=" and a.annual_planning_id = "+annualplanId;
			
			String status = request.getParameter("status_icon");
			if(StringUtils.isNotEmpty(status)){
				countQuery += " and s.status = '" + status + "'";
				sqlQuery += " and s.status = '" + status + "'";
			}
			String activity_id = request.getParameter("activity_id");
			if(StringUtils.isNotEmpty(activity_id)){
				countQuery += " and a.activity_domain_id = " + activity_id;
				sqlQuery += " and a.activity_domain_id = " + activity_id;
			}
			String tree_species_id = request.getParameter("tree_species_id");
			if(StringUtils.isNotEmpty(tree_species_id)){
				countQuery += " and h.tree_species_id = " + tree_species_id;
				sqlQuery += " and h.tree_species_id = " + tree_species_id;
			}
			if(StringUtils.isNotEmpty(comp_nr)){
				countQuery += " and co.comp_nr ilike '"+comp_nr+"' ";
				sqlQuery += " and co.comp_nr ilike '"+comp_nr+"' ";
			}
			if(StringUtils.isNotEmpty(stand_nr)){
				countQuery += " and st.stand_nr ilike '"+stand_nr+"' ";
				sqlQuery += " and st.stand_nr ilike '"+stand_nr+"' ";
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("status_icon")){
					ob_field = "s.status";
				}else if(ob_field.equals("activity")){
					ob_field = "ad.name_"+lang;
				}else if(ob_field.equals("tree_species")){
					ob_field = "t.name_"+lang;
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<StandPlantingActivity> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (StandPlantingActivity o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("status_icon", getStatusIcon(o.getActivityStatus().getStatus(),lang));
				jsonObject.element("stand_id", o.getStand().getStandId());
				jsonObject.element("comp_id", o.getStand().getCompartment().getId());
				jsonObject.element("stand_nr", o.getStand().getStandNr());
				jsonObject.element("comp_nr", o.getStand().getCompartment().getCompNr());
				jsonObject.element("activity_id", o.getActivity().getId());
				
				if("en".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
				}else{
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
				}
				if("en".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
				}else{
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
				}
				
				if("al".equals(lang)){
					jsonObject.element("tree_species", o.getTreeSpecies().getNameAl());
				}else if("sr".equals(lang)){
					jsonObject.element("tree_species", o.getTreeSpecies().getNameSr());	
				}else{
					jsonObject.element("tree_species", o.getTreeSpecies().getNameEn());
				}
				jsonObject.element("status_id", o.getActivityStatus().getId());
				jsonObject.element("work_stage", o.getWorkStage());
				jsonObject.element("pl_area", o.getPlArea());
				jsonObject.element("pl_trees", o.getPlTrees());
				if(o.getPlCreatedDate()!=null)
					jsonObject.element("pl_created_date", DATE_FORMAT.format(o.getPlCreatedDate()));
				if(o.getPersonByPlCreatedBy()!=null)
					jsonObject.element("pl_created_by", o.getPersonByPlCreatedBy().getFirstName()+" "+o.getPersonByPlCreatedBy().getLastName());
				jsonObject.element("im_area", o.getImArea());
				jsonObject.element("im_trees", o.getImTrees());
				if(o.getImCreatedDate()!=null)
					jsonObject.element("im_created_date",  DATE_FORMAT.format(o.getImCreatedDate()));
				if(o.getPersonByImCreatedBy()!=null)
					jsonObject.element("im_created_by", o.getPersonByImCreatedBy().getFirstName()+" "+o.getPersonByImCreatedBy().getLastName());
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();}
		}catch (Exception e){
			log.error("FrmGridAction.planting", e);
			throw new BusinessException("FrmGridAction.planting", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * road.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void road() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang = getLocale().getLanguage().toLowerCase();
			HttpServletRequest request=ServletActionContext.getRequest();
			String sqlQuery="";
			String countQuery="";
			
			RoadDAO dao=DAOFactory.getFactory().getRoadDAO();
			
			countQuery = "select count(*) from tgis_road";
			sqlQuery = "select * from tgis_road ";
			String munId=request.getParameter("munId");
			if(StringUtils.isNotEmpty(munId)){
				countQuery+=" where mun_id="+munId+" ";
				sqlQuery+=" where mun_id="+munId+" ";
			}
//			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
//				sqlQuery += " order by " + getSidx() + " " + getSord();
//			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<Road> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (Road r : list) {

				JSONObject jo = new JSONObject();
				jo.element("id", r.getId());
				
				jo.element("cadastralMunId", r.getCadastralMunicipality().getId());
				if("en".equals(lang)){
					jo.element("cadMunName", r.getCadastralMunicipality().getNameEn());
				}else if("sr".equals(lang)){
					jo.element("cadMunName", r.getCadastralMunicipality().getNameSr());
				}else{
					jo.element("cadMunName", r.getCadastralMunicipality().getName());
				}
				jo.element("mu_id", r.getMuId());
				jo.element("name", r.getRoadName());
				if(r.getRoadType()!=null)
				jo.element("roadType", r.getRoadType().getDOMNAME());
				else
					jo.element("roadType", "");
				
				jo.element("accessType", r.getAccessType());
//				jo.element("roadStatus", r.getRoadStatus());
				jo.element("lastActivityYear", r.getLastActivityYear());
				jo.element("roadLength", r.getRoadLength());
				jo.element("createdDate", DATE_FORMAT.format(r.getCreatedDate()));
				if(r.getPerson()!=null)
					jo.element("createdBy", r.getPerson().getFirstName()+" "+r.getPerson().getLastName());
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.road", e);
			throw new BusinessException("FrmGridAction.road", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * infrastructure.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void infrastructure() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try{
			String lang = getLocale().getLanguage().toLowerCase();
			
			String sqlQuery="";
			String countQuery="";
			String annualplanId = request.getParameter("annualplanId");
			if(StringUtils.isNotEmpty(annualplanId)){
				RoadActivityDAO dao=DAOFactory.getFactory().getRoadActivityDAO();
				Long orgId = getUser().getOrganisation().getId();			
				Character opl_val = getUser().getOrganisation().getOperLevelVal();

				countQuery="select count(h.*) from tfrm_road_activity as h "+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id  "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
				sqlQuery="select h.* from tfrm_road_activity as h "+
						" left join tfrm_activity as a on h.activity_id = a.id "+
						" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
						" left join tfrm_activity_status as s on h.status_id = s.id  "+
						" left join tgis_road r on h.road_id=r.id "+
						" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
				if(opl_val=='C'){
					countQuery+=" where s.status!='NEW' ";
					sqlQuery+=" where s.status!='NEW' ";
				}else{
					countQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
								" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
								" where org_mun.org_id ="+orgId;
					sqlQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
							" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
							" where org_mun.org_id ="+orgId;
					if(opl_val=='M'){
						countQuery+=" and s.status='APR'";
						sqlQuery+=" and s.status='APR'";
					}
				}
				
				countQuery+=" and a.annual_planning_id = "+annualplanId;
				sqlQuery+=" and a.annual_planning_id = "+annualplanId;
				
				String activity_id = request.getParameter("activity_id");
				if(StringUtils.isNotEmpty(activity_id)){
					countQuery += " and a.activity_domain_id = " + activity_id;
					sqlQuery += " and a.activity_domain_id = " + activity_id;
				}
				
				String status = request.getParameter("status_icon");
				if(StringUtils.isNotEmpty(status)){
					countQuery += " and s.status = '" + status + "'";
					sqlQuery += " and s.status = '" + status + "'";
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("status_icon")){
						ob_field = "s.status";
					}else if(ob_field.equals("activity")){
						ob_field = "ad.name_"+lang;
					}else if(ob_field.equals("road_name")){
						ob_field = "r.road_name";
					}
				
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<RoadActivity> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (RoadActivity r : list) {
	
					JSONObject jo = new JSONObject();
					jo.element("id", r.getId());
					jo.element("road_name", r.getRoad().getRoadName());
					jo.element("road_id", r.getRoad().getId());
					if("en".equals(lang)){
						jo.element("activity", r.getActivity().getActivityDomain().getNameEn());
					}else if("al".equals(lang)){
						jo.element("activity", r.getActivity().getActivityDomain().getNameAl());
					}else{
						jo.element("activity", r.getActivity().getActivityDomain().getNameSr());
					}
					jo.element("activity_id", r.getActivity().getId());
					jo.element("status_icon", getStatusIcon(r.getActivityStatus().getStatus(),lang));
					jo.element("status_id", r.getActivityStatus().getId());
					jo.element("work_stage", r.getWorkStage());
					jo.element("pl_lenght", r.getPlLenght());
					jo.element("pl_start_m", r.getPlStartM());
					jo.element("pl_width", r.getPlWidth());
					jo.element("pl_end_m", r.getPlEndM());
					if(r.getPersonByPlCreatedBy()!=null)
						jo.element("pl_created_by", r.getPersonByPlCreatedBy().getFirstName()+" "+r.getPersonByPlCreatedBy().getLastName());
					if(r.getPlCreatedDate()!=null)
						jo.element("pl_created_ate", DATE_FORMAT.format(r.getPlCreatedDate()));
					jo.element("im_lenght", r.getImLenght());
					jo.element("im_start_m", r.getImStartM());
					jo.element("im_width", r.getImWidth());
					jo.element("im_end_m", r.getImEndM());
					if(r.getImCreatedDate()!=null)
						jo.element("im_created_date", DATE_FORMAT.format(r.getImCreatedDate()));
					if(r.getPersonByImCreatedBy()!=null)
						jo.element("im_reated_by", r.getPersonByImCreatedBy().getFirstName()+" "+r.getPersonByImCreatedBy().getLastName());
					
					rows.add(jo);
				}
				data.element("rows", rows);
	
				out.append(data.toString());
				out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.infrastructure", e);
			throw new BusinessException("FrmGridAction.infrastructure", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * Seed activity grid.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void seedActivityGrid() throws IOException,BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			SeedActivityDAO dao=DAOFactory.getFactory().getSeedActivityDAO();
			String annualplanId = request.getParameter("annualplanId");
			String inventory= request.getParameter("inventory");
			
			
			if(StringUtils.isNotEmpty(annualplanId) || StringUtils.isNotEmpty(inventory)){
				String sqlQuery="";
				String countQuery="";
				Character opl_val = getUser().getOrganisation().getOperLevelVal();
				boolean isForestInstituteUser=isForestInstituteUser();
				if(StringUtils.isNotEmpty(inventory)){
					countQuery="select count(h.*) from tfrm_seed_activity as h where h.work_stage='I'";
					sqlQuery="select h.* from tfrm_seed_activity as h where h.work_stage='I'";
					
				}else {
					countQuery="select count(distinct(h.*)) from tfrm_seed_activity as h "+
							" left join tfrm_activity as a on h.activity_id = a.id "+
							" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
							" left join tfrm_annual_planning_status as aps on aps.annual_planning_id = ap.id "+
							" left join tfrm_activity_status as s on h.status_id = s.id "+
							" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
					sqlQuery="select distinct(h.*) from tfrm_seed_activity as h "+
							" left join tfrm_activity as a on h.activity_id = a.id "+
							" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
							" left join tfrm_annual_planning_status as aps on aps.annual_planning_id = ap.id "+
							" left join tfrm_activity_status as s on h.status_id = s.id  "+
							" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
					if(opl_val=='C'){
						countQuery+=" where ((s.status!='NEW' and aps.status!='NEW') ";
						sqlQuery+=" where ((s.status!='NEW' and aps.status!='NEW') ";
						if(isForestInstituteUser){
							countQuery+=" OR ap.mun_id is null) and";
							sqlQuery+=" OR ap.mun_id is null) and";
						}else{
							countQuery+=") and";
							sqlQuery+=") and";
						}
					}else{
						countQuery+=" where ";
						sqlQuery+=" where ";
					}
					
					countQuery+=" a.annual_planning_id = "+annualplanId;
					sqlQuery+=" a.annual_planning_id = "+annualplanId;
					
				}
				
				Integer count=dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<SeedActivity> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				String lang = getLocale().getLanguage().toLowerCase();
				JSONArray rows = new JSONArray();
				
				for(SeedActivity s: list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", s.getId());
					if("en".equals(lang)){
						jsonObject.element("activity", s.getActivity().getActivityDomain().getNameEn());
					}else if("al".equals(lang)){
						jsonObject.element("activity", s.getActivity().getActivityDomain().getNameAl());
					}else{
						jsonObject.element("activity", s.getActivity().getActivityDomain().getNameSr());
					}
					jsonObject.element("status_icon", getStatusIcon(s.getActivityStatus().getStatus(),lang));
					jsonObject.element("status_id", s.getActivityStatus().getId());
					if(lang.equals("en"))
						jsonObject.element("treeSpecies", s.getTreeSpecies().getNameEn());
					else if(lang.equals("al"))
						jsonObject.element("treeSpecies", s.getTreeSpecies().getNameAl());
					else if(lang.equals("sr"))
						jsonObject.element("treeSpecies", s.getTreeSpecies().getNameSr());
					else
						jsonObject.element("treeSpecies", s.getTreeSpecies().getNameLa());
					
					jsonObject.element("institute", s.getInstitute());
					jsonObject.element("prodType", s.getProdType());
					jsonObject.element("workStage", s.getWorkStage());
					jsonObject.element("prValue", s.getPrValue());
					jsonObject.element("plValue", s.getPlValue());
					jsonObject.element("exValue", s.getExValue());
					jsonObject.element("activity_id", s.getActivity().getId());
					jsonObject.element("imValue", s.getImValue());
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
				
				out.append(data.toString());
				out.flush();
			}			
		}
		catch(Exception e){
			log.error("FrmGridAction.seedActivityGrid",e);
			throw new BusinessException("FrmGridAction.seedActivityGrid",e);
		} 
		finally {
			out.close();
		}
	}
	
	
	/**
	 * Domain tree JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	@SuppressWarnings("unchecked")
	public void domainTreeJSON() throws IOException,BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			 String query = "select * from tree_json where code='SILVC'"; 
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 sqlQuery.addEntity(ActivityDomainView.class);
			 List<ActivityDomainView> rez = sqlQuery.list();
			 if(rez != null && !rez.isEmpty()){
				 JSONObject root = (JSONObject) JSONSerializer.toJSON(rez.get(0).getId().getJsonTree());
				 String lang = getLocale().getLanguage().toLowerCase();
				 updateLanguage(root, lang);
				 
				 //String jsonTree = "[" + rez.get(0).getId().getJsonTree() + "]";
				 String jsonTree = "[" + root.toString() + "]";
				 
				 out.append(jsonTree);
				 out.flush();
			 }
			
			
		}
		catch(Exception e){
			log.error("FrmGridAction.domainTreeJSON",e);
			throw new BusinessException("FrmGridAction.domainTreeJSON",e);
		} 
		finally {
			out.close();
		}
		
	}
	
	
	/**
	 * Update language.
	 *
	 * @param obj the obj
	 * @param lang the lang
	 */
	protected void updateLanguage(JSONObject obj, String lang){
		obj.put("expand", true);
		if("en".equals(lang)){
			obj.remove("title");
			String name_en = obj.getString("name_en");
			obj.put("title", name_en);
		}else if("sr".equals(lang)){
			String name_sr = obj.getString("name_sr");
			obj.put("title", name_sr);
		}
		
		JSONArray children = obj.getJSONArray("children");
		for (Object object : children) {
			JSONObject jo = (JSONObject) object;
			updateLanguage(jo, lang);
		}
	}
	
	/**
	 * privateRequest.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void privateRequest() throws IOException, BusinessException {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			//print(request);
			String lang = getLocale().getLanguage().toLowerCase();
			
			String sqlQuery="";
			String countQuery="";
			
			PrivateRequestDAO dao=DAOFactory.getFactory().getPrivateRequestDAO();
			String annualplanId = request.getParameter("annualplanId");
			String isRequester=request.getParameter("isRequester");
			if(StringUtils.isNotEmpty(annualplanId)){
			countQuery = "select count(*) from tfrm_private_request as p left join tfrm_activity as a on p.activity_id=a.id where a.annual_planning_id="+annualplanId;
			sqlQuery = "select * from tfrm_private_request as p left join tfrm_activity as a on p.activity_id=a.id where a.annual_planning_id="+annualplanId; //order by comp_id asc
			if(isRequester.equalsIgnoreCase("true")){
				countQuery+="	and p.requester_id="+getUser().getPerson().getId();
				sqlQuery+="	 and p.requester_id="+getUser().getPerson().getId();
			}
			sqlQuery+=" order by p.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<PrivateRequest> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (PrivateRequest o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("activity_id", o.getActivity().getId());
				jsonObject.element("status_icon", getStatusIcon(o.getActivityStatus().getStatus(),lang));

				if("en".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
				}else{
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
				}
				
				jsonObject.element("status_id", o.getActivityStatus().getId());
				jsonObject.element("status", o.getActivityStatus().getStatus().getDOMVALUE());
				jsonObject.element("mun_id", o.getCadastralMunicipality().getName());
				jsonObject.element("work_stage", o.getWorkStage());
				jsonObject.element("request_no", o.getRequestNo());
				if(o.getRequestDate() != null)
					jsonObject.element("request_date", DATE_FORMAT.format(o.getRequestDate()));
				jsonObject.element("person", o.getRequester().getFirstName() + " " + o.getRequester().getLastName());
				if(o.getRequester().getAddress()!=null){
					jsonObject.element("person_country", o.getRequester().getAddress().getCountry());
					jsonObject.element("person_street", o.getRequester().getAddress().getStreet());
					jsonObject.element("person_home_nr", o.getRequester().getAddress().getHomeNr());
				}
				
				jsonObject.element("cad_zone_id", o.getCadastralZone().getName());
				jsonObject.element("parcel_no", o.getParcelDetail().getParcelnr()); 
				jsonObject.element("parcel_area", o.getParcelDetail().getArea());
				jsonObject.element("place_name", o.getParcelDetail().getPlacename());
				jsonObject.element("cad_cert_no", o.getCadCertNo());
				jsonObject.element("copy_plan_no", o.getCopyPlanNo()); 
				jsonObject.element("remarks", o.getRemarks());
				jsonObject.element("pl_tech_volume", o.getPlTechVolume());
				jsonObject.element("pl_fire_volume", o.getPlFireVolume());
				jsonObject.element("pl_created_date",  DATE_FORMAT.format(o.getPlCreatedDate())); 
				jsonObject.element("pl_created_by", o.getPlCreatedBy().getFirstName()+" "+o.getPlCreatedBy().getLastName());
				jsonObject.element("alw_tech_volume", o.getAlwTechVolume());
				jsonObject.element("alw_fire_volume", o.getAlwFireVolume());
				jsonObject.element("alw_created_date", o.getAlwCreatedDate());
				jsonObject.element("marking_tool", o.getMarkingTool());
				if(o.getMarkingDate()!=null)
				jsonObject.element("marking_date", DATE_FORMAT.format(o.getMarkingDate()));
				jsonObject.element("receiver_person", o.getReceiverPerson());
				if(o.getAuthPerson() != null)
					jsonObject.element("auth_person_id", o.getAuthPerson().getFirstName()+"  "+o.getAuthPerson().getLastName());
				jsonObject.element("ap_tech_volume", o.getApFireVolume());
				jsonObject.element("ap_fire_volume", o.getApFireVolume());
				if(o.getApCreatedDate()!=null)
				jsonObject.element("ap_created_date", DATE_FORMAT.format(o.getApCreatedDate()));
				if(o.getApCreatedBy() != null)
					jsonObject.element("ap_created_by", o.getApCreatedBy().getFirstName()+" "+o.getApCreatedBy().getLastName());
				jsonObject.element("payment", o.getPayment());
				jsonObject.element("payment_value", o.getPaymentValue());
				jsonObject.element("transport_doc", o.getTransported());
				jsonObject.element("justFoCanEdit", justFOCanEdit(o));
				rows.add(jsonObject);
			}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.privateRequest", e);
			throw new BusinessException("FrmGridAction.privateRequest", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Just FO can edit.
	 *
	 * @param pvtReq the pvt req
	 * @return true, if successful
	 */
	private boolean justFOCanEdit(PrivateRequest pvtReq){
		if(userIsForestOwner()){
			if(pvtReq.getPlCreatedBy().getId()==getUser().getPerson().getId()){
				return true;
			}
		}else if(pvtReq.getRequester().getId()!=pvtReq.getPlCreatedBy().getId()){
			return true;
		}else if(pvtReq.getRequester().getId()==pvtReq.getPlCreatedBy().getId() && userIsForestOwner() ){
			return true;
		}
		
		return false;
	}
	
	
	
	
	/**
	 * privateRequestImp.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void privateRequestImpl() throws IOException, BusinessException {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang = getLocale().getLanguage().toLowerCase();
			String sqlQuery="";
			String countQuery="";
			String pvtReq_id=request.getParameter("pvtReq_id");
			if(StringUtils.isNotEmpty(pvtReq_id)){
			PrivateRequestImplDAO dao=DAOFactory.getFactory().getPrivateRequestImplDAO();
			
			countQuery = "select count(*) from tfrm_private_request_impl where request_id="+pvtReq_id;
			sqlQuery = "select * from tfrm_private_request_impl where request_id="+pvtReq_id; //order by comp_id asc
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				sqlQuery += " order by " + getSidx() + " " + getSord();
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<PrivateRequestImpl> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (PrivateRequestImpl o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("idImpl", o.getId());
				jsonObject.element("pvt_req_id", pvtReq_id);
				jsonObject.element("actual_status", o.getPrivateRequest().getActivityStatus().getStatus().getDOMKEY());
				jsonObject.element("tree_species_id", o.getTreeSpecies().getId());
				if("en".equals(lang)){
					jsonObject.element("tree_species", o.getTreeSpecies().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("tree_species", o.getTreeSpecies().getNameAl());
				}else{
					jsonObject.element("tree_species", o.getTreeSpecies().getNameSr());
				}
				jsonObject.element("diameter_1_3", o.getDiameter13());
				jsonObject.element("factor", o.getFactor());
				jsonObject.element("height", o.getHeight());
				jsonObject.element("tech_volume", o.getTechVolume());
				jsonObject.element("fire_volume", o.getFireVolume());
				jsonObject.element("pulp_volume", o.getPulpVolume());
				jsonObject.element("volume_total", o.getVolumeTotal());
				jsonObject.element("height", o.getHeight());
				jsonObject.element("remarks", o.getRemarks());
				jsonObject.element("created_date",DATE_FORMAT.format(o.getCreatedDate()));
				jsonObject.element("created_by", o.getEmployee().getFirstName()+"	"+o.getEmployee().getLastName());
				rows.add(jsonObject);
			}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.privateRequestImpl", e);
			throw new BusinessException("FrmGridAction.privateRequestImpl", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * privateplan.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void privateplan() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request=ServletActionContext.getRequest();
		try{
			//print(request);
			String lang = getLocale().getLanguage().toLowerCase();
			String annualplanId = request.getParameter("annualplanId");
			if(StringUtils.isNotEmpty(annualplanId)){
			
			String sqlQuery="";
			String countQuery="";
			
			PrivateActivityDAO dao=DAOFactory.getFactory().getPrivateActivityDAO();
//			countQuery = "select count(*) from ";
//			sqlQuery = "select * from tfrm_stand_planting_activity"; //order by comp_id asc
			Long orgId = getUser().getOrganisation().getId();			
			Character opl_val = getUser().getOrganisation().getOperLevelVal();
			countQuery="select count(h.*) from tfrm_private_activity as h "+
					" left join tfrm_activity as a on h.activity_id = a.id "+
					" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
					" left join tfrm_activity_status as s on h.status_id = s.id "+
					" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
			sqlQuery="select h.* from tfrm_private_activity as h "+
					" left join tfrm_activity as a on h.activity_id = a.id "+
					" left join tfrm_annual_planning as ap on a.annual_planning_id = ap.id "+
					" left join tfrm_activity_status as s on h.status_id = s.id  "+
					" left join tfrm_activity_domain as ad on ad.id = a.activity_domain_id";
			if(opl_val=='C'){
				countQuery+=" where s.status!='NEW' ";
				sqlQuery+=" where s.status!='NEW' ";
			}else{
				countQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
							" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
							" where org_mun.org_id ="+orgId;
				sqlQuery+=" left join tgis_cadastral_municipality as m on m.id = ap.mun_id "+
						" left join torganisation_mun as org_mun on org_mun.mun_id=ap.mun_id "+
						" where org_mun.org_id ="+orgId;
				if(opl_val=='M'){
					countQuery+=" and s.status='APR'";
					sqlQuery+=" and s.status='APR'";
				}
			}
			
			countQuery+=" and a.annual_planning_id = "+annualplanId;
			sqlQuery+=" and a.annual_planning_id = "+annualplanId;
				
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<PrivateActivity> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (PrivateActivity o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("status_icon", getStatusIcon(o.getActivityStatus().getStatus(),lang));
				jsonObject.element("activity_id", o.getActivity().getId());
				
				if("en".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameAl());
				}else{
					jsonObject.element("activity", o.getActivity().getActivityDomain().getNameSr());
				}
				
				jsonObject.element("status_id", o.getActivityStatus().getId());
				jsonObject.element("work_stage", o.getWorkStage());
				jsonObject.element("mun_name", o.getCadastralMunicipality().getName());
				jsonObject.element("pl_tech_value", o.getPlTechVolume());
				jsonObject.element("pl_fire_value", o.getPlFireVolume());
				if(o.getPlCreatedDate()!=null)
					jsonObject.element("pl_created_date", DATE_FORMAT.format(o.getPlCreatedDate()));
				if(o.getPersonByPlCreatedBy()!=null)
					jsonObject.element("pl_created_by", o.getPersonByPlCreatedBy().getFirstName()+" "+o.getPersonByPlCreatedBy().getLastName());
				jsonObject.element("im_tech_value", o.getImTechVolume());
				jsonObject.element("im_fire_value", o.getImFireVolume());
				if(o.getImCreatedDate()!=null)
					jsonObject.element("im_created_date",  DATE_FORMAT.format(o.getImCreatedDate()));
				if(o.getPersonByImCreatedBy()!=null)
					jsonObject.element("im_created_by", o.getPersonByPlCreatedBy().getFirstName()+" "+o.getPersonByPlCreatedBy().getLastName());
				
				jsonObject.element("start_cmpgn_date", DATE_FORMAT.format( o.getStartCmpgnDate()));
				jsonObject.element("end_cmpgn_date",  DATE_FORMAT.format(o.getEndCmpgnDate()));
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();}
		}catch (Exception e){
			log.error("FrmGridAction.privateplan", e);
			throw new BusinessException("FrmGridAction.privateplan", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * Get Annual Planning pvt req.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualPlanningPvtReq() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//print(request);
		try{
			
			String sqlQuery="";
			String countQuery="";
			
			AnnualPlanningDAO dao = DAOFactory.getFactory().getAnnualPlanningDAO();
			/* Where user is logged in as forest owner */
			String lang=getLocale().getLanguage();   
			boolean userIsForestOwner=false;
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery roleQueryCount=s.createSQLQuery("select count(*) from  trbac_user_role as ur  left join trbac_role as r  on ur.role_id=r.id where r.code='foc'  and ur.user_id="+getUser().getUser().getId());
			roleQueryCount.addScalar("count",IntegerType.INSTANCE);
			Integer rez = (Integer) roleQueryCount.uniqueResult();
			String year="";
			String mun_name="";
			String status = request.getParameter("status_icon");

			String condtion = getCondition();
			if(filterParams!=null) {
				Iterator it=filterParams.entrySet().iterator();
				  while (it.hasNext()) {
					  Map.Entry pair = (Map.Entry)it.next();
					  if(pair.getKey().toString().equalsIgnoreCase("status_icon")) {
						  status=pair.getValue().toString();
					  }else if(pair.getKey().toString().equalsIgnoreCase("year")) {
						  year=pair.getValue().toString();
					  }else if(pair.getKey().toString().equalsIgnoreCase("mun_name")) {
						  mun_name=pair.getValue().toString();
					  }
				  }
				
			}
			
			if(rez.longValue()!=0){
				userIsForestOwner=true;
			}
			
			if(userIsForestOwner){
				countQuery="select count(p.*) from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id " +
						" left join (select * from tfrm_activity where activity_field='PVT') as ac on p.id=ac.annual_planning_id" +
						" left join tfrm_private_activity as pvt on pvt.activity_id=ac.id " +
						" where s.status='APR' and p.mun_id is not null";
			
				sqlQuery="select p.* from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id " +
						" left join (select * from tfrm_activity where activity_field='PVT') as ac on p.id=ac.annual_planning_id" +
						" left join tfrm_private_activity as pvt on pvt.activity_id=ac.id " +
						" where s.status='APR' and  p.mun_id is not null";
				if(StringUtils.isNotEmpty(mun_name)) {
					sqlQuery+=" and m.name ilike '"+mun_name+"%'";
				}
				
				if(StringUtils.isNotEmpty(year)) {
					sqlQuery+=" and year= "+year;
				}
				
				
			}else if(getUser().getOrganisation()!=null){
				Long orgId = getUser().getOrganisation().getId();			
				Character opl_val = getUser().getOrganisation().getOperLevelVal();
				
				
				countQuery="select count(distinct(p.*)) from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id left join tgis_cadastral_municipality as m on m.id = mun_id "+ 
						" left join torganisation_mun org_mun on org_mun.mun_id=m.id where s.status='APR' and p.mun_id is not null";
				
				sqlQuery="select distinct(p.*) from tfrm_annual_planning as p left join tfrm_annual_planning_status as s on p.status_id = s.id left join tgis_cadastral_municipality as m on m.id = mun_id "+ 
							" left join torganisation_mun org_mun on org_mun.mun_id=m.id where s.status='APR' and p.mun_id is not null";
				
				if(opl_val!='C'){
					countQuery+=" and org_mun.org_id ="+orgId;
					sqlQuery+=" and org_mun.org_id ="+orgId;
				}
				
				if(StringUtils.isNotEmpty(mun_name)) {
					sqlQuery+=" and m.name ilike '"+mun_name+"%'";
				}
				
				if(StringUtils.isNotEmpty(year)) {
					sqlQuery+=" and year= "+year;
				}
			}
			
			if(StringUtils.isNotEmpty(status)){
				countQuery += " and s.status = '" + status + "'";
				sqlQuery += " and s.status = '" + status + "'";
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<AnnualPlanning> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (AnnualPlanning o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if( o.getCadastralMunicipality()!=null)
				jsonObject.element("mun_id", o.getCadastralMunicipality().getId());
				else 
					jsonObject.element("mun_id", "");
				jsonObject.element("status_icon", getStatusIcon(o.getAnnualPlanningStatus().getStatus(),lang));
				jsonObject.element("mun_name", o.getCadastralMunicipality().getName());
				jsonObject.element("year", o.getYear());
				jsonObject.element("created_by_id", o.getPerson().getId());
				jsonObject.element("created_by", o.getPerson().getFirstName()+" "+o.getPerson().getLastName());
				jsonObject.element("remarks", o.getRemarks());
				jsonObject.element("status_id", o.getAnnualPlanningStatus().getId());
				jsonObject.element("status", o.getAnnualPlanningStatus().getStatus());
				jsonObject.element("status_remarks", o.getAnnualPlanningStatus().getRemarks());				
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.annualPlanning", e);
			throw new BusinessException("FrmGridAction.annualPlanning", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Private request doc.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void privateRequestDoc() throws IOException, BusinessException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String countQuery="";
			String sqlQuery="";
			String request_id=request.getParameter("request_id");
			
			PrivateRequestDocDAO dao=DAOFactory.getFactory().getPrivateRequestDocDAO();
			
			countQuery+="select count(d.*) from tfrm_private_request_doc d " +
					"left join tfrm_private_request r on r.id=d.request_id ";
					
			sqlQuery+="select d.* from tfrm_private_request_doc d " +
					"left join tfrm_private_request r on r.id=d.request_id ";
			
			if(StringUtils.isNotEmpty(request_id)){
				countQuery+=" where d.request_id="+request_id;
				sqlQuery+=" where d.request_id="+request_id;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<PrivateRequestDoc> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(PrivateRequestDoc d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("doc_name", d.getDocName());
				o.element("notes", d.getNote());
				o.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));
				
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FrmGridAction.privateRequestDoc", e);
			throw new BusinessException("FrmGridAction.privateRequestDoc",e);
		}finally{
			out.close();
		}
	}
	
	/**
	 * Activity status.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void activityStatus() throws IOException,BusinessException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String lang=getLocale().getLanguage();
			ActivityStatusDAO dao=DAOFactory.getFactory().getActivityStatusDAO();
			String countQuery, sqlQuery, activity_id=request.getParameter("activity_id");
			
			countQuery="select count(*) from tfrm_activity_status s";
			sqlQuery="select * from tfrm_activity_status s";
			
			if(StringUtils.isNotEmpty(activity_id)){
				countQuery+=" where s.activity_id="+activity_id;
				sqlQuery+=" where s.activity_id="+activity_id;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<ActivityStatus> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			Key aesKey = new SecretKeySpec(keyAesAsString.getBytes(), "AES");

			String encryptedText= encrypt(tableName,aesKey);
			 
			
			JSONArray rows=new JSONArray();
			for(ActivityStatus d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				if(lang.equals("al"))
					o.element("status", d.getStatus().getDOMTEXT());
				else if(lang.equals("en"))
					o.element("status", d.getStatus().getDOMTEXT_EN());
				else
					o.element("status", d.getStatus().getDOMTEXT_SR());
				
				o.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));
				if(d.getPerson()!=null)
					o.element("created_by", d.getPerson().getFirstName()+" "+d.getPerson().getLastName());
				o.element("remarks",d.getRemarks());
				o.element("encryptedText", encryptedText);

				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.activityStatus", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Activity status doc.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void activityStatusDoc() throws IOException,BusinessException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			ActivityStatusDocDAO dao = DAOFactory.getFactory().getActivityStatusDocDAO();
			
			String countQuery, sqlQuery, activity_id=request.getParameter("activity_id");
			
			countQuery="select count(d.*) from TFRM_ACTIVITY_STATUS_DOC d left join TFRM_ACTIVITY_STATUS s on s.id=d.status_id ";
			sqlQuery="select d.* from TFRM_ACTIVITY_STATUS_DOC d left join TFRM_ACTIVITY_STATUS s on s.id=d.status_id ";
			
			if(StringUtils.isNotEmpty(activity_id)){
				countQuery+=" where s.activity_id="+activity_id;
				sqlQuery+=" where s.activity_id="+activity_id;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<ActivityStatusDoc> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(ActivityStatusDoc d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("doc_name", d.getDocName());
				o.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));
				
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.activityStatusDoc", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Treespecies.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void treespecies() throws IOException,BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String language=getLocale().getLanguage();
			
			TreeSpeciesDAO dao = DAOFactory.getFactory().getTreeSpeciesDAO();
			
			
			String countQuery="select count(d.*) from tfrm_tree_species as d";
			String sqlQuery="select d.* from tfrm_tree_species as d";
			
			
			String name=request.getParameter("nameAl");
			if(StringUtils.isNotEmpty(name)){
				sqlQuery+=" where d.name_al ilike '"+name+"%' ";
				countQuery+=" where d.name_al ilike '"+name+"%' ";
			}
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			
			List<TreeSpecies> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(TreeSpecies d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("code", d.getCode());
				o.element("nameEn", d.getNameEn());
				o.element("nameAl", d.getNameAl());
				o.element("nameSr", d.getNameSr());
				o.element("nameLa", d.getNameLa());
				if("en".equals(language))
					o.element("speciesGroup", d.getSpeciesGroup().getDOMTEXT_EN());
				else if("sr".equals(language))
					o.element("speciesGroup", d.getSpeciesGroup().getDOMTEXT_SR());
				else o.element("speciesGroup", d.getSpeciesGroup().getDOMTEXT());
				
				o.element("speciesBonitet", d.getSpeciesBonitet());
				o.element("maxDiameter", d.getMaxDiameter());
				
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.treespecies", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Seed inventory.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void seedInventory() throws IOException,BusinessException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String seedActId=request.getParameter("seedActId");
			
			SeedlingInventoryDAO dao=DAOFactory.getFactory().getSeedlingInventoryDAO();
			
//			TreeSpeciesDAO dao = DAOFactory.getFactory().getTreeSpeciesDAO();
			
			
			String countQuery="select count(d.*) from tfrm_seedling_inventory d";
			String sqlQuery="select d.* from tfrm_seedling_inventory d";
			
			if(!StringUtils.isEmpty(seedActId)){
				countQuery+=" where d.seed_activity_id="+seedActId;
				sqlQuery+="	where d.seed_activity_id="+seedActId;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			
			List<SeedlingInventory> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			String lang = getLocale().getLanguage().toLowerCase();
			
			JSONArray rows=new JSONArray();
			for(SeedlingInventory s:list){
				JSONObject jsonObject=new JSONObject();	
				jsonObject.element("id", s.getId());
				if(s.getSeedActivity()!=null)
					jsonObject.element("seed_activity_id", "<span class='fa fa-building'></span>");
				else 
					jsonObject.element("seed_activity_id", "<span class='fa fa-asterisk'></span>");
				jsonObject.element("prod_type", s.getProdType());
				jsonObject.element("tree_species_id", s.getTreeSpecies().getId());
				if(lang.equals("en"))
					jsonObject.element("treeSpecies", s.getTreeSpecies().getNameEn());
				else if(lang.equals("al"))
					jsonObject.element("treeSpecies", s.getTreeSpecies().getNameAl());
				else if(lang.equals("sr"))
					jsonObject.element("treeSpecies", s.getTreeSpecies().getNameSr());
				else
					jsonObject.element("treeSpecies", s.getTreeSpecies().getNameLa());
				jsonObject.element("age", s.getAge());
				jsonObject.element("seed_year", s.getSeedYear());
				jsonObject.element("stock", s.getStock());
				jsonObject.element("price", s.getPrice());
				if(s.getPersonByCreatedBy()!=null)
				jsonObject.element("created_by", s.getPersonByCreatedBy().getFirstName()+" "+s.getPersonByCreatedBy().getLastName());
				if(s.getCreatedDate()!=null)
				jsonObject.element("created_date", DATE_FORMAT.format(s.getCreatedDate()));
				else 
					jsonObject.element("created_date", "");
				if(s.getChangedDate()!=null)
				jsonObject.element("changed_date", DATE_FORMAT.format(s.getChangedDate()));
				else
					jsonObject.element("changed_date", "");
				if(s.getPersonByChangedBy()!=null)
				jsonObject.element("changed_by", s.getPersonByChangedBy().getFirstName()+" "+s.getPersonByChangedBy().getLastName());
				else
					jsonObject.element("changed_by", "");
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.treespecies", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Inspection.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void inspection() throws IOException,BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			
			InspectionDAO dao=DAOFactory.getFactory().getInspectionDAO();
			String language = getLocale().getLanguage();	
			
			Employee inspectorUser=getUser().getEmployee();
			if(inspectorUser!=null){
				Employeerole persRole=inspectorUser.getRoleCode();
				
				String sqlQuery="select distinct(i.*) from tfrm_inspection as i left join tfrm_inspector as inspector  on i.id=inspector.office_activity_id where i.parent_id is null";
				String countQuery="select count(distinct(i.*)) from tfrm_inspection as i left join tfrm_inspector as inspector  on i.id=inspector.office_activity_id where i.parent_id is null";
				if(persRole==Employeerole.INSPECTOR){
					sqlQuery+=" and (created_by="+inspectorUser.getId()+" or inspector.employee_id="+inspectorUser.getId()+")";
					countQuery+=" and (created_by="+inspectorUser.getId()+" or inspector.employee_id="+inspectorUser.getId()+")";
				}
				
				Integer count=dao.countQuery(countQuery);
				calcPages(count);
				sqlQuery+=" order by id desc ";
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				
				List<Inspection> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows=new JSONArray();
				for(Inspection s:list){
					JSONObject jo=new JSONObject();	
					jo.element("id", s.getId());
					
					jo.element("inspection_no", s.getInspectionNo());
					jo.element("procesverbal", s.getProcesverbal());
					jo.element("procesverbal_no", s.getProcesverbalNo());
					jo.element("procesverbal_note", s.getProcesverbalNote());
					jo.element("sequestration", s.getSequestration());
					jo.element("seq_teach_volume", s.getSeqTeachVolume());
					jo.element("seq_fire_volume", s.getSeqFireVolume());
					jo.element("seq_note", s.getSeqNote());
					jo.element("charges", s.getCharges());
					
					jo.element("charges_ref_no", s.getChargesRefNo());
					jo.element("charges_note", s.getChargesNote());
					
					if(s.getChargesType()!=null)
						jo.element("charges_type", language.equals("en")?s.getChargesType().getDOMTEXT_EN():language.equals("sr")?s.getChargesType().getDOMTEXT_SR():s.getChargesType().getDOMTEXT());
					else jo.element("charges_type", "");
					
					if(s.getInspectionType()!=null)
						jo.element("inspection_type", language.equals("en")?s.getInspectionType().getDOMTEXT_EN():language.equals("sr")?s.getInspectionType().getDOMTEXT_SR():s.getInspectionType().getDOMTEXT());
					else jo.element("inspection_type", "");
					
					
					if(s.getRegion()!=null)
						jo.element("region_name", language.equals("en")?s.getRegion().getNameEn():language.equals("sr")?s.getRegion().getNameSr():s.getRegion().getName());
					else jo.element("region_name", "");
	
					if(s.getCadastralMunicipality()!=null)
						jo.element("mun_name", language.equals("en")?s.getCadastralMunicipality().getNameEn():language.equals("sr")?s.getCadastralMunicipality().getNameSr():s.getCadastralMunicipality().getName());
					else jo.element("mun_name", "");
					
					
					if(s.getInspActionType()!=null)
						jo.element("type_action", language.equals("en")?s.getInspActionType().getNameEn():language.equals("sr")?s.getInspActionType().getNameSr():s.getInspActionType().getNameAl());
					else jo.element("type_action", "");
					
					jo.element("contact_person", s.getContactPerson());	
					jo.element("inspection_date",fdate(s.getDate()));	
					jo.element("created_date",fdate(s.getCreatedDate()));	
					jo.element("created_by",getPersonData(s.getEmployee()));
					jo.element("notes", s.getNotes());
					
					rows.add(jo);
					
				}
				data.element("rows", rows);
				
				out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.Inspection", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Actiontype.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void actiontype() throws IOException,BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			
			InspActionTypeDAO dao = DAOFactory.getFactory().getInspActionTypeDAO();
			
			
			String countQuery="select count(d.*) from tfrm_insp_action_type d";
			String sqlQuery="select d.* from tfrm_insp_action_type d";
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			
			List<InspActionType> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(InspActionType d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("nameAl", d.getNameAl());
				o.element("nameEn", d.getNameEn());
				o.element("nameSr", d.getNameSr());
				o.element("description", d.getDescription());
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.actiontype", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Inspection doc.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void inspectionDoc() throws IOException, BusinessException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String countQuery="";
			String sqlQuery="";
			String inspection_id=request.getParameter("inspection_id");
			
			InspectionDocDAO dao=DAOFactory.getFactory().getInspectionDocDAO();
			
			countQuery+="select count(d.*) from tfrm_inspection_doc as d left join  tfrm_inspection as i on d.inspection_id=i.id ";
					
			sqlQuery+="select d.* from tfrm_inspection_doc as d left join  tfrm_inspection as i on d.inspection_id=i.id ";
			
			if(StringUtils.isNotEmpty(inspection_id)){
				countQuery+=" where d.inspection_id="+inspection_id;
				sqlQuery+=" where d.inspection_id="+inspection_id;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<InspectionDoc> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(InspectionDoc d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("doc_name", d.getDocName());
				o.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));
				
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FrmGridAction.inspectionDoc", e);
			throw new BusinessException("FrmGridAction.inspectionDoc",e);
		}finally{
			out.close();
		}
	}
	
	/**
	 * Inspection tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void inspectionTree() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String parent_id=request.getParameter("parent_id");
			if(StringUtils.isNotEmpty(parent_id)){
				InspectionDAO dao=DAOFactory.getFactory().getInspectionDAO();
				
				String query = "select i.* from tfrm_inspection as i where i.parent_id=any (get_all_children_inspection("+parent_id+")) or i.id=any (get_all_children_inspection("+parent_id+"))order  by i.id";
				
				List<Inspection> list=dao.executeSQLQuery(query);
				
				Integer count = list.size();
				calcPages(count);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				String language = getLocale().getLanguage();
				JSONArray rows=new JSONArray();
				Inspection main_parent = dao.get(new Long(parent_id));
				InspectionTree tree=new InspectionTree();
				InspectionNode pnode=new InspectionNode(language);
				pnode.setData(main_parent);
				tree.setRootElement(pnode);
				
				for(Inspection ins:list){
					
					if(ins.getInspection()!=null){
						InspectionNode node=new InspectionNode(language);
						node.setData(ins);
						Node<Inspection> parent=tree.findParent(tree.getRootElement(),ins.getInspection().getId());
						if(parent==null){
							loadInspParents(dao, tree, node, ins.getInspection().getId());
						}else{
							parent.addChild(node);
							node.setParent(parent);
						}
						
					}
					
				}
				for(Object jo:tree.getJSONArray()){
					String id=((JSONObject)jo).getString("id");
					if(!(id.equals(parent_id)))
						rows.element(jo);
				}
				
				data.element("rows", rows);
				out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();			
			
		}catch (Exception e){
			log.error("FrmGridAction.inspectionTree", e);
			throw new BusinessException("FrmGridAction.inspectionTree", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Affrefproject tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void affrefprojectTree() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String parent_id=request.getParameter("parent_id");
			if(StringUtils.isNotEmpty(parent_id)){
				AffRefProjectsDAO dao=DAOFactory.getFactory().getAffRefProjectsDAO();
				String query = "select i.* from taff_ref_projects as i where i.refer_id=any (get_all_children_affreffprojects("+parent_id+")) or i.id=any (get_all_children_affreffprojects("+parent_id+")) order  by i.id";
				
				List<AffRefProjects> list=dao.executeSQLQuery(query);
				
				Integer count = list.size();
				calcPages(count);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				String language = getLocale().getLanguage();
				JSONArray rows=new JSONArray();
				AffRefProjects main_parent = dao.get(new Long(parent_id));
				AffRefProjectsTree tree=new AffRefProjectsTree();
				AffRefProjectsNode pnode=new AffRefProjectsNode(language);
				pnode.setData(main_parent);
				tree.setRootElement(pnode);
				
				for(AffRefProjects ins:list){
					
					if(ins.getAffRefProjects()!=null){
						AffRefProjectsNode node=new AffRefProjectsNode(language);
						node.setData(ins);
						Node<AffRefProjects> parent=tree.findParent(tree.getRootElement(),ins.getAffRefProjects().getId());
						if(parent==null){
							loadIAffReffProjParents(dao, tree, node, ins.getAffRefProjects().getId());
						}else{
							parent.addChild(node);
							node.setParent(parent);
						}
						
					}
					
				}
				for(Object jo:tree.getJSONArray()){
					String id=((JSONObject)jo).getString("id");
					if(!(id.equals(parent_id)))
						rows.element(jo);
				}
				
				data.element("rows", rows);
				out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();			
			
		}catch (Exception e){
			log.error("FrmGridAction.inspectionTree", e);
			throw new BusinessException("FrmGridAction.inspectionTree", e);
		} finally {
			out.close();
		}
	}	
	
	/**
	 * Inspection tree 1.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void inspectionTree1() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String condtion = getCondition();
			
			InspectionDAO dao=DAOFactory.getFactory().getInspectionDAO();
			
			/*
			String countQuery ="select count(o.*) from torganisation as o left join tparty as p on o.id = p.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			*/
			
			String query = "select i.* from tfrm_inspection as i order  by i.id";
//			if(StringUtils.isNotEmpty(condtion)){
//				condtion = condtion.replaceAll("orga_name", "o.orga_name");
//				query += " where " + condtion;
//			}
			
			List<Inspection> list=dao.executeSQLQuery(query);
			
			Integer count = list.size();
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			
			Employee inspectorUser=getUser().getEmployee();
			Employeerole persRole=inspectorUser.getRoleCode();
			if(inspectorUser!=null){
			String queryInsp="select distinct(i.*) from tfrm_inspection as i left join tfrm_inspector as inspector  on i.id=inspector.office_activity_id where i.parent_id is null";
			if(persRole==Employeerole.INSPECTOR){
				queryInsp+=" and (created_by="+inspectorUser.getId()+" or inspector.employee_id="+inspectorUser.getId()+")";
			}
			String language = getLocale().getLanguage();
			List<Inspection> parentList = dao.executeSQLQuery(queryInsp);
			JSONArray rows=new JSONArray();
			for(Inspection i:parentList){
				InspectionTree tree=new InspectionTree();
				InspectionNode pnode=new InspectionNode(language);
				pnode.setData(i);
				tree.setRootElement(pnode);
				
				for(Inspection ins:list){
					
					if(ins.getInspection()!=null){
						InspectionNode node=new InspectionNode(language);
						node.setData(ins);
						Node<Inspection> parent=tree.findParent(tree.getRootElement(),ins.getInspection().getId());
						if(parent==null){
							loadInspParents(dao, tree, node, ins.getInspection().getId());
						}else{
							parent.addChild(node);
							node.setParent(parent);
						}
						
					}
					
				}
				for(Object jo:tree.getJSONArray()){
					rows.element(jo);
				}
//				rows.element(tree.getJSONArray());
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("FrmGridAction.inspectionTree", e);
			throw new BusinessException("FrmGridAction.inspectionTree", e);
		} finally {
			out.close();
		}
	}	
	
	/**
	 * Load insp parents.
	 *
	 * @param dao the dao
	 * @param tree the tree
	 * @param node the node
	 * @param parentId the parent id
	 */
	private void loadInspParents(InspectionDAO dao, InspectionTree tree, InspectionNode node, Long parentId){
		
		List<Inspection> inspList = dao.executeSQLQuery("select i.* from tfrm_inspection as i  where i.id=" + parentId);
		
		Inspection inspection=inspList.get(0);
		
		InspectionNode parent=new InspectionNode();
		
		parent.setData(inspection);		
		parent.addChild(node);
		node.setParent(parent);
		
		if(inspection.getInspection()!= null && inspection.getInspection().getId()!=null){
			Node<Inspection> nextParent = tree.findParent(tree.getRootElement(), inspection.getInspection().getId());
			if(nextParent==null){
				loadInspParents(dao, tree, parent, inspection.getInspection().getId());
			}else{
				nextParent.addChild(node);
				node.setParent(nextParent);		
			}
		}
	}
	
	/**
	 * Load I aff reff proj parents.
	 *
	 * @param dao the dao
	 * @param tree the tree
	 * @param node the node
	 * @param parentId the parent id
	 */
	private void loadIAffReffProjParents(AffRefProjectsDAO dao, AffRefProjectsTree tree, AffRefProjectsNode node, Long parentId){
		
		List<AffRefProjects> inspList = dao.executeSQLQuery("select i.* from taff_ref_projects as i  where i.id=" + parentId);
		
		AffRefProjects affreff=inspList.get(0);
		
		AffRefProjectsNode parent=new AffRefProjectsNode();
		
		parent.setData(affreff);		
		parent.addChild(node);
		node.setParent(parent);
		
		if(affreff.getAffRefProjects()!= null && affreff.getAffRefProjects().getId()!=null){
			Node<AffRefProjects> nextParent = tree.findParent(tree.getRootElement(), affreff.getAffRefProjects().getId());
			if(nextParent==null){
				loadIAffReffProjParents(dao, tree, parent, affreff.getAffRefProjects().getId());
			}else{
				nextParent.addChild(node);
				node.setParent(nextParent);		
			}
		}
	}

	/**
	 * Get Fire Report.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void fireReport() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String sqlQuery="";
			String countQuery="";
			String lang=getLocale().getLanguage();
			FireReportDAO dao = DAOFactory.getFactory().getFireReportDAO();

			Organisation org=getUser().getOrganisation();
			Long orgId = org.getId();			
			Character opl_val = org.getOperLevelVal();
			
			countQuery="select count(distinct(f.*)) from tfrm_fire_report as f " +
					" left join tgis_cadastral_municipality as m on m.id = f.mun_id "+
					" left join torganisation_mun org_mun on org_mun.mun_id=m.id ";
			sqlQuery="select distinct f.*,m.*,mu.*,r.* from tfrm_fire_report as f " +
					" left join tgis_cadastral_municipality as m on m.id = mun_id "+ 
					" left join torganisation_mun org_mun on org_mun.mun_id=m.id "+
					" left join tgis_region r on r.id=f.region_id "+
					" left join tgis_management_unit mu on mu.id=f.mun_id ";
			
			if(opl_val!='C'){
				countQuery+=" where org_mun.org_id ="+orgId;
				sqlQuery+=" where org_mun.org_id ="+orgId;
			}

			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("municipality"))
					ob_field=("al".equals(lang)?"m.name":"m.name_"+lang);
				else if(ob_field.equals("region"))
					ob_field=("al".equals(lang)?"r.name":"r.name_"+lang);
				else if(ob_field.equals("management_unit"))
					ob_field="mu.mu_name";
				
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<FireReport> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (FireReport o : list) {

				JSONObject jo = new JSONObject();
				jo.element("id", o.getId());
				jo.element("municipality", getCadastralMunicipalityData(o.getCadastralMunicipality(), lang));
				jo.element("region", getRegionData(o.getRegion(),lang));
				jo.element("management_unit", o.getManagementUnit().getMuName());
				jo.element("fire_type", o.getFireType());
				jo.element("fire_cause", o.getFireCause());
				jo.element("occurrence_date", fDateTime(o.getOccurrenceDate()));
				jo.element("extinguish_date", fDateTime(o.getExtinguishDate()));
				jo.element("extinguished_by", o.getExtinguishedBy());
				
				jo.element("pub_damage_euro", o.getPubDamageEuro());
				jo.element("pub_damage_m2", o.getPubDamageM2());
				jo.element("pub_damage_m3", o.getPubDamageM3());
				
				jo.element("pvt_damage_euro", o.getPvtDamageEuro());
				jo.element("pvt_damage_m2", o.getPvtDamageM2());
				jo.element("pvt_damage_m3", o.getPvtDamageM3());
				
				jo.element("proposed_action", o.getProposedAction());
				jo.element("doc_name", o.getDocName());
				jo.element("comment", o.getComment());
				
				jo.element("created_by", getPersonData(o.getPerson()));
				jo.element("created_date", fdate(o.getCreatedDate()));
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.fireReport", e);
			throw new BusinessException("FrmGridAction.fireReport", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Get Confiscation Report.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void confiscationReport() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String sqlQuery="";
			String countQuery="";
			String lang=getLocale().getLanguage();
			ConfiscationDAO dao=DAOFactory.getFactory().getConfiscationDAO();
			String confType=request.getParameter("confType");
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			
			Organisation org=getUser().getOrganisation();
			Long orgId = org.getId();			
			Character opl_val = org.getOperLevelVal();
			
			countQuery="select distinct count(c.*) from tfrm_confiscation as c " +
					"left join tgis_cadastral_municipality as m on m.id = c.mun_id " +
					"left join torganisation_mun org_mun on org_mun.mun_id=m.id " +
					"left join tgis_region r on r.id=m.region_id where c.type='"+confType+"'";
			
			sqlQuery="select distinct c.*,m.*,r.* from tfrm_confiscation as c " +
					"left join tgis_cadastral_municipality as m on m.id = c.mun_id " +
					"left join torganisation_mun org_mun on org_mun.mun_id=m.id " +
					"left join tgis_region r on r.id=m.region_id where c.type='"+confType+"'";
			
			if(opl_val!='C'){
				countQuery+=" and org_mun.org_id ="+orgId;
				sqlQuery+=" and org_mun.org_id ="+orgId;
			}
			
			if(StringUtils.isNotEmpty(startDate) && StringUtils.isNotEmpty(endDate)){
				startDate=stringDateFormat(startDate);
				endDate=stringDateFormat(endDate);
				countQuery+=" and c.confiscation_date between '"+startDate+"' and '"+endDate+"' ";
				sqlQuery+=" and c.confiscation_date between '"+startDate+"' and '"+endDate+"' ";
			}
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("municipality"))
					ob_field=("al".equals(lang)?"m.name":"m.name_"+lang);
				else if(ob_field.equals("region"))
					ob_field=("al".equals(lang)?"r.name":"r.name_"+lang);
				else if(ob_field.equals("management_unit"))
					ob_field="mu.mu_name";
				
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<Confiscation> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (Confiscation o : list) {

				JSONObject jo = new JSONObject();
				jo.element("id", o.getId());
				jo.element("municipality", getCadastralMunicipalityData(o.getCadastralMunicipality(), lang));
				jo.element("region", getRegionData(o.getCadastralMunicipality().getRegion(),lang));
				jo.element("confiscation_date", fDateTime(o.getConfiscationDate()));
				jo.element("remarks", o.getRemarks());
				jo.element("created_by", getPersonData(o.getEmployee()));
				jo.element("created_date", fdate(o.getCreatedDate()));
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.confiscation", e);
			throw new BusinessException("FrmGridAction.confiscation", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Get Confiscation Report.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void confiscationDetail() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String sqlQuery="";
			String countQuery="";
			String lang=getLocale().getLanguage();
			String confId=request.getParameter("confiscationId");
			ConfiscationDetailDAO dao=DAOFactory.getFactory().getConfiscationDetailDAO();
			countQuery="select count(*) from tfrm_confiscation_detail as cd where cd.confiscation_id="+confId;
			sqlQuery="select * from tfrm_confiscation_detail as cd where cd.confiscation_id="+confId;
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<ConfiscationDetail> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (ConfiscationDetail o : list) {
				JSONObject jo = new JSONObject();
				jo.element("id", o.getId());
				jo.element("confiscation_detail_id",o.getId());
				jo.element("tree_species_id",o.getTreeSpecies().getId());
				jo.element("tree_species_la",o.getTreeSpecies().getNameLa());
				if(lang.equals("al"))
					jo.element("tree_species",o.getTreeSpecies().getNameAl());
				else if(lang.equals("en"))
					jo.element("tree_species",o.getTreeSpecies().getNameEn());
				else
					jo.element("tree_species",o.getTreeSpecies().getNameSr());
					
				if(o.getTreeTechVolume()!=null)
					jo.element("tree_tech_volume", o.getTreeTechVolume());
				else
					jo.element("tree_tech_volume", "0.0");
				if(o.getTreeFireVolume()!=null)
					jo.element("tree_fire_volume", o.getTreeFireVolume());
				else
					jo.element("tree_fire_volume", "0.0");
				jo.element("total_volume", o.getTotalVolume());
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.confiscation", e);
			throw new BusinessException("FrmGridAction.confiscation", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * Get Fire Details.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void fireDetails() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String sqlQuery="";
			String countQuery="";
			String fire_id = request.getParameter("fire_id");
			FireDetailsDAO dao = DAOFactory.getFactory().getFireDetailsDAO();

		
			
			String select ="select distinct f.*";
			if(StringUtils.isNotEmpty(fire_id) && StringUtils.isNumeric(fire_id)){
				countQuery="select count(f.*) from tfrm_fire_details as f where f.fire_report_id="+fire_id;
				sqlQuery=" from tfrm_fire_details as f ";

				String order_by="f.id";
				String sort = "desc";
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("compId")){
						select+=",c.* ";
						sqlQuery += " left join tgis_compartment c on c.id=f.comp_id ";
						ob_field="c.comp_id";
					}else if(ob_field.equals("standId")){
						select+=",s.* ";
						sqlQuery += " left join tgis_stand s on s.id=f.stand_id";
						ob_field="s.stand_id";
					}
					order_by=ob_field;
					sort=getSord();
				}
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery=select+sqlQuery+" where f.fire_report_id="+fire_id;
//				sqlQuery += " order by " + order_by + " " + sort+" LIMIT " + limit + " offset " + start;
				
				List<FireDetails> list = dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (FireDetails o : list) {
	
					JSONObject jo = new JSONObject();
					jo.element("fd_id", o.getId());
					jo.element("fire_report_id", o.getFireReport().getId());
					jo.element("compId", o.getCompartment().getCompNr());
					jo.element("comp_id", o.getCompartment().getId());
					jo.element("standId", o.getStand().getStandNr());
					jo.element("stand_id", o.getStand().getId());
					jo.element("damage_m2", o.getDamageM2());
					jo.element("damage_m3", o.getDamageM3());
					jo.element("damage_euro", o.getDamageEuro());
					
					rows.add(jo);
				}
				data.element("rows", rows);
	
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.fireDetails", e);
			throw new BusinessException("FrmGridAction.fireDetails", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Harvest Declare .
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void harvImplDeclare() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sqlQuery="";
			String countQuery="";
			String harv_activity_id= request.getParameter("harv_activity_id");
			StandHarvestImplDeclareDAO dao=DAOFactory.getFactory().getStandHarvestImplDeclareDAO();	
			
			if(StringUtils.isNotEmpty(harv_activity_id) && StringUtils.isNumeric(harv_activity_id)){
				countQuery="select count(f.*) from tfrm_stand_harvest_impl_declare as f where f.harvest_activity_id="+harv_activity_id;
				sqlQuery="select * from tfrm_stand_harvest_impl_declare as f where f.harvest_activity_id="+harv_activity_id;
 				
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				List<StandHarvestImplDeclare> list = dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				Class<?> c = StandHarvestImplTransport.class;
				Table table = c.getAnnotation(Table.class);
				String tableName = table.name();
				Key aesKey = new SecretKeySpec(keyAesAsString.getBytes(), "AES");
				String lang = getLocale().getLanguage();
				String encryptedText= encrypt(tableName,aesKey);
				String rez_trans_done="";
				String rez_trans="";
				String language = getLocale().getLanguage();
				if(lang.equals("al")) {
					rez_trans="Jo-realizuar";
				    rez_trans_done="Realizuar";
				}
				else if(lang.equals("en")) {
					rez_trans="Not Done";
					rez_trans_done="Done";
				}
				JSONArray rows = new JSONArray();
				for (StandHarvestImplDeclare o : list) {
					JSONObject jo = new JSONObject();
					jo.element("hd_id", o.getId());
				
					if(o.getStandHarvestImplTransport()!=null){
					jo.element("hd_trans_id", o.getStandHarvestImplTransport().getId());
					jo.element("transport_done", rez_trans_done);	
					}else {
					jo.element("hd_trans_id", "");	
					jo.element("transport_done", rez_trans);	
					}
					jo.element("harv_activity_id", o.getStandHarvestActivity().getId());
					jo.element("im_tech_volume_dec", o.getTechVolume());
					jo.element("im_fire_volume_dec", o.getFireVolume());
					jo.element("im_pulp_volume_dec", o.getPulpVolume());
					jo.element("im_date_dec", fdate(o.getImDate()));
					jo.element("im_created_date_dec", fdate(o.getCreatedDate()));
					jo.element("created_by_dec", getPersonData(o.getPerson()));	
					jo.element("encryptedText",encryptedText);
					jo.element("edit", false);
					rows.add(jo);
				}
				data.element("rows", rows);
				out.append(data.toString());
			}
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.harvImplDeclare", e);
			throw new BusinessException("FrmGridAction.harvImplDeclare", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Silviculture Declare.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void slvImplDeclare() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sqlQuery="";
			String countQuery="";
			String slv_activity_id= request.getParameter("slv_activity_id");
			StandSilvicultureImplDeclareDAO dao=DAOFactory.getFactory().getStandSilvicultureImplDeclareDAO();
			if(StringUtils.isNotEmpty(slv_activity_id) && StringUtils.isNumeric(slv_activity_id)){
				countQuery="select count(f.*) from tfrm_stand_silviculture_impl_declare as f where f.slv_activity_id="+slv_activity_id;
				sqlQuery="select * from tfrm_stand_silviculture_impl_declare as f where f.slv_activity_id="+slv_activity_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				List<StandSilvicultureImplDeclare> list = dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (StandSilvicultureImplDeclare o : list) {
					JSONObject jo = new JSONObject();
					jo.element("sd_id", o.getId());
					jo.element("slv_activity_id", o.getStandSilvicultureActivity().getId());
					jo.element("im_area", o.getImArea());
					jo.element("im_date", fdate(o.getImDate()));
					WKTWriter wktWriter=new WKTWriter();
					jo.element("im_geom", wktWriter.write(o.getImGeom()));
					jo.element("im_created_date_dec", fdate(o.getCreatedDate()));
					jo.element("created_by_dec", getPersonData(o.getPerson()));	
					jo.element("edit", false);
					rows.add(jo);
				}
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.slvImplDeclare", e);
			throw new BusinessException("FrmGridAction.slvImplDeclare", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Planting Impl Declare.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void plantImplDeclare() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sqlQuery="";
			String countQuery="";
			String plant_activity_id= request.getParameter("plant_activity_id");
			StandPlantingImplDeclareDAO dao=DAOFactory.getFactory().getStandPlantingImplDeclareDAO();
			
			if(StringUtils.isNotEmpty(plant_activity_id) && StringUtils.isNumeric(plant_activity_id)){
				countQuery="select count(f.*) from tfrm_stand_planting_impl_declare as f where f.plant_activity_id="+plant_activity_id;
				sqlQuery="select * from tfrm_stand_planting_impl_declare as f where f.plant_activity_id="+plant_activity_id;
//				sqlQuery="select *,st_astext(st_setsrid(st_transform(im_geom,900913),900913)) from tfrm_stand_planting_impl_declare as f where f.plant_activity_id="+plant_activity_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				List<StandPlantingImplDeclare> list = dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (StandPlantingImplDeclare o : list) {
					JSONObject jo = new JSONObject();
					jo.element("pd_id", o.getId());
					jo.element("plant_activity_id", o.getStandPlantingActivity().getId());
					jo.element("im_area", o.getImArea());
					jo.element("im_geom", o.getImGeom()!=null?o.getImGeom().toString():"");
					jo.element("im_trees", o.getImTrees());
					jo.element("im_date", fdate(o.getImDate()));
					jo.element("im_created_date_dec", fdate(o.getCreatedDate()));
					jo.element("created_by_dec", getPersonData(o.getPerson()));	
					jo.element("edit", false);
					rows.add(jo);
				}
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.plantImplDeclare", e);
			throw new BusinessException("FrmGridAction.plantImplDeclare", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Infrastructure Declare.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void infraImplDeclare() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sqlQuery="";
			String countQuery="";
			String road_id= request.getParameter("road_id");
			
			RoadImplDeclareDAO dao=DAOFactory.getFactory().getRoadImplDeclareDAO();
			if(StringUtils.isNotEmpty(road_id) && StringUtils.isNumeric(road_id)){
				countQuery="select count(f.*) from tfrm_road_impl_declare as f where f.road_id="+road_id;
				sqlQuery="select * from tfrm_road_impl_declare as f where f.road_id="+road_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				List<RoadImplDeclare> list = dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (RoadImplDeclare o : list) {
					JSONObject jo = new JSONObject();
					jo.element("rd_id", o.getId());
					jo.element("road_id", o.getRoadActivity().getId());
					jo.element("im_start_m", o.getImStartM());
					jo.element("im_end_m", o.getImEndM());
					jo.element("im_width", o.getImWidth());
					jo.element("im_lenght", o.getImLenght());
					jo.element("im_date", fdate(o.getImDate()));
					jo.element("im_created_date_dec", fdate(o.getCreatedDate()));
					jo.element("created_by_dec", getPersonData(o.getPerson()));	
					jo.element("edit", false);
					rows.add(jo);
				}
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.infraImplDeclare", e);
			throw new BusinessException("FrmGridAction.infraImplDeclare", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Protection Declare.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void protImplDeclare() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sqlQuery="";
			String countQuery="";
			String protection_id= request.getParameter("protection_id");
			ProtectionImplDeclareDAO dao=DAOFactory.getFactory().getProtectionImplDeclareDAO();
			if(StringUtils.isNotEmpty(protection_id) && StringUtils.isNumeric(protection_id)){
				countQuery="select count(f.*) from tfrm_protection_impl_declare as f where f.protection_id="+protection_id;
				sqlQuery="select * from tfrm_protection_impl_declare as f where f.protection_id="+protection_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				List<ProtectionImplDeclare> list = dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (ProtectionImplDeclare o : list) {
					JSONObject jo = new JSONObject();
					jo.element("pd_id", o.getId());
					jo.element("protection_id", o.getProtectionActivity().getId());
					jo.element("im_value", o.getImValue());
					jo.element("im_date", fdate(o.getImDate()));
					WKTWriter wktWriter=new WKTWriter();
					jo.element("im_geom", wktWriter.write(o.getImGeom()));
					jo.element("im_created_date_dec", fdate(o.getCreatedDate()));
					jo.element("created_by_dec", getPersonData(o.getPerson()));	
					jo.element("edit", false);	
					rows.add(jo);
				}
				data.element("rows", rows);
				out.append(data.toString());
			}
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.protImplDeclare", e);
			throw new BusinessException("FrmGridAction.protImplDeclare", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Stand Treatment.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void standTreatment() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				String standId= request.getParameter("standId");
				ShapeStandTreatmentDAO dao=DAOFactory.getFactory().getShapeStandTreatmentDAO();
				String countQuery="select count(st.*) from tshape_stand_treatment as st";
				String sqlQuery="select st.* from tshape_stand_treatment as st";
				if(standId!=null){
					countQuery+=" where st.stand_id="+standId;
					sqlQuery+=" where st.stand_id="+standId;
				}
				Integer count = dao.countQuery(countQuery);
				String language = getLocale().getLanguage();
				calcPages(count);
				
				List<ShapeStandTreatment> list= dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (ShapeStandTreatment o : list) {
					JSONObject jo = new JSONObject();
					jo.element("id", o.getId());
					jo.element("treatment_name", language.equals("en")?o.getShapeTreatmentName().getNameEn():language.equals("sr")?o.getShapeTreatmentName().getNameSr():o.getShapeTreatmentName().getName());
					if(o.getTreatmentDate()!=null)
					jo.element("treatment_date", fdate(o.getTreatmentDate()));
					jo.element("treatment_area_perc", o.getTreatmentAreaPerc());
					rows.add(jo);
				}
				data.element("rows", rows);
				out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.standTreatment", e);
			throw new BusinessException("FrmGridAction.standTreatment", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Get Stand Biodiversity.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void standBiodiversity() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				String standId=request.getParameter("standId");
				ShapeStandBiodiversityDAO dao=DAOFactory.getFactory().getShapeStandBiodiversityDAO();
				String countQuery="select count(st.*) from tgis_biodiv as st";
				String sqlQuery="select st.* from tgis_biodiv as st";
				
				if(standId!=null){
					countQuery+=" where st.stand_id="+standId;
					sqlQuery+=" where st.stand_id="+standId;
				}
				
				Integer count = dao.countQuery(countQuery);
				String language = getLocale().getLanguage();
				calcPages(count);
				
				List<ShapeStandBiodiversity> list= dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (ShapeStandBiodiversity o : list) {
					JSONObject jo = new JSONObject();
					jo.element("id", o.getId());
					jo.element("biodiversity_name", language.equals("en")?o.getShapeBiodiversityName().getNameEn():language.equals("sr")?o.getShapeBiodiversityName().getNameSr():o.getShapeBiodiversityName().getName());
					jo.element("biocode", o.getBiocode());
					jo.element("taksator", o.getTaksator());
					jo.element("remarks", o.getRemarks());
					rows.add(jo);
				}
				data.element("rows", rows);
				out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.standBiodiversity", e);
			throw new BusinessException("FrmGridAction.standBiodiversity", e);
		} finally {
			out.close();
		}
	}
		

	/**
	 * ManagementUnits's.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void managementUnits() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String language = getLocale().getLanguage();
			String sqlQuery="";
			String countQuery="";
			
			HttpServletRequest request=ServletActionContext.getRequest();

			String mu_names =  request.getParameter("mu_name");
			String mu_codes =  request.getParameter("mu_code");
			ManagementUnitPeriodDAO dao = DAOFactory.getFactory().getManagementUnitPeriodDAO();
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			
			countQuery = "select count(*) from tgis_management_unit mu ";
			sqlQuery = "select a.* from (select  mu.*,gr.name,gr.name_en,gr.name_sr ,mp.id as mu_period_id, (case when trunc(st_area(mpg.the_geom)/10000) > 0 " +
					" then trunc(st_area(mpg.the_geom)/10000)||'ha 'else '' end || trunc(((st_area(mpg.the_geom)/10000)-trunc(st_area(mpg.the_geom)/10000))*100)|| 'ar '" +
					" ||round(((st_area(mpg.the_geom)/100)-trunc(st_area(mpg.the_geom)/100))\\:\\:numeric*100,2)||'m\u00B2')\\:\\:varchar as area_mask, comp.count as compartments_num," +
					" (select count(*) from get_stand_id('Y',gr.code,mu.mu_code))as stand_num from tgis_management_unit mu left join  (select id,mu_id from tgis_mu_period where isactive ='Y') " +
					" mp on mp.mu_id=mu.id left join  (select id,mu_id,the_geom from tgis_mu_period where isactive ='Y' and the_geom is not null) mpg on mpg.mu_id=mu.id " +
					" left join tgis_region gr on gr.id=region_id  left join (select mup_id,count(*) from tgis_compartment group by mup_id )comp on comp.mup_id=mp.id";
			sqlQuery += ") a where a.id is not null ";
			countQuery += "  where mu.id is not null ";
			
			BoUserSecurity user = getUser();
			Long reg=null;
			if(!user.getOperationalLevelVal().equals('C')){
				reg=user.getRegion().getId();
				countQuery += " and mu.region_id="+reg;
				sqlQuery += " and a.region_id="+reg;
				
			}
			
			String condtion = getCondition();
			if(filterParams!=null) {
				Iterator it=filterParams.entrySet().iterator();
				  while (it.hasNext()) {
					  Map.Entry pair = (Map.Entry)it.next();
					  if(pair.getKey().toString().equalsIgnoreCase("mu_name")) {
						  mu_names=pair.getValue().toString();
					  }else if(pair.getKey().toString().equalsIgnoreCase("mu_code")) {
						  mu_codes=pair.getValue().toString();
					  }
				  }
				
			}
			
			if(StringUtils.isNotEmpty(mu_names)){
				countQuery += " and mu.mu_name ilike '%"+mu_names+"%'";
				sqlQuery +=" and a.mu_name ilike '%"+mu_names+"%'";
			}
			if(StringUtils.isNotEmpty(mu_codes)){
				countQuery += " and mu.mu_code ilike '%"+mu_codes+"%'";
				sqlQuery +=" and a.mu_code ilike '%"+mu_codes+"%'";
			}
			getUser().getRegion();
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			SQLQuery SQLQuery = s.createSQLQuery(sqlQuery);
			SQLQuery.addScalar("id", LongType.INSTANCE);
			SQLQuery.addScalar("region_id", LongType.INSTANCE);
			SQLQuery.addScalar("name", StringType.INSTANCE);
			SQLQuery.addScalar("name_en", StringType.INSTANCE);
			SQLQuery.addScalar("name_sr", StringType.INSTANCE);
			SQLQuery.addScalar("mu_name", StringType.INSTANCE);
			SQLQuery.addScalar("mu_code", StringType.INSTANCE);
			SQLQuery.addScalar("remarks", StringType.INSTANCE);
			SQLQuery.addScalar("mu_period_id", LongType.INSTANCE);
			SQLQuery.addScalar("area_mask", StringType.INSTANCE);
			SQLQuery.addScalar("compartments_num", IntegerType.INSTANCE);
			SQLQuery.addScalar("stand_num", IntegerType.INSTANCE);
			
			
			List list = SQLQuery.list();
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				Long id = (Long) obj[0];
				Long region_id = (Long) obj[1];
				String name = (String) obj[2];
				String name_en = (String) obj[3];
				String name_sr = (String) obj[4];
				String mu_name = (String) obj[5];
				String mu_code = (String) obj[6];
				String remarks = (String) obj[7];
				Long mu_period_id = (Long) obj[8];
				String area_mask = (String) obj[9];
				Integer compartments_num = (Integer) obj[10];
				Integer stand_num = (Integer) obj[11];

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", id);
				//jsonObject.element("comp_id", o.getCompId());
				jsonObject.element("mu_name", mu_name);
				jsonObject.element("mu_code", mu_code);
				jsonObject.element("region_id", region_id);
				String region_name = "al".equals(language)?name:"en".equals(language)?name_en:name_sr;
				jsonObject.element("region_name", region_name);
				jsonObject.element("note", remarks);
				jsonObject.element("mu_period_id", mu_period_id);
				jsonObject.element("area_mask", area_mask);
				jsonObject.element("compartments_num", compartments_num);
				jsonObject.element("stand_num", stand_num);
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FrmGridAction.compartmens", e);
			throw new BusinessException("FrmGridAction.compartmens", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * harvestMarked.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void harvestMarked() throws IOException, BusinessException {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang = getLocale().getLanguage().toLowerCase();
			String sqlQuery="";
			String countQuery="";
			String harv_id=request.getParameter("harv_id");
			if(StringUtils.isNotEmpty(harv_id)){
			StandHarvestMarkedDAO dao=DAOFactory.getFactory().getStandHarvestMarkedDAO();
			
			countQuery = "select count(*) from tfrm_stand_harvest_marked where harvest_id="+harv_id;
			sqlQuery = "select * from tfrm_stand_harvest_marked where harvest_id="+harv_id; //order by comp_id asc
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				sqlQuery += " order by " + getSidx() + " " + getSord();
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<StandHarvestMarked> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (StandHarvestMarked o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("idM", o.getId());
				jsonObject.element("harv_id", harv_id);
				jsonObject.element("actual_status", o.getStandHarvestActivity().getActivityStatus().getStatus().getDOMKEY());
				jsonObject.element("tree_species_id", o.getTreeSpecies().getId());
				if("en".equals(lang)){
					jsonObject.element("tree_species", o.getTreeSpecies().getNameEn());
				}else if("al".equals(lang)){
					jsonObject.element("tree_species", o.getTreeSpecies().getNameAl());
				}else{
					jsonObject.element("tree_species", o.getTreeSpecies().getNameSr());
				}
				jsonObject.element("diameter_1_3", o.getDiameter13());
				jsonObject.element("height", o.getHeight());
				jsonObject.element("tech_volume", o.getTechVolume());
				jsonObject.element("fire_volume", o.getFireVolume());
				jsonObject.element("pulp_volume", o.getPulpVolume());
				jsonObject.element("volume_total", o.getVolumeTotal());
				jsonObject.element("height", o.getHeight());
				jsonObject.element("remarks", o.getRemarks());
				if(o.getCreatedDate()!=null)
				jsonObject.element("created_date",DATE_FORMAT.format(o.getCreatedDate()));
				if(o.getEmployee()!=null)
				jsonObject.element("created_by", o.getEmployee().getFirstName()+"	"+o.getEmployee().getLastName());
				rows.add(jsonObject);
			}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.harvestMarked", e);
			throw new BusinessException("FrmGridAction.harvestMarked", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Activity box.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void activityBox() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String activityId = request.getParameter("activityId");
			String activity_box="";
			JSONObject data = new JSONObject();
			if(StringUtils.isNotEmpty(activityId)){
					Activity act=DAOFactory.getFactory().getActivityDAO().get(new Long(activityId));
					  Geometry geombuffer = act.getPlanedGeom().buffer(5).getEnvelope();
					     double minx = geombuffer.getCentroid().getX() - geombuffer.getEnvelopeInternal().maxExtent()/2;
					     double miny = geombuffer.getCentroid().getY() - geombuffer.getEnvelopeInternal().maxExtent()/2;
					     double maxx = geombuffer.getCentroid().getX() + geombuffer.getEnvelopeInternal().maxExtent()/2;
					     double maxy = geombuffer.getCentroid().getY() + geombuffer.getEnvelopeInternal().maxExtent()/2;
					     activity_box = minx + "," + miny + "," +  maxx + "," +  maxy;
					     data.element("activity_box", activity_box);
				         out.append(data.toString());
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.activityBox", e);
			throw new BusinessException("InputAction.activityBox", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Stand box.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void standBox() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String standId=request.getParameter("standId");
			String actId=request.getParameter("actId");
			String stand_box="";
			JSONObject data = new JSONObject();
			if(StringUtils.isNotEmpty(actId)){
			String queryView="select count(*) from vgis_pl_point as p where p.id="+actId;
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery(queryView);
			sqlForReqNo.addScalar("count",LongType.INSTANCE);
			Object rez=sqlForReqNo.uniqueResult();
			Long rezPoint=null;
				if(rez!=null && !StringUtils.isEmpty(rez.toString())){
					rezPoint=(Long)rez;
					data.element("point_nr", rezPoint);
				}
			}
			if(StringUtils.isNotEmpty(standId)){
					  String query="select st.* from tgis_stand as st left join tgis_compartment as co on co.id = st.compartment_id left join tgis_mu_period as mup on co.mup_id = mup.id  " +
					  		" where  st.stand_id='"+standId+"'";
					  List<Stand> stands=DAOFactory.getFactory().getStandDAO().executeSQLQuery(query);
					  Stand stand=null;
					  if(stands.size()>0) {
						  stand=stands.get(0);
						     Geometry geombuffer =stand.getTheGeom().buffer(5).getEnvelope();
						     double minx = geombuffer.getCentroid().getX() - geombuffer.getEnvelopeInternal().maxExtent()/2;
						     double miny = geombuffer.getCentroid().getY() - geombuffer.getEnvelopeInternal().maxExtent()/2;
						     double maxx = geombuffer.getCentroid().getX() + geombuffer.getEnvelopeInternal().maxExtent()/2;
						     double maxy = geombuffer.getCentroid().getY() + geombuffer.getEnvelopeInternal().maxExtent()/2;
						     stand_box = minx + "," + miny + "," +  maxx + "," +  maxy;
						     data.element("stand_box", stand_box);
					         out.append(data.toString());
					  }

			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.standBox", e);
			throw new BusinessException("InputAction.standBox", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Stand search.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void standSearch() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		Session session = null;
		
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			String lang = getLocale().getLanguage();
			
			String fiterSql = filterSearch();
			String countfilter = "select count(*) as count  from stand_search";
			String searchDetailQuery = "Select * from stand_search";
			String cond = " where ";
			if(!fiterSql.isEmpty()){
				countfilter += cond + fiterSql;
				searchDetailQuery += cond + fiterSql;
				cond = " and ";
			}			
			BoUserSecurity user = getUser();
			Long reg=null;
			if(!user.getOperationalLevelVal().equals('C')){
				reg=user.getRegion().getId();
				countfilter += cond + " region_id="+reg;
				searchDetailQuery += cond + " region_id="+reg;
				
			}
			SQLQuery sqlQuery = session.createSQLQuery(countfilter);
			Object c = sqlQuery.uniqueResult();
			Integer count = new Integer((c!=null?c:0).toString());
			calcPages(count);
			
			searchDetailQuery += " LIMIT " + limit + " offset " + start;
			
			sqlQuery = session.createSQLQuery(searchDetailQuery);
			sqlQuery.addScalar("mu_id", LongType.INSTANCE);//0
			sqlQuery.addScalar("mu_name", StringType.INSTANCE);
			sqlQuery.addScalar("comp_id", LongType.INSTANCE);
			sqlQuery.addScalar("comp_nr", StringType.INSTANCE);
			sqlQuery.addScalar("st_id", LongType.INSTANCE);
			sqlQuery.addScalar("stand_id", StringType.INSTANCE);
			sqlQuery.addScalar("stand_nr", StringType.INSTANCE);
			sqlQuery.addScalar("basal_area", DoubleType.INSTANCE);
			sqlQuery.addScalar("stype", StringType.INSTANCE);
			sqlQuery.addScalar("stypeen", StringType.INSTANCE);
			sqlQuery.addScalar("stypesr", StringType.INSTANCE);
			sqlQuery.addScalar("acctext", StringType.INSTANCE);
			sqlQuery.addScalar("acctexten", StringType.INSTANCE);
			sqlQuery.addScalar("acctextsr", StringType.INSTANCE);
			sqlQuery.addScalar("mntext", StringType.INSTANCE);
			sqlQuery.addScalar("mntexten", StringType.INSTANCE);
			sqlQuery.addScalar("mntextsr", StringType.INSTANCE);
			
			List list = sqlQuery.list();
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());	
			JSONArray rows = new JSONArray();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				Object o[] = (Object[]) iterator.next();
				JSONObject jo = new JSONObject();
				
				jo.element("mu_id", o[0]!=null?(Long)o[0]:"");
				jo.element("mu_name", o[1]!=null?(String)o[1]:"");
				jo.element("comp_id", o[2]!=null?(Long)o[2]:"");
				jo.element("comp_nr", o[3]!=null?(String)o[3]:"");
				jo.element("st_id", o[4]!=null?(Long)o[4]:"");
				jo.element("stand_id", o[5]!=null?(String)o[5]:"");
				jo.element("stand_nr", o[6]!=null?(String)o[6]:"");
				jo.element("basal_area", o[7]!=null?(Double)o[7]:"");
				jo.element("stand_type", "en".equals(lang)?(o[9]!=null?(String)o[9]:""):"sr".equals(lang)?(o[10]!=null?(String)o[10]:""):(o[8]!=null?(String)o[8]:""));
				jo.element("access_type", "en".equals(lang)?(o[12]!=null?(String)o[12]:""):"sr".equals(lang)?(o[13]!=null?(String)o[13]:""):(o[11]!=null?(String)o[11]:""));
				jo.element("mngm_class", "en".equals(lang)?(o[15]!=null?(String)o[15]:""):"sr".equals(lang)?(o[16]!=null?(String)o[16]:""):(o[14]!=null?(String)o[14]:""));
				
				rows.add(jo);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			
		}catch(Exception e){
			log.error("FrmGridAction.standSearch", e);
			throw new BusinessException("FrmGridAction.standSearch", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Filter search.
	 *
	 * @return the string
	 */
	protected String filterSearch(){
			StringBuilder where = new StringBuilder();
			if(filters!=null && StringUtils.isNotEmpty(filters)){
				
				
				JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON(filters);
				String groupOp = jsonFilter.getString("groupOp");
				if(StringUtils.isNotEmpty(groupOp) && "or".equals(groupOp)) where.append("("); 
				
				JSONArray rules = jsonFilter.getJSONArray("rules");
				int rulesCount = JSONArray.getDimensions(rules)[0];
				
				boolean op_and = false;
				for (int i = 0; i < rulesCount; i++) {
					JSONObject rule = rules.getJSONObject(i);
					
					String data = null;
					try {
						data = new String(rule.getString("data").getBytes(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					if(data==null || StringUtils.isEmpty(data)) data = ""; 

					if("eq".equals(rule.getString("op"))){
						
						if("mu_id".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" mu_id = " + data + " ");
						}
						if("mu_name".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" mu_name = '" + data + "' ");
						}
						if("comp_id".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" comp_id = " + data + " ");
						}
						if("comp_nr".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" comp_nr = '" + data + "' ");
						}
						if("st_id".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" st_id = " + data + " ");
						}
						if("compartment_id".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" compartment_id = " + data + " ");
						}
						if("stand_id".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" stand_id = '" + data + "' ");
						}
						if("stand_nr".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" stand_nr = '" + data +"' ");
						}
						if("mngm_class".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" mngm_class = '" + data + "' ");
						}			
						if("basal_area".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" basal_area = " + data + " ");
						}
						if("stand_type".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" stand_type = '" + data + "' ");
						}
						if("access_type".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" access_type = '" + data + "' ");
						}
						op_and = true;
						
					}else if("ne".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append(rule.getString("field") + " <> '" + data + "' ");
						op_and = true;
					}else if("lt".equals(rule.getString("op"))){
						if("basal_area".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(rule.getString("field") + " < " + data + " ");;
						}else{
						if(op_and) where.append(groupOp + " ");
						where.append(rule.getString("field") + " < '" + data + "' ");
						}
						op_and = true;					
					}else if("le".equals(rule.getString("op"))){
						//where.append(rule.getString("field") + " <= " + data + " ");
						if("basal_area".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" basal_area <= " + data + " ");
						}	
						
						op_and = true;
					}else if("gt".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append(rule.getString("field") + " > '" + data + "' ");
						op_and = true;
					}else if("ge".equals(rule.getString("op"))){
						//where.append(rule.getString("field") + " >= " + data + " ");
						if("basal_area".equals(rule.getString("field"))){
							if(op_and) where.append(groupOp + " ");
							where.append(" basal_area >= '" + data + "' ");
						}					
						op_and = true;		
					}else if("bw".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append(  rule.getString("field") + "  ILIKE '" + data  + "%' ");
						op_and = true;
					}else if("bn".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append(  rule.getString("field") + "  NOT ILIKE '" + data  + "%' ");
						op_and = true;
					}else if("ew".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append( rule.getString("field") + "  ILIKE '%" + data + "' ");
						op_and = true;
					}else if("en".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append( rule.getString("field") + " NOT ILIKE '%" + data + "' ");
						op_and = true;
					}else if("cn".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append( rule.getString("field") + " ILIKE '%" + data + "%' ");
						op_and = true;
					}else if("nc".equals(rule.getString("op"))){
						if(op_and) where.append(groupOp + " ");
						where.append(  rule.getString("field") + "  NOT ILIKE '%" + data + "%' ");
						op_and = true;
					}				
					
					log.debug("where :" + where.toString());
					
				}			
				
				if(StringUtils.isNotEmpty(groupOp) && "or".equals(groupOp)) where.append(") ");
				
			}
			return where.toString();
		}

	/**
	 * Activity domain tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void activityDomainTree() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				//String condtion = getCondition();

				ActivityDomainDAO dao=DAOFactory.getFactory().getActivityDomainDAO();
				String query="select * from tfrm_activity_domain order by id";
//				if(StringUtils.isNotEmpty(condtion)){
//					condtion = condtion.replaceAll("name_al", "name_al");
//					query += " where " + condtion;
//				}
				
				List<ActivityDomain> list=dao.executeSQLQuery(query);
				
				Integer count = list.size();
				calcPages(count);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				ActivityDomainTree tree=new ActivityDomainTree();
				List<ActivityDomain> parentList = dao.executeSQLQuery("select *  from tfrm_activity_domain as a where  a.parent_id is null");
				ActivityDomainNode pnode=new ActivityDomainNode();
				pnode.setData( parentList.get(0));
				tree.setRootElement(pnode);
				for (ActivityDomain a : list) {
						ActivityDomainNode node=new ActivityDomainNode();
						node.setData(a);
						Node<ActivityDomain> parent = tree.findParent(tree.getRootElement(), a.getId());
						if(parent == null) {
							loadActivityDomainParents(dao, tree, node, a.getId());
						}else{
						parent.addChild(node);
						node.setParent(parent);
						}
					
				}	
				
				data.element("rows", tree.getJSONArray());
				out.append(data.toString());
				out.flush();		
			
		}catch (Exception e){
			log.error("FrmGridAction.activityDomainTree", e);
			throw new BusinessException("FrmGridAction.activityDomainTree", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Activitydomain.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void activitydomain() throws IOException,BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try {
				ActivityDomainDAO dao=DAOFactory.getFactory().getActivityDomainDAO();
				String sqlQuery="select distinct(i.*) from tfrm_activity_domain as i left join tfrm_activity_domain as ref  on i.id=ref.parent_id where i.parent_id is null";
				String countQuery="select count(distinct(i.*)) from tfrm_activity_domain as i left join tfrm_activity_domain as ref  on i.id=ref.parent_id where i.parent_id is null";
				
				Integer count=dao.countQuery(countQuery);
				calcPages(count);
				sqlQuery+=" order by id desc ";
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				
				List<ActivityDomain> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
		
				JSONArray rows=new JSONArray();
				for(ActivityDomain s:list){
					JSONObject jo=new JSONObject();	
					jo.element("id", "\"" + s.getId() + "\"");
					
					if(s.getActivityDomain() != null){
						jo.element("parent_id", s.getActivityDomain().getId());
					}else{
						jo.element("parent_id", "");
					}
					jo.element("name_al", s.getNameAl());
					jo.element("name_en",s.getNameEn());
					jo.element("name_sr", s.getNameSr());
					jo.element("type", s.getType());
					jo.element("code", s.getCode());
					
					if(s.getActivityDomain() != null){
						jo.element("parent", "\"" + s.getActivityDomain().getId()+ "\"");
					}else{
						jo.element("parent", "");
					}
					
					rows.add(jo);
					
				}
				data.element("rows", rows);
				
				out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.activitydoamin", e);
		} finally {
			out.close();
		}
	}
	
	
	/**
	 * Load activity domain parents.
	 *
	 * @param dao the dao
	 * @param tree the tree
	 * @param node the node
	 * @param parentId the parent id
	 */
	private void loadActivityDomainParents(ActivityDomainDAO dao, ActivityDomainTree tree, ActivityDomainNode node, Long parentId){
			List<ActivityDomain> activityList = dao.executeSQLQuery("select *  from tfrm_activity_domain as a  where a.id =" + parentId);
			ActivityDomain activityDomain=activityList.get(0);
			ActivityDomainNode parent=new ActivityDomainNode();
			parent.setData(activityDomain);		
			parent.addChild(node);
			node.setParent(parent);
			
			if(activityDomain.getActivityDomain()!=null && activityDomain.getActivityDomain().getId()!=null){
				Node<ActivityDomain> nextParent = tree.findParent(tree.getRootElement(), activityDomain.getActivityDomain().getId());
				if(nextParent==null){
					loadActivityDomainParents(dao, tree, parent, activityDomain.getActivityDomain().getId());
				}else{
					nextParent.addChild(node);
					node.setParent(nextParent);		
				}
			}
	}
	
	/**
	 * AJAX Method- layerGisData.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void layerGisData() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try{
		String module=request.getParameter("module");
		String query="select * from tlayers_gis where module ilike '%"+module+"%' order by sort";
		List<LayersGis> list=DAOFactory.getFactory().getLayersGisDAO().executeSQLQuery(query);
		JSONArray jsonArray = new JSONArray();
		for (LayersGis  l: list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.element("id", l.getId());
//			jsonObject.element("parent_id", l.getLayersGis().getId());
			jsonObject.element("url", l.getUrl());
			jsonObject.element("service_type", l.getServiceType());
			jsonObject.element("featurens", l.getFeaturens());
			jsonObject.element("store", l.getStore());
			jsonObject.element("feature_type_layer", l.getFeatureTypeLayer());
			jsonObject.element("is_base_layer", l.getIsBaseLayer());
			jsonObject.element("min_scale", l.getMinScale());
			jsonObject.element("srs_name", l.getSrsName());
			jsonObject.element("outputformat", l.getOutputformat());
			jsonObject.element("tiled", l.getTiled());
			jsonObject.element("transparent", l.getTransparent());
			if(l.getVisibility()==null)jsonObject.element("visibility", false);
			else jsonObject.element("visibility", l.getVisibility());
			jsonObject.element("tilesize", l.getTilesize());
			jsonArray.add(jsonObject);
		}
		String str = jsonArray.toString();
		out.append(str);
		out.flush();
		}catch (Exception e){
			log.error("InputAction.layerGisData", e);
			throw new BusinessException("InputAction.layerGisData", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Layer gis tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void layerGisTree() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String condtion = getCondition();
			LayersGisDAO dao=DAOFactory.getFactory().getLayersGisDAO();
			
			
			String query = "select * from tlayers_gis l order by l.sort";
			if(StringUtils.isNotEmpty(condtion)){
				condtion = condtion.replaceAll("store", "l.store");
				query += " where " + condtion;
			}
			List<LayersGis> list = dao.executeSQLQuery(query);
			
			Integer count = list.size();
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			LayerGisTree tree = new LayerGisTree();
			List<LayersGis> parentList = dao.executeSQLQuery("select * from tlayers_gis where parent_id is null");
			LayerGisNode pnode = new LayerGisNode();
			pnode.setData(parentList.get(0));
			tree.setRootElement(pnode);
			
			
			for (LayersGis org : list) {
				if(org.getLayersGis() != null){
					LayerGisNode node = new LayerGisNode();
					node.setData(org);
					Node<LayersGis> parent = tree.findParent(tree.getRootElement(), org.getLayersGis().getId());
					if(parent == null) {
						loadLayerParents(dao, tree, node, org.getLayersGis().getId());
					}else{
					parent.addChild(node);
					node.setParent(parent);
					}
				}
				
			}	
			
			data.element("rows", tree.getJSONArray());
			out.append(data.toString());
//			System.out.println(tree.getJSONArray().toString());
//			System.out.println(tree.print());
			out.flush();			
			
		}catch (Exception e){
			log.error("FrmGridAction.layerGisTree", e);
			throw new BusinessException("FrmGridAction.layerGisTree", e);
		} finally {
			out.close();
		}
	}	
	
	/**
	 * Load layer parents.
	 *
	 * @param dao the dao
	 * @param tree the tree
	 * @param node the node
	 * @param parentId the parent id
	 */
	private void loadLayerParents(LayersGisDAO dao, LayerGisTree tree, LayerGisNode node, Long parentId){
		List<LayersGis> orgaList = dao.executeSQLQuery("select * from tlayers_gis where id = " + parentId);
		LayersGis layersgis = orgaList.get(0);
		
		LayerGisNode parent = new LayerGisNode();
		parent.setData(layersgis);		
		parent.addChild(node);
		node.setParent(parent);
		
		if(layersgis.getLayersGis() != null && layersgis.getLayersGis().getId()!=null){
			Node<LayersGis> nextParent = tree.findParent(tree.getRootElement(), layersgis.getLayersGis().getId());
			if(nextParent==null){
				loadLayerParents(dao, tree, parent, layersgis.getLayersGis().getId());
			}else{
				nextParent.addChild(node);
				node.setParent(nextParent);		
			}
		}
	}
	
	/**
	 * Layer gis tree 2.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void layerGisTree2() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacObjectDAO dao = DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String countQuery = "select count(*) from tlayers_gis";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			LayersGisTree tree = DAOFactory.getFactory().getLayersGisDAO().getTree(new Long(15));
			List<com.geoland.kfis.web.action.frm.compartment.tree.Node<LayersGis>> list = tree.toList();
			for (com.geoland.kfis.web.action.frm.compartment.tree.Node<LayersGis> node: list) {
				//String legendUrl=getSettings().getString("geoserver_url")+"?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&STRICT=false&layer="+node.getData().getFeatureTypeLayer();
				String legendUrl=node.getData().getUrl()+"?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&STRICT=false&layer="+node.getData().getFeatureTypeLayer();
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", "\"" + node.getData().getId() + "\"");
				jsonObject.element("store", node.getData().getStore());
				jsonObject.element("url", node.getData().getUrl());
				jsonObject.element("service_type", node.getData().getServiceType());
				jsonObject.element("featurens", node.getData().getFeaturens());
				jsonObject.element("feature_type_layer",node.getData().getFeatureTypeLayer());
				jsonObject.element("is_base_layer", node.getData().getIsBaseLayer());
				jsonObject.element("min_scale", node.getData().getMinScale());
				jsonObject.element("srs_name", node.getData().getSrsName());
				jsonObject.element("outputformat", node.getData().getOutputformat());
				jsonObject.element("tiled", node.getData().getTiled());
				jsonObject.element("transparent", node.getData().getTransparent());
				jsonObject.element("visibility",node.getData().getVisibility());
				jsonObject.element("tilesize", node.getData().getTilesize());
				jsonObject.element("legendUrl", legendUrl);
				jsonObject.element("level", node.getLevel());
				if(node.getData().getLayersGis()!=null){
					jsonObject.element("parent", "\"" + node.getData().getLayersGis().getId() + "\"");
				}else{
					jsonObject.element("parent", "");
				}
				if(node.getData().getUrl()==null){
					jsonObject.element("in_map", false);
				}else{
					jsonObject.element("in_map", true);
				}
				jsonObject.element("isLeaf", node.isLeaf());
				jsonObject.element("expanded", true);
				jsonObject.element("loaded", true);
				
				rows.add(jsonObject);
			}			
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("FrmGridAction.layerGisTree2", e);
			throw new BusinessException("FrmGridAction.layerGisTree2", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Affrefproject.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void affrefproject() throws IOException,BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try {
			
//			InspectionDAO dao=DAOFactory.getFactory().getInspectionDAO();
			AffRefProjectsDAO dao=DAOFactory.getFactory().getAffRefProjectsDAO();
			String language = getLocale().getLanguage();	
			
				
				String sqlQuery="select distinct(i.*) from taff_ref_projects as i left join taff_ref_projects as ref  on i.id=ref.refer_id where i.refer_id is null";
				String countQuery="select count(distinct(i.*)) from taff_ref_projects as i left join taff_ref_projects as ref  on i.id=ref.refer_id where i.refer_id is null";
				
				Integer count=dao.countQuery(countQuery);
				calcPages(count);
				sqlQuery+=" order by id desc ";
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				
				List<AffRefProjects> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				Class<?> c = AffRefProjects.class;
				Table table = c.getAnnotation(Table.class);
				String tableName = table.name();
				Key aesKey = new SecretKeySpec(keyAesAsString.getBytes(), "AES");

				String encryptedText= encrypt(tableName,aesKey);
				 
				JSONArray rows=new JSONArray();
				for(AffRefProjects s:list){
					JSONObject jo=new JSONObject();	
					jo.element("id", s.getId());
					jo.element("name", s.getName());
					if(s.getAffRefProjects()!=null)
						jo.element("parent_id", s.getAffRefProjects().getId());
					else
						jo.element("parent_id", "");
					jo.element("data_from", s.getName());
					jo.element("created_time",fdate(s.getCreatedTime()));	
					jo.element("created_by",getPersonData(s.getPerson()));
					jo.element("remarks", s.getRemarks());
					jo.element("encryptedText", encryptedText);
					
					rows.add(jo);
					
				}
				data.element("rows", rows);
				
				out.append(data.toString());
				out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("FrmGridAction.affrefproject", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Geom details.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void geomDetails() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request= ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String language = getLocale().getLanguage();
			String the_geom = request.getParameter("the_geom");
			if(StringUtils.isNotEmpty(the_geom)){
			
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			CompartmentDAO dao = DAOFactory.getFactory().getCompartmentDAO();
			
			String countQuery = "select count(*) from get_surfacedata('"+the_geom+"')";
			String sqlQuery = "select * from get_surfacedata('"+the_geom+"')";
			

			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			SQLQuery SQLQuery = s.createSQLQuery(sqlQuery);
			SQLQuery.addScalar("nr", LongType.INSTANCE);
			SQLQuery.addScalar("min_elevation", DoubleType.INSTANCE);
			SQLQuery.addScalar("max_elevation", DoubleType.INSTANCE);
			SQLQuery.addScalar("mean_elevation", DoubleType.INSTANCE);
			SQLQuery.addScalar("min_slope", DoubleType.INSTANCE);
			SQLQuery.addScalar("max_slope", DoubleType.INSTANCE);
			SQLQuery.addScalar("mean_slope", DoubleType.INSTANCE);
			SQLQuery.addScalar("exp", StringType.INSTANCE);
			SQLQuery.addScalar("soil_code", StringType.INSTANCE);

			
			
			List list = SQLQuery.list();
//			List<Compartment> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				Long id = (Long) obj[0];
				Double min_elevation = (Double) obj[1];
				Double max_elevation = (Double) obj[2];
				Double mean_elevation = (Double) obj[3];
				Double min_slope = (Double) obj[4];
				Double max_slope = (Double) obj[5];
				Double mean_slope=(Double) obj[6];
				Integer exp = (Integer) obj[7];
				String soil_code = (String) obj[8];

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("nr", id);
				jsonObject.element("min_elevation", min_elevation);
				jsonObject.element("max_elevation", max_elevation);
				jsonObject.element("mean_elevation", mean_elevation);
				jsonObject.element("min_slope", min_slope);
				jsonObject.element("max_slope", max_slope);
				jsonObject.element("mean_slope", mean_slope);
				jsonObject.element("max_slope", max_slope);
				jsonObject.element("exp", exp);
				jsonObject.element("soil_code", soil_code);
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.geomDetails", e);
			throw new BusinessException("FrmGridAction.geomDetails", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Parcel details.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void parcelDetails() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request= ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String cordx = request.getParameter("cordx");
			String cordy = request.getParameter("cordy");
			String pointProjection = request.getParameter("pointProjection");

			if(StringUtils.isNotEmpty(cordx) && StringUtils.isNotEmpty(cordy)&& StringUtils.isNotEmpty(pointProjection)){
			
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			
			String sqlQuery = "select * from get_parc_ow_by_coord("+cordx+", "+cordy+","+pointProjection+")";
			
			SQLQuery SQLQuery = s.createSQLQuery(sqlQuery);
			SQLQuery.addScalar("cadzone", LongType.INSTANCE);
			SQLQuery.addScalar("cad_zona_name", StringType.INSTANCE);
			SQLQuery.addScalar("parcelnr", LongType.INSTANCE);
			SQLQuery.addScalar("subparcelnr", LongType.INSTANCE);
			SQLQuery.addScalar("placename", StringType.INSTANCE);
			SQLQuery.addScalar("culturename", StringType.INSTANCE);
			SQLQuery.addScalar("clas", LongType.INSTANCE);
			SQLQuery.addScalar("area", LongType.INSTANCE);
			SQLQuery.addScalar("pers_stat", StringType.INSTANCE);
			SQLQuery.addScalar("partsn", StringType.INSTANCE);
			SQLQuery.addScalar("cadparcelid", StringType.INSTANCE);



			
			
			List list = SQLQuery.list();
			
		
			
			JSONArray data = new JSONArray();
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				Long cadzone = (Long) obj[0];
				String cad_zona_name = (String) obj[1];
				Long parcelnr = (Long) obj[2];
				Long subparcelnr = (Long) obj[3];
				String placename = (String) obj[4];
				String culturename = (String) obj[5];
				Long clas=(Long) obj[6];
				Long area = (Long) obj[7];
				String pers_stat = (String) obj[8];
				String partsn = (String) obj[9];
				String cadparcelid = (String) obj[10];
				

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("cadzone", cadzone);
				jsonObject.element("cad_zona_name", cad_zona_name);
				jsonObject.element("parcelnr", parcelnr);
				jsonObject.element("subparcelnr", subparcelnr);
				jsonObject.element("placename", placename);
				jsonObject.element("culturename", culturename);
				jsonObject.element("clas", clas);
				jsonObject.element("area", area);
				jsonObject.element("pers_stat", pers_stat);
				jsonObject.element("partsn", partsn);
				jsonObject.element("cadparcelid", cadparcelid);
				
				data.add(jsonObject);
			}

			out.append(data.toString());
			out.flush();
			}
		}catch (Exception e){
			log.error("FrmGridAction.parcelDetails", e);
			throw new BusinessException("FrmGridAction.parcelDetails", e);
		} finally {
			out.close();
		}		
	}	

	
	
}
	



