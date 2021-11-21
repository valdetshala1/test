/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.periodplan;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PeriodPlanAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 17, 2015, 10:20:02 AM
 */
public class PeriodPlanAction extends PeriodPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3162115056680741906L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(periodId!=null)
			setPeriod(DAOFactory.getFactory().getDhpetPeriodPlanDAO().get(periodId));
		
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
