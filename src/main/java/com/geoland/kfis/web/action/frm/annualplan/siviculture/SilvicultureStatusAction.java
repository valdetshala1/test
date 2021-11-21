package com.geoland.kfis.web.action.frm.annualplan.siviculture;

import java.util.Date;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.StandSilvicultureActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class SilvicultureStatusAction.
 */
public class SilvicultureStatusAction  extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The activity id list. */
	private String activityIdList;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
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
			StandSilvicultureActivity activity=DAOFactory.getFactory().getStandSilvicultureActivityDAO().get(lValue);
			
			Long asId = activity.getActivityStatus().getId();
			ActivityStatus activityStatus = DAOFactory.getFactory().getActivityStatusDAO().get(asId);
			
			if(activityStatus.getStatus().equals(Activitystatus.NEW) || activityStatus.getStatus().equals(Activitystatus.REPLANNED)) {
				ActivityStatus status = new ActivityStatus();
				status.setCreatedDate(new Date());
				status.setActivity(activity.getActivity());
				status.setPerson(person);
				status.setStatus(Activitystatus.SUBMITTED);
				DAOFactory.getFactory().getActivityStatusDAO().save(status);
				activity.setActivityStatus(status);
				DAOFactory.getFactory().getStandSilvicultureActivityDAO().save(activity);
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