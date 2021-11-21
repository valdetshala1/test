/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp.doccategory;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DocCategoryAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 8:58:42 AM, Feb 4, 2015
 */
public class DocCategoryAction extends DocCategoryBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3227648866863638775L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(docCategoryId!=null){
			setDocCategory(DAOFactory.getFactory().getDocCategoryDAO().get(docCategoryId));
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
