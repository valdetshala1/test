package com.geoland.kfis.web.action.ads.order.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.Bpartner;
import com.geoland.kfis.model.BpartnerLocation;
import com.geoland.kfis.model.Currency;
import com.geoland.kfis.model.DpMngmt;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.Requisition;
import com.geoland.kfis.model.Tax;
import com.geoland.kfis.model.Uom;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.CurrencyDAO;
import com.geoland.kfis.persistence.dao.services.DpMngmtDAO;
import com.geoland.kfis.persistence.dao.services.RequisitionDAO;
import com.geoland.kfis.persistence.dao.services.TaxDAO;
import com.geoland.kfis.persistence.dao.services.UomDAO;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class InputAction.
 */
public class InputAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3777684415097270959L;
	
	/** The log. */
	protected Logger log = Logger.getLogger(InputAction.class);

	
	/**
	 * Gets the person data.
	 *
	 * @param person the person
	 * @return the person data
	 */
	protected String getPersonData(Person person){
		String pdata = "";
		if(person!=null){
			pdata = person.getFirstName() + " " + person.getLastName();
		}
		return pdata;
	}
	
	/**
	 * Gets the oganisation data.
	 *
	 * @param orga the orga
	 * @return the oganisation data
	 */
	protected String getOganisationData(Organisation orga){
		String odata = "";
		if(orga!=null){
			odata = orga.getOrgaName() + " (" + orga.getOrgaCategory() + ", " + orga.getOperLevelVal() + ")";
		}
		return odata;
	}
	
	/**
	 * Txndocs.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void txndocs() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{

			DpMngmtDAO dao = DAOFactory.getFactory().getDpMngmtDAO();
			String sqlQuery;
//			sqlQuery = "select * from tdp_mngmt as dp left join tdoctype as dt on dt.id = dp.doctype_id where dt.docbasetype = 'POR'";
			sqlQuery = "select * from tdp_mngmt as dp left join tdoctype as dt on dt.id = dp.doctype_id";
			String nameStartsWith = request.getParameter("name_startsWith");
			if(StringUtils.isNotEmpty(nameStartsWith)){
//				sqlQuery += " and dp.doc_subject ilike '%" + nameStartsWith + "%'";
				sqlQuery += " where dp.doc_subject ilike '%" + nameStartsWith + "%'";
			}
			
			List<DpMngmt> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (DpMngmt o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("doctype_id", o.getDocType().getId());
				jsonObject.element("doctype", o.getDocType().getName());
				jsonObject.element("department_id", o.getOrganisation().getId());
				jsonObject.element("department", getOganisationData(o.getOrganisation()));
				jsonObject.element("documentno", o.getDocumentno());
				jsonObject.element("doc_subject", o.getDocSubject());
				jsonObject.element("createdby", getPersonData(o.getPersonByCreatedby()));
				jsonObject.element("created", DATE_FORMAT.format(o.getCreated()));
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.order.ajax.txndocs", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.txndocs", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Tax.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void tax() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			
			TaxDAO dao = DAOFactory.getFactory().getTaxDAO();
			String sqlQuery = "select * from ttax as c";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " where c.isactive = 'Y' and c.name ilike '%" + nameStartsWith+ "%'";
			}else{
				sqlQuery += " where c.isactive = 'Y' and c.name = 'Standard'";
			}
			
			List<Tax> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Tax o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("rate", o.getRate());
				jsonObject.element("description", o.getDescription());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.order.ajax.currency", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.currency", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Currency.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void currency() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			
			CurrencyDAO dao = DAOFactory.getFactory().getCurrencyDAO();
			String sqlQuery = "select * from tcurrency as c";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " where c.isactive = 'Y' and c.description ilike '%" + nameStartsWith+ "%'";
			}else{
				sqlQuery += " where c.isactive = 'Y' and c.iso_code = 'EUR'";
			}
			
			List<Currency> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Currency o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("iso_code", o.getIsoCode());
				jsonObject.element("cursymbol", o.getCursymbol());
				jsonObject.element("description", o.getDescription());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.order.ajax.currency", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.currency", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Uom.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void uom() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			
			UomDAO dao = DAOFactory.getFactory().getUomDAO();
			String sqlQuery = "select * from tuom as c";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				sqlQuery += " where c.isactive = 'Y' and c.name ilike '%" + nameStartsWith+ "%'";
			}else{
				sqlQuery += " where c.isactive = 'Y'";
			}
			
			List<Uom> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (Uom o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("x12de355", o.getX12de355());
				jsonObject.element("uomsymbol", o.getUomsymbol());
				jsonObject.element("name", o.getName());
				jsonObject.element("description", o.getDescription());
				
				jsonArray.add(jsonObject);
			}
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.order.ajax.uom", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.uom", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Requisition.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requisition() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			
			RequisitionDAO dao = DAOFactory.getFactory().getRequisitionDAO();
			if(StringUtils.isNotEmpty(nameStartsWith)){
				String sqlQuery = "select r.* from trequisition r left join tdp_mngmt as dp on r.document_id=dp.id where dp.doc_subject ilike '%"+nameStartsWith+"%'";
				
				
				List<Requisition> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (Requisition o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("doc_subject", o.getDpMngmt().getDocSubject());
					jsonObject.element("requisitionNr", o.getRequisitionNr());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.order.ajax.requisition", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.requisition", e);
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
	public void busPartner() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String query="SELECT p.* FROM tbpartner AS p ";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				query+=" WHERE p.name ILIKE '"+nameStartsWith+"%'";
			}
			List<Bpartner> list=DAOFactory.getFactory().getBPartnerDAO().executeSQLQuery(query);
			JSONArray jsonArray = new JSONArray();
			for (Bpartner o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("name2", o.getName2());
				
				jsonArray.add(jsonObject);
			}
				String str = jsonArray.toString();
				out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.busPartner", e);
			throw new BusinessException("InputAction.busPartner", e);
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
	public void busPartnerLocation() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String bpartnerId=request.getParameter("bpartner_id");
			String query="SELECT p.* FROM tbpartner_location AS p ";
			String cond = " WHERE";
			if(StringUtils.isNotEmpty(nameStartsWith)){
				query+=" WHERE p.name ILIKE '"+nameStartsWith+"%'";
				cond=" AND ";
			}
			if(StringUtils.isNotEmpty(bpartnerId)){
				query+=cond+" p.bpartner_id="+bpartnerId;
			}
			
			List<BpartnerLocation> list=DAOFactory.getFactory().getBPartnerLocationDAO().executeSQLQuery(query);
			JSONArray jsonArray = new JSONArray();
			for (BpartnerLocation o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				
				jsonArray.add(jsonObject);
			}
				String str = jsonArray.toString();
				out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("InputAction.busPartnerLocation", e);
			throw new BusinessException("InputAction.busPartnerLocation", e);
		} finally {
			out.close();
		}		
	}
}
