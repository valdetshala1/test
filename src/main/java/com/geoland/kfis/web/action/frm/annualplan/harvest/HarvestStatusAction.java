package com.geoland.kfis.web.action.frm.annualplan.harvest;

import java.util.Date;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.StandHarvestActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * Returning ActionSupport.NONE (or null) from an Action class method causes the results processing to be skipped. 
 * This is useful if the action fully handles the result processing such as writing directly to the HttpServletResponse OutputStream.
 * 
 * @author GEO&LAND
 * @created October 28, 2014 12:21:22 AM
 * @Version 1.0
 *
 */
public class HarvestStatusAction extends BaseActionSupport {

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
			StandHarvestActivity activity = DAOFactory.getFactory().getStandHarvestActivityDAO().get(lValue);
			
			Long asId = activity.getActivityStatus().getId();
			ActivityStatus activityStatus = DAOFactory.getFactory().getActivityStatusDAO().get(asId);
			
			if(activityStatus.getStatus().equals(Activitystatus.NEW) || activityStatus.getStatus().equals(Activitystatus.REPLANNED)){
				
				ActivityStatus status = new ActivityStatus();
				
				status.setCreatedDate(new Date());
				status.setActivity(activity.getActivity());
				status.setPerson(person);
				status.setStatus(Activitystatus.SUBMITTED);

				activity.setActivityStatus(status);
				
				DAOFactory.getFactory().getActivityStatusDAO().save(status);
				DAOFactory.getFactory().getStandHarvestActivityDAO().save(activity);				
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
}
