package com.geoland.kfis.web.action.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.BooleanType;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.dao.services.RbacObjectDAO;
import com.geoland.framework.persistence.dao.services.RbacRoleDAO;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.rbac.RbacObject;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.CadastralZone;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.Contractor;
import com.geoland.kfis.model.DecisionType;
import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.DhpetAnimalLocation;
import com.geoland.kfis.model.DhpetAnnualPlan;
import com.geoland.kfis.model.DhpetLocation;
import com.geoland.kfis.model.DhpetTouristPurpose;
import com.geoland.kfis.model.DhpetWildAnimals;
import com.geoland.kfis.model.DhpetWildAnimalsRequest;
import com.geoland.kfis.model.EconomicCode;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.model.FrmDomain;
import com.geoland.kfis.model.FrmDomainName;
import com.geoland.kfis.model.InspActionType;
import com.geoland.kfis.model.Language;
import com.geoland.kfis.model.ManagementUnit;
import com.geoland.kfis.model.ManagementUnitPeriod;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.ParcelDetail;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PrcmtTenderBidder;
import com.geoland.kfis.model.PrcmtTenderRequest;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.model.RequestType;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.model.UnitsMetric;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.ActivityDomainDAO;
import com.geoland.kfis.persistence.dao.services.AnnualPlanningDAO;
import com.geoland.kfis.persistence.dao.services.CadastralMunicipalityDAO;
import com.geoland.kfis.persistence.dao.services.CadastralZoneDAO;
import com.geoland.kfis.persistence.dao.services.CompartmentDAO;
import com.geoland.kfis.persistence.dao.services.ContractorDAO;
import com.geoland.kfis.persistence.dao.services.DecisionTypeDAO;
import com.geoland.kfis.persistence.dao.services.DevicesDAO;
import com.geoland.kfis.persistence.dao.services.DhpetAnimalLocationDAO;
import com.geoland.kfis.persistence.dao.services.DhpetLocationDAO;
import com.geoland.kfis.persistence.dao.services.DhpetWildAnimalsDAO;
import com.geoland.kfis.persistence.dao.services.EconomicCodeDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeSalaryDAO;
import com.geoland.kfis.persistence.dao.services.FinancialTypeDAO;
import com.geoland.kfis.persistence.dao.services.FrmDomainDAO;
import com.geoland.kfis.persistence.dao.services.LanguageDAO;
import com.geoland.kfis.persistence.dao.services.ManagementUnitDAO;
import com.geoland.kfis.persistence.dao.services.OrganisationDAO;
import com.geoland.kfis.persistence.dao.services.ParcelDetailDAO;
import com.geoland.kfis.persistence.dao.services.PersonDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderBidderDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderRequestDAO;
import com.geoland.kfis.persistence.dao.services.RegionDAO;
import com.geoland.kfis.persistence.dao.services.StandDAO;
import com.geoland.kfis.persistence.dao.services.TreeSpeciesDAO;
import com.geoland.kfis.persistence.dao.services.UnitsMetricDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Landtype;
import com.geoland.kfis.persistence.hibernate.usertypes.Periodtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.operation.valid.IsValidOp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

// TODO: Auto-generated Javadoc
/**
 * The Class InputAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 20, 2014 1:11:27 PM
 * @Version 1.0
 */
