package com.geoland.kfis.web.action.frm.dhpet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.DhpetAnimalCapacity;
import com.geoland.kfis.model.DhpetAnimalLocation;
import com.geoland.kfis.model.DhpetAnimalLocationDetail;
import com.geoland.kfis.model.DhpetAnnualPlan;
import com.geoland.kfis.model.DhpetHuntGroundEval;
import com.geoland.kfis.model.DhpetHuntedAnimalDetail;
import com.geoland.kfis.model.DhpetHuntedAnimals;
import com.geoland.kfis.model.DhpetLocation;
import com.geoland.kfis.model.DhpetLocationLandType;
import com.geoland.kfis.model.DhpetPeriodPlan;
import com.geoland.kfis.model.DhpetTouristPurpose;
import com.geoland.kfis.model.DhpetTouristRegister;
import com.geoland.kfis.model.DhpetWildAnimals;
import com.geoland.kfis.model.DhpetWildAnimalsRequest;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.DhpetAnimalCapacityDAO;
import com.geoland.kfis.persistence.dao.services.DhpetAnimalLocationDAO;
import com.geoland.kfis.persistence.dao.services.DhpetAnimalLocationDetailDAO;
import com.geoland.kfis.persistence.dao.services.DhpetAnnualPlanDAO;
import com.geoland.kfis.persistence.dao.services.DhpetHuntGroundEvalDAO;
import com.geoland.kfis.persistence.dao.services.DhpetHuntedAnimalDetailDAO;
import com.geoland.kfis.persistence.dao.services.DhpetHuntedAnimalsDAO;
import com.geoland.kfis.persistence.dao.services.DhpetLocationDAO;
import com.geoland.kfis.persistence.dao.services.DhpetLocationLandTypeDAO;
import com.geoland.kfis.persistence.dao.services.DhpetPeriodPlanDAO;
import com.geoland.kfis.persistence.dao.services.DhpetTouristPurposeDAO;
import com.geoland.kfis.persistence.dao.services.DhpetTouristRegisterDAO;
import com.geoland.kfis.persistence.dao.services.DhpetWildAnimalsDAO;
import com.geoland.kfis.persistence.dao.services.DhpetWildAnimalsRequestDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
// TODO: Auto-generated Javadoc

/**
 * The Class DhpetGridAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created 11:14:19 AM
 * @Version 1.0
 */
