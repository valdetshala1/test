package com.geoland.kfis.web.action.hrm.taxrate;

import java.io.IOException;

import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * Class TaxRateAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020 22:16:54
 * @Version 1.0
 */
public class TaxRateAction extends TaxRateBaseAction {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		if(taxrateId != null){
			taxrate = DAOFactory.getFactory().getEmployeeSalaryTaxRatesDAO().get(taxrateId);
		}
		
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String list() throws IOException{
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String grid() throws IOException{
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String page() throws IOException{
		return "page";
	}
	

}
