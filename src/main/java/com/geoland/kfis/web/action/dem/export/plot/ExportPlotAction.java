/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.plot;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportPlotAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 18, 2016, 4:31:39 PM
 */
public class ExportPlotAction extends ExportPlotBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 212677792792041575L;

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
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
		return "grid";
	}
}
