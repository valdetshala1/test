/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.financedonor;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class FinanceDonorAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:32:28 AM, Mar 31, 2015
 */
public class FinanceDonorAction extends FinanceDonorBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3738129110003297907L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(donorId!=null)
			setDonor(DAOFactory.getFactory().getMerFinanceDonorDAO().get(donorId));
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
