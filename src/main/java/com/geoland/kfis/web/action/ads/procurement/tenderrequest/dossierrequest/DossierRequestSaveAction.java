/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest.dossierrequest;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DossierRequestSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:05:41 PM, Oct 7, 2014
 */
public class DossierRequestSaveAction extends DossierRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 532281613643757471L;
	
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
		
		if(dossierRequest!=null && dossierRequest.getPrcmtTenderRequest().getId()==null)
			addFieldError("dossierRequest.prcmtTenderRequest.id", getMessage("dossierRequest.prcmtTenderRequest.id.empty"));
		
		if(dossierRequest!=null && dossierRequest.getPrcmtTenderBidder().getId()==null)
			addFieldError("dossierRequest.prcmtTenderBidder.id", getMessage("dossierRequest.prcmtTenderBidder.id.empty"));
		
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
		dossierRequest.setCreatedDate(new Date());
		dossierRequest.setEmployee(employee);
		
		DAOFactory.getFactory().getPrcmtDossierRequestDAO().save(dossierRequest);
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
