/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.planperiod;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PlanPeriodAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:20:48 PM, Mar 25, 2015
 */
public class PlanPeriodAction extends PlanPeriodBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2616669984704872836L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(periodId!=null)
			setPeriod(DAOFactory.getFactory().getMerPlanPeriodDAO().get(periodId));
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
