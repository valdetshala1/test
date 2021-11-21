/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp.doctype;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DocTypeAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:03:37 PM, Feb 4, 2015
 */
public class DocTypeAction extends DocTypeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if (docTypeId != null) {
			setDocType(DAOFactory.getFactory().getDocTypeDAO().get(docTypeId));
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
}
