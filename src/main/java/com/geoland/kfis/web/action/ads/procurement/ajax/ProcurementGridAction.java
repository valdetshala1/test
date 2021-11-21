/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.ajax;

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
import com.geoland.kfis.model.PrcmtDossierQuestion;
import com.geoland.kfis.model.PrcmtDossierRequest;
import com.geoland.kfis.model.PrcmtTenderBid;
import com.geoland.kfis.model.PrcmtTenderBidder;
import com.geoland.kfis.model.PrcmtTenderComplaint;
import com.geoland.kfis.model.PrcmtTenderRequest;
import com.geoland.kfis.model.PrcmtTenderStatusDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.PrcmtDossierQuestionDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtDossierRequestDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderBidDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderBidderDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderComplaintDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderRequestDAO;
import com.geoland.kfis.persistence.dao.services.PrcmtTenderStatusDocDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class ProcurementGridAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:01:48 PM, Oct 2, 2014
 */
public class ProcurementGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 956957627833707363L;

	/**
	 * Tender request.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void tenderRequest() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {  
			HttpServletRequest request = ServletActionContext.getRequest();
			PrcmtTenderRequestDAO dao = DAOFactory.getFactory().getPrcmtTenderRequestDAO();
			String language = getLocale().getLanguage();
			String countQuery="select distinct count(r.*) from tprcmt_tender_request r left join tprcmt_tender_status s on r.current_status=s.id left join torganisation o on o.id=r.organisation_id";// where s.status='"+status+"'";
			String sqlQuery="select distinct r.*,o.* from tprcmt_tender_request r left join tprcmt_tender_status s on r.current_status=s.id left join torganisation o on o.id=r.organisation_id";// where s.status='"+status+"'";
			String status= request.getParameter("status");
			if(StringUtils.isNotEmpty(status)){
				countQuery+=" where s.status='"+status+"'";
				sqlQuery+=" where s.status='"+status+"'";
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("organisation")){
					ob_field = ("al".equals(language)?"t.organ_name":"en".equals(language)?"t.organ_name_en":"t.organ_name_sr");
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<PrcmtTenderRequest> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for(PrcmtTenderRequest r:list){
				JSONObject ob = new JSONObject();
				ob.element("id", r.getId());
				ob.element("designation_of_request", r.getDesignationOfRequest());
				ob.element("declare_of_needs", r.getDeclareOfNeeds());
				ob.element("organisation", getOganisationData(r.getOrganisation(),language));
				ob.element("organisation_id", r.getOrganisation().getId());
//				ob.element("status", r.get)
				ob.element("annual_plan", r.getAnnualPlan());
				ob.element("pprc_notification", r.getPprcNotification());
				ob.element("created_by", getPersonData(r.getEmployee()));
				ob.element("created_date", fdate(r.getCreatedDate()));
				
				rows.add(ob);
			}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("ProcurementGridAction.tenderRequest", e);
			throw new BusinessException("ProcurementGridAction.tenderRequest", e);
		}finally {
			out.close();
		}
	}
	
	/**
	 * Bidders.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void bidders() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			PrcmtTenderBidderDAO dao=DAOFactory.getFactory().getPrcmtTenderBidderDAO();
			String countQuery = "select count(*) from tprcmt_tender_bidder";
			String query = "select * from tprcmt_tender_bidder";
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			query += " LIMIT " + limit + " offset " + start;
			List<PrcmtTenderBidder> list = dao.executeSQLQuery(query);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			
			for(PrcmtTenderBidder b:list){
				JSONObject ob=new JSONObject();
				ob.element("id", b.getId());
				ob.element("comopanyName", b.getCompanyName());
				ob.element("fiscalNumber", b.getFiscalNumber());
				ob.element("address", b.getAddress());
				ob.element("contactPerson", b.getContactPerson());
				ob.element("contactPhone", b.getContactPhone());
				ob.element("EMail", b.getEMail());
				ob.element("contractor", b.getContractor());
				ob.element("comments", b.getComments());
				ob.element("createdBy", b.getEmployee().getFirstName()+" "+b.getEmployee().getLastName());
				ob.element("createdDate", DATE_FORMAT.format(b.getCreatedDate()));
				
				rows.add(ob);
			}
			
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			log.error("ProcurementGridAction.bidders");
			throw new BusinessException("ProcurementGridAction.bidders");
		} finally{
			out.close();
		}
	}
	
	/**
	 * Bids.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void bids() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String tenderId=request.getParameter("tenderId");
			if(StringUtils.isNotEmpty(tenderId)){
				PrcmtTenderBidDAO dao=DAOFactory.getFactory().getPrcmtTenderBidDAO();
				String countQuery = "select count(*) from tprcmt_tender_bid where tender_request_id="+tenderId;
				String query = "select * from tprcmt_tender_bid where tender_request_id="+tenderId;
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				query += " LIMIT " + limit + " offset " + start;
				List<PrcmtTenderBid> list = dao.executeSQLQuery(query);
			
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
			
				JSONArray rows=new JSONArray();
			
			for(PrcmtTenderBid b:list){
				JSONObject ob=new JSONObject();
				ob.element("id", b.getId());
				ob.element("proTenderRequest", b.getPrcmtTenderRequest().getDesignationOfRequest());
				ob.element("proTenderBidder", b.getPrcmtTenderBidder().getCompanyName());
				ob.element("bid_value", b.getBidValue());
				ob.element("createdBy", b.getEmployee().getFirstName()+" "+b.getEmployee().getLastName());
				ob.element("createdDate", DATE_FORMAT.format(b.getCreatedDate()));
				ob.element("selected", b.isSelected());
				ob.element("comment", b.getNote());
				ob.element("doc", b.getDoc()!=null?"true":"");
				rows.add(ob);
			}
			
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			}
			
		} catch (Exception e) {
			log.error("ProcurementGridAction.bids");
			throw new BusinessException("ProcurementGridAction.bids");
		} finally{
			out.close();
		}
	}
	
	/**
	 * Dossier requests.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dossierRequests() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			HttpServletRequest req=ServletActionContext.getRequest();
			String tenderId=req.getParameter("tenderId");
			if(StringUtils.isNotEmpty(tenderId)){
				
				PrcmtDossierRequestDAO dao=DAOFactory.getFactory().getPrcmtDossierRequestDAO();
				String countQuery = "select count(*) from tprcmt_dossier_request where tender_id="+tenderId;
				String query = "select * from tprcmt_dossier_request where tender_id="+tenderId;
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				query += " LIMIT " + limit + " offset " + start;
				List<PrcmtDossierRequest> list = dao.executeSQLQuery(query);
				
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows=new JSONArray();
				
				for(PrcmtDossierRequest d:list){
					JSONObject ob=new JSONObject();
					ob.element("id", d.getId());
					ob.element("proTenderRequest", d.getPrcmtTenderRequest().getDesignationOfRequest());
					ob.element("proTenderBidder", d.getPrcmtTenderBidder().getCompanyName());
					ob.element("sent", d.getSent());
					ob.element("sent_date", fdate(d.getSentDate()));
					ob.element("note", d.getNote());
					ob.element("createdBy", d.getEmployee().getFirstName()+" "+d.getEmployee().getLastName());
					ob.element("createdDate", DATE_FORMAT.format(d.getCreatedDate()));
					
					rows.add(ob);
				}
				
				data.element("rows", rows);
				
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
			out.flush();
			
		} catch (Exception e) {
			log.error("ProcurementGridAction.dossierRequests");
			throw new BusinessException("ProcurementGridAction.dossierRequests");
		} finally{
			out.close();
		}
	}
	
	/**
	 * Dossier questions.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void dossierQuestions() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			HttpServletRequest req=ServletActionContext.getRequest();
			String dossierId=req.getParameter("dossierId");
			if(StringUtils.isNotEmpty(dossierId)){
				PrcmtDossierQuestionDAO dao=DAOFactory.getFactory().getPrcmtDossierQuestionDAO();
				String countQuery = "select count(*) from tprcmt_dossier_question where dossier_request_id="+dossierId;
				String query = "select * from tprcmt_dossier_question where dossier_request_id="+dossierId;
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				query += " LIMIT " + limit + " offset " + start;
				List<PrcmtDossierQuestion> list = dao.executeSQLQuery(query);
				
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows=new JSONArray();
				
				for(PrcmtDossierQuestion q:list){
					JSONObject ob=new JSONObject();
					ob.element("idQuestion", q.getId());
					ob.element("prcmtDossierRequest", q.getPrcmtDossierRequest().getId());
					ob.element("question", q.getQuestion());
					ob.element("createdBy", q.getEmployee().getFirstName()+" "+q.getEmployee().getLastName());
					ob.element("createdDate", DATE_FORMAT.format(q.getCreatedDate()));
					
					rows.add(ob);
				}
				
				data.element("rows", rows);
				
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
				out.flush();
				
		} catch (Exception e) {
			log.error("ProcurementGridAction.dossierQuestions");
			throw new BusinessException("ProcurementGridAction.dossierQuestions");
		} finally{
			out.close();
		}
	}
	
	/**
	 * Tender attachments.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void tenderAttachments() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			HttpServletRequest req=ServletActionContext.getRequest();
			String tenderId=req.getParameter("tenderId");
			if(StringUtils.isNotEmpty(tenderId)){
				PrcmtTenderStatusDocDAO dao=DAOFactory.getFactory().getPrcmtTenderStatusDocDAO();
				String countQuery = "select count(a.*) from tprcmt_tender_status_doc a left join tprcmt_tender_status s on s.id=a.status_id where s.tender_request_id="+tenderId;
				String query = "select a.* from tprcmt_tender_status_doc a left join tprcmt_tender_status s on s.id=a.status_id where s.tender_request_id="+tenderId;
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				query += " LIMIT " + limit + " offset " + start;
				List<PrcmtTenderStatusDoc> list = dao.executeSQLQuery(query);
				
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows=new JSONArray();
				
				for(PrcmtTenderStatusDoc a:list){
					JSONObject ob=new JSONObject();
					ob.element("idattach", a.getId());
					ob.element("prcmtTenderStatus", a.getPrcmtTenderStatus().getStatus());
					ob.element("doc_name", a.getDocName());
//					ob.element("attachment", a.getAttachment());
					ob.element("comment", a.getComment());
					ob.element("createdBy", a.getEmployee().getFirstName()+" "+a.getEmployee().getLastName());
					ob.element("createdDate", DATE_FORMAT.format(a.getCreatedDate()));
					
					rows.add(ob);
				}
				
				data.element("rows", rows);
				
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
				out.flush();
				
		} catch (Exception e) {
			log.error("ProcurementGridAction.tenderAttachments");
			throw new BusinessException("ProcurementGridAction.tenderAttachments");
		} finally{
			out.close();
		}
	}
	
	/**
	 * Complaint.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void complaint() throws IOException, BusinessException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String bidId=request.getParameter("bidId");
			if(bidId!=null){
				PrcmtTenderComplaintDAO dao=DAOFactory.getFactory().getPrcmtTenderComplaintDAO();
				String countQuery = "select count(*) from tprcmt_tender_complaint where tender_bid_id="+bidId;
				String query = "select * from tprcmt_tender_complaint where tender_bid_id="+bidId;
				
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				query += " LIMIT " + limit + " offset " + start;
				List<PrcmtTenderComplaint> list = dao.executeSQLQuery(query);
			
				JSONObject data=new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
			
				JSONArray rows=new JSONArray();
			
			for(PrcmtTenderComplaint b:list){
				JSONObject ob=new JSONObject();
				ob.element("id", b.getId());
				ob.element("complaint", b.getComplaint());
				ob.element("docType", b.getDocType());
				ob.element("docName", b.getDocName());
				rows.add(ob);
			}
			
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
			}
			
		} catch (Exception e) {
			log.error("ProcurementGridAction.complaint");
			throw new BusinessException("ProcurementGridAction.complaint");
		} finally{
			out.close();
		}
	}
}
