/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.economiccode;

import com.geoland.kfis.model.EconomicCode;
import com.geoland.kfis.persistence.dao.DAOFactory;

public class EconomicCodeAction extends EconomicCodeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5661516611989613783L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(getEconomicCodeId()!=null){
			EconomicCode economicCode = DAOFactory.getFactory().getEconomicCodeDAO().get(getEconomicCodeId());
			setEconomicCode(economicCode);
			if(economicCode.getParent()!=null) {
				EconomicCode parent = DAOFactory.getFactory().getEconomicCodeDAO().get(economicCode.getParent().getId());
				setEconomicCodeParent(parent);
			}
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
