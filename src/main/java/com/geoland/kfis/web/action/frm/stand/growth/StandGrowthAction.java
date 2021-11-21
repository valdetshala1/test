/**
 * 
 */
package com.geoland.kfis.web.action.frm.stand.growth;


// TODO: Auto-generated Javadoc
/**
 * The Class StandGrowthAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:41:42 PM, Jan 28, 2015
 */
public class StandGrowthAction extends StandGrowthBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
//		if(standGrowthId!=null)
//			setStandGrowth(DAOFactory.getFactory().getStandGrowthDAO().get(standGrowthId));
		
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
