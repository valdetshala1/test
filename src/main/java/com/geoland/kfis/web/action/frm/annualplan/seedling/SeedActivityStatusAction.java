/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.seedling;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.SeedActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class SeedActivityStatusAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 30, 2014 9:20:36 AM
 * @Version 1.0
 */
public class SeedActivityStatusAction extends SeedActivityBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 210398440096505504L;
	
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
				
				SeedActivity pl=DAOFactory.getFactory().getSeedActivityDAO().get(Long.valueOf(item));
				ActivityStatus st=DAOFactory.getFactory().getActivityStatusDAO().get(pl.getActivityStatus().getId());
				ActivityStatus status=new ActivityStatus();
				status.setCreatedDate(new Date());
				status.setActivity(st.getActivity());
				status.setPerson(st.getPerson());
				if((Activitystatus.NEW).equals(st.getStatus())  || st.getStatus().equals(Activitystatus.REPLANNED)) {
					status.setStatus(Activitystatus.SUBMITTED);
					
					DAOFactory.getFactory().getActivityStatusDAO().save(status);
					pl.setActivityStatus(status);
					DAOFactory.getFactory().getSeedActivityDAO().save(pl);
				}
			}
		}
		return SUCCESS;
	}
}
