
package com.geoland.kfis.web.action.frm.annualplan.protection;

import java.util.Date;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.ProtectionActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
// TODO: Auto-generated Javadoc

/**
 * The Class ProtectionActivityStatusAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 31, 2014 , 9:05:11 AM
 */
public class ProtectionActivityStatusAction extends ProtectionActivityBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The activity id list. */
	private String activityIdList;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(employee==null){
			addActionError("login.user.employee.role.empty");
		}	
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Person person = DAOFactory.getFactory().getPartyUserDAO().getPerson(getUser().getUser().getId());
		String[] values = activityIdList.split(",");
		for (String sValue : values) {
			Long lValue = Long.valueOf(sValue);
			ProtectionActivity protection=DAOFactory.getFactory().getProtectionActivityDAO().get(lValue);
			Long asId = protection.getActivityStatus().getId();
			ActivityStatus activityStatus = DAOFactory.getFactory().getActivityStatusDAO().get(asId);
			
			if(activityStatus.getStatus().equals(Activitystatus.NEW) || activityStatus.getStatus().equals(Activitystatus.REPLANNED)) {
				
				ActivityStatus status = new ActivityStatus();
				
				status.setCreatedDate(new Date());
				status.setActivity(protection.getActivity());
				status.setPerson(person);
				status.setStatus(Activitystatus.SUBMITTED);
				protection.setActivityStatus(status);
				
				DAOFactory.getFactory().getActivityStatusDAO().save(status);
				DAOFactory.getFactory().getProtectionActivityDAO().save(protection);
			}
		}
		
		return NONE;
		
	}

	/**
	 * Gets the activity id list.
	 *
	 * @return the activity id list
	 */
	public String getActivityIdList() {
		return activityIdList;
	}

	/**
	 * Sets the activity id list.
	 *
	 * @param activityIdList the new activity id list
	 */
	public void setActivityIdList(String activityIdList) {
		this.activityIdList = activityIdList;
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
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	

}
