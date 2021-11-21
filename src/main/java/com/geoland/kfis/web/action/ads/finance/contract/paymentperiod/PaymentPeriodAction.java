/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contract.paymentperiod;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PaymentPeriodAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 8, 2014, 9:15:47 AM
 */
public class PaymentPeriodAction extends PaymentPeriodBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3963666613542903420L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(paymentId!=null)
			setPayment(DAOFactory.getFactory().getPaymentPeriodDAO().get(paymentId));
		
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
