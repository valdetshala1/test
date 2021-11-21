package com.geoland.kfis.web.action.hrm.employee.soscontact;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class SosContactSaveAction.
 */
public class SosContactSaveAction extends SosContactBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The created by. */
	private Employee createdBy;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		createdBy=getUser().getEmployee();
		if(createdBy==null)
			addActionError("");
		
		if(sosContact!=null && StringUtils.isEmpty(sosContact.getContactName())){
			addFieldError("sosContact.contactName",getMessage("employee.sos.contact.name.empty"));
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
		
		sosContact.setCreatedDate(new Date());
		sosContact.setParty(createdBy);
		
		User user = getUser().getUser();
		sosContact.setCurrentUser(user);
		DAOFactory.getFactory().getEmployeeSosContactDAO().save(sosContact);
		return SUCCESS;
	}
	
	/**
	 * Gets the created by.
	 *
	 * @return the createdBy
	 */
	public Employee getCreatedBy() {
		return createdBy;
	}
	
	/**
	 * Sets the created by.
	 *
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(Employee createdBy) {
		this.createdBy = createdBy;
	}
	
}
