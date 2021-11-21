/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contractor;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ContractorSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 5, 2014, 2:12:17 PM
 */
public class ContractorSaveAction extends ContractorBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8373931551510847634L;
	
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
		
		
		if(contractor!=null && StringUtils.isEmpty(contractor.getComopanyName()))
			addFieldError("contractor.comopanyName", getMessage("contractor.comopany.name.empty"));
		if(contractor!=null && StringUtils.isEmpty(contractor.getFiscalNumber()))
			addFieldError("contractor.fiscalNumber", getMessage("contractor.fiscal.number"));
		if(contractor!=null && StringUtils.isEmpty(contractor.getBusinessNumber()))
			addFieldError("contractor.businessNumber", getMessage("contractor.business.number"));
		
		if(!getFieldErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		contractor.setCreatedTime(new Date());
		contractor.setParty(employee);
		contractor.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getContractorDAO().save(contractor);
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
