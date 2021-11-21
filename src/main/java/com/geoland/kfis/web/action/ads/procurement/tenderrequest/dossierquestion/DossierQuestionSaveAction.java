/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest.dossierquestion;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DossierQuestionSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:14:14 AM, Oct 8, 2014
 */
public class DossierQuestionSaveAction extends DossierQuestionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9181163917370228294L;
	
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
		
		if(dossierQuestion!=null && dossierQuestion.getPrcmtDossierRequest().getId()==null)
			addFieldError("dossierQuestion.prcmtDossierRequest.id", getMessage("dossierQuestion.prcmtDossierRequest.id.empty"));
		
		if(dossierQuestion!=null && StringUtils.isEmpty(dossierQuestion.getQuestion()))
			addFieldError("dossierQuestion.question", getMessage("dossierQuestion.question.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		dossierQuestion.setEmployee(employee);
		dossierQuestion.setCreatedDate(new Date());
		
		DAOFactory.getFactory().getPrcmtDossierQuestionDAO().save(dossierQuestion);
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
