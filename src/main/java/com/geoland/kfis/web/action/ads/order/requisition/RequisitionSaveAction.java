package com.geoland.kfis.web.action.ads.order.requisition;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.RequisitionStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequisitionSaveAction.
 */
public class RequisitionSaveAction extends RequisitionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6761894914078953680L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(requisition!=null && requisition.getId()!=null){
			String fieldNames[] = new String[]{"id", "status_id", "status_code"};
			String fieldTypes[] = new String[]{"LONG", "LONG", "STRING"};
			String query = "select r.id, r.status_id, r.status_code from trequisition as r left join trequisition_status as s on r.id = s.requisition_id where s.id=r.status_id and r.id=" + requisition.getId();
			List<Object[]> dataView = DAOFactory.getFactory().getRequisitionStatusDAO().getDataView(fieldNames, fieldTypes, query);
			if(dataView!=null && !dataView.isEmpty()){
				Object[] data = dataView.get(0);
				Long tid = (Long) data[0];
				//Long tstatusId = (Long) data[1];
				String tstatusCode = (String) data[2];
				if(requisition.getId().equals(tid) &&  (!"NEW".equals(tstatusCode) && !"OPEN".equals(tstatusCode))){
					addActionError("requisition.save.operation.status.disabled");
				}
			}else{
				addActionError("requisition.status.data.invalid");
			}
		}
		
		if(StringUtils.isEmpty(requisition.getDestinationType())){
			addFieldError("requisition.destinationType", getMessage("requisition.destinationType.empty"));
		}
		
		if(StringUtils.isEmpty(requisition.getDestinationType())){
			addFieldError("requisition.destinationType", getMessage("requisition.destinationType.empty"));
		}	
		
		if(StringUtils.isEmpty(requisition.getRequesterName())){
			addFieldError("requisition.requesterName", getMessage("requisition.requesterName.empty"));
		}		

		if(StringUtils.isEmpty(requisition.getRequesterPhone())){
			addFieldError("requisition.requesterPhone", getMessage("requisition.requesterPhone.empty"));
		}
		
		if(requisition.getDpMngmt()!=null && requisition.getDpMngmt().getId()==null){
			addFieldError("requisition.dpMngmt.id", getMessage("requisition.dpMngmt.id"));
//			addFieldError("trxdoctype", getMessage("requisition.dpMngmt.id"));
		}		
		
		if(requisition.getOrganisation() != null && requisition.getOrganisation().getId()==null){
			addFieldError("requisition.organisation.orgaName", getMessage("requisition.organisation.orgaName"));
		}	
		
		if(StringUtils.isEmpty(requisition.getIsBpartner())){
			addFieldError("bpartner", getMessage("requisition.isBpartner.empty"));
		}else{
			if("Y".equals(requisition.getIsBpartner())){
				if(requisition.getBpartner() != null && requisition.getBpartner().getId() == null){
					addFieldError("bpartner", getMessage("requisition.bpartner.id"));
				}
				requisition.setSupplierAddress(null);
				requisition.setSupplierContact(null);
				requisition.setSupplierEmail(null);
				requisition.setSupplierFax(null);
				requisition.setSupplierName(null);
				requisition.setSupplierPhone(null);
				requisition.setSupplierSite(null);
				
			}else{
				
				requisition.setBpartner(null);
				
				if(StringUtils.isEmpty(requisition.getSupplierName())){
					addFieldError("requisition.supplierName", getMessage("requisition.supplierName.empty"));
				}
				
				if(StringUtils.isEmpty(requisition.getSupplierAddress())){
					addFieldError("requisition.supplierAddress", getMessage("requisition.supplierAddress.empty"));
				}
				
				if(StringUtils.isEmpty(requisition.getSupplierContact())){
					addFieldError("requisition.supplierContact", getMessage("requisition.supplierContact.empty"));
				}		
				
				if(StringUtils.isEmpty(requisition.getSupplierPhone())){
					addFieldError("requisition.supplierPhone", getMessage("requisition.supplierPhone.empty"));
				}					
			}
		}
		
		if(requisition.getCurrency() != null && requisition.getCurrency().getId()==null){
			addFieldError("requisition.currency.id", getMessage("requisition.currency.id"));
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
		String statusCode = "NEW";
		BigDecimal totalAmount = new BigDecimal(0.0);
		
		RequisitionStatus status = new RequisitionStatus();
		status.setRequisition(requisition);
		status.setStatusCode(statusCode);
		status.setCreated(cdate);
		status.setUpdated(cdate);
		status.setPersonByCreatedby(person);
		status.setPersonByUpdatedby(person);
		
		if(requisition.getId() == null && StringUtils.isEmpty(requisition.getRequisitionNr()) ){
			//requisition.setRequisitionNr(IdGenerator.createId());
			Calendar cal = Calendar.getInstance();
		    cal.setTime(cdate);
		    int year = cal.get(Calendar.YEAR);
			Long seqNr = DAOFactory.getFactory().getDpMngmtDAO().nextOfSequence("KFIS_TREQUISITION_REQUISITION_NR");
			String docNr = "PR-" + String.valueOf(year).substring(2) + "-" + seqNr;
			requisition.setRequisitionNr(docNr);			
		}
		
		requisition.setIsPo("N");
		requisition.setIsactive("Y");
		requisition.setStatusCode(statusCode);
		requisition.setRequisitionStatus(status);
		requisition.setTotalAmount(totalAmount);
		requisition.setCreated(cdate);
		requisition.setUpdated(cdate);
		requisition.setPersonByCreatedby(person);
		requisition.setPersonByUpdatedby(person);
		
		if(requisition.getBpartner()!=null && requisition.getBpartner().getId()!=null){
			requisition.setIsBpartner("Y");
		}else{
			requisition.setIsBpartner("N");
			requisition.setBpartner(null);
		}
		User user=getUser().getUser();
		requisition.setCurrentUser(user);
		DAOFactory.getFactory().getRequisitionDAO().save(requisition);
		status.setCurrentUser(user);
		DAOFactory.getFactory().getRequisitionStatusDAO().save(status);
		
		return SUCCESS;
	}
}
