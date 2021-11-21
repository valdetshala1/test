package com.geoland.kfis.web.action.ads.finance.allocation;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnuBudgetAllocationAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Sep 8, 2014 10:07:32 AM
 * @Version 1.0
 */
public class AnnuBudgetAllocationAction extends AnnuBudgetAllocationBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5857284924786958614L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(annuBudgetAllocationId!=null){
			annuBudgetAllocation=DAOFactory.getFactory().getAnnuBudgetAllocationDAO().get(annuBudgetAllocationId);
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
	
	/**
	 * Report popup.
	 *
	 * @return the string
	 */
	public String reportPopup(){
		
		return "reportPopup";
	}
}
