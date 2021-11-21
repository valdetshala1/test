package com.geoland.kfis.web.action.ads.finance.output;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class FinancialOutputAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Sep 4, 2014 1:59:19 PM
 * @Version 1.0
 */
public class FinancialOutputAction extends FinancialOutputBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3973438456242160611L;
	
	/**
	 * Salaryform.
	 *
	 * @return the string
	 */
	public String salaryform(){
		if(financialOutputId!=null){
			financialOutput=DAOFactory.getFactory().getFinancialOutputDAO().get(financialOutputId);
		}
		return "salaryform";
	}
	
	/**
	 * Salarypage.
	 *
	 * @return the string
	 */
	public String salarypage(){
		return "salarypage";
	}
	
	/**
	 * Salarygrid.
	 *
	 * @return the string
	 */
	public String salarygrid(){
		return "salarygrid";
	}
	
	/**
	 * Costsform.
	 *
	 * @return the string
	 */
	public String costsform(){
		if(financialOutputId!=null){
			financialOutput=DAOFactory.getFactory().getFinancialOutputDAO().get(financialOutputId);
		}
		return "costsform";
	}
	
	/**
	 * Costspage.
	 *
	 * @return the string
	 */
	public String costspage(){
		return "costspage";
	}
	
	/**
	 * Costsgrid.
	 *
	 * @return the string
	 */
	public String costsgrid(){
		return "costsgrid";
	}

	/**
	 * Costs report popup.
	 *
	 * @return the string
	 */
	public String costsReportPopup(){
		return "costsReportPopup";
	}
	
	/**
	 * Salary report popup.
	 *
	 * @return the string
	 */
	public String salaryReportPopup(){
		return "salaryReportPopup";
	}
}
