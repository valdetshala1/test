package com.geoland.kfis.web.action.frm.searchmap;

import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class SearchMapAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 23, 2017 , 1:50:02 PM
 */
public class SearchMapAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		return "form";
	}
	
	/**
	 * Search map.
	 *
	 * @return the string
	 */
	public String search_map(){
		return "search_map";
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
	 * Parcel detail.
	 *
	 * @return the string
	 */
	public String parcel_detail(){
		return "parcel_detail";
	}
	
}
