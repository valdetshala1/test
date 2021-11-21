package com.geoland.kfis.web.action.ads.order.requisition;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequisitionAction.
 */
public class RequisitionAction extends RequisitionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4445526592418121745L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if (requisitionId != null) {
			requisition = DAOFactory.getFactory().getRequisitionDAO().get(requisitionId);
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
	 * Rep generator.
	 *
	 * @return the string
	 */
	public String rep_generator(){
		return "rep_generator";
	}
	
}
