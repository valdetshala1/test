/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contractor;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ContractorAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 5, 2014, 2:11:53 PM
 */
public class ContractorAction extends ContractorBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1438263048462657874L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(contractorId!=null){
			setContractor(DAOFactory.getFactory().getContractorDAO().get(contractorId));
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
