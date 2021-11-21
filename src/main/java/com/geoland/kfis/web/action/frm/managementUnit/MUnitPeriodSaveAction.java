package com.geoland.kfis.web.action.frm.managementUnit;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class MUnitPeriodSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 20, 2015, 9:44:53 AM
 * v2.0
 */
public class MUnitPeriodSaveAction extends ManagementUnitBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(managementUnitPeriod!=null && managementUnitPeriod.getStartDate()==null){
			addFieldError("managementUnitPeriod.startDate", getMessage("payment.start.date.empty"));
		}
		
		if(managementUnitPeriod!=null && managementUnitPeriod.getEndDate()==null){
			addFieldError("managementUnitPeriod.endDate", getMessage("payment.completion.date.empty"));
		}
		
		if(managementUnitPeriod!=null && managementUnitPeriod.getEndDate()!=null && managementUnitPeriod.getStartDate()!=null){
			if(managementUnitPeriod.getEndDate().before(managementUnitPeriod.getStartDate()))
				addFieldError("managementUnitPeriod.endDate", getMessage("employee.start.date.greater"));
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
		Employee emp = getUser().getEmployee();
		managementUnitPeriod.setTrnxId(UUID.randomUUID().toString());
		managementUnitPeriod.setIsactive("Y");
		Date cdate=new Date();
		managementUnitPeriod.setCreatedDate(cdate);
		managementUnitPeriod.setEmployeeByCreatedBy(emp);
		User user = getUser().getUser();
		managementUnitPeriod.setCurrentUser(user);
		DAOFactory.getFactory().getManagementUnitPeriodDAO().save(managementUnitPeriod);
		return SUCCESS;
	}
}
