package com.geoland.kfis.web.action.ads.dp.ajax;

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
import com.geoland.kfis.model.DocCategory;
import com.geoland.kfis.model.DocType;
import com.geoland.kfis.model.DpMngmt;
import com.geoland.kfis.model.DpMngmtAttach;
import com.geoland.kfis.model.DpMngmtStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.DocCategoryDAO;
import com.geoland.kfis.persistence.dao.services.DocTypeDAO;
import com.geoland.kfis.persistence.dao.services.DpMngmtAttachDAO;
import com.geoland.kfis.persistence.dao.services.DpMngmtDAO;
import com.geoland.kfis.persistence.dao.services.DpMngmtStatusDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class GridAction.
 *
 * @author GEO&LAND
 * @created February 11, 2015 10:22:36 PM
 * @Version 1.0
 */
public class GridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 752229284091022916L;
	
	
	/**
	 * Dp.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dp() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			
			DpMngmtDAO dao = DAOFactory.getFactory().getDpMngmtDAO();
			String countQuery = "select count(*) from tdp_mngmt";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String language=getLocale().getLanguage();
			
			String sqlQuery ="";/* "select distinct dp.*,s.*,o.*,p.* from tdp_mngmt as dp " +
					" left join tdp_mngmt_status as s on dp.status_id = s.id " +
					"left join torganisation o on dp.department_id=o.id " +
					"left join tperson p on p.id=dp.owner_id";*/
			String left_join="";
			String select="";
			String ob_field = getSidx();
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				if(ob_field.equals("status")){
					select+=" s.*";
					left_join+=" left join tdp_mngmt_status as s on dp.status_id = s.id ";
					ob_field="s.status_code";
				}else if(ob_field.equals("department")){
					select+="o.*";
					left_join+=" left join torganisation o on dp.department_id=o.id ";
					ob_field=("al".equals(language)?"o.orga_name":"en".equals(language)?"o.orga_name_en":"o.orga_name_sr");
				}else if(ob_field.equals("owner")){
					select+=" p.*";
					left_join+=" left join tperson p on p.id=dp.owner_id ";
					ob_field="p.first_name";
				}else if(ob_field.equals("doctype")){
					select+=" t.*";
					left_join+=" left join tdoctype t on t.id=dp.doctype_id ";
					ob_field="t.name";
				}
			}
			
			sqlQuery+="SELECT dp.* ";
			if(StringUtils.isNotEmpty(select))
				sqlQuery+=","+select;
			
			sqlQuery+=" from tdp_mngmt as dp "+left_join;
			if(StringUtils.isNotEmpty(ob_field))
				sqlQuery+=" order by " + ob_field + " " + getSord();
			else sqlQuery += " order by dp.updated asc";
			
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<DpMngmt> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (DpMngmt a : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", a.getId());
				jsonObject.element("status", a.getDpMngmtStatus()!=null?a.getDpMngmtStatus().getStatusCode():"");
				jsonObject.element("department_id", a.getOrganisation().getId());
				jsonObject.element("department", getOganisationData(a.getOrganisation(), language));
				jsonObject.element("isactive", a.getIsactive());
				jsonObject.element("created", DATE_FORMAT.format(a.getCreated()));
				jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
				jsonObject.element("updated", DATE_FORMAT.format(a.getUpdated()));
				jsonObject.element("documentno", a.getDocumentno());
				jsonObject.element("doc_subject", a.getDocSubject());
				jsonObject.element("doctype_id", a.getDocType().getId());
				jsonObject.element("doctype", a.getDocType().getName());
				jsonObject.element("processing", a.getProcessing());
				jsonObject.element("processed", a.getProcessed());
				jsonObject.element("posted", a.getPosted());
				jsonObject.element("receiver", a.getReceiver());
				jsonObject.element("shipper", a.getShipper());
				jsonObject.element("issued_date", fdate(a.getIssuedDate()));
				jsonObject.element("received_date", fdate(a.getReceivedDate()));
				
				if(!a.getDpMngmtAttaches().isEmpty())
					jsonObject.element("attachments", a.getDpMngmtAttaches().size());
				else
					jsonObject.element("attachments", "");
					
				jsonObject.element("activity_id", a.getDpMngmtStatus()!=null?a.getDpMngmtStatus().getId():"");
				jsonObject.element("activity", a.getDpMngmtStatus()!=null?a.getDpMngmtStatus().getStatusCode():"");
				jsonObject.element("owner", getPersonData(a.getPersonByOwnerId()));
				if(a.getPersonByOwnerId()!=null)
					jsonObject.element("owner_id", a.getPersonByOwnerId().getId());
				else
					jsonObject.element("owner_id", "");
				
				jsonObject.element("description", a.getDescription());

				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.dp", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.dp", e);
		} finally {
			out.close();
		}
	}	
	
	/**
	 * Status.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void status() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			String dpId = request.getParameter("dp_id");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(dpId)){
				DpMngmtStatusDAO dao = DAOFactory.getFactory().getDpMngmtStatusDAO();
				String countQuery = "select count(dp.*) from tdp_mngmt_status as dp where dp.dp_mngm_id=" + dpId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
	
				String sqlQuery = "select dp.* from tdp_mngmt_status as dp where dp.dp_mngm_id=" + dpId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}else{
					sqlQuery += " order by dp.updated asc, s.status_code asc";
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<DpMngmtStatus> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (DpMngmtStatus a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("status_code", a.getStatusCode());
					jsonObject.element("dp_mngm_id", a.getDpMngmt().getId());
					jsonObject.element("from_dpt", getOganisationData(a.getOrganisationByFromDptId(),lang));
					jsonObject.element("from_dpt_id", a.getOrganisationByFromDptId()!=null?a.getOrganisationByFromDptId().getId():"");
					jsonObject.element("to_dpt", getOganisationData(a.getOrganisationByToDptId(),lang));
					jsonObject.element("to_dpt_id", a.getOrganisationByToDptId()!=null?a.getOrganisationByToDptId().getId():"");
					jsonObject.element("action_taken", a.getActionTaken());
					jsonObject.element("textmsg", a.getTextmsg());
					jsonObject.element("created", DATE_FORMAT.format(a.getCreated()));
					jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
					jsonObject.element("updated", DATE_FORMAT.format(a.getUpdated()));
					jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
					
					rows.add(jsonObject);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Attachments.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void attachments() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			String dpId = request.getParameter("dp_id");
			if(StringUtils.isNotEmpty(dpId)){
				DpMngmtAttachDAO dao = DAOFactory.getFactory().getDpMngmtAttachDAO();
				String countQuery = "select count(dp.*) from tdp_mngmt_attach as dp where dp.dp_mngm_id=" + dpId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
	
				String sqlQuery = "select dp.* from tdp_mngmt_attach as dp where dp.dp_mngm_id=" + dpId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}else{
					sqlQuery += " order by dp.updated asc";
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<DpMngmtAttach> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (DpMngmtAttach a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("dp_mngm_id", a.getDpMngmt().getId());
					jsonObject.element("doc_name", a.getDocName());
					jsonObject.element("doc_content_type", a.getDocContentType());
					jsonObject.element("doc_type", a.getDocType());
					jsonObject.element("doc_size", a.getDocSize());
					jsonObject.element("created", DATE_FORMAT.format(a.getCreated()));
					jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
					jsonObject.element("updated", DATE_FORMAT.format(a.getUpdated()));
					jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
					
					rows.add(jsonObject);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status", e);
		} finally {
			out.close();
		}
	}
	
	
	/**
	 * grid docCategory method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void docCategory() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			
			DocCategoryDAO dao = DAOFactory.getFactory().getDocCategoryDAO();
			String countQuery = "select count(*) from tdoc_category";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery="select * from tdoc_category";
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<DocCategory> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			
			for(DocCategory c:list){
				JSONObject jo = new JSONObject();
				jo.element("id", c.getId());
				jo.element("isactive", c.getIsactive());
				jo.element("name", c.getName());
				jo.element("name_en", c.getNameEn());
				jo.element("name_sr", c.getNameSr());
				jo.element("description", c.getDescription());
				jo.element("categorytype", c.getCategorytype());
				jo.element("isdefault", c.getIsdefault());
				jo.element("docbasetype", c.getDocbasetype());
				jo.element("created", DATE_FORMAT.format(c.getCreated()));
				jo.element("createdby", c.getPersonByCreatedby().getFirstName()+" "+c.getPersonByCreatedby().getLastName());
				jo.element("updated", DATE_FORMAT.format(c.getUpdated()));
				jo.element("updatedby", c.getPersonByUpdatedby().getFirstName()+" "+c.getPersonByUpdatedby().getLastName());
				
				rows.add(jo);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status.docCategory", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status.docCategory", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * grid docType method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void docType() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String category_name = request.getParameter("category_name");
			String category_id = request.getParameter("category_id");
			String printname = request.getParameter("printname");
			String name = request.getParameter("name");
			String lang=getLocale().getLanguage();
			
			DocTypeDAO dao = DAOFactory.getFactory().getDocTypeDAO();
			String countQuery = "select count(t.*) from tdoctype t left join tdoc_category c on c.id=t.category_id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String condition = "";
			String sqlQuery = "select t.* from tdoctype t left join tdoc_category c on c.id=t.category_id";
			if(StringUtils.isNotEmpty(category_name)){
				condition += " lower(c.name) like '%" + category_name.toLowerCase() + "%'";
			}			

			if(StringUtils.isNotEmpty(name)){
				if(StringUtils.isNotEmpty(condition)){
					condition += " and";
				}
				condition += " lower(t.name) like '%" + name.toLowerCase() + "%'";
			}	
			
			if(StringUtils.isNotEmpty(printname)){
				if(StringUtils.isNotEmpty(condition)){
					condition += " and";
				}
				condition += " lower(t.printname) like '%" + printname.toLowerCase() + "%'";
			}
			if(StringUtils.isNotEmpty(category_id)){
				if(StringUtils.isNotEmpty(condition)){
					condition += " and";
				}
				condition += " t.category_id= " + category_id;
			}
			
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery += " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if("category_name".equals(ob_field)){
					ob_field = ("al".equals(lang)?"c.name":"en".equals(lang)?"c.name_en":"c.name_sr");
				}
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<DocType> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();

			for(DocType t:list){
				JSONObject jo = new JSONObject();
				jo.element("id", t.getId());
				jo.element("isactive", t.getIsactive());
				jo.element("issotrx", t.getIssotrx());
				jo.element("isdocnocontrolled", t.getIsdocnocontrolled());
				jo.element("name", t.getName());
				jo.element("name_en", t.getNameEn());
				jo.element("name_sr", t.getNameSr());
				jo.element("category_id", t.getDocCategory().getId());
				jo.element("category_name", "al".equals(lang)?t.getDocCategory().getName():"en".equals(lang)?t.getDocCategory().getNameEn():t.getDocCategory().getNameSr());
				jo.element("printname", t.getPrintname());
				jo.element("printnameEn", t.getPrintnameEn());
				jo.element("printnameSr", t.getPrintnameSr());
				jo.element("docbasetype", t.getDocbasetype());
				jo.element("description", t.getDescription());
				jo.element("documentnote", t.getDocumentnote());
				jo.element("created", DATE_FORMAT.format(t.getCreated()));
				jo.element("createdby", t.getPersonByCreatedby().getFirstName()+" "+t.getPersonByCreatedby().getLastName());
				jo.element("updated", DATE_FORMAT.format(t.getUpdated()));
				jo.element("updatedby", t.getPersonByUpdatedby().getFirstName()+" "+t.getPersonByUpdatedby().getLastName());
				
				rows.add(jo);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status.docType", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.GridAction.status.docType", e);
		} finally {
			out.close();
		}
	}
}