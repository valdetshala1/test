package com.geoland.kfis.web.action.frm.annualplan.activitydomain;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ActivityDomainAction.
 */
public class ActivityDomainAction extends ActivityDomainBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(activityDomainId!=null){
		  activityDomain=DAOFactory.getFactory().getActivityDomainDAO().get(activityDomainId);
				if(activityDomain.getActivityDomain()!=null){
					parentId=activityDomain.getActivityDomain().getId();
				}
		}
		if(parentId!=null){
			ref=DAOFactory.getFactory().getActivityDomainDAO().get(parentId);
		}
		return "form";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}

}
