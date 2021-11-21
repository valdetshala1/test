/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.type;

import com.geoland.kfis.persistence.dao.DAOFactory;


public class FinancialTypeAction extends FinancialTypeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3868622894443356501L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(financialTypeId!=null){
			financialType = DAOFactory.getFactory().getFinancialTypeDAO().get(financialTypeId);
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
	

	public String formTree(){
		if(financialTypeId!=null){
			financialType = DAOFactory.getFactory().getFinancialTypeDAO().get(financialTypeId);
		}
		
		return "form_tree";
	}
	
	public String gridTree(){
		return "grid_tree";
	}
	
	public String pageTree(){
		return "page_tree";
	}	
}
