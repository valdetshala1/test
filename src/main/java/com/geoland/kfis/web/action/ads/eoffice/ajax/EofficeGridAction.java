/**
 * 
 */
package com.geoland.kfis.web.action.ads.eoffice.ajax;

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
import com.geoland.kfis.model.Bpartner;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.BPartnerDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class EofficeGridAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:32:21 AM, Feb 12, 2015
 */
public class EofficeGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7066410913251099564L;

	/**
	 * B partner.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void bPartner() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			
			BPartnerDAO dao = DAOFactory.getFactory().getBPartnerDAO();
			
			String name=request.getParameter("name");
			String countQuery = "select count(*) from tbpartner as b";
			

			String sqlQuery = "select b.*, y.*, 1 as clazz_ from tbpartner as b left join tparty as y on b.id = y.id";
			//String sqlQuery = "select p.*, y.*, 1 as clazz_ from tperson as p left join tparty as y on p.id = y.id";
			
			if(StringUtils.isNotEmpty(name)){
				sqlQuery+=" where b.name ilike '"+name+"%' ";
				countQuery+=" where b.name ilike '%"+name+"%' ";
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("name")){
					ob_field = "name";
				}else if(ob_field.equals("name2")){
					ob_field = "name2";
				}
				sqlQuery += " order by b." + ob_field + " " + getSord();
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<Bpartner> list = dao.executeSQLQuery(sqlQuery);
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (Bpartner b : list) {
				JSONObject jo = new JSONObject();
				jo.element("id", b.getId());
				jo.element("party_id", b.getParty()!=null?b.getParty().getId():"");
				jo.element("isactive", b.getIsactive());
				jo.element("name", b.getName());
				jo.element("name2", b.getName2());
				jo.element("description", b.getDescription());
				jo.element("employer_id_number", b.getEmployerIdNumber());
				jo.element("social_security_number", b.getSocialSecurityNumber());
				jo.element("contact_etbilished_date", DATE_FORMAT.format(b.getContactEtbilishedDate()));
				jo.element("vendor_discount_percent", b.getVendorDiscountPercent());
				jo.element("issummary", b.getIssummary());
				jo.element("isonetime", b.getIsonetime());
				jo.element("isprospect", b.getIsprospect());
				jo.element("isvendor", b.getIsvendor());
				jo.element("iscustomer", b.getIscustomer());
				jo.element("isemployee", b.getIsemployee());
				jo.element("referenceno", b.getReferenceno());
				jo.element("rating", b.getRating());
				jo.element("salesvolume", b.getSalesvolume());
				jo.element("numberemployees", b.getNumberemployees());
				jo.element("flatdiscount", b.getFlatdiscount());
				jo.element("totalopenbalance", b.getTotalopenbalance());
				jo.element("bpartner_parent_id", b.getBpartnerParentId());
				jo.element("created", DATE_FORMAT.format(b.getCreated()));
				jo.element("createdby", b.getPersonByCreatedby().getFirstName()+" "+b.getPersonByCreatedby().getLastName());
				jo.element("updated", DATE_FORMAT.format(b.getUpdated()));
				jo.element("updatedby", b.getPersonByUpdatedby().getFirstName()+" "+b.getPersonByUpdatedby().getLastName());

				rows.add(jo);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.executiveoffice.ajax.ExecutiveOfficeGridAction.bPartner", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.executiveoffice.ajax.ExecutiveOfficeGridAction.bPartner", e);
		} finally {
			out.close();
		}

	}
}
