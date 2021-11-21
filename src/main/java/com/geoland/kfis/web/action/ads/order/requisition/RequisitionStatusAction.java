package com.geoland.kfis.web.action.ads.order.requisition;

import java.text.MessageFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.RequisitionItem;
import com.geoland.kfis.model.RequisitionStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequisitionStatusAction.
 */
public class RequisitionStatusAction extends RequisitionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6761894914078953680L;
	
	/** The is AP. */
	private boolean isAP = false;
	
	/** The is RE. */
	private boolean isRE = false;
	
	/** The is CA. */
	private boolean isCA = false;
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(requisitionId != null){
			requisition = DAOFactory.getFactory().getRequisitionDAO().get(requisitionId);
			if(requisition==null){
				addFieldError("requisition_id", getMessage("requisition.requisition_id.empty"));
			}
			
			for (RequisitionItem ri : requisition.getRequisitionItems()) {
				if("OP".equals(ri.getStatusCode())){
					String message = MessageFormat.format(getMessage("requisition.item.statuscode.op.invalid"), ri.getItemNumber()) ;
					addActionError(message);	
				}
				
				if("AP".equals(ri.getStatusCode())){
					isAP = true;
				}
				
				if("RE".equals(ri.getStatusCode())){
					isRE = true;
				}	
				
				if("CA".equals(ri.getStatusCode())){
					isCA = true;
				}				
			}

			if(requisition.getRequisitionItems()!=null && requisition.getRequisitionItems().isEmpty()){
				addActionError(getMessage("requisition.requisition.items.empty"));
			}			
			
		}else{
			addFieldError("requisition_id", getMessage("requisition.requisition_id.empty"));
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}			
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		Person person = getUser().getPerson();
		
		String statusCode = null;
		if(isAP){
			statusCode = "AP";
		}else if(isRE && !isAP){
			statusCode = "RE";
		}else if(!isAP && !isRE && isCA){
			statusCode = "CA";
		}
		
		RequisitionStatus status = new RequisitionStatus();
		status.setRequisition(requisition);
		status.setStatusCode(statusCode);
		status.setCreated(cdate);
		status.setUpdated(cdate);
		status.setPersonByCreatedby(person);
		status.setPersonByUpdatedby(person);
		
		requisition.setStatusCode(statusCode);
		requisition.setRequisitionStatus(status);
		
		DAOFactory.getFactory().getRequisitionDAO().save(requisition);
		DAOFactory.getFactory().getRequisitionStatusDAO().save(status);
		
		return SUCCESS;
	}
}
