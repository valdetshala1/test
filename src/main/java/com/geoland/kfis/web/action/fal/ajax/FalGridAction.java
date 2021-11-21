package com.geoland.kfis.web.action.fal.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.Request;
import com.geoland.kfis.model.RequestCoord;
import com.geoland.kfis.model.RequestDoc;
import com.geoland.kfis.model.RequestType;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.RequestCoordDAO;
import com.geoland.kfis.persistence.dao.services.RequestDAO;
import com.geoland.kfis.persistence.dao.services.RequestDocDAO;
import com.geoland.kfis.persistence.dao.services.RequestTypeDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Requeststatus;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
// TODO: Auto-generated Javadoc

/**
 * The Class FalGridAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 20, 2015, 2:52:45 PM
 * v2.0
 */
public class FalGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

/* (non-Javadoc)
 * @see com.geoland.kfis.web.action.base.grid.GridBaseAction#fdate(java.util.Date)
 */
@Override
protected String fdate(Date date) {
	// TODO Auto-generated method stub
	return super.fdate(date);
}
	
	/**
	 * Requests.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requests() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String sqlQuery="";
			String countQuery="";
			String lang=getLocale().getLanguage();
			RequestDAO dao = DAOFactory.getFactory().getRequestDAO();
			String requester = request.getParameter("requester");
			String disconected = request.getParameter("disconected");
			String completed = request.getParameter("completed");
			String rejected = request.getParameter("rejected");
			String approved = request.getParameter("approved");
			String newStatus = request.getParameter("newStat");
			Integer countStat = Integer.valueOf(request.getParameter("count"));
			
			
			countQuery="select count(r.*) from tfal_request r left join tperson p on r.person_id=p.id left join tfin_contractor c on r.company_id=c.id left join " +
					"tfal_request_status rs on rs.id=r.current_status_id  ";
			sqlQuery="select r.* from tfal_request r left join tperson p on r.person_id=p.id left join tfin_contractor c on r.company_id=c.id left join " +
					"tfal_request_status rs on rs.id=r.current_status_id ";
			if(StringUtils.isNotEmpty(requester) ||countStat!=0){
				sqlQuery +=" where ";
			}
			if(StringUtils.isNotEmpty(requester)){
				String[] splitQuery = requester.split(" ");
				if(splitQuery!=null && splitQuery.length==2 ){
					sqlQuery+=" lower(p.first_name) like '"+splitQuery[0].toLowerCase()+"%' and lower(p.last_name) like '"+splitQuery[1].toLowerCase()+"%'";
					countQuery+=" lower(p.first_name) like '"+splitQuery[0].toLowerCase()+"%' and lower(p.last_name) like '"+splitQuery[1].toLowerCase()+"%'";
				}else{
					sqlQuery+=" (lower(c.comopany_name) like '"+splitQuery[0].toLowerCase()+"%' or(lower(p.first_name) like '"+splitQuery[0].toLowerCase()+"%' " +
							"or lower(p.last_name) like '"+splitQuery[0].toLowerCase()+"%'))";
					countQuery+="where (lower(c.comopany_name) like '"+splitQuery[0].toLowerCase()+"%' or(lower(p.first_name) like '"+splitQuery[0].toLowerCase()+"%' " +
							"or lower(p.last_name) like '"+splitQuery[0].toLowerCase()+"%'))";
				}
			}
			if(countStat==0 && StringUtils.isNotEmpty(requester)){
				sqlQuery+=" and rs.status is null";
			}else if(countStat==0 && StringUtils.isEmpty(requester)){
				sqlQuery+=" where rs.status is null";
			}
			if(StringUtils.isNotEmpty(requester) && countStat!=0){
				countQuery +=" and ";
				sqlQuery +=" and ";
			}
		
			if(disconected.equals("true")){
				sqlQuery+=" rs.status='DIS'";
				if(countStat>1)
					sqlQuery+=" or";
				countStat--;
			}
			if(completed.equals("true")){
				sqlQuery+=" rs.status='COM'";
				if(countStat>1)
					sqlQuery+=" or";
				countStat--;
			}
			if(rejected.equals("true")){
				sqlQuery+=" rs.status='REJ'";
				if(countStat>1)
					sqlQuery+=" or";
				countStat--;
			}
			if(approved.equals("true")){
				sqlQuery+=" rs.status='APP'";
				if(countStat>1)
					sqlQuery+=" or";
				countStat--;
			}
			if(newStatus.equals("true")){
				sqlQuery+=" rs.status='NEW'";
				if(countStat>1)
					sqlQuery+=" or";
				countStat--;
			}
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<Request> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (Request o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if(o.getPersonByPersonId()!=null)
					jsonObject.element("requester", o.getPersonByPersonId().getFirstName()+" "+o.getPersonByPersonId().getLastName());
				else
					jsonObject.element("requester", o.getContractor().getComopanyName()+"("+o.getContractor().getBusinessNumber()+")");
				
				jsonObject.element("start_lease", fdate(o.getStartLease()));
				jsonObject.element("end_lease", fdate(o.getEndLease()));
				String status="al".equals(lang)?o.getRequestStatus().getStatus().getDOMTEXT():"en"
					.equals(lang)?o.getRequestStatus().getStatus().getDOMTEXT_EN():o.getRequestStatus().getStatus().getDOMTEXT_SR();
				jsonObject.element("status", status);
				jsonObject.element("status_icon", getStatusIcon(o.getRequestStatus().getStatus(),lang));
				
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("FalGridAction.requests", e);
			throw new BusinessException("FalGridAction.requests", e);
		} finally {
			out.close();
		}		
	}	
	
	/**
	 * Gets the status icon.
	 *
	 * @param status the status
	 * @param language the language
	 * @return icon
	 */
	private String getStatusIcon(Requeststatus status,String language){
		String icon = "status_" + status.getDOMKEY().toLowerCase() + ".png";
		String title="al".equals(language)?status.getDOMTEXT():"en".equals(language)?status.getDOMTEXT_EN():status.getDOMTEXT_SR();
		String content = "<img src='img/status/" + icon + "' border='0' alt='" + title + "'" + " title='" + title + "'" + "style='display: block; margin-left: auto; margin-right: auto;' align='center'/>";
		return content;
	}
	
	/**
	 * Request coord.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requestCoord() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String requestId=request.getParameter("requestId");
			
			if(StringUtils.isNotEmpty(requestId)){
				RequestCoordDAO dao = DAOFactory.getFactory().getRequestCoordDAO();
				
				String countQuery="select count(*) from tfal_request_coord where request_id= "+requestId;
				String sqlQuery="select * from tfal_request_coord where request_id= "+requestId;
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				List<RequestCoord> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (RequestCoord o : list) {
	
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("x", o.getX());
					jsonObject.element("y", o.getY());
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}
			
		}catch (Exception e){
			log.error("FalGridAction.requestCoord", e);
			throw new BusinessException("FalGridAction.requestCoord", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Request doc.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requestDoc() throws IOException, BusinessException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String countQuery="";
			String sqlQuery="";
			String request_id=request.getParameter("request_id");
			String lang=getLocale().getLanguage();
			
			RequestDocDAO dao=DAOFactory.getFactory().getRequestDocDAO();
			
			countQuery+="select count(d.*) from tfal_request_doc d left join tfal_request_status rs on " +
					"d.request_status_id=rs.id left join tfal_request r on r.id=rs.request_id ";
					
			sqlQuery+="select d.* from tfal_request_doc d left join tfal_request_status rs on " +
					"d.request_status_id=rs.id left join tfal_request r on r.id=rs.request_id ";
			
			if(StringUtils.isNotEmpty(request_id)){
				countQuery+=" where rs.request_id="+request_id;
				sqlQuery+=" where rs.request_id="+request_id;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<RequestDoc> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(RequestDoc d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("doc_name", d.getDocName());
				o.element("notes", d.getNote());
				o.element("created_date", DATE_FORMAT.format(d.getCreateDate()));
				String status="al".equals(lang)?d.getRequestStatus().getStatus().getDOMTEXT():"en"
					.equals(lang)?d.getRequestStatus().getStatus().getDOMTEXT_EN():d.getRequestStatus().getStatus().getDOMTEXT_SR();
				o.element("status", status);
				o.element("changed_by", d.getRequestStatus().getPerson().getFirstName()+" "+d.getRequestStatus().getPerson().getLastName());
				o.element("status_icon", getStatusIcon(d.getRequestStatus().getStatus(),lang));
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FalGridAction.requestDoc", e);
			throw new BusinessException("FalGridAction.requestDoc",e);
		}finally{
			out.close();
		}
	}
	
	/**
	 * Request types.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requestTypes() throws IOException, BusinessException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String countQuery="";
			String sqlQuery="";
			
			RequestTypeDAO dao=DAOFactory.getFactory().getRequestTypeDAO();
			
			countQuery+="select count(*) from tfal_request_type ";
			
			sqlQuery+="select * from tfal_request_type";
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<RequestType> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(RequestType d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("name_al", d.getNameAl());
				o.element("name_en", d.getNameEn());
				o.element("name_sr", d.getNameSr());
				o.element("price", d.getPrice());
				o.element("created_by", getPersonData(d.getEmployee()));
				o.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FalGridAction.requestTypes", e);
			throw new BusinessException("FalGridAction.requestTypes",e);
		}finally{
			out.close();
		}
	}
}
