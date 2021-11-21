
package com.geoland.kfis.web.action.ads.legalsector.ajax;

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
import com.geoland.kfis.model.LawSuit;
import com.geoland.kfis.model.LawSuitDamage;
import com.geoland.kfis.model.LawSuitStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.LawSuitDAO;
import com.geoland.kfis.persistence.dao.services.LawSuitDamageDAO;
import com.geoland.kfis.persistence.dao.services.LawSuitStatusDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
// TODO: Auto-generated Javadoc

/**
 * The Class LegalSectorGridAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 30, 2014 4:31:20 PM
 * @Version 1.0
 */
public class LegalSectorGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * lawsuit JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void lawsuit() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			LawSuitDAO dao=DAOFactory.getFactory().getLawSuitDAO();
			String lang = getLocale().getLanguage();
			String countQuery = "select count(*) from tlegsec_lawsuit";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery = "select distinct ls.*,o.*,p.* from tlegsec_lawsuit as ls left join torganisation o on o.id=ls.office_id " +
					" left join tperson p on p.id=ls.claimant_id ";
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field=getSidx();
				if(ob_field.equals("claimant"))
					ob_field = "p.first_name";
				else if(ob_field.equals("office"))
					ob_field = ("al".equals(lang)?"o.orga_name":"en".equals(lang)?"o.orga_name_en":"o.orga_name_sr");
				else if(ob_field.equals("personal_id"))
					ob_field = "ls.personal_id";
				
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<LawSuit> list=dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", 1);		
			data.element("total", 1);			
			data.element("records", 1);
			JSONArray rows = new JSONArray();
			for (LawSuit o : list) {
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.element("id", o.getId());
				jsonObject.element("claimant", o.getEmployee().getFirstName()+""+o.getEmployee().getLastName());
				jsonObject.element("current_status", "en".equals(lang)?o.getLawSuitStatus().getStatus().getDOMTEXT_EN():"sr".equals(lang)?o.getLawSuitStatus().getStatus().getDOMTEXT_SR():o.getLawSuitStatus().getStatus().getDOMTEXT());
				jsonObject.element("lawsuit_no", o.getLawsuitNo());
				jsonObject.element("office", getOganisationData(o.getOrganisation(), lang));
				jsonObject.element("suit_type", "en".equals(lang)?o.getSuitType().getDOMTEXT_EN():"sr".equals(lang)?o.getSuitType().getDOMTEXT_SR():o.getSuitType().getDOMTEXT());
				jsonObject.element("name",""+ o.getName()+" "+o.getParentName()+" "+o.getLastName());
				jsonObject.element("origin", "en".equals(lang)?o.getOrigin().getDOMTEXT_EN():"sr".equals(lang)?o.getOrigin().getDOMTEXT_SR():o.getOrigin().getDOMTEXT());
				jsonObject.element("total_damage",o.getTotalDamage());
				jsonObject.element("total_damage_euro",o.getTotalDamageEuro());
				jsonObject.element("personal_id",o.getPersonalId());
				jsonObject.element("birthdate",fdate(o.getBirthdate()));
				
				jsonObject.element("address",o.getAddress());
				jsonObject.element("profession",o.getProfession());
				jsonObject.element("place_of_employment",o.getPlaceOfEmployment());
				
				jsonObject.element("accomplice",o.getAccomplice());
				jsonObject.element("managment_unit",o.getManagmentUnit());
				jsonObject.element("stand",o.getStand());
				jsonObject.element("evidence",o.getEvidence());
				jsonObject.element("placename",o.getPlacename());
				jsonObject.element("date",fdate(o.getDate()));
				jsonObject.element("note",o.getNote());
				
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("LegalSectorGridAction.lawsuit", e);
			throw new BusinessException("LegalSectorGridAction.lawsuit", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * lawsuit JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void lawsuitDamage() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lawsuitId = request.getParameter("lawsuitId");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(lawsuitId)){
				LawSuitDamageDAO dao=DAOFactory.getFactory().getLawsuitDamageDAO();
				String countQuery = "select count(*) from tlegsec_lawsuit_damage where lawsuit_id="+lawsuitId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select ld.* from tlegsec_lawsuit_damage as ld where ld.lawsuit_id="+lawsuitId;
				List<LawSuitDamage> list=dao.executeSQLQuery(sqlQuery);
				JSONObject data = new JSONObject();
				data.element("page", 1);		
				data.element("total", 1);			
				data.element("records", 1);
				JSONArray rows = new JSONArray();
				for (LawSuitDamage o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("lawsuit_damage_id", o.getId());
					jsonObject.element("lawsuit_id", o.getLawSuit().getId());
					jsonObject.element("tree_species_id", o.getTreeSpecies().getId());
					jsonObject.element("tree_species", "en".equals(lang)?o.getTreeSpecies().getNameEn():"sr".equals(lang)?o.getTreeSpecies().getNameSr():o.getTreeSpecies().getNameAl());
					jsonObject.element("timberNumber", o.getTimberNumber());
					jsonObject.element("timberDiameterStump", o.getTimberDiameterStump());
					jsonObject.element("timberDiameter13", o.getTimberDiameter13());
					jsonObject.element("timberHeight", o.getTimberHeight());
					jsonObject.element("volumeDamage", o.getVolumeDamage());
					jsonObject.element("volumeUnitPrice", o.getVolumeUnitPrice());
					jsonObject.element("damageEuro", o.getDamageEuro());
					rows.add(jsonObject);
				}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			}
		}catch (Exception e){
			log.error("LegalSectorGridAction.lawsuitDamage", e);
			throw new BusinessException("LegalSectorGridAction.lawsuitDamage", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * lawsuit JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void lawsuitstatus() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lawsuitId = request.getParameter("lawsuitId");
			String lang = getLocale().getLanguage();
			LawSuitStatusDAO dao=DAOFactory.getFactory().getLawsuitStatusDAO();
			String countQuery;
			if(lawsuitId==null){
				 countQuery = "select count(*) from tlegsec_lawsuit_status";
			}
			else {
				 countQuery = "select count(*) from tlegsec_lawsuit_status where lawsuit_id="+lawsuitId;
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery;
			if(lawsuitId==null){
				sqlQuery = "select ls.* from tlegsec_lawsuit_status as ls";
			}
			else {
				sqlQuery = "select ls.* from tlegsec_lawsuit_status as ls where lawsuit_id="+lawsuitId +" order by id";
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<LawSuitStatus> list=dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", 1);		
			data.element("total", 1);			
			data.element("records", 1);
			JSONArray rows = new JSONArray();
			for (LawSuitStatus o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("status", "en".equals(lang)?o.getStatus().getDOMTEXT_EN():"sr".equals(lang)?o.getStatus().getDOMTEXT_SR():o.getStatus().getDOMTEXT());
				if(o.getCourtSessionDate()!=null){
					jsonObject.element("courtSessionDate", DATE_FORMAT.format(o.getCourtSessionDate()));
				}else {
					jsonObject.element("courtSessionDate", "");
				}
				jsonObject.element("fileName", o.getDocName());
				jsonObject.element("active", o.isActive());
				jsonObject.element("note", o.getNote());
				jsonObject.element("createby", o.getEmployee().getFirstName()+" "+o.getEmployee().getLastName());
				jsonObject.element("createdate", DATE_FORMAT.format(o.getCreateDate()));
				if(o.getDoc()!=null)
					jsonObject.element("doc", "true");
				else jsonObject.element("doc", "false");
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("LegalSectorGridAction.lawsuitstatus", e);
			throw new BusinessException("LegalSectorGridAction.lawsuitstatus", e);
		} finally {
			out.close();
		}		
	}
}
