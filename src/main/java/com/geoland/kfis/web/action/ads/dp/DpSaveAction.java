package com.geoland.kfis.web.action.ads.dp;

import java.io.File;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.DpMngmtAttach;
import com.geoland.kfis.model.DpMngmtStatus;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class DpSaveAction.
 */
public class DpSaveAction extends DpBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4444691792729157972L;
	
	/** The status code. */
	private String statusCode;
	
	/** The msg type. */
	private String msgType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {

		if(dp.getDocType().getId() == null){
			addFieldError("dp.docType.name", getMessage("dp.doctype.name.empty"));
		}
		
		if(dp.getOrganisation() !=null && dp.getOrganisation().getId() == null){
			addFieldError("dp.organisation.orgaName", getMessage("dp.organisation.orgaName.empty"));
		}
			
		if(StringUtils.isEmpty(dp.getDocSubject()))
			addFieldError("dp.docSubject", getMessage("dp.docsubject.empty"));			
		
		if(getFromDptId()!=null){
			fromDtp = DAOFactory.getFactory().getOrganisationDAO().get(fromDptId);
		}

		if(getToDptId()!=null){
			toDtp = DAOFactory.getFactory().getOrganisationDAO().get(toDptId);
		}

		if(getDocOwnerId()!=null){
			docOwner = DAOFactory.getFactory().getPersonDAO().get(docOwnerId);
		}		
		
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}		
	}

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Person person = getUser().getPerson();
		Date cdate = new Date();
		
		DpMngmtStatus status = new DpMngmtStatus();
		status.setDpMngmt(dp);
		status.setCreated(cdate);
		status.setUpdated(cdate);
		status.setPersonByCreatedby(person);
		status.setPersonByUpdatedby(person);
		status.setOrganisationByFromDptId(dp.getOrganisation());
		
		status.setStatusCode("NEW");
		status.setMsgType(msgType);
		User user=getUser().getUser();
		if(dp.getId() != null){
//			String curSC = dp.getDpMngmtStatus().getStatusCode();
//			if("NEW".equals(curSC) && StringUtils.isNotEmpty(statusCode)){
//				status = createStatus(person, cdate, statusCode);
//				dp.setDpMngmtStatus(status);	
//			}else if("FOR".equals(curSC) || "POS".equals(curSC)){
			if(!StringUtils.isEmpty(statusCode))
				status = createStatus(person, cdate, statusCode);
			else
				status = createStatus(person, cdate, "NEW");
			
				dp.setDpMngmtStatus(status);	
				
//			}
		}else{
			dp.setDpMngmtStatus(status);
		}
		if(getToDtp()!=null && getToDtp().getId()!=null)
			status.setOrganisationByToDptId(getToDtp());
		else status.setOrganisationByToDptId(null);
		if(dp.getId() == null && StringUtils.isEmpty(dp.getDocumentno())){
			Calendar cal = Calendar.getInstance();
		    cal.setTime(cdate);
		    int year = cal.get(Calendar.YEAR);
			Long seqNr = DAOFactory.getFactory().getDpMngmtDAO().nextOfSequence("KFIS_TDP_MNGMT_DOCUMENTNO");
			String docNr = "DO-" + String.valueOf(year).substring(2) + "-" + seqNr;
			dp.setDocumentno(docNr);
			//dp.setDocumentno(IdGenerator.createId());
		}
		
		dp.setIsactive("Y");
		dp.setPosted("N");
		dp.setProcessed("N");
		dp.setDpMngmtStatus(status);
		if(dp.getId()==null){
			dp.setCreated(cdate);
			dp.setPersonByCreatedby(person);
		}else{
			dp.setId(dp.getId());
		}
		dp.setUpdated(cdate);
		dp.setPersonByUpdatedby(person);
		dp.setPersonByOwnerId(docOwner);
		dp.setChannelType("I");
		dp.setDatetrx(cdate);
		dp.setStoredDate(cdate);
		
		dp.setCurrentUser(user);
		DAOFactory.getFactory().getDpMngmtDAO().save(dp);
		status.setCurrentUser(user);
		DAOFactory.getFactory().getDpMngmtStatusDAO().save(status);
		
	    for(int i=0; i<fileUpload.size(); i++) {
			File file = fileUpload.get(i);
			if(file!=null && file.length()>0){
				String fuf = fileUploadFileName.get(i);
				String doctype = fuf.substring(fuf.lastIndexOf(".")+1);
				byte[] bytes = FileUtils.readFileToByteArray(file);
				dpAttach = new DpMngmtAttach();
				dpAttach.setDpMngmt(dp);
				dpAttach.setCreated(cdate);
				dpAttach.setUpdated(cdate);
				dpAttach.setPersonByCreatedby(person);
				dpAttach.setPersonByUpdatedby(person);
				dpAttach.setDocName(fuf);
				dpAttach.setDocContentType(fileUploadContentType.get(i));
				dpAttach.setDocType(doctype);
				dpAttach.setDoc(bytes);
				dpAttach.setDocSize(file.length());
				dpAttach.setCurrentUser(user);
				DAOFactory.getFactory().getDpMngmtAttachDAO().save(dpAttach);
			}
	    }		
	    
		return SUCCESS;
	}
	
	/**
	 * Creates the status.
	 *
	 * @param person the person
	 * @param cdate the cdate
	 * @param sc the sc
	 * @return the dp mngmt status
	 */
	private DpMngmtStatus createStatus(Person person, Date cdate, String sc){
		DpMngmtStatus status = new DpMngmtStatus();
		status.setDpMngmt(dp);
		status.setCreated(cdate);
		status.setUpdated(cdate);
		status.setPersonByCreatedby(person);
		status.setPersonByUpdatedby(person);
		status.setStatusCode(sc);	
		status.setOrganisationByFromDptId(dp.getOrganisation());
		status.setOrganisationByToDptId(getToDtp());
		status.setMsgType(msgType);		
		return status;
	}


	/**
	 * Gets the status code.
	 *
	 * @return the status code
	 */
	public String getStatusCode() {
		return statusCode;
	}


	/**
	 * Sets the status code.
	 *
	 * @param statusCode the new status code
	 */
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}


	/**
	 * Gets the msg type.
	 *
	 * @return the msg type
	 */
	public String getMsgType() {
		return msgType;
	}


	/**
	 * Sets the msg type.
	 *
	 * @param msgType the new msg type
	 */
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}	
	
	
}
