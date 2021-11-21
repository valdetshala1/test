/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.planting;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.StandPlantingActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class PlantingStatusAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:06:06 PM, Oct 27, 2014
 */
public class PlantingStatusAction extends PlantingBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9092265449886170784L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(activityList!=null && StringUtils.isEmpty(activityList))
			addFieldError("", "");
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		if(activityList.length()!=0){
			String split[] = activityList.split(",");
			for (String item : split) {
				
				StandPlantingActivity pl=DAOFactory.getFactory().getStandPlantingActivityDAO().get(Long.valueOf(item));
				ActivityStatus st=DAOFactory.getFactory().getActivityStatusDAO().get(pl.getActivityStatus().getId());
				ActivityStatus status=new ActivityStatus();
				status.setCreatedDate(new Date());
				status.setActivity(st.getActivity());
				status.setPerson(st.getPerson());
				if((Activitystatus.NEW).equals(st.getStatus()) || st.getStatus().equals(Activitystatus.REPLANNED)) {
					status.setStatus(Activitystatus.SUBMITTED);
					
					DAOFactory.getFactory().getActivityStatusDAO().save(status);
					pl.setActivityStatus(status);
					DAOFactory.getFactory().getStandPlantingActivityDAO().save(pl);
				}
			}
		}
		return SUCCESS;
	}
}
