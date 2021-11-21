/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.contract;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Contractor;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrcmtTenderStatus;
import com.geoland.kfis.model.PrcmtTenderStatusDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;


// TODO: Auto-generated Javadoc
/**
 * The Class TenderContractSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:18:50 PM, Nov 19, 2014
 */
public class TenderContractSaveAction extends TenderContractBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7438965173196886971L;

	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(bidder!=null && bidder.getId()==null)
			addFieldError("", getMessage(""));
		else{
			bidder=DAOFactory.getFactory().getPrcmtTenderBidderDAO().get(bidder.getId());
			contractor=new Contractor();
			contractor.setAddress(bidder.getAddress());
			contractor.setComopanyName(bidder.getCompanyName());
			contractor.setContactPerson(bidder.getContactPerson());
			contractor.setNote(bidder.getComments());
			contractor.setPhone(bidder.getContactPhone());
			contractor.setFiscalNumber(bidder.getFiscalNumber());
			contractor.setBusinessNumber(bidder.getBusinessNumber());
			contract.setContractor(contractor);
		}
		/*contractor validations*/
		if(contractor!=null && StringUtils.isEmpty(contractor.getComopanyName()))
			addFieldError("contractor.comopanyName", getMessage("contractor.comopany.name.empty"));
		
		if(contractor!=null && StringUtils.isEmpty(contractor.getFiscalNumber()))
			addFieldError("contractor.fiscalNumber", getMessage("contractor.fiscal.number"));
		
		if(tender!=null && tender.getId()==null)
			addFieldError("", getMessage(""));
		else{
			tender=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tender.getId());
			contract.setContractName(tender.getDesignationOfRequest());
		}
		/*contract validations*/
		if(contract!=null && StringUtils.isEmpty(contract.getContractName()))
			addFieldError("contract.contractName", getMessage("contract.contract.name.empty"));
		
//		if(contract!=null && contract.getContractor().getId()==null)
//			addFieldError("contract.contractors.id", getMessage("contract.contractors.empty"));
		
		if(contract!=null && StringUtils.isEmpty(contract.getContractNumber()))
			addFieldError("contract.contractNumber", getMessage("contract.contract.number.empty"));
		
		if(contract!=null && contract.getContractCosts()==null)
			addFieldError("contract.cost", getMessage("contract.cost.empty"));
		
		if(!getFieldErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		/*contractor */
		contractor.setCreatedTime(new Date());
		contractor.setParty(employee);
		
		DAOFactory.getFactory().getContractorDAO().save(contractor);
		
		/*contract */
		
		contract.setParty(employee);
		contract.setCreatedTime(new Date());
		DAOFactory.getFactory().getContractDAO().save(contract);
		
		/*tender request with status*/
		PrcmtTenderStatus tenderStatus = new PrcmtTenderStatus();
		tenderStatus.setCreatedDate(new Date());
		tenderStatus.setEmployee(employee);
		tenderStatus.setPrcmtTenderRequest(tender);
		tenderStatus.setStatus(Protenderstatus.CONTRACTED);
		tender.setPrcmtTenderStatus(tenderStatus);
		
		DAOFactory.getFactory().getPrcmtTenderRequestDAO().save(tender);
		DAOFactory.getFactory().getPrcmtTenderStatusDAO().save(tenderStatus);
		
		/*contract doc and tender request doc*/
		if(file!=null){
			doc.setContract(contract);//contract doc attachment
			doc.setCreatedDate(new Date());
			doc.setEmployee(employee);
			doc.setDoc(getFileBytes(file));
			
			PrcmtTenderStatusDoc attachment=new PrcmtTenderStatusDoc();//tender request attachment
			attachment.setComment(tenderStatus.getComment());
			attachment.setCreatedDate(new Date());
			attachment.setEmployee(employee);
			attachment.setPrcmtTenderStatus(tenderStatus);
			attachment.setDocName(doc.getDocName());
			attachment.setDocType(doc.getDocType());
			attachment.setDoc(doc.getDoc());
			
			
			DAOFactory.getFactory().getContractDocDAO().save(doc);
			DAOFactory.getFactory().getPrcmtTenderStatusDocDAO().save(attachment);
		}
		return SUCCESS;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
}
