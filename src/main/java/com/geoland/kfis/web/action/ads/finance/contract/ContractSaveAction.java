/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contract;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ContractSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 5, 2014, 3:26:31 PM
 */
public class ContractSaveAction extends ContractBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1898519390286167726L;
	
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
		
		if(contract!=null && StringUtils.isEmpty(contract.getContractName()))
			addFieldError("contract.contractName", getMessage("contract.contract.name.empty"));
		
		if(contract!=null && contract.getContractor().getId()==null)
			addFieldError("contract.contractors.id", getMessage("contract.contractors.empty"));
		
		if(contract!=null && StringUtils.isEmpty(contract.getContractNumber()))
			addFieldError("contract.contractNumber", getMessage("contract.contract.number.empty"));
		
		if(contract!=null && contract.getContractCosts()==null)
			addFieldError("contract.cost", getMessage("contract.cost.empty"));
		
		if(contract!=null && contract.getOrganisation().getId()==null)
			addFieldError("contract.organisation.id", getMessage("contract.organisation.empty"));
		if(compareDates(contract.getApprovedDate(), contract.getDateDueForStart()))
			addFieldError("contract.dateDueForStart", getMessage("contract.date.due.for.start.invalid"));
		
		if(compareDates(contract.getDateDueForStart(),contract.getDateDueForCompletion()))
			addFieldError("contract.dateDueForCompletion", getMessage("contract.date.due.for.completion.invalid"));
		
		if(compareDates(contract.getDateDueForStart(),contract.getNotificationDate()))
			addFieldError("contract.notificationDate", getMessage("contract.notification.date.ninvalid"));
		
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
		contract.setParty(employee);
		contract.setCreatedTime(new Date());
		User user=getUser().getUser();
		contract.setCurrentUser(user);
		DAOFactory.getFactory().getContractDAO().save(contract);
		if(file!=null){
			
			doc.setDoc(getFileBytes(file));

			doc.setContract(contract);
			doc.setCreatedDate(new Date());
			doc.setEmployee(employee);
			doc.setCurrentUser(user);
			DAOFactory.getFactory().getContractDocDAO().save(doc);
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
