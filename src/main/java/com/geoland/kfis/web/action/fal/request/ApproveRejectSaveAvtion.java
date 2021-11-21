package com.geoland.kfis.web.action.fal.request;

import java.io.File;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.RequestDoc;
import com.geoland.kfis.model.RequestStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Requeststatus;

// TODO: Auto-generated Javadoc
/**
 * The Class ApproveRejectSaveAvtion.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 25, 2015, 9:29:10 AM
 * v2.0
 */
public class ApproveRejectSaveAvtion extends RequestBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The decisionfile. */
	private File decisionfile[];
	
	/** The doc names decision. */
	private String docNamesDecision;
	
	/** The doc exts decision. */
	private String docExtsDecision;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(requestId==null)
			addActionError("request.approve.reject.id.empty");
		
		if(StringUtils.isEmpty(approvedRejected))
			addActionError("request.approve.reject.approvedRejected.empty");
		
		if(decisionfile==null || decisionfile.length<0)
			addActionError("request.approve.reject.file.empty");
		
		if(hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("error_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		leaseRequest = DAOFactory.getFactory().getRequestDAO().get(requestId);
		
		RequestStatus currentStatus = leaseRequest.getRequestStatus();
		if(currentStatus!=null && currentStatus.getId()!=null){
			currentStatus = DAOFactory.getFactory().getRequestStatusDAO().get(currentStatus.getId());				
		}
		Person user = getUser().getPerson();
		
		if(currentStatus!=null && currentStatus.getStatus().equals(Requeststatus.NEW)){
			if(approvedRejected.equals("rejected")){
				leaseRequest.setActive(false);
				requestStatus.setStatus(Requeststatus.REJECTED);
			}else{
				requestStatus.setStatus(Requeststatus.APPROVED);
			}
			requestStatus.setActive(true);
			requestStatus.setCreatedDate(new Date());
			requestStatus.setPerson(user);
			requestStatus.setRequest(leaseRequest);
			leaseRequest.setRequestStatus(requestStatus);			
		}
		DAOFactory.getFactory().getRequestDAO().save(leaseRequest);
		DAOFactory.getFactory().getRequestStatusDAO().save(requestStatus);
		
		if(decisionfile!=null && decisionfile.length>0){
			StringTokenizer st=new StringTokenizer(docNamesDecision,";");
			int length = st.countTokens();
			String names[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					names[i]=a;
			}
			st=new StringTokenizer(docExtsDecision, ";");
			length=st.countTokens();
			String exts[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					exts[i]=a;
			}
			for(int i=0;i<decisionfile.length;i++){
				if(decisionfile[i]!=null){
					RequestDoc doc=new RequestDoc();
					doc.setCreateDate(new Date());
					doc.setRequestStatus(requestStatus);
					doc.setDocName(names[i]);
					doc.setDocType(exts[i]);
					doc.setDoc(getFileBytes(decisionfile[i]));
					doc.setPerson(user);
					DAOFactory.getFactory().getRequestDocDAO().save(doc);
				}
			}
		}
		return SUCCESS;
	}

	/**
	 * Gets the decisionfile.
	 *
	 * @return the decisionfile
	 */
	public File[] getDecisionfile() {
		return decisionfile;
	}

	/**
	 * Sets the decisionfile.
	 *
	 * @param decisionfile the new decisionfile
	 */
	public void setDecisionfile(File[] decisionfile) {
		this.decisionfile = decisionfile;
	}

	/**
	 * Gets the doc names decision.
	 *
	 * @return the doc names decision
	 */
	public String getDocNamesDecision() {
		return docNamesDecision;
	}

	/**
	 * Sets the doc names decision.
	 *
	 * @param docNamesDecision the new doc names decision
	 */
	public void setDocNamesDecision(String docNamesDecision) {
		this.docNamesDecision = docNamesDecision;
	}

	/**
	 * Gets the doc exts decision.
	 *
	 * @return the doc exts decision
	 */
	public String getDocExtsDecision() {
		return docExtsDecision;
	}

	/**
	 * Sets the doc exts decision.
	 *
	 * @param docExtsDecision the new doc exts decision
	 */
	public void setDocExtsDecision(String docExtsDecision) {
		this.docExtsDecision = docExtsDecision;
	}
	
}
