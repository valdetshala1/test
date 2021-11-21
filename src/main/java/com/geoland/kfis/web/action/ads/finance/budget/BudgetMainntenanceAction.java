package com.geoland.kfis.web.action.ads.finance.budget;

import com.geoland.kfis.model.BudgetMainntenance;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 *       
 *
 * @author Fisnik Aliu, GEO&LAND
 * @version 1.0
 * @created 11:54:41 AM, Sep 9, 2014
 */
public class BudgetMainntenanceAction extends BudgetMainntenanceBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3240684275415485390L;
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if(budgetMainntenanceId!=null) {
			BudgetMainntenance bm = DAOFactory.getFactory().getBudgetMainntenanceDAO().get(budgetMainntenanceId);
			setBudgetMainntenance(bm);
		}
		return "form";
	}
}
