/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.biodiv;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportBiodiversityAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 21, 2016, 11:26:53 AM
 */
public class ExportBiodiversityAction extends ExportBiodiversityBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8195619833117813625L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		return "form";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "gird";
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
