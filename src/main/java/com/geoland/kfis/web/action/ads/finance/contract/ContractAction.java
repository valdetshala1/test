/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contract;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ContractAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 5, 2014, 3:26:16 PM
 */
public class ContractAction extends ContractBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1397787379189013961L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(contractId!=null){
			setContract(DAOFactory.getFactory().getContractDAO().get(contractId));
			if(contract.getDateCompleted()!=null)
				finished=true;
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
	 * Tab.
	 *
	 * @return the string
	 */
	public String tab(){
		if(contractId!=null)
			setContract(DAOFactory.getFactory().getContractDAO().get(contractId));
		
		return "tab";
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
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}
}
