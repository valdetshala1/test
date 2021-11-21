package com.geoland.kfis.web.action.ads.order;

import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class OrderAction.
 */
public class OrderAction extends OrderBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4445526592418121745L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if(orderId!= null) {
			setOrder(DAOFactory.getFactory().getPurchaseOrderDAO().get(orderId));
		}
		return "form";
	}

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
	 * Status.
	 *
	 * @return the string
	 */
	public String status() {
		if(orderId!= null) {
			setOrder(DAOFactory.getFactory().getPurchaseOrderDAO().get(orderId));
		}
		return "status";
	}
	
	/**
	 * Item receipt.
	 *
	 * @return the string
	 */
	public String itemReceipt(){
		return "item_receipt";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String 	reportGenerator(){
		return "reportGenerator";
	}

	
}
