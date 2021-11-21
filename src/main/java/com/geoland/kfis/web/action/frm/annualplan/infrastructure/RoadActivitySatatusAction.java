/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.infrastructure;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.RoadActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class RoadActivitySatatusAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:05:09 PM, Oct 29, 2014
 */
public class RoadActivitySatatusAction extends RoadActivityBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9092265449886170784L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if (activityList != null && StringUtils.isEmpty(activityList))
			addFieldError("", "");
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		if (activityList.length() != 0) {
			String split[] = activityList.split(",");
			for (String item : split) {

				RoadActivity ra = DAOFactory.getFactory().getRoadActivityDAO()
						.get(Long.valueOf(item));
				ActivityStatus st = DAOFactory.getFactory()
						.getActivityStatusDAO()
						.get(ra.getActivityStatus().getId());
				ActivityStatus status = new ActivityStatus();
				status.setCreatedDate(new Date());
				status.setActivity(st.getActivity());
				status.setPerson(st.getPerson());
				if ((Activitystatus.NEW).equals(st.getStatus()) || st.getStatus().equals(Activitystatus.REPLANNED)) {
					status.setStatus(Activitystatus.SUBMITTED);

					DAOFactory.getFactory().getActivityStatusDAO().save(status);
					ra.setActivityStatus(status);
					DAOFactory.getFactory().getRoadActivityDAO().save(ra);
				}
			}
		}
		return NONE;
	}
}