public class DhpetGridAction extends GridBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4514719335125153360L;
	
	/**
	 * animalCapacityGrid JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void animalCapacityGrid() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			String annualplanId = request.getParameter("annualplanId");
			DhpetAnimalCapacityDAO dao=DAOFactory.getFactory().getDhpetAnimalCapacityDAO();
			String countQuery = "SELECT COUNT(c.*) FROM tdhpet_animal_capacity c left join tdhpet_animal_location l on l.id=c.animal_location_id";
			String sqlQuery = "SELECT c.* FROM tdhpet_animal_capacity c left join tdhpet_animal_location l on l.id=c.animal_location_id";
			
			if(StringUtils.isNotEmpty(annualplanId) && StringUtils.isNumeric(annualplanId)){
				countQuery+=" where l.annu_plan_id="+annualplanId;
				sqlQuery+=" where l.annu_plan_id="+annualplanId;
			
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DhpetAnimalCapacity> list=dao.executeSQLQuery(sqlQuery);
				String lang=getLocale().getLanguage();
				
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetAnimalCapacity a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("animal", "al".equals(lang)?a.getDhpetAnimalLocation().getDhpetWildAnimals().getNameAl():"sr".equals(lang)?a.getDhpetAnimalLocation().getDhpetWildAnimals().getNameSr():a.getDhpetAnimalLocation().getDhpetWildAnimals().getNameEn());
					jsonObject.element("useOfLand", "al".equals(lang)?a.getUseOfLand().getDOMTEXT():"sr".equals(lang)?a.getUseOfLand().getDOMTEXT_SR():a.getUseOfLand().getDOMTEXT_EN());
					jsonObject.element("year", a.getDhpetAnimalLocation().getDhpetAnnualPlan().getYear());
					jsonObject.element("area", a.getArea());
					jsonObject.element("percentage", a.getPercentage());
					jsonObject.element("dhpetLocation", a.getDhpetAnimalLocation().getDhpetAnnualPlan().getDhpetPeriodPlan().getDhpetLocation().getHabitatLocation());
					jsonObject.element("createdBy", a.getEmployee().getFirstName()+" "+a.getEmployee().getLastName());
					jsonObject.element("created", fdate(a.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}else setEmtpyContent(out);
			
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.animalCapacityGrid", e);
			throw new BusinessException("DhpetGridAction.animalCapacityGrid", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * locationGrid JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void locationGrid() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		try{
			String lang=getLocale().getLanguage();
			DhpetLocationDAO dao=DAOFactory.getFactory().getDhpetLocationDAO();
			String countQuery = "SELECT COUNT(*) FROM tdhpet_location";
			if(isHuntingOwnerUser()){
				countQuery+=" where  superintend_by="+getUser().getPerson().getId();
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String sqlQuery = "SELECT * FROM tdhpet_location ";
			if(isHuntingOwnerUser()){
				sqlQuery+=" where  superintend_by="+getUser().getPerson().getId();
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<DhpetLocation> list=dao.executeSQLQuery(sqlQuery);
			
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetLocation a : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", a.getId());
				jsonObject.element("municipality",lang.equals("al") ? a.getCadastralMunicipality().getName() : lang.equals("en") ? a.getCadastralMunicipality().getNameEn() : lang.equals("sr") ? a.getCadastralMunicipality().getNameSr():"");
				jsonObject.element("habitat_location", a.getHabitatLocation());
				jsonObject.element("area", a.getArea());
				jsonObject.element("hunting_area_type",lang.equals("al") ? a.getHuntingAreaType().getDOMTEXT() : lang.equals("en") ? a.getHuntingAreaType().getDOMTEXT_EN() : lang.equals("sr") ? a.getHuntingAreaType().getDOMTEXT_SR():"");
				jsonObject.element("comments", a.getComments());
				jsonObject.element("superintend_by", a.getPerson().getFirstName()+" "+a.getPerson().getLastName());
				jsonObject.element("createdBy", a.getEmployee().getFirstName()+" "+a.getEmployee().getLastName());
				jsonObject.element("created", fdate(a.getCreatedDate()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.locationGrid", e);
			throw new BusinessException("DhpetGridAction.locationGrid", e);
		} finally {
			out.close();
		}		
	}

	/**
	 * maintOfMongGrid JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dhpetHuntGroundEvalGrid() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		try{
			String lang=getLocale().getLanguage();
			String annualplanId = request.getParameter("annualplanId");
			String animalLocationId=request.getParameter("animalLocationId");
			DhpetHuntGroundEvalDAO dao=DAOFactory.getFactory().getDhpetHuntGroundEvalDAO();
			String countQuery = "SELECT COUNT(e.*) FROM tdhpet_hunt_ground_eval e left join tdhpet_animal_location l on l.id=e.animal_location_id";
			String sqlQuery = "SELECT e.* FROM tdhpet_hunt_ground_eval e left join tdhpet_animal_location l on l.id=e.animal_location_id";
			if(StringUtils.isNotEmpty(annualplanId) && StringUtils.isNumeric(annualplanId)){
				countQuery+=" where l.id="+animalLocationId;
				sqlQuery+=" where l.id="+animalLocationId;
				
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DhpetHuntGroundEval> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetHuntGroundEval m : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", m.getId());
					jsonObject.element("dhpetLocation", m.getDhpetAnimalLocation().getDhpetAnnualPlan().getDhpetPeriodPlan().getDhpetLocation().getHabitatLocation());
					if("en".equals(lang))
						jsonObject.element("dhpetWildAnimals", m.getDhpetAnimalLocation().getDhpetWildAnimals().getNameEn());
					else if("al".equals(lang))
						jsonObject.element("dhpetWildAnimals", m.getDhpetAnimalLocation().getDhpetWildAnimals().getNameAl());
					else jsonObject.element("dhpetWildAnimals", m.getDhpetAnimalLocation().getDhpetWildAnimals().getNameSr());
					jsonObject.element("year", m.getDhpetAnimalLocation().getDhpetAnnualPlan().getYear());
					jsonObject.element("requestFor", lang.equals("al") ? m.getDhpetWildAnimalsRequest().getRequestFor().getDOMTEXT() : lang.equals("en") ?m.getDhpetWildAnimalsRequest().getRequestFor().getDOMTEXT_EN() : lang.equals("sr") ? m.getDhpetWildAnimalsRequest().getRequestFor().getDOMTEXT_SR():"");
					jsonObject.element("maxPoint", m.getDhpetWildAnimalsRequest().getMaxPoint());
					jsonObject.element("definedPoint", m.getDefinedPoint());
					jsonObject.element("createdDate", DATE_FORMAT.format(m.getCreatedDate()));
					jsonObject.element("createdBy", m.getEmployee().getFirstName()+" "+m.getEmployee().getLastName());
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}else setEmtpyContent(out);
			
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.dhpetHuntGroundEvalGrid", e);
			throw new BusinessException("DhpetGridAction.dhpetHuntGroundEvalGrid", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * maintOfMongGrid JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void wildAnimalGrid() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		try{
			DhpetWildAnimalsDAO dao = DAOFactory.getFactory().getDhpetWildAnimalsDAO();
			String countQuery = "SELECT COUNT(*) FROM tdhpet_wild_animals";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String sqlQuery = "SELECT * FROM tdhpet_wild_animals ORDER BY id";
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<DhpetWildAnimals> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetWildAnimals w : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", w.getId());
				jsonObject.element("nameLa", w.getNameLa());
				jsonObject.element("nameAl", w.getNameAl());
				jsonObject.element("nameEn", w.getNameEn());
				jsonObject.element("nameSr", w.getNameSr());
				jsonObject.element("hunt_seasone", w.getHuntSeasoneStart()+" - "+w.getHuntSeasoneEnd());
				jsonObject.element("hunt_forbidden_seasone", w.getHuntForbiddenSeasoneStart() +" - "+w.getHuntForbiddenSeasoneEnd());
				jsonObject.element("createdDate", DATE_FORMAT.format(w.getCreatedDate()));
				jsonObject.element("createdBy", w.getEmployee().getFirstName()+" "+w.getEmployee().getLastName());
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.wildAnimalGrid", e);
			throw new BusinessException("DhpetGridAction.wildAnimalGrid", e);
		} finally {
			out.close();
		}		
	}

	/**
	 * animalLocation JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void animalLocation() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try{
			DhpetAnimalLocationDAO dao = DAOFactory.getFactory().getDhpetAnimalLocationDAO();
			
			String annualplanId = request.getParameter("annualplanId");
			String lang=getLocale().getLanguage();
			String countQuery = "SELECT count(al.*) FROM tdhpet_animal_location al";
			String sqlQuery = "SELECT al.* FROM tdhpet_animal_location al";
			if(StringUtils.isNotEmpty(annualplanId) && StringUtils.isNumeric(annualplanId)){
				countQuery+=" where al.annu_plan_id="+annualplanId;
				sqlQuery+=" where al.annu_plan_id="+annualplanId;
					
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				
				List<DhpetAnimalLocation> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetAnimalLocation al : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", al.getId());
					jsonObject.element("animal_id", al.getDhpetWildAnimals().getId());
					jsonObject.element("animal", "al".equals(lang)?al.getDhpetWildAnimals().getNameAl():"sr".equals(lang)?al.getDhpetWildAnimals().getNameSr():al.getDhpetWildAnimals().getNameEn());
					jsonObject.element("location", al.getDhpetAnnualPlan().getDhpetPeriodPlan().getDhpetLocation().getHabitatLocation());
					jsonObject.element("year", al.getDhpetAnnualPlan().getYear());
					jsonObject.element("quantity", al.getQuantity());
	//				jsonObject.element("comments", al.getNote());
					jsonObject.element("created_by", getPersonData(al.getEmployee()));
					jsonObject.element("created_date", fdate(al.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}else setEmtpyContent(out);
			
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.animalLocation", e);
			throw new BusinessException("DhpetGridAction.animalLocation", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * huntedAnimal JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void huntedAnimal() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try{
			DhpetHuntedAnimalsDAO dao = DAOFactory.getFactory().getDhpetHuntedAnimalsDAO();
			
			String annualplanId = request.getParameter("annualplanId");
			
			
			String lang=getLocale().getLanguage();
			String countQuery = "SELECT count(al.*) FROM tdhpet_hunted_animals al";
			String sqlQuery = "SELECT al.* FROM tdhpet_hunted_animals al";
			if(StringUtils.isNotEmpty(annualplanId) && StringUtils.isNumeric(annualplanId)){
				countQuery+=" where al.annu_plan_id="+annualplanId;
				sqlQuery+=" where al.annu_plan_id="+annualplanId;
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" order by al.annu_plan_id";
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				
				List<DhpetHuntedAnimals> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetHuntedAnimals al : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", al.getId());
					jsonObject.element("animal_id", al.getDhpetWildAnimals().getId());
					jsonObject.element("animal", "al".equals(lang)?al.getDhpetWildAnimals().getNameAl():"sr".equals(lang)?al.getDhpetWildAnimals().getNameSr():al.getDhpetWildAnimals().getNameEn());
					jsonObject.element("location", al.getDhpetAnnualPlan().getDhpetPeriodPlan().getDhpetLocation().getHabitatLocation());
					jsonObject.element("animals_number", al.getAnimalsNumber());
					jsonObject.element("year", al.getDhpetAnnualPlan().getYear());
					jsonObject.element("date", fdate(al.getDate()));
					jsonObject.element("createdBy", getPersonData(al.getEmployee()));
					jsonObject.element("created", fdate(al.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}else setEmtpyContent(out);
			
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.huntedAnimal", e);
			throw new BusinessException("DhpetGridAction.huntedAnimal", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * animalRequest JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void animalRequest() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		try{
			String lang=getLocale().getLanguage();
			String animal_id = request.getParameter("animal_id");
			DhpetWildAnimalsRequestDAO dao=DAOFactory.getFactory().getDhpetWildAnimalsRequestDAO();
			
			String countQuery = "SELECT COUNT(*) FROM tdhpet_wild_animals_request";
			String sqlQuery = "SELECT * FROM tdhpet_wild_animals_request";
			
			if(StringUtils.isNotEmpty(animal_id) && StringUtils.isNumeric(animal_id)){
				countQuery+=" where animal_id="+animal_id;
				sqlQuery+=" where animal_id="+animal_id;
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<DhpetWildAnimalsRequest> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetWildAnimalsRequest m : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", m.getId());
				jsonObject.element("requestFor", lang.equals("al") ? m.getRequestFor().getDOMTEXT() : lang.equals("en") ? m.getRequestFor().getDOMTEXT_EN() : lang.equals("sr") ? m.getRequestFor().getDOMTEXT_SR():"");
				jsonObject.element("maxPoint", m.getMaxPoint());
				jsonObject.element("note", m.getNote());
				jsonObject.element("createdDate", DATE_FORMAT.format(m.getCreatedDate()));
				jsonObject.element("createdBy", m.getEmployee().getFirstName()+" "+m.getEmployee().getLastName());
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.animalRequest", e);
			throw new BusinessException("DhpetGridAction.animalRequest", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * animalRequest JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualplan() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		try{
			DhpetAnnualPlanDAO dao=DAOFactory.getFactory().getDhpetAnnualPlanDAO();
			String periodId = request.getParameter("periodId");
			if(StringUtils.isNotEmpty(periodId)){
				String countQuery = "SELECT COUNT(*) FROM tdhpet_annual_plan where period_plan_id="+periodId;
				String sqlQuery = "SELECT * FROM tdhpet_annual_plan where period_plan_id="+periodId;
				
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DhpetAnnualPlan> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetAnnualPlan ap : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", ap.getId());
					jsonObject.element("period_plan", ap.getDhpetPeriodPlan().getStartYear()+" - "+ ap.getDhpetPeriodPlan().getEndYear());
					jsonObject.element("year", ap.getYear());
					jsonObject.element("doc_name", ap.getDocName());
					jsonObject.element("remark", ap.getRemark());
					jsonObject.element("created_by", getPersonData(ap.getEmployee()));
					jsonObject.element("created_date", fdate(ap.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.annualplan", e);
			throw new BusinessException("DhpetGridAction.annualplan", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Locationlandtype.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void locationlandtype() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8"); //ReportForestDamage
		PrintWriter out = response.getWriter();
		try{
			String lang=getLocale().getLanguage();
			String location_id=request.getParameter("location_id");
			if(!StringUtils.isEmpty(location_id)){
			DhpetLocationLandTypeDAO dao=DAOFactory.getFactory().getDhpetLocationLandTypeDAO();
			
			String countQuery = "SELECT COUNT(*) FROM tdhpet_location_land_type where location_id="+location_id;
			String sqlQuery = "SELECT * FROM tdhpet_location_land_type  where location_id="+location_id+" ORDER BY id ";
				
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
//			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<DhpetLocationLandType> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();

			for (DhpetLocationLandType ap : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("t_id", ap.getId());
				jsonObject.element("location_id", ap.getDhpetLocation().getId());
				jsonObject.element("land_type", "al".equals(lang)?ap.getLandType().getDOMTEXT():"sr".equals(lang)?ap.getLandType().getDOMTEXT_SR():ap.getLandType().getDOMTEXT_EN());
				jsonObject.element("private_land_area", ap.getPrivateLandArea());
				jsonObject.element("public_land_area", ap.getPublicLandArea());
				jsonObject.element("total_area", ap.getTotalArea());
				jsonObject.element("public_land_area", ap.getPublicLandArea());
				jsonObject.element("created_date", DATE_FORMAT.format(ap.getCreatedDate()));
				jsonObject.element(	"created_by", ap.getEmployee().getFirstName()+" "+ap.getEmployee().getLastName());
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.locationlandtype", e);
			throw new BusinessException("DhpetGridAction.locationlandtype", e);
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
	public void planPeriod() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			DhpetPeriodPlanDAO dao = DAOFactory.getFactory().getDhpetPeriodPlanDAO();
			Employee user = getUser().getEmployee();
			String countQuery ="select count(p.*) from tdhpet_period_plan p left join tdhpet_location l on p.location_id=l.id where l.superintend_by="+user.getId();
			String sqlQuery="select p.* from tdhpet_period_plan p left join tdhpet_location l on p.location_id=l.id where l.superintend_by="+user.getId();

			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<DhpetPeriodPlan> list = dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetPeriodPlan o : list) {

				JSONObject jo = new JSONObject();
				jo.element("id", o.getId());
				jo.element("location", o.getDhpetLocation().getHabitatLocation());
				jo.element("start_year", o.getStartYear());
				jo.element("end_year", o.getEndYear());
				jo.element("remark", o.getRemark());
				jo.element("doc_name", o.getDocName());
				jo.element("created_by", getPersonData(o.getEmployee()));
				jo.element("created_date", fdate(o.getCreatedDate()));
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			
			out.flush();
		}catch (Exception e){
			log.error("DhpetGridAction.planPeriod", e);
			throw new BusinessException("DhpetGridAction.planPeriod", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * animalLocationDetail JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void animalLocationDetail() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		try{
			DhpetAnimalLocationDetailDAO dao=DAOFactory.getFactory().getDhpetAnimalLocationDetailDAO();
			String animalLocationId = request.getParameter("animalLocationId");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(animalLocationId)){
				String countQuery = "SELECT COUNT(*) FROM tdhpet_animal_location_detail where animal_location_id="+animalLocationId;
				String sqlQuery = "SELECT * FROM tdhpet_animal_location_detail where animal_location_id="+animalLocationId;
				
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DhpetAnimalLocationDetail> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetAnimalLocationDetail d : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", d.getId());
					jsonObject.element("animal_location_id", d.getDhpetAnimalLocation().getId());
					jsonObject.element("gender", "en".equals(lang)?d.getGender().getDOMTEXT_EN():"sr".equals(lang)?d.getGender().getDOMTEXT_SR():d.getGender().getDOMTEXT());
					jsonObject.element("age_type", "en".equals(lang)?d.getAgeType().getDOMTEXT_EN():"sr".equals(lang)?d.getAgeType().getDOMTEXT_SR():d.getAgeType().getDOMTEXT());
					jsonObject.element("quantity", d.getQuantity());
					jsonObject.element("note", d.getNote());
					jsonObject.element("created_by", getPersonData(d.getEmployee()));
					jsonObject.element("created_date", fdate(d.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.animalLocationDetail", e);
			throw new BusinessException("DhpetGridAction.animalLocationDetail", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * huntedAnimalDetail JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void huntedAnimalDetail() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		try{
			DhpetHuntedAnimalDetailDAO dao=DAOFactory.getFactory().getDhpetHuntedAnimalDetailDAO();
			String huntAnimalId = request.getParameter("huntAnimalId");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(huntAnimalId)){
				String countQuery = "SELECT COUNT(*) FROM tdhpet_hunted_animal_detail where hunted_animal_id="+huntAnimalId;
				String sqlQuery = "SELECT * FROM tdhpet_hunted_animal_detail where hunted_animal_id="+huntAnimalId;
				
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DhpetHuntedAnimalDetail> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DhpetHuntedAnimalDetail d : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", d.getId());
					jsonObject.element("hunted_animal_id", d.getDhpetHuntedAnimals().getId());
					jsonObject.element("gender", "en".equals(lang)?d.getGender().getDOMTEXT_EN():"sr".equals(lang)?d.getGender().getDOMTEXT_SR():d.getGender().getDOMTEXT());
					jsonObject.element("death_cause", "en".equals(lang)?d.getDeathCause().getDOMTEXT_EN():"sr".equals(lang)?d.getDeathCause().getDOMTEXT_SR():d.getDeathCause().getDOMTEXT());
					jsonObject.element("age", d.getAge());
					jsonObject.element("weight", d.getWeight());
					jsonObject.element("animals_number", d.getAnimalsNumber());
					jsonObject.element("notes", d.getNotes());
					jsonObject.element("created_by", getPersonData(d.getEmployee()));
					jsonObject.element("created_date", fdate(d.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
				
				out.append(data.toString());
			}else setEmtpyContent(out);
			out.flush();			
			
		}catch (Exception e){
			log.error("DhpetGridAction.huntedAnimalDetail", e);
			throw new BusinessException("DhpetGridAction.huntedAnimalDetail", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * tourismPurpose.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void tourismPurpose() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			DhpetTouristPurposeDAO dao = DAOFactory.getFactory().getDhpetTouristPurposeDAO();
			String countQuery ="select count(p.*) from tdhpet_tourist_purpose p";
			String sqlQuery="select p.* from tdhpet_tourist_purpose p";

			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<DhpetTouristPurpose> list = dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetTouristPurpose o : list) {

				JSONObject jo = new JSONObject();
				jo.element("id", o.getId());
				jo.element("name", o.getName());
				jo.element("name_en", o.getNameEn());
				jo.element("name_sr", o.getNameSr());
				jo.element("created_by", getPersonData(o.getEmployee()));
				jo.element("created_date", fdate(o.getCreatedDate()));
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			
			out.flush();
		}catch (Exception e){
			log.error("DhpetGridAction.tourismPurpose", e);
			throw new BusinessException("DhpetGridAction.tourismPurpose", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * tourismPurpose.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void tourismRegister() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang = getLocale().getLanguage();
			DhpetTouristRegisterDAO dao = DAOFactory.getFactory().getDhpetTouristRegisterDAO();
			String countQuery ="select count(r.*) from tdhpet_tourist_register r";
			String sqlQuery="select r.* from tdhpet_tourist_register r";

			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<DhpetTouristRegister> list = dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetTouristRegister o : list) {

				JSONObject jo = new JSONObject();
				jo.element("id", o.getId());
				
				jo.element("location_id", o.getDhpetLocation().getId());
				jo.element("location_name", o.getDhpetLocation().getHabitatLocation());
				jo.element("start_date", fdate(o.getStartDate()));
				jo.element("end_date", fdate(o.getEndDate()));
				jo.element("purpose_id", o.getDhpetTouristPurpose().getId());
				jo.element("purpose_name", "en".equals(lang)?o.getDhpetTouristPurpose().getNameEn():"sr".equals(lang)?o.getDhpetTouristPurpose().getNameSr():o.getDhpetTouristPurpose().getName());
				jo.element("payment", o.getPayment());
				jo.element("tourist_number", o.getTouristNumber());
				jo.element("note", o.getNote());
				jo.element("created_by", getPersonData(o.getEmployee()));
				jo.element("created_date", fdate(o.getCreatedDate()));
				
				rows.add(jo);
			}
			data.element("rows", rows);

			out.append(data.toString());
			
			out.flush();
		}catch (Exception e){
			log.error("DhpetGridAction.tourismRegister", e);
			throw new BusinessException("DhpetGridAction.tourismRegister", e);
		} finally {
			out.close();
		}
	}
}