public class InputAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The log. */
	protected Logger log = Logger.getLogger(InputAction.class);
	
	/**
	 * AJAX Method - frmDomain.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void frmDomain() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			if(StringUtils.isNotEmpty(nameStartsWith)){
				FrmDomainDAO dao = DAOFactory.getFactory().getFrmDomainDAO();
				String sqlQuery = null;
				String lang = getLocale().getLanguage().toLowerCase();
				String dom_type=request.getParameter("dom_type");
				if("en".equals(lang)){
					sqlQuery = "select d.* from tfrm_domain as d WHERE d.domain_activity ILIKE '%" + nameStartsWith + "%'";// order by d.domain_category_sort asc, d.domain_type_sort asc, d.domain_activity_sort asc";
					if(StringUtils.isNotEmpty(dom_type)){
						sqlQuery+=" and d.domain_type='"+dom_type+"'";
					}
					sqlQuery+=" order by d.domain_category_sort asc, d.domain_type_sort asc, d.domain_activity_sort asc";
				}else{
					sqlQuery = "select d.*, dn.* from tfrm_domain as d left join tfrm_domain_name as dn on d.id = dn.domain_id WHERE dn.domain_activity ILIKE '%" + nameStartsWith + "%' and lower(lang_code) = '" + lang + "'";// order by d.domain_activity_sort asc, dn.domain_sort asc";
					if(StringUtils.isNotEmpty(dom_type)){
						sqlQuery+=" and d.domain_type='"+dom_type+"'";
					}
					sqlQuery+=" order by d.domain_activity_sort asc, dn.domain_sort asc";
				}
				
				List<FrmDomain> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (FrmDomain o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					if("en".equals(lang)){
						jsonObject.element("name", o.getDomainActivity());
						jsonObject.element("type", o.getDomainType());
						jsonObject.element("category", o.getDomainCategory());
					}else{
						Set<FrmDomainName> frmDomainNames = o.getFrmDomainNames();
						for (FrmDomainName frmDomainName : frmDomainNames) {
							if(lang.equals(frmDomainName.getLangCode().toLowerCase())){
								jsonObject.element("name", frmDomainName.getDomainActivity());
								jsonObject.element("type", frmDomainName.getDomainType());
								jsonObject.element("category", frmDomainName.getDomainCategory());
								break;
							}
						}
					}
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.frmDomain", e);
			throw new BusinessException("InputAction.frmDomain", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * AJAX Method - activityDomain.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void activityDomain() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				String nameStartsWith = request.getParameter("name_startsWith").trim();
			
				ActivityDomainDAO dao = DAOFactory.getFactory().getActivityDomainDAO();
				String sqlQuery;
				String dom_code=request.getParameter("dom_code").trim();
				String lang = getLocale().getLanguage().toLowerCase();
				sqlQuery = "SELECT * FROM tfrm_activity_domain d";
				if(StringUtils.isNotEmpty(dom_code)){
					sqlQuery+=" LEFT JOIN tfrm_activity_domain p ON p.id=d.parent_id  WHERE p.code='"+dom_code+"' AND LOWER(d.type)='a'";
				}
				
				if(StringUtils.isNotEmpty(nameStartsWith)){
					if(StringUtils.isNotEmpty(dom_code)){
						sqlQuery+=" AND ";
					}else{
						sqlQuery+=" WHERE ";
					}
					if("al".equals(lang)){
						 sqlQuery+=" d.name_al ILIKE '%" + nameStartsWith + "%'";
					}else if("sr".equals(lang)){
						sqlQuery += " d.name_sr ILIKE '%" + nameStartsWith + "%'";
					}else{
						sqlQuery += " d.name_en ILIKE '%" + nameStartsWith + "%'";					
					}
				}
				
				sqlQuery+=" order by d.sort asc";
				List<ActivityDomain> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (ActivityDomain o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("code", o.getClass());
					if("al".equals(lang)){
						jsonObject.element("name", o.getNameAl());
					}else if("sr".equals(lang)){
						jsonObject.element("name", o.getNameSr());						
					}else{
						jsonObject.element("name", o.getNameEn());
					}
					jsonObject.element("type", o.getType());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);

				out.flush();
		}catch (Exception e){
			log.error("InputAction.activityDomain", e);
			throw new BusinessException("InputAction.activityDomain", e);
		} finally {
			out.close();
		}		
	}	

	/**
	 * AJAX Method - treeSpecies.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void treeSpecies() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			TreeSpeciesDAO dao = DAOFactory.getFactory().getTreeSpeciesDAO();
			String sqlQuery;
			String lang = getLocale().getLanguage().toLowerCase();
			sqlQuery = "SELECT * FROM tfrm_tree_species";
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("al".equals(lang)){
					sqlQuery += " WHERE name_al ILIKE '%" + nameStartsWith + "%'";
				}else if("sr".equals(lang)){
					sqlQuery += " WHERE name_sr ILIKE '%" + nameStartsWith + "%'";
				}else{
					sqlQuery += " WHERE name_en ILIKE '%" + nameStartsWith + "%'";					
				}
			}
			
			List<TreeSpecies> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (TreeSpecies o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("code", o.getClass());
				if("al".equals(lang)){
					jsonObject.element("name", o.getNameAl());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getNameEn());
				}
				jsonObject.element("name_la", o.getNameLa());
				jsonObject.element("species_group", "al".equals(lang)?o.getSpeciesGroup().getDOMTEXT():"sr".equals(lang)?o.getSpeciesGroup().getDOMTEXT_SR():o.getSpeciesGroup().getDOMTEXT_EN());
				jsonObject.element("species_bonitet", o.getSpeciesBonitet());
				jsonObject.element("max_diameter", o.getMaxDiameter());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.treeSpecies", e);
			throw new BusinessException("InputAction.treeSpecies", e);
		} finally {
			out.close();
		}		
	}		
	
	/**
	 * AJAX Method - annual planning.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualplanning() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			if(StringUtils.isNotEmpty(nameStartsWith)){
				AnnualPlanningDAO dao = DAOFactory.getFactory().getAnnualPlanningDAO();
				String sqlQuery = null;
				String lang = getLocale().getLanguage().toLowerCase();
				if("en".equals(lang)){
					sqlQuery = "select * from tfrm_annual_planning as p left join tgis_cadastral_municipality c on p.mun_id = c.id WHERE c.name_en ILIKE '%" + nameStartsWith + "%'";
				}else if("sr".equals(lang)){
					sqlQuery = "select * from tfrm_annual_planning as p left join tgis_cadastral_municipality c on p.mun_id = c.id WHERE c.name_sr ILIKE '%" + nameStartsWith + "%'";
				}else{
					sqlQuery = "select * from tfrm_annual_planning as p left join tgis_cadastral_municipality c on p.mun_id = c.id WHERE c.name ILIKE '%" + nameStartsWith + "%'";
				}				
				
				List<AnnualPlanning> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (AnnualPlanning o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					if("en".equals(lang)){
						jsonObject.element("name", o.getCadastralMunicipality().getNameEn());
					}else if("sr".equals(lang)){
						jsonObject.element("name", o.getCadastralMunicipality().getNameSr());
					}else{
						jsonObject.element("name", o.getCadastralMunicipality().getName());
					}					
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.annualplanning", e);
			throw new BusinessException("InputAction.annualplanning", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method - dhpetLocation.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dhpetLocation() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			DhpetLocationDAO dao = DAOFactory.getFactory().getDhpetLocationDAO();
			String sqlQuery;
			sqlQuery = "SELECT * FROM tdhpet_location";
			String cond = " WHERE ";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery +=cond+" habitat_location ILIKE '%" + nameStartsWith + "%'";
				cond=" AND ";
			}
			User user = getUser().getUser();
			sqlQuery+=cond+" superintend_by="+getUser().getPerson().getId();;
			
			
			List<DhpetLocation> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (DhpetLocation o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getHabitatLocation());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.dhpetLocation", e);
			throw new BusinessException("InputAction.dhpetLocation", e);
		} finally {
			out.close();
		}		
	}	
	
	
	/**
	 * AJAX Method - organisation.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void organisation() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			OrganisationDAO dao = DAOFactory.getFactory().getOrganisationDAO();
			String orglevel = request.getParameter("orglevel");
			String orgtype = request.getParameter("orgtype");
			String sqlQuery;
			Organisation org = getUser().getOrganisation();
			sqlQuery = "SELECT o.*, p.*  FROM torganisation AS o LEFT JOIN tparty AS p ON o.id = p.id where p.active='true'";
			
			if(StringUtils.isNotEmpty(orglevel)){
				 sqlQuery += " and oper_level_val='"+orglevel+"'" ;
			}
			
			if(StringUtils.isNotEmpty(orgtype)){
					sqlQuery += " and orga_type='"+orgtype+"'";
			}
			if(org.getOperLevelVal()!='C'){
				sqlQuery+=" and (o.id=any (get_all_children_array("+org.getId()+")) or o.id="+org.getId()+")";
			}
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " and LOWER(o.orga_name) LIKE '" + nameStartsWith.toLowerCase().trim() + "%'" ;
			}
			sqlQuery+=" order by o.orga_name";
			List<Organisation> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Organisation o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getOrgaName()+" ("+o.getOperLevelVal()+")");
				jsonObject.element("code", o.getCode());
				jsonObject.element("oper_level", o.getOperLevel());
				jsonObject.element("oper_level_val", o.getOperLevelVal());
				jsonObject.element("orga_category", o.getOrgaCategory());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);

			out.flush();
		}catch (Exception e){
			log.error("InputAction.organisation", e);
			throw new BusinessException("InputAction.organisation", e);
		} finally {
			out.close();
		}		
	}	
	
	
	/**
	 * AJAX Method - economicCode.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void economicCode() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			EconomicCodeDAO dao = DAOFactory.getFactory().getEconomicCodeDAO();
			String orglevel = request.getParameter("orglevel");
			String orgtype = request.getParameter("orgtype");
			String sqlQuery;
			Organisation org = getUser().getOrganisation();
			sqlQuery = "select * from economic_code_tree";
			
			/*
			if(StringUtils.isNotEmpty(orglevel)){
				 sqlQuery += " and oper_level_val='"+orglevel+"'" ;
			}
			
			if(StringUtils.isNotEmpty(orgtype)){
					sqlQuery += " and orga_type='"+orgtype+"'";
			}
			if(org.getOperLevelVal()!='C'){
				sqlQuery+=" and (o.id=any (get_all_children_array("+org.getId()+")) or o.id="+org.getId()+")";
			}
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " and LOWER(o.orga_name) LIKE '" + nameStartsWith.toLowerCase().trim() + "%'" ;
			}
			sqlQuery+=" order by o.orga_name";
			*/
			
			List<EconomicCode> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (EconomicCode o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				
				if(o.getParent()!=null) {
					jsonObject.element("parent_id", o.getParent().getId());
				}else {
					jsonObject.element("parent_id", "");
				}
				
				jsonObject.element("name", o.getNameAl());
				jsonObject.element("nameEn", o.getNameEn());
				jsonObject.element("nameSr", o.getNameSr());
				jsonObject.element("code", o.getCode());
				jsonObject.element("level", o.getLevel());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);

			out.flush();
		}catch (Exception e){
			log.error("InputAction.economicCode", e);
			throw new BusinessException("InputAction.economicCode", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * AJAX Method- employee.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void employee() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			EmployeeDAO dao = DAOFactory.getFactory().getEmployeeDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String roleCode = request.getParameter("role_code");
			String roleCodeInsp=request.getParameter("roleCodeInsp");
			
					
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String sqlQuery = null;
				if(nameStartsWith.indexOf(" ")>0){
					String[] split = nameStartsWith.split(" ");
					sqlQuery = "SELECT e.*, p.*, y.* FROM thrm_employee AS e LEFT JOIN tperson AS p ON e.id = p.id LEFT JOIN tparty AS y ON p.id = y.id WHERE (y.party_type = 'P' or y.party_type = 'E') and y.active=true AND LOWER(p.first_name) ILIKE '" + split[0] + "%' AND LOWER(p.last_name) ILIKE '" + split[0] + "%'";
				}else{
					sqlQuery = "SELECT e.*, p.*, y.* FROM thrm_employee AS e LEFT JOIN tperson AS p ON e.id = p.id LEFT JOIN tparty AS y ON p.id = y.id WHERE (y.party_type = 'P' or y.party_type = 'E') and y.active=true AND LOWER(p.first_name) ILIKE '" + nameStartsWith.toLowerCase() + "%'";
				}
				
				if(StringUtils.isNotEmpty(roleCode)){
					sqlQuery+="	and (role_code='"+roleCode+"'";
					
					if(StringUtils.isNotEmpty(roleCodeInsp)){
						sqlQuery+="	or role_code='"+roleCodeInsp+"'";
						
					}
					sqlQuery+=")";
				}
			
				
				List<Employee> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (Employee o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", o.getFirstName()+" "+o.getLastName());
					jsonObject.element("birthdate", DATE_FORMAT.format(o.getBirthdate()));
					jsonObject.element("ssnNr", o.getEmpSsnNum());
					
					jsonArray.add(jsonObject);
				}
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.employee", e);
			throw new BusinessException("InputAction.employee", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * AJAX Method- employeeWithSalary.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void employeeWithSalary() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			EmployeeSalaryDAO dao = DAOFactory.getFactory().getEmployeeSalaryDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String roleCode = request.getParameter("role_code");
			String roleCodeInsp=request.getParameter("roleCodeInsp");
			
					
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String sqlQuery = null;
				if(nameStartsWith.indexOf(" ")>0){
					String[] split = nameStartsWith.split(" ");
					sqlQuery = "SELECT s.* FROM thrm_employee AS e LEFT JOIN tperson AS p ON e.id = p.id LEFT JOIN tparty AS y ON p.id = y.id right join thrm_employee_salary as s on s.employee_id = e.id WHERE (y.party_type = 'P' or y.party_type = 'E') and y.active=true AND LOWER(p.first_name) ILIKE '" + split[0] + "%' AND LOWER(p.last_name) ILIKE '" + split[0] + "%'";
				}else{
					sqlQuery = "SELECT s.* FROM thrm_employee AS e LEFT JOIN tperson AS p ON e.id = p.id LEFT JOIN tparty AS y ON p.id = y.id right join thrm_employee_salary as s on s.employee_id = e.id WHERE (y.party_type = 'P' or y.party_type = 'E') and y.active=true AND LOWER(p.first_name) ILIKE '" + nameStartsWith.toLowerCase() + "%'";
				}
				
				if(StringUtils.isNotEmpty(roleCode)){
					sqlQuery+="	and (role_code='"+roleCode+"'";
					
					if(StringUtils.isNotEmpty(roleCodeInsp)){
						sqlQuery+="	or role_code='"+roleCodeInsp+"'";
						
					}
					sqlQuery+=")";
				}
				
				List<EmployeeSalary> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (EmployeeSalary c : list) {
					JSONObject jsonObject = new JSONObject();
					
					jsonObject.element("id", c.getId());
					jsonObject.element("employeeId", c.getEmployee().getId());
					jsonObject.element("employee", c.getEmployee().getFirstName()+" "+c.getEmployee().getLastName());
					jsonObject.element("firstName", c.getEmployee().getFirstName());
					jsonObject.element("lastName", c.getEmployee().getLastName());
					jsonObject.element("birthdate", DATE_FORMAT.format(c.getEmployee().getBirthdate()));
					jsonObject.element("basicsalary", c.getBasicsalary());
					jsonObject.element("grosssalary", c.getGrosssalary());
					jsonObject.element("payperiod", c.getPayperiod());
					jsonObject.element("regularworkhours", c.getRegularworkhours());
					
					jsonArray.add(jsonObject);
				}
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.employeeWithSalary", e);
			throw new BusinessException("InputAction.employeeWithSalary", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- employee.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void language() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang = getLocale().getLanguage().toLowerCase();
			String lang_f="";
			if(lang.equals("en"))
				lang_f= "l.name_en";
			if(lang.equals("al"))
				lang_f= "l.name";
			else if(lang.equals("sr"))
				lang_f= "l.name_sr";
				
			LanguageDAO dao=DAOFactory.getFactory().getLanguageDAO();
			String sqlQuery = "SELECT l.* FROM thrm_language AS l";
			String nameStartsWith = request.getParameter("name_startsWith");
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				
				if(nameStartsWith.indexOf(" ")>0){
					String[] split = nameStartsWith.split(" ");
					sqlQuery +=" WHERE LOWER("+lang_f+") ILIKE '"+split[0]+"%'";
				}else{
					sqlQuery +=" WHERE LOWER("+lang_f+") ILIKE '"+nameStartsWith.toLowerCase()+"%'";
				}
				
				List<Language> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (Language o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					
					if(lang.equals("en"))
						jsonObject.element("name", o.getNameEn());
					if(lang.equals("al"))
						jsonObject.element("name", o.getName());
					else if(lang.equals("sr"))
						jsonObject.element("name", o.getNameSr());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.language", e);
			throw new BusinessException("InputAction.language", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- person.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void person() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			PersonDAO dao = DAOFactory.getFactory().getPersonDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String sqlQuery = null;
				if(nameStartsWith.indexOf(" ")>0){
					String[] split = nameStartsWith.split(" ");
					sqlQuery = "SELECT p.*, y.*,1 AS clazz_ FROM tperson AS p LEFT JOIN tparty AS y ON p.id = y.id WHERE y.active=true AND LOWER(p.first_name) ILIKE '" + split[0] + "%' AND LOWER(p.last_name) ILIKE '" + split[1] + "%'";
				}else{
					sqlQuery = "SELECT p.*, y.*,1 AS clazz_ FROM tperson AS p LEFT JOIN tparty AS y ON p.id = y.id WHERE y.active=true AND LOWER(p.first_name) ILIKE '" + nameStartsWith.toLowerCase() + "%'";
				}
				
				List<Person> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (Person o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", o.getFirstName()+" "+o.getLastName());
					
					jsonArray.add(jsonObject);
				}
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.person", e);
			throw new BusinessException("InputAction.person", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- person.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void personDetails() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			PersonDAO dao = DAOFactory.getFactory().getPersonDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String partyRole = request.getParameter("partyRole");
		//	and yr.role_code='FRO'
					
					
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String sqlQuery = null;
				if(nameStartsWith.indexOf(" ")>0){
					String[] split = nameStartsWith.split(" ");
					if(split!=null && split.length>1){
					sqlQuery = "SELECT p.*, y.*,1 AS clazz_ FROM tperson AS p LEFT JOIN tparty AS y  ON p.id = y.id LEFT JOIN tparty_role AS yr ON y.id=yr.party_id WHERE y.active=true AND LOWER(p.first_name) ILIKE '" + split[0] + "%' AND LOWER(p.last_name) ILIKE '" + split[1] + "%'";
					}else{
						sqlQuery = "SELECT p.*, y.*,1 AS clazz_ FROM tperson AS p LEFT JOIN tparty AS y ON p.id = y.id LEFT JOIN tparty_role AS yr ON y.id=yr.party_id WHERE y.active=true AND LOWER(p.first_name) ILIKE '" + nameStartsWith.toLowerCase() + "%'";
					}
					
					if(StringUtils.isNotEmpty(partyRole)){
						sqlQuery+="	AND yr.role_code='"+partyRole+"'";
					}
				}else{
					sqlQuery = "SELECT p.*, y.*,1 AS clazz_ FROM tperson AS p LEFT JOIN tparty AS y ON p.id = y.id LEFT JOIN tparty_role AS yr ON y.id=yr.party_id WHERE y.active=true AND LOWER(p.first_name) ILIKE '" + nameStartsWith.toLowerCase() + "%'";
					
					if(StringUtils.isNotEmpty(partyRole)){
						sqlQuery+="	AND yr.role_code='"+partyRole+"'";
					}
				
				}
				
				List<Person> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (Person o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", o.getFirstName()+" "+o.getLastName());
					jsonObject.element("firstName", o.getFirstName());
					jsonObject.element("lastName", o.getLastName());
					jsonObject.element("birthdate", DATE_FORMAT.format(o.getBirthdate()));
					if(o.getAddress()!=null){
						JSONObject adrData = new JSONObject();
						adrData.element("street", o.getAddress().getStreet());
						adrData.element("homeNr", o.getAddress().getHomeNr());
						adrData.element("zipCode", o.getAddress().getZipCode());
						adrData.element("place", o.getAddress().getPlace());
						adrData.element("country", o.getAddress().getCountry());
						adrData.element("email", o.getAddress().getEmail());
						adrData.element("phone", o.getAddress().getPhone());
						adrData.element("mobile", o.getAddress().getMobile());
						adrData.element("lat", o.getAddress().getLat());
						adrData.element("lon", o.getAddress().getLon());
						
						jsonObject.element("address", adrData);
					}
					jsonArray.add(jsonObject);
				}
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.personDetails", e);
			throw new BusinessException("InputAction.personDetails", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- municipality.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void municipality() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			CadastralMunicipalityDAO dao = DAOFactory.getFactory().getCadastralMunicipalityDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String reg_id=request.getParameter("reg_id");
			String region_id=request.getParameter("region_id");
			String sqlQuery = null;
			Character opl_val = getUser().getOrganisation().getOperLevelVal();
			String lang = getLocale().getLanguage().toLowerCase();
			String condition=" WHERE ";
			sqlQuery = "SELECT DISTINCT(cm.*) FROM tgis_cadastral_municipality AS cm LEFT JOIN torganisation_mun AS om ON cm.id = om.mun_id ";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("en".equals(lang)){
					sqlQuery += " WHERE LOWER(cm.name_en) ILIKE '" + nameStartsWith.toLowerCase() + "%' " ;
					condition = " AND";
				} else if("sr".equals(lang)){
					sqlQuery += " WHERE LOWER(cm.name_sr) ILIKE '" + nameStartsWith.toLowerCase() + "%' " ;
					condition = " AND";
				} else if("al".equals(lang)){
					sqlQuery += " WHERE LOWER(cm.name) ILIKE '" + nameStartsWith.toLowerCase() + "%' " ;
					condition = " AND";
				}
			} 
			if(StringUtils.isNotEmpty(region_id)){//other use from reg_id, do not delete
				sqlQuery+=condition+"cm.region_id="+region_id;
			}else{
				if(opl_val.charValue() != 'C'){
					sqlQuery+=condition+" om.org_id = " + getUser().getOrganisationId();
					condition = " AND";
				}
				
				if(StringUtils.isNotEmpty(reg_id)){
					sqlQuery+=condition+" cm.region_id="+reg_id;
				}
			}
			List<CadastralMunicipality> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (CadastralMunicipality o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				if("en".equals(lang)){
					jsonObject.element("name", o.getNameEn());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getName());
				}
				
				jsonArray.add(jsonObject);
			}
			
			
			String str = jsonArray.toString();
			out.append(str);

			out.flush();
		}catch (Exception e){
			log.error("InputAction.municipality", e);
			throw new BusinessException("InputAction.municipality", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- cadZone.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void cadZone() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			CadastralZoneDAO dao=DAOFactory.getFactory().getCadastralZoneDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String munID = request.getParameter("mun_id");
			String sqlQuery = null;
			String lang = getLocale().getLanguage().toLowerCase();
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("al".equals(lang)){
					sqlQuery = "SELECT cz.* FROM tgis_cadastral_zone AS cz WHERE LOWER(cz.name) ILIKE '"+nameStartsWith.toLowerCase()+"%'";
				}else if("sr".equals(lang)){
					sqlQuery = "SELECT cz.* FROM tgis_cadastral_zone AS cz WHERE LOWER(cz.name_sr) ILIKE '"+nameStartsWith.toLowerCase()+"%'";
				}else{
					sqlQuery = "SELECT cz.* FROM tgis_cadastral_zone AS cz WHERE LOWER(cz.name_en) ILIKE '"+nameStartsWith.toLowerCase()+"%'";
				}
				
				if(StringUtils.isNotEmpty(munID)){
					sqlQuery+="  AND municipality_id="+munID;
				}
				
				List<CadastralZone> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (CadastralZone o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("cadId", o.getCadId());
					if("en".equals(lang)){
						jsonObject.element("name", o.getNameEn()+" - "+o.getCadId());
					}else if("sr".equals(lang)){
						jsonObject.element("name", o.getNameSr()+" - "+o.getCadId());						
					}else{
						jsonObject.element("name", o.getName()+" - "+o.getCadId());
					}				
					jsonArray.add(jsonObject);
				}
				
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.cadZone", e);
			throw new BusinessException("InputAction.cadZone", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- parcelId.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void parcelId() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			ParcelDetailDAO dao=DAOFactory.getFactory().getParcelDetailDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String cadZone_id = request.getParameter("cadZone_id");
			String parcel_id = request.getParameter("parcel_id");
			String sqlQuery = null;
			String lang = getLocale().getLanguage().toLowerCase();
			if(StringUtils.isNotEmpty(nameStartsWith) && StringUtils.isNumeric(nameStartsWith) && StringUtils.isNotEmpty(cadZone_id)){
				if(StringUtils.isEmpty(parcel_id)){
					sqlQuery = "SELECT pd.* FROM tparcel_detail AS pd WHERE pd.cadparcelid ilike '" +cadZone_id+"-"+nameStartsWith.toLowerCase()+"%'";
				}else {
					sqlQuery = "SELECT pd.* FROM tparcel_detail AS pd WHERE pd.cadparcelid ilike '" +cadZone_id+"-"+parcel_id+"-"+nameStartsWith.toLowerCase()+"%'";
				}
				List<ParcelDetail> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				String parcelNrString="";
				for (ParcelDetail o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					parcelNrString+=o.getParcelnr();
					if(parcelNrString.length()==4){
						parcelNrString="0"+parcelNrString;
					}else if(parcelNrString.length()==3){
						parcelNrString="00"+parcelNrString;
					}else if (parcelNrString.length()==2) {
						parcelNrString="000"+parcelNrString;
					}
					jsonObject.element("parcelnr", parcelNrString);
					parcelNrString="";
					jsonObject.element("subparcelnr", o.getSubparcelnr());
					jsonObject.element("cadparcelid", o.getCadparcelid());
					jsonObject.element("cadparcelid", o.getCadparcelid());
					jsonObject.element("persStat", o.getParcelOwner().getPersStat());
					jsonObject.element("partsn", o.getParcelOwner().getPartsn());
					jsonArray.add(jsonObject);
				}
				
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.parcelId", e);
			throw new BusinessException("InputAction.parcelId", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- rbacRoles.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacRoles() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacRoleDAO dao = DAOFactoryRbac.getFactory().getRbacRoleDAO();
			String lang = getLocale().getLanguage();
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT t.* FROM trbac_role AS t";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String name=("al".equals(lang)?"name":"en".equals(lang)?"name_en":"name_sr");
				sqlQuery += " WHERE t."+name+" ILIKE '" + nameStartsWith + "%'" ;
			}
			
			List<RbacRole> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (RbacRole o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", "al".equals(lang)?o.getName():"en".equals(lang)?o.getNameEn():o.getNameSr());
				jsonObject.element("code", o.getCode());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.rbacRoles", e);
			throw new BusinessException("InputAction.rbacRoles", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * AJAX Method- rbacRoles.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacObjects() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacObjectDAO dao = DAOFactoryRbac.getFactory().getRbacObjectDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT t.* FROM trbac_object AS t " ;
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery+=" WHERE t.name ILIKE '" + nameStartsWith + "%'";
			}
			List<RbacObject> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (RbacObject o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("code", o.getCode());
				jsonObject.element("parentId", o.getParentId());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.rbacObjects", e);
			throw new BusinessException("InputAction.rbacObjects", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- financialType.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financialType() throws IOException, BusinessException {
		String lang = getLocale().getLanguage();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			FinancialTypeDAO dao = DAOFactory.getFactory().getFinancialTypeDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String type=request.getParameter("type");
			String condition="";
			String sqlQuery = "SELECT * FROM tfin_type AS t";
			
			if(StringUtils.isNotEmpty(type)){
				sqlQuery+=" WHERE type='"+type+"'";
				condition=" AND";
			}else { 
				condition=" WHERE";
			}
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("en"==lang) {
					sqlQuery+=condition+" t.name_en ilike '" + nameStartsWith.trim() + "%' or t.code ilike '" + nameStartsWith.trim() + "%'";
				}else if("sr"==lang) {
					sqlQuery+=condition+" t.name_sr ilike '" + nameStartsWith.trim() + "%'  or t.code ilike '" + nameStartsWith.trim() + "%'" ;
				}else {
					sqlQuery+=condition+" t.name_al ilike '" + nameStartsWith.trim() + "%'  or t.code ilike '" + nameStartsWith.trim() + "%'" ;
				}
			}
			
			List<FinancialType> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (FinancialType o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if("al"==lang) {
					jsonObject.element("name", o.getNameAl());
				}else if("sr"==lang) {
					jsonObject.element("name", o.getNameSr());
				}else {
					jsonObject.element("name", o.getNameEn());
				}
				
				jsonObject.element("code", o.getCode());
				jsonObject.element("level", o.getLevel());
				jsonObject.element("type", o.getType());
				jsonObject.element("allocation", o.getAllocation());
				jsonObject.element("description", o.getNotes());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.financialType", e);
			throw new BusinessException("InputAction.financialType", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- contractor.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void contractor() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			ContractorDAO dao = DAOFactory.getFactory().getContractorDAO();
			
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT * FROM tfin_contractor AS c";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery+=" WHERE c.comopany_name ILIKE '" + nameStartsWith + "%'";
			}
			List<Contractor> list = dao.executeSQLQuery(sqlQuery);
			
			JSONArray jsonArray = new JSONArray();
			for (Contractor o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getComopanyName());
				jsonObject.element("fiscalNr", o.getFiscalNumber());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.contractor", e);
			throw new BusinessException("InputAction.contractor", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- dbpetAnimal.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dbpetAnimal() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			DhpetWildAnimalsDAO dao = DAOFactory.getFactory().getDhpetWildAnimalsDAO();
			
			String lang=getLocale().getLanguage();
			
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT * FROM tdhpet_wild_animals";
			if(StringUtils.isNotEmpty(nameStartsWith))
				sqlQuery+=" WHERE name_"+lang+" ILIKE '" + nameStartsWith + "%'";
			List<DhpetWildAnimals> list = dao.executeSQLQuery(sqlQuery);
			
			JSONArray jsonArray = new JSONArray();
			for (DhpetWildAnimals w : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", w.getId());
				if("en".equals(lang))
					jsonObject.element("name", w.getNameEn());
				else if("al".equals(lang))
					jsonObject.element("name", w.getNameAl());
				if("sr".equals(lang))
					jsonObject.element("name", w.getNameSr());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.animal", e);
			throw new BusinessException("InputAction.animal", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- contractor.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void proTenderRequest() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			PrcmtTenderRequestDAO dao = DAOFactory.getFactory().getPrcmtTenderRequestDAO();
			
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT * FROM tprcmt_tender_request AS r";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery+=" WHERE r.designation_of_request ILIKE '" + nameStartsWith + "%'";
			}
			List<PrcmtTenderRequest> list = dao.executeSQLQuery(sqlQuery);
			
			JSONArray jsonArray = new JSONArray();
			for (PrcmtTenderRequest o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getDesignationOfRequest());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.proTenderRequest", e);
			throw new BusinessException("InputAction.proTenderRequest", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- contractor.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void proTenderBidder() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			PrcmtTenderBidderDAO dao = DAOFactory.getFactory().getPrcmtTenderBidderDAO();
			
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT * from TPRCMT_TENDER_BIDDER AS b";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery+=" WHERE b.company_name ILIKE '" + nameStartsWith + "%'";
			}
			List<PrcmtTenderBidder> list = dao.executeSQLQuery(sqlQuery);
			
			JSONArray jsonArray = new JSONArray();
			for (PrcmtTenderBidder o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getCompanyName());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.proTenderBidder", e);
			throw new BusinessException("InputAction.proTenderBidder", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * AJAX Method- unitMetric.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void unitsMetric() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			UnitsMetricDAO dao=DAOFactory.getFactory().getUnitsMetricDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = "SELECT * FROM tunits_metric";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery+=" WHERE name ILIKE '" + nameStartsWith + "%'";
			}
			List<UnitsMetric> list = dao.executeSQLQuery(sqlQuery);
			
			JSONArray jsonArray = new JSONArray();
			for (UnitsMetric o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("nameEn", o.getNameEn());
				jsonObject.element("nameSr", o.getNameSr());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.unitMetric", e);
			throw new BusinessException("InputAction.unitMetric", e);
		} finally {
			out.close();
		}		
	}
	
	
	
	/**
	 * AJAX Method- managementUnit.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void managementUnit() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sqlQuery = "SELECT DISTINCT(mu.*) FROM tgis_management_unit mu";
			ManagementUnitDAO dao = DAOFactory.getFactory().getManagementUnitDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String mun_id=request.getParameter("mun_id");
			String cond=" WHERE ";
			if(StringUtils.isNotEmpty(mun_id)){
//				select distinct(mu.*) from tgis_management_unit mu 
//				left join tgis_compartment c on c.mu_id=mu.id
//				LEFT JOIN tgis_cadastral_municipality m ON m.id=c.mun_id where m.id=
				sqlQuery+=" LEFT JOIN tgis_compartment c ON c.mu_id=mu.id" +
						" LEFT JOIN tgis_cadastral_municipality m ON m.id=c.mun_id where m.id="+mun_id;
				cond=" AND ";
			}
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += cond+" mu_name ILIKE '" + nameStartsWith + "%'";
				cond=" AND ";
			}
			String regionId = request.getParameter("regionId");
			if(StringUtils.isNotEmpty(regionId)){
				sqlQuery+=cond+ " mu.region_id = " + regionId;
			}
			String reg_id=request.getParameter("reg_id");//different use from regionId, don't delete
			if(StringUtils.isNotEmpty(reg_id) && StringUtils.isNumeric(reg_id)){
				sqlQuery="select distinct mu.* from tgis_management_unit mu where mu.region_id="+reg_id;
				if(StringUtils.isNotEmpty(nameStartsWith)){
					sqlQuery += " and mu.mu_name ILIKE '" + nameStartsWith + "%'";
				}
			}
			List<ManagementUnit> list = dao.executeSQLQuery(sqlQuery);
			ManagementUnitPeriod mup=null;
			JSONArray jsonArray = new JSONArray();
			for (ManagementUnit o : list) {
				String mup_query="select * from tgis_mu_period mp left join tgis_management_unit mu on mp.mu_id=mu.id where isactive='Y' and mu.id="+o.getId();
				List<ManagementUnitPeriod> mupList=DAOFactory.getFactory().getManagementUnitPeriodDAO().executeSQLQuery(mup_query);
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if(mupList.size()>0){
					 mup=mupList.get(0);
					jsonObject.element("mng_period_id",mup.getId());	
				}else{
					jsonObject.element("mng_period_id","");	
				}
				
				jsonObject.element("name", o.getMuName());
				jsonObject.element("code", o.getMuCode());
				jsonObject.element("region_id", o.getRegion()!=null?o.getRegion().getId():"");
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.managementUnit", e);
			throw new BusinessException("InputAction.managementUnit", e);
		} finally {
			out.close();
		}		
	}

	/**
	 * AJAX Method- managementUnit.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void selectedBidder() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String tenderId = request.getParameter("tender_id");
			String query="SELECT bidder.* FROM tprcmt_tender_bidder bidder LEFT JOIN tprcmt_tender_bid bid ON bidder.id=bid.bidder_id " +
					"LEFT JOIN tprcmt_tender_request request ON request.id=bid.tender_request_id WHERE bid.selected=true AND request.id="+tenderId;
			
			List<PrcmtTenderBidder> list=DAOFactory.getFactory().getPrcmtTenderBidderDAO().executeSQLQuery(query);
			
			
			JSONArray jsonArray = new JSONArray();
			for (PrcmtTenderBidder o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getCompanyName());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.selectedBidder", e);
			throw new BusinessException("InputAction.selectedBidder", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- region.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void region() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RegionDAO dao = DAOFactory.getFactory().getRegionDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = null;
			String lang = getLocale().getLanguage().toLowerCase();
			sqlQuery = "SELECT * FROM tgis_region";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("en".equals(lang)){
						sqlQuery += " WHERE LOWER(name_en) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else if("sr".equals(lang)){
					sqlQuery += " WHERE LOWER(name_sr) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else{
					sqlQuery += " WHERE LOWER(name) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}
			}
			List<Region> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Region o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				if("en".equals(lang)){
					jsonObject.element("name", o.getNameEn());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getName());
				}
				jsonObject.element("code", o.getCode());
				jsonArray.add(jsonObject);
			}
			
			
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.municipality", e);
			throw new BusinessException("InputAction.municipality", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- assignEmployee.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void assignEmployee() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			EmployeeDAO dao = DAOFactory.getFactory().getEmployeeDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String vehicle_id=request.getParameter("vehicle_id");
			String org_id=request.getParameter("org_id");
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String sqlQuery = "SELECT e.*, p.*, y.* FROM thrm_employee AS e LEFT JOIN tperson AS p ON e.id = p.id LEFT JOIN tparty AS y ON p.id = y.id ";
				
				if(StringUtils.isNotEmpty(vehicle_id)){
					sqlQuery+=" RIGHT JOIN tvehicles_staff_assign s ON s.employee_id=e.id ";
				}
				
				if(nameStartsWith.indexOf(" ")>0){
					String[] split = nameStartsWith.split(" ");
					sqlQuery += " WHERE LOWER(p.first_name) ILIKE '" + split[0] + "%' AND LOWER(p.last_name) ILIKE '" + split[0] + "%'";
				}else{
					sqlQuery += " WHERE LOWER(p.first_name) ILIKE '" + nameStartsWith.toLowerCase() + "%'";
				}
				
				if(StringUtils.isNotEmpty(vehicle_id)){
					sqlQuery+=" AND s.vehicles_id="+vehicle_id;
				}
				if(StringUtils.isNotEmpty(org_id)){
					sqlQuery+=" AND e.organisation_id="+org_id;
				}
				List<Employee> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (Employee o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", o.getFirstName()+" "+o.getLastName());
					jsonObject.element("ssnNr", o.getEmpSsnNum());
					
					jsonArray.add(jsonObject);
				}
				
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.employee", e);
			throw new BusinessException("InputAction.employee", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- inspActionType.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void inspActionType() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String lang=getLocale().getLanguage();
			String query="select at.* from TFRM_INSP_ACTION_TYPE at ";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("en".equals(lang)){
					query += " WHERE LOWER(at.name_en) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else if("sr".equals(lang)){
					query += " WHERE LOWER(at.name_sr) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else{
					query += " WHERE LOWER(at.name_al) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}
			}
			List<InspActionType> list=DAOFactory.getFactory().getInspActionTypeDAO().executeSQLQuery(query);
			
			JSONArray jsonArray = new JSONArray();
			for (InspActionType o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if("en".equals(lang)){
					jsonObject.element("name", o.getNameEn());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getNameAl());
				}
				jsonObject.element("description", o.getDescription());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.inspActionType", e);
			throw new BusinessException("InputAction.inspActionType", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- inspActionType.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void animalRequest() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String lang=getLocale().getLanguage();
			String animalId = request.getParameter("animalId");
			if(StringUtils.isNotEmpty(animalId)){
			String query="SELECT ar.* FROM tdhpet_wild_animals_request as ar  left join (select * from ttextdomain where domname='ANIMALNEEDS') as td  " +
					" on td.domkey=ar.request_for  WHERE animal_id="+animalId;
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("en".equals(lang)){
					query += " and  LOWER(td.domtext_en) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else if("sr".equals(lang)){
					query += " and LOWER(td.domtext_sr) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else{
					query += " and LOWER(td.domtext) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}
			}
			
			List<DhpetWildAnimalsRequest> list=DAOFactory.getFactory().getDhpetWildAnimalsRequestDAO().executeSQLQuery(query);
			
			JSONArray jsonArray = new JSONArray();
			for (DhpetWildAnimalsRequest o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("key", o.getRequestFor().getDOMKEY());
				if("en".equals(lang)){
					jsonObject.element("name", o.getRequestFor().getDOMTEXT_EN()+" (Max Point="+o.getMaxPoint()+")");
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getRequestFor().getDOMTEXT_SR()+" (Max Point="+o.getMaxPoint()+")");					
				}else{
					jsonObject.element("name", o.getRequestFor().getDOMTEXT()+" (Poenat Maksimal="+o.getMaxPoint()+")");
				}
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.animalRequest", e);
			throw new BusinessException("InputAction.animalRequest", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method - compartment.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void compartment() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String mu_id = request.getParameter("mu_id");
			CompartmentDAO dao = DAOFactory.getFactory().getCompartmentDAO();
			String sqlQuery;
			sqlQuery = "SELECT * FROM tgis_compartment c left join tgis_mu_period p on p.id=c.mup_id where p.isactive='Y'";
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " AND c.comp_nr ILIKE '%" + nameStartsWith + "%'";
			}
			
			if(StringUtils.isNotEmpty(mu_id) && StringUtils.isNumeric(mu_id)){
				sqlQuery += " AND c.mu_id=" + mu_id ;
			}
			
			List<Compartment> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Compartment c : list) {
				JSONObject jo = new JSONObject();
				jo.element("id", c.getId());
				jo.element("comp_id", c.getCompNr());
				jo.element("mu_id", c.getManagementUnit().getMuName());
				
				jsonArray.add(jo);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.compartment", e);
			throw new BusinessException("InputAction.compartment", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method - compartment.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void stand() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String comp_id = request.getParameter("comp_id");
			String mu_id = request.getParameter("mu_id");
			StandDAO dao = DAOFactory.getFactory().getStandDAO();
			String sqlQuery;
			sqlQuery = "SELECT distinct st.* FROM ( select * from tgis_stand where status is null or status  not ilike 'DEL') as st " +
					" left join tgis_compartment as co on co.id = st.compartment_id " +
					" left join tgis_mu_period as mup on co.mup_id = mup.id " +
					" left join tgis_management_unit mu on mu.id=co.mu_id where mup.isactive='Y'";
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " AND st.stand_nr ILIKE '%" + nameStartsWith + "%'";
			}
			
			if(StringUtils.isNotEmpty(comp_id) && StringUtils.isNumeric(comp_id)){
				sqlQuery += " AND st.compartment_id=" + comp_id ;
			}
			
			if(StringUtils.isNotEmpty(mu_id) && StringUtils.isNumeric(mu_id)){
				sqlQuery += " AND co.mu_id=" + mu_id ;
			}
		
			List<Stand> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Stand s : list) {
				JSONObject jo = new JSONObject();
				jo.element("id", s.getId());
				jo.element("stand_id", s.getStandNr());
				jo.element("compId", s.getCompartment().getCompNr());
				jo.element("comp_id", s.getCompartment().getId());
				jo.element("mu_id", s.getCompartment().getManagementUnit().getMuName());
				
				jsonArray.add(jo);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.stand", e);
			throw new BusinessException("InputAction.stand", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Decision types.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void decisionTypes() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			DecisionTypeDAO dao = DAOFactory.getFactory().getDecisionTypeDAO();
			String sqlQuery;
			String lang = getLocale().getLanguage().toLowerCase();
			sqlQuery = "SELECT * FROM THRM_DECISION_TYPE";
			
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("al".equals(lang)){
					sqlQuery += " WHERE name_al ILIKE '%" + nameStartsWith + "%'";
				}else if("sr".equals(lang)){
					sqlQuery += " WHERE name_sr ILIKE '%" + nameStartsWith + "%'";
				}else{
					sqlQuery += " WHERE name_en ILIKE '%" + nameStartsWith + "%'";					
				}
			}
			
			List<DecisionType> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (DecisionType o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("code", o.getClass());
				if("al".equals(lang)){
					jsonObject.element("name", o.getNameAl());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getNameEn());
				}
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.decisionTypes", e);
			throw new BusinessException("InputAction.decisionTypes", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Gets the overlap stand.
	 *
	 * @return the overlap stand
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void getOverlapStand() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
				Session session = HibSessionFactory.getSessionFactory()
						.getCurrentSession();
				String polygon = request.getParameter("polygon");
				String stand_id = request.getParameter("stand_id");
//				String sid = request.getParameter("sid");
				session = HibSessionFactory.getSessionFactory().getCurrentSession();
				
				WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
			    Geometry geo = wktReader.read(polygon);
			    JSONArray jsonArray = new JSONArray();
				if(StringUtils.isNotEmpty(polygon) && IsValidOp.isValid(geo)){
					String sql = "";
					if(StringUtils.isNotEmpty(stand_id)){// && StringUtils.isNotEmpty(sid)
						 sql = "select * from get_overlapstand('"+stand_id+"','"+polygon+"')";
					}else{
						sql = "select * from get_overlapstand('"+polygon+"')";
					}
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					sqlQuery.addScalar("stand_id", StringType.INSTANCE);
					sqlQuery.addScalar("area", DoubleType.INSTANCE);
					List list = sqlQuery.list();
					
					JSONObject jsonObject = new JSONObject();
					for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					String standId = (String) obj[0];
					Double area = (Double) obj[1];

					
					jsonObject.element("standId", standId);
					jsonObject.element("area", area);
					jsonArray.add(jsonObject);
					}
				
			}
				String str = jsonArray.toString();
				out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getOverlapStand", e);
			throw new BusinessException("InputAction.getOverlapStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Split stands.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void splitStands() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			String linestring = request.getParameter("linestring");
			String sid = request.getParameter("sid");
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo = wktReader. read(linestring) ;
			JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(sid) && StringUtils.isNotEmpty(linestring)){
				String sql = "select st_astext(st_transform((ge.poly).geom,900913)) as geom,st_astext((ge.poly).geom) as geom916,(ge.poly).path from (select ST_Dump(st_split(the_geom, st_setsrid" +
						"(ST_GeomFromText('"+geo+"'),900916))) as poly" +
						" from tgis_stand where id = "+sid+")ge";
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("geom", StringType.INSTANCE);
				sqlQuery.addScalar("geom916", StringType.INSTANCE);
				List list = sqlQuery.list();
				
				JSONObject jsonObject = new JSONObject();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] obj = (Object[]) iterator.next();
					String geom = (String) obj[0];
					String geom916 = (String) obj[1];
					
					jsonObject.element("geom", geom);
					jsonObject.element("geom916", geom916);
					jsonArray.add(jsonObject);
				}
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.splitStands", e);
			throw new BusinessException("InputAction.splitStands", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Gets the altitude profile.
	 *
	 * @return the altitude profile
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void getAltitudeProfile() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			String linestring = request.getParameter("linestring");
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(linestring)){
				String sql = "select  *,ST_X(st_transform(('SRID=900916;point('||x||' '||y ||')')\\:\\:geometry,900913)) x913," +
						"ST_y(st_transform(('SRID=900916;point('||x||' '||y ||')')\\:\\:geometry,900913)) y913 from " +
						"getprofile('"+linestring+"')";
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("x", DoubleType.INSTANCE);
				sqlQuery.addScalar("y", DoubleType.INSTANCE);
				sqlQuery.addScalar("elev", DoubleType.INSTANCE);
				sqlQuery.addScalar("m", DoubleType.INSTANCE);
				sqlQuery.addScalar("x913", DoubleType.INSTANCE);
				sqlQuery.addScalar("y913", DoubleType.INSTANCE);
				List list = sqlQuery.list();
				
				JSONObject jsonObject = new JSONObject();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] obj = (Object[]) iterator.next();
					Double x = (Double) obj[0];
					Double y = (Double) obj[1];
					Double elev = (Double) obj[2];
					Double m = (Double) obj[3];
					Double x913 = (Double) obj[4];
					Double y913 = (Double) obj[5];
					
					jsonObject.element("x913", x913);
					jsonObject.element("y913", y913);
					jsonObject.element("x", m);
					jsonObject.element("y", elev);
					
//					jsonObject.element("point", point);
					jsonArray.add(jsonObject);
				}
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getAltitudeProfile", e);
			throw new BusinessException("InputAction.getAltitudeProfile", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check stand contains.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void checkStandContains() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Session session = HibSessionFactory.getSessionFactory()
				.getCurrentSession();
		try {
			String stand_id = request.getParameter("stand_id");
			String polygon = request.getParameter("polygon");
			if(StringUtils.isNotEmpty(stand_id) && StringUtils.isNotEmpty(polygon)){	
				String query = "select (st_contains(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916),(select the_geom from tgis_stand where id="+stand_id+")) or (st_area(st_difference(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916),(select the_geom from tgis_stand where id="+stand_id+")))< st_perimeter(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916))*0.0005))";
				SQLQuery sqlQuery = session.createSQLQuery(query);
				Object result = sqlQuery.uniqueResult();
				
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				
				if(result.toString().equals("true"))
					jsonObject.element("result", "true");
				else jsonObject.element("result", "false");
				
				jsonArray.add(jsonObject);
				String str = jsonObject.toString();
				out.append(str);
			}

			out.flush();
		} catch (Exception e) {
			log.error("InputAction.checkStandContains", e);
			throw new BusinessException("InputAction.checkStandContains", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Gets the stand split.
	 *
	 * @return the stand split
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void getStandSplit() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			String linestring = request.getParameter("linestring");
			String sid = request.getParameter("stand_id");
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo = wktReader.read(linestring);
			JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(sid) && StringUtils.isNotEmpty(linestring)){
				String sql = "select st_astext(geom) as geom,st_astext(geom913) as geom913,part from get_stand_split('"+linestring+"',"+sid+");";
//				String sql = "select st_astext(st_transform((ge.poly).geom,900913)) as geom,st_astext((ge.poly).geom) as geom916,(ge.poly).path from (select ST_Dump(st_split(the_geom, st_setsrid" +
//						"(ST_GeomFromText('"+geo+"'),900916))) as poly" +
//						" from tgis_stand where id = "+sid+")ge";
//				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("geom", StringType.INSTANCE);
				sqlQuery.addScalar("geom913", StringType.INSTANCE);
				List list = sqlQuery.list();
				
				JSONObject jsonObject = new JSONObject();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] obj = (Object[]) iterator.next();
					String geom = (String) obj[0];
					String geom916 = (String) obj[1];
					
					jsonObject.element("geom", geom);
					jsonObject.element("geom913", geom916);
					jsonArray.add(jsonObject);
				}
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getStandSplit", e);
			throw new BusinessException("InputAction.getStandSplit", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Gets the plan split.
	 *
	 * @return the plan split
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void getPlanSplit() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			String linestring = request.getParameter("linestring");
			String aid = request.getParameter("activity_id");
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(aid) && StringUtils.isNotEmpty(linestring)){
				String sql = "select st_astext(geom) as geom,st_astext(geom913) as geom913,part from get_plan_split('"+linestring+"',"+aid+");";
//				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("geom", StringType.INSTANCE);
				sqlQuery.addScalar("geom913", StringType.INSTANCE);
				List list = sqlQuery.list();
				
				JSONObject jsonObject = new JSONObject();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] obj = (Object[]) iterator.next();
					String geom = (String) obj[0];
					String geom916 = (String) obj[1];
					
					jsonObject.element("geom", geom);
					jsonObject.element("geom913", geom916);
					jsonArray.add(jsonObject);
				}
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getPlanSplit", e);
			throw new BusinessException("InputAction.getPlanSplit", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check plan contains.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void checkPlanContains() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Session session = HibSessionFactory.getSessionFactory()
				.getCurrentSession();
		try {
			String activity_id = request.getParameter("activity_id");
			String polygon = request.getParameter("polygon");
			if(StringUtils.isNotEmpty(activity_id) && StringUtils.isNotEmpty(polygon)){	
//				String query="select ST_CONTAINS((select the_geom from tgis_stand where id="+stand_geometry+"),st_setsrid(st_snaptogrid(st_geomfromtext('"+polygon+"'),0.001),900916)) or (select the_geom from tgis_stand where id="+stand_geometry+")=st_setsrid(st_snaptogrid(st_geomfromtext('"+polygon+"'),0.001),900916)";
				String query = "select (st_contains(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916),(select planed_geom from tfrm_activity where id="+activity_id+")) or (st_area(st_difference(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916),(select planed_geom from tfrm_activity where id="+activity_id+")))< st_perimeter(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916))*0.0005))";
				SQLQuery sqlQuery = session.createSQLQuery(query);
				Object result = sqlQuery.uniqueResult();
				
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				
				if(result!=null && result.toString().equals("true"))
					jsonObject.element("result", "true");
				else jsonObject.element("result", "false");
				
				jsonArray.add(jsonObject);
				String str = jsonObject.toString();
				out.append(str);
			}

			out.flush();
		} catch (Exception e) {
			log.error("InputAction.checkStandContains", e);
			throw new BusinessException("InputAction.checkStandContains", e);
		} finally {
			out.close();
		}
	}
	
	
	/**
	 * Geom is in municipality.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void geomIsInMunicipality() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
		try {
			String munId = request.getParameter("munId");
			String polygon = request.getParameter("polygon");
			if(StringUtils.isNotEmpty(polygon)){	
				String query = "select  m.id, m.name as result from tgis_cadastral_municipality m where st_intersects(m.the_geom, st_setsrid(st_geomfromtext('"+polygon+"'),900916)) ";
				if(StringUtils.isNotEmpty(munId) ){
					 query = "select  m.id, m.name, "+munId+"=m.id as result from tgis_cadastral_municipality m where st_intersects(m.the_geom, st_setsrid(st_geomfromtext('"+polygon+"'),900916)) ";
				}
				SQLQuery sqlQuery = session.createSQLQuery(query);
				sqlQuery.addScalar("id",IntegerType.INSTANCE);
				sqlQuery.addScalar("name",StringType.INSTANCE);
				sqlQuery.addScalar("result",StringType.INSTANCE);

				
				 List list = sqlQuery.list();
				 JSONObject jsonObject = new JSONObject();
				 if(list!=null && list.size()>0){
						 Object obj[] =(Object[])list.get(0);
						 Integer id = (Integer) obj[0];
						 String name = (String) obj[1];
						 String result = (String) obj[2];
						 jsonObject.element("id", id);
						 jsonObject.element("name", name);
						 jsonObject.element("result", result);

					}
				 
				
				String str = jsonObject.toString();
				out.append(str);
			}

			out.flush();
		} catch (Exception e) {
			log.error("InputAction.geomIsInMunicipality", e);
			throw new BusinessException("InputAction.geomIsInMunicipality", e);
		} finally {
			out.close();
		}
	}
	
	
	/**
	 * Checks if is inside state.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void isInsideState() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Session session = HibSessionFactory.getSessionFactory()
				.getCurrentSession();
		try {
			String polygon = request.getParameter("polygon");
			if(StringUtils.isNotEmpty(polygon)){	
				String query = "select st_within(st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916), (select the_geom from tgis_state limit 1))";
				SQLQuery sqlQuery = session.createSQLQuery(query);
				Object result = sqlQuery.uniqueResult();
				
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				
				if(result.toString().equals("true"))
					jsonObject.element("result", "true");
				else jsonObject.element("result", "false");
				
				jsonArray.add(jsonObject);
				String str = jsonObject.toString();
				out.append(str);
			}

			out.flush();
		} catch (Exception e) {
			log.error("InputAction.isInsideState", e);
			throw new BusinessException("InputAction.isInsideState", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check plan overlapping.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void checkPlanOverlapping() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				String polygon = request.getParameter("polygon");
				String annualplan_id = request.getParameter("annualplan_id");
				String activity_id = request.getParameter("activity_id");
				
				WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
			    Geometry geo = wktReader.read(polygon);
			    JSONArray jsonArray = new JSONArray();
				if(StringUtils.isNotEmpty(polygon) && IsValidOp.isValid(geo) && StringUtils.isNotEmpty(annualplan_id)){
					String sql = "select st_intersects(planed_geom,st_transform(st_setsrid(st_geomfromtext('"+polygon+"'),900916),900916))  as intersect from tfrm_activity where annual_planning_id="+annualplan_id;
					if(StringUtils.isNotEmpty(activity_id)){
						sql+=" and id!="+activity_id;
					}
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					sqlQuery.addScalar("intersect", BooleanType.INSTANCE);
					Object o = sqlQuery.uniqueResult();
					
					JSONObject jsonObject = new JSONObject();
					if(o!=null)
						jsonObject.element("intersect", (!(new Boolean(o.toString())))+"");

					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.checkPlanOverlapping", e);
			throw new BusinessException("InputAction.checkPlanOverlapping", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check impl overlap.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void checkImplOverlap() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			String jsonDetails = request.getParameter("implArray");
			String polygon = request.getParameter("polygon");
			String planId = request.getParameter("planId");
			String rowId = request.getParameter("rowId");
			
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails) && StringUtils.isNotEmpty(polygon) && StringUtils.isNotEmpty(planId)){
				Geometry poly = null;
				try {
					WKTReader reader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
					poly = reader.read(polygon);
					poly.setSRID(900916);
				} catch (com.vividsolutions.jts.io.ParseException e) {
					e.printStackTrace();
				}
				
				JSONArray jsonArray = new JSONArray();
				JSONArray array=(JSONArray)JSONSerializer.toJSON(jsonDetails);
				WKTReader reader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
				boolean overlap=false;
				String ids=null;
				if(array.size()>0){
					
					for(Iterator<JSONObject>  iterator = array.iterator(); iterator.hasNext();){
						JSONObject o=iterator.next();
						String row_id="";
						if(o.get("row_id")!=null && StringUtils.isNotEmpty(o.get("row_id").toString())){
							row_id=o.get("row_id").toString();
						}
						if(o.get("pd_id")!=null && StringUtils.isNotEmpty(o.get("pd_id").toString())){
							String pl_id=o.get("pd_id").toString();
							if(ids==null)
								ids=pl_id;
							else{
								ids+=","+pl_id;
							}
						}
						
						if(o.get("im_geom")!=null && StringUtils.isNotEmpty(o.get("im_geom").toString())){
							String im_geom=o.get("im_geom").toString();
							Geometry geom = null;
							try {
								geom = reader.read(im_geom);
								geom.setSRID(900916);
								
								if(!row_id.equals(rowId) && (poly.overlaps(geom)|| poly.equals(geom))){
									JSONObject jsonObject = new JSONObject();
									jsonObject.element("result", "false");
									jsonArray.add(jsonObject);
									overlap=true;
								}
							} catch (com.vividsolutions.jts.io.ParseException e) {
								e.printStackTrace();
							}
						}
					}
				}
				if(!overlap){
					String sql="select st_astext(dec.im_geom) from tfrm_stand_planting_impl_declare dec left join tfrm_stand_planting_activity pl on pl.id=dec.plant_activity_id where dec.plant_activity_id="+planId+" and dec.id not in ("+ids+")";
					Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					List list = sqlQuery.list();
					if(list!=null && list.size()>0){
						for(Object ob:list){
							Geometry geom = null;
							try {
								geom = reader.read(ob.toString());
								geom.setSRID(900916);
								if(poly.overlaps(geom) || poly.equals(geom)){
									JSONObject jsonObject = new JSONObject();
									jsonObject.element("result", "false");
									jsonArray.add(jsonObject);
								}
							} catch (com.vividsolutions.jts.io.ParseException e) {
								e.printStackTrace();
							}
						}
					}
				}
			
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.checkImplOverlap", e);
			throw new BusinessException("InputAction.checkImplOverlap", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check impl slv overlap.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void checkImplSlvOverlap() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			String jsonDetails = request.getParameter("implArray");
			String polygon = request.getParameter("polygon");
			String planId = request.getParameter("planId");
			String rowId = request.getParameter("rowId");
			
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails) && StringUtils.isNotEmpty(polygon) && StringUtils.isNotEmpty(planId)){
				Geometry poly = null;
				try {
					WKTReader reader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
					poly = reader.read(polygon);
					poly.setSRID(900916);
				} catch (com.vividsolutions.jts.io.ParseException e) {
					e.printStackTrace();
				}
				
				JSONArray jsonArray = new JSONArray();
				JSONArray array=(JSONArray)JSONSerializer.toJSON(jsonDetails);
				WKTReader reader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
				boolean overlap=false;
				String ids=null;
				if(array.size()>0){
					
					for(Iterator<JSONObject>  iterator = array.iterator(); iterator.hasNext();){
						JSONObject o=iterator.next();
						String row_id="";
						if(o.get("row_id")!=null && StringUtils.isNotEmpty(o.get("row_id").toString())){
							row_id=o.get("row_id").toString();
						}
						if(o.get("sd_id")!=null && StringUtils.isNotEmpty(o.get("sd_id").toString())){
							String pl_id=o.get("sd_id").toString();
							if(ids==null)
								ids=pl_id;
							else{
								ids+=","+pl_id;
							}
						}
						
						if(o.get("im_geom")!=null && StringUtils.isNotEmpty(o.get("im_geom").toString())){
							String im_geom=o.get("im_geom").toString();
							Geometry geom = null;
							try {
								geom = reader.read(im_geom);
								geom.setSRID(900916);
								
								if(!row_id.equals(rowId) && (poly.overlaps(geom)|| poly.equals(geom))){
									JSONObject jsonObject = new JSONObject();
									jsonObject.element("result", "false");
									jsonArray.add(jsonObject);
									overlap=true;
								}
							} catch (com.vividsolutions.jts.io.ParseException e) {
								e.printStackTrace();
							}
						}
					}
				}
				if(!overlap){
					String sql="select st_astext(dec.im_geom) from tfrm_stand_silviculture_impl_declare dec left join tfrm_stand_silviculture_activity pl on pl.id=dec.slv_activity_id where dec.slv_activity_id="+planId+" and dec.id not in ("+ids+")";
					Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					List list = sqlQuery.list();
					if(list!=null && list.size()>0){
						for(Object ob:list){
							Geometry geom = null;
							try {
								geom = reader.read(ob.toString());
								geom.setSRID(900916);
								if(poly.overlaps(geom) || poly.equals(geom)){
									JSONObject jsonObject = new JSONObject();
									jsonObject.element("result", "false");
									jsonArray.add(jsonObject);
								}
							} catch (com.vividsolutions.jts.io.ParseException e) {
								e.printStackTrace();
							}
						}
					}
				}
			
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.checkImplSlvOverlap", e);
			throw new BusinessException("InputAction.checkImplSlvOverlap", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * AJAX Method- inspActionType.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void landType() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang=getLocale().getLanguage();
			Landtype[] list=Landtype.values();
			String option="";
			for (Landtype o : list) {
				 option="'"+o.getDOMKEY()+"':";
				if("en".equals(lang)){
					option+="'"+o.getDOMTEXT_EN()+"'";
				}else if("sr".equals(lang)){
					option+="'"+o.getDOMTEXT_SR()+"'";						
				}else{
					option+="'"+o.getDOMTEXT()+"'";	
				}			
				option+=",";
			}
			option=option.substring(0,option.length()-1);
			out.append(option);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.landType", e);
			throw new BusinessException("InputAction.landType", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Request type.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 * @Method requestType
	 */
	public void requestType() throws IOException, BusinessException {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			try{
				String nameStartsWith = request.getParameter("name_startsWith");
				String lang=getLocale().getLanguage();
				String query="select at.* from tfal_request_type at ";
				if(StringUtils.isNotEmpty(nameStartsWith)){
					if("en".equals(lang)){
						query += " WHERE LOWER(at.name_en) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
					}else if("sr".equals(lang)){
						query += " WHERE LOWER(at.name_sr) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
					}else{
						query += " WHERE LOWER(at.name_al) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
					}
				}
				List<RequestType> list=DAOFactory.getFactory().getRequestTypeDAO().executeSQLQuery(query);
				
				JSONArray jsonArray = new JSONArray();
				for (RequestType o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					if("en".equals(lang)){
						jsonObject.element("name", o.getNameEn());
					}else if("sr".equals(lang)){
						jsonObject.element("name", o.getNameSr());						
					}else{
						jsonObject.element("name", o.getNameAl());
					}
					jsonObject.element("price", o.getPrice());
					if("en".equals(lang)){
						jsonObject.element("period_type", o.getPeriodType().getDOMTEXT_EN());
					}else if("sr".equals(lang)){
						jsonObject.element("period_type", o.getPeriodType().getDOMTEXT_SR());
					}else{
						jsonObject.element("period_type", o.getPeriodType().getDOMTEXT());
					}
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
				
				out.flush();
			}catch (Exception e){
				log.error("InputAction.inspActionType", e);
				throw new BusinessException("InputAction.inspActionType", e);
			} finally {
				out.close();
			}		
		}

	/**
	 * Dhpet annual plan.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 * @Method dhpetAnnualPlan
	 */
	public void dhpetAnnualPlan() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String query="select p.* from tdhpet_annual_plan p left join tdhpet_period_plan pp on pp.id=p.period_plan_id left join tdhpet_location l on l.id=pp.location_id ";
			String cond = " WHERE ";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				query += cond+" p.year\\:\\:varchar ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				cond=" AND ";
			}
			Character oplv = getUser().getOperationalLevelVal();
			if(oplv!='C'){
				Long userId = getUser().getEmployee().getId();
				query+=cond+" superintend_by="+userId;
				cond=" AND ";
			}
			List<DhpetAnnualPlan> list=DAOFactory.getFactory().getDhpetAnnualPlanDAO().executeSQLQuery(query);
			
			JSONArray jsonArray = new JSONArray();
			for (DhpetAnnualPlan o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getYear()+" - "+o.getDhpetPeriodPlan().getDhpetLocation().getHabitatLocation());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.dhpetAnnualPlan", e);
			throw new BusinessException("InputAction.dhpetAnnualPlan", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- dbpetAnimal.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dhpetAnimalLoc() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			DhpetAnimalLocationDAO dao = DAOFactory.getFactory().getDhpetAnimalLocationDAO();
			
			String lang=getLocale().getLanguage();
			
			String nameStartsWith = request.getParameter("name_startsWith");
			String annualplanId = request.getParameter("annualplanId");
			if(StringUtils.isNotEmpty(annualplanId)){
				String sqlQuery = "SELECT l.* FROM tdhpet_animal_location l left join tdhpet_wild_animals a on l.animal_id=a.id WHERE l.annu_plan_id="+annualplanId;
				if(StringUtils.isNotEmpty(nameStartsWith))
					sqlQuery+=" AND name_"+lang+" ILIKE '" + nameStartsWith + "%'";
				List<DhpetAnimalLocation> list = dao.executeSQLQuery(sqlQuery);
				
				JSONArray jsonArray = new JSONArray();
				for (DhpetAnimalLocation w : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", w.getId());
					jsonObject.element("animal_id", w.getDhpetWildAnimals().getId());
					if("en".equals(lang))
						jsonObject.element("name", w.getDhpetWildAnimals().getNameEn());
					else if("al".equals(lang))
						jsonObject.element("name", w.getDhpetWildAnimals().getNameAl());
					if("sr".equals(lang))
						jsonObject.element("name", w.getDhpetWildAnimals().getNameSr());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.dhpetAnimalLoc", e);
			throw new BusinessException("InputAction.dhpetAnimalLoc", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Gets the overlap lease request.
	 *
	 * @return the overlap lease request
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void getOverlapLeaseRequest() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				String polygon = request.getParameter("polygon");
				String request_id = request.getParameter("request_id");
				session = HibSessionFactory.getSessionFactory().getCurrentSession();
				
				WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
			    Geometry geo = wktReader.read(polygon);
			    JSONArray jsonArray = new JSONArray();
				if(StringUtils.isNotEmpty(polygon) && IsValidOp.isValid(geo)){
					String sql = "";
					if(StringUtils.isNotEmpty(request_id)){
						 sql = "select * from get_overlap_lease_request('"+request_id+"','"+polygon+"')";
					}else{
						sql = "select * from get_overlap_lease_request('"+polygon+"')";
					}
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					sqlQuery.addScalar("request_id", StringType.INSTANCE);
					sqlQuery.addScalar("area", DoubleType.INSTANCE);
					List list = sqlQuery.list();
					
					JSONObject jsonObject = new JSONObject();
					for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					String requestId = (String) obj[0];
					Double area = (Double) obj[1];

					
					jsonObject.element("request_id", requestId);
					jsonObject.element("area", area);
					jsonArray.add(jsonObject);
					}
				
			}
				String str = jsonArray.toString();
				out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getOverlapStand", e);
			throw new BusinessException("InputAction.getOverlapStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Calc lease price.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void calcLeasePrice() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String startdate = request.getParameter("startDate");
			String enddate = request.getParameter("endDate");
			String destination = request.getParameter("destination");
			String area=request.getParameter("area");
			if(StringUtils.isNotEmpty(area) && StringUtils.isNotEmpty(startdate) && StringUtils.isNotEmpty(enddate) && StringUtils.isNotEmpty(destination)){
				Long destId = Long.valueOf(destination);
				RequestType reqType  = DAOFactory.getFactory().getRequestTypeDAO().get(destId);
				
				Date endDate = DATE_FORMAT.parse(enddate);
			    Calendar cal = Calendar.getInstance();
			    cal.setTime(endDate);
			    int daysOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			    
			    String query = "select EXTRACT(YEAR FROM age)as years,EXTRACT(MONTH FROM age) months,EXTRACT(DAY FROM age) days from " +
			    		"(SELECT age(TIMESTAMP '"+enddate+"', TIMESTAMP '"+startdate+"'))a"; 
			    Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			    SQLQuery sqlQuery = session.createSQLQuery(query);
			    sqlQuery.addScalar("years", DoubleType.INSTANCE);
			    sqlQuery.addScalar("months", DoubleType.INSTANCE);
				sqlQuery.addScalar("days", DoubleType.INSTANCE);
				
				Object [] ob = (Object[])sqlQuery.uniqueResult();
				Double years=(Double)ob[0];
				Double months = (Double)ob[1];
				Double days = (Double)ob[2];
				Double area_ha=new Double(area);
				Double s = days/daysOfMonth;
				double days_ect=months +s;
				
				Double price = reqType.getPrice();
				if(reqType.getPeriodType().equals(Periodtype.YEAR)){
					price = price*area_ha*years;
				}else if(reqType.getPeriodType().equals(Periodtype.MONTH)){
					if(years.doubleValue()>0.0){
						months=months+(years.doubleValue()*12);
					}
					price = price*area_ha*months;
				}else if(reqType.getPeriodType().equals(Periodtype.MONTH3)){
					if(years.doubleValue()>0.0){
						months=(months+(years.doubleValue()*12))/3.0;
					}
					price = price*area_ha*months;
				}
				DecimalFormat df = new DecimalFormat("#.##");
				
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("price", df.format(price));
				jsonArray.add(jsonObject);
				String str = jsonObject.toString();
				out.append(str);
				out.flush();
			}
				
		} catch (Exception e) {
			log.error("InputAction.calcLeasePrice", e);
			throw new BusinessException("InputAction.calcLeasePrice", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * AJAX Method- dhpetTouristPurpose.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dhpetTouristPurpose() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String lang=getLocale().getLanguage();
			String query="select p.* from tdhpet_tourist_purpose p ";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				if("en".equals(lang)){
					query += " WHERE LOWER(p.name_en) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else if("sr".equals(lang)){
					query += " WHERE LOWER(p.name_sr) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}else{
					query += " WHERE LOWER(p.name_al) ILIKE '" + nameStartsWith.toLowerCase() + "%'" ;
				}
			}
			List<DhpetTouristPurpose> list=DAOFactory.getFactory().getDhpetTouristPurposeDAO().executeSQLQuery(query);
			
			JSONArray jsonArray = new JSONArray();
			for (DhpetTouristPurpose o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if("en".equals(lang)){
					jsonObject.element("name", o.getNameEn());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getName());
				}
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.dhpetTouristPurpose", e);
			throw new BusinessException("InputAction.dhpetTouristPurpose", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Gets the overlap animal location.
	 *
	 * @return the overlap animal location
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void getOverlapAnimalLocation() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				String polygon = request.getParameter("polygon");
				String location_id = request.getParameter("location_id");
				session = HibSessionFactory.getSessionFactory().getCurrentSession();
				
				WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
			    Geometry geo = wktReader.read(polygon);
			    JSONArray jsonArray = new JSONArray();
				if(StringUtils.isNotEmpty(polygon) && IsValidOp.isValid(geo)){
					String sql ="";
					if(StringUtils.isNotEmpty(location_id)){
						sql = "select * from get_overlaped_animal_location("+location_id+",'"+polygon+"')";
					}else{
						sql = "select * from get_overlaped_animal_location('"+polygon+"')";
					}
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					sqlQuery.addScalar("location_id", StringType.INSTANCE);
					sqlQuery.addScalar("area", DoubleType.INSTANCE);
					List list = sqlQuery.list();
					
					JSONObject jsonObject = new JSONObject();
					for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					String locationId = (String) obj[0];
					Double area = (Double) obj[1];
					jsonObject.element("location_id", locationId);
					jsonObject.element("area", area);
					jsonArray.add(jsonObject);
					}
				
			}
				String str = jsonArray.toString();
				out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getOverlapStand", e);
			throw new BusinessException("InputAction.getOverlapStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * AJAX Method- devices.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void devices() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			DevicesDAO dao=DAOFactory.getFactory().getDevicesDAO();
			String vehicle_id=request.getParameter("vehicle_id");
			String lang = getLocale().getLanguage();
			String nameStartsWith = request.getParameter("name_startsWith");
			
			String sqlQuery = "select * from tlog_devices where vehicle_id="+vehicle_id+" and name ilike '"+nameStartsWith+"%'";
			List<Devices> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Devices o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.devices", e);
			throw new BusinessException("InputAction.devices", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Layer names.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void layerNames() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String querylayerNames="select cast( viewname as text ) from vw_layers_export";

			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(querylayerNames);
			sqlQuery.addScalar("viewname",StringType.INSTANCE);
			
			
			DevicesDAO dao=DAOFactory.getFactory().getDevicesDAO();
			String lang = getLocale().getLanguage();
			String nameStartsWith = request.getParameter("name_startsWith");
			
			
			List list = sqlQuery.list();
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				Object obj= (Object) iterator.next();
				String layerName = (String) obj;
				jsonObject.element("name", layerName);
				jsonArray.add(jsonObject);
			}
		
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.layerNames", e);
			throw new BusinessException("InputAction.layerNames", e);
		} finally {
			out.close();
		}		
	}	
	
	
	/**
	 * Gets the activity geom details.
	 *
	 * @return the activity geom details
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void getActivityGeomDetails() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			String activitypointstart=request.getParameter("activitypointstart");
			String activitypointend=request.getParameter("activitypointend");
			String roadId=request.getParameter("roadId");
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(activitypointstart) && StringUtils.isNotEmpty(activitypointend) && StringUtils.isNotEmpty(roadId)){
				String sql = "select * from public.get_segment_details_from_road("+roadId+",'"+activitypointstart+"','"+activitypointend+"')";
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("lg1", DoubleType.INSTANCE);
				sqlQuery.addScalar("lg2", DoubleType.INSTANCE);
				sqlQuery.addScalar("geom_act",StringType.INSTANCE);
				sqlQuery.addScalar("distance_lg0_lg_1", DoubleType.INSTANCE);
				List list = sqlQuery.list();
				DecimalFormat df = new DecimalFormat("#.##");
				JSONObject jsonObject = new JSONObject();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] obj = (Object[]) iterator.next();
					Double lg1 = (Double) obj[0];
					Double lg2 = (Double) obj[1];
					String geom_act = (String) obj[2];
					Double distance_lg0_lg_1 = (Double) obj[3];
					
					
					jsonObject.element("lg1",df.format(lg1));
					jsonObject.element("lg2",df.format(lg2));
					jsonObject.element("geom_act", geom_act);
					jsonObject.element("distance_lg0_lg_1",df.format( distance_lg0_lg_1));
					
					jsonArray.add(jsonObject);
				}
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.getActivityGeomDetails", e);
			throw new BusinessException("InputAction.getActivityGeomDetails", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check line points.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void checkLinePoints() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			String activitypointstart=request.getParameter("activitypointstart");
			String activitypointend=request.getParameter("activitypointend");
			String roadId=request.getParameter("roadId");
			session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
			JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(activitypointstart) && StringUtils.isNotEmpty(activitypointend) && StringUtils.isNotEmpty(roadId)){
				String sql = "select * from public.get_segment_details_checked("+roadId+",'"+activitypointstart+"','"+activitypointend+"')";
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("get_segment_details_checked", BooleanType.INSTANCE);
				
				Object o = sqlQuery.uniqueResult();
				
				JSONObject jsonObject = new JSONObject();
				if(o!=null)
					jsonObject.element("start_point_is_min", new Boolean(o.toString()));
				  jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.checkLinePoints", e);
			throw new BusinessException("InputAction.checkLinePoints", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Read print formats.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void readPrintFormats() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
		    String apiurl =settings.getString("map_print_url")+"?&SERVICE=WMS&VERSION=1.3&REQUEST=GetProjectSettings";
			File xmlFile = File.createTempFile("temp", "xml");
			
			URL url = new URL(apiurl); 
			FileUtils.copyURLToFile(url, xmlFile);
			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(xmlFile);
			
			doc.getDocumentElement().normalize();

			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
			
			NodeList nList = doc.getElementsByTagName("ComposerTemplate");
			System.out.println("----------------------------");
			String[] mapFormats=new String[nList.getLength()];
			for (int temp = 0; temp < nList.getLength(); temp++) {
				
					Node nNode = nList.item(temp);
							
					System.out.println("\nCurrent Element :" + nNode.getNodeName());
							
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {
	
						Element eElement = (Element) nNode;
						mapFormats[temp]=eElement.getAttribute("name");
					}
				}
				NodeList nListCompMap = doc.getElementsByTagName("ComposerMap");
				String[] dimensionsMapWidth=new String[nListCompMap.getLength()];
				String[] dimensionsMapHeight=new String[nListCompMap.getLength()];
				for (int i = 0; i < nListCompMap.getLength(); i++) {
					Node nNodeCompMap = nListCompMap.item(i);
					if (nNodeCompMap.getNodeType() == Node.ELEMENT_NODE) {
						Element compMapElement = (Element) nNodeCompMap;
						dimensionsMapWidth[i]=compMapElement.getAttribute("width");
						dimensionsMapHeight[i]=compMapElement.getAttribute("height");
				  }
				}
			
			  JSONArray jsonArray = new JSONArray();
			  
			  for(int j=0;j<nList.getLength(); j++) {
				  JSONObject jsonObject = new JSONObject();
				  jsonObject.element("format",mapFormats[j]);
				  jsonObject.element("width",dimensionsMapWidth[j]);
				  jsonObject.element("height",dimensionsMapHeight[j]);
				  jsonArray.add(jsonObject);
			  }
//				
			JSONObject jsonObject = new JSONObject();
//				
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("InputAction.readPrintFormats", e);
			throw new BusinessException("InputAction.readPrintFormats", e);
		} finally {
			out.close();
		}
	}
	
	
}
