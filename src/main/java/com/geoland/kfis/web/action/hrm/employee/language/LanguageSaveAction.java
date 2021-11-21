package com.geoland.kfis.web.action.hrm.employee.language;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class LanguageSaveAction.
 */
public class LanguageSaveAction extends LanguageBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(employeeLanguage!=null && employeeLanguage.getLanguage().getId()==null){
			addFieldError("employeeLanguage.language.id",getMessage("employee.language.empty"));
		} 
		else{
//			if(existLanguage(employeeLanguage.getEmployee(), employeeLanguage.getLanguage()) && employeeLanguage.getId()==null){
//			 addFieldError("employeeLanguage.language.id",getMessage("employeeLanguage.language.exist"));
//			}
			employeeLanguage.setLanguage(DAOFactory.getFactory().getLanguageDAO().get(employeeLanguage.getLanguage().getId()));
		}
		if(employeeLanguage!=null && employeeLanguage.getReading()==null){
			addFieldError("employeeLanguage.reading",getMessage("employee.reading.empty"));
		}
		if(employeeLanguage!=null && employeeLanguage.getSpeaking()==null){
			addFieldError("employeeLanguage.speaking",getMessage("employee.speaking.empty"));
		}
		if(employeeLanguage!=null && employeeLanguage.getWriting()==null){
			addFieldError("employeeLanguage.writing",getMessage("employee.writing.empty"));
		}
		if(employeeLanguage!=null && employeeLanguage.getUnderstanding()==null){
			addFieldError("employeeLanguage.understanding",getMessage("employee.understanding.empty"));
		}
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		employeeLanguage.setCurrentUser(user);
		DAOFactory.getFactory().getEmployeeLanguageDAO().save(employeeLanguage);
		return SUCCESS;
	}
}
