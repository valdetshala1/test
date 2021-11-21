
package com.geoland.kfis.web.action.frm.annualplan.privateplan;

import java.util.Date;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PrivateActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
// TODO: Auto-generated Javadoc

/**
 * The Class PrivateStatusAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Jan 7, 2015 , 9:38:13 AM
 */
public class PrivateStatusAction extends PrivateBaseAction{
	
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
		
		if(annualplanId != null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		
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
			PrivateActivity pvtAct=DAOFactory.getFactory().getPrivateActivityDAO().get(lValue);
			Long asId = pvtAct.getActivityStatus().getId();
			ActivityStatus activityStatus = DAOFactory.getFactory().getActivityStatusDAO().get(asId);
			
			if(activityStatus.getStatus().equals(Activitystatus.NEW) || activityStatus.getStatus().equals(Activitystatus.REPLANNED)) {
				
				ActivityStatus status = new ActivityStatus();
				status.setRemarks(activityStatus.getRemarks());
				status.setCreatedDate(new Date());
				status.setActivity(pvtAct.getActivity());
				status.setPerson(person);
				status.setStatus(Activitystatus.SUBMITTED);
				pvtAct.setActivityStatus(status);
				DAOFactory.getFactory().getActivityStatusDAO().save(status);
				DAOFactory.getFactory().getPrivateActivityDAO().save(pvtAct);
			}
		}
		
		return SUCCESS;
		
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

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.frm.annualplan.privateplan.PrivateBaseAction#getEmployee()
	 */
	public Employee getEmployee() {
		return employee;
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.frm.annualplan.privateplan.PrivateBaseAction#setEmployee(com.geoland.kfis.model.Employee)
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	

}
