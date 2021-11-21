package com.geoland.kfis.web.action.mer.execution.indicator.subindicator.indicatortarget;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class IndicatorTargetAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 4:56:02 PM
 */
public class IndicatorTargetAction extends IndicatorTargetBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(indicatorTargetId!=null){
			indicatorTarget=DAOFactory.getFactory().getMerIndicatorTargetDAO().get(indicatorTargetId);
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
	
	/**
	 * Strategy page.
	 *
	 * @return the string
	 */
	public String strategyPage(){
		return "strategyPage";
	}
	
	/**
	 * Board.
	 *
	 * @return the string
	 */
	public String board(){
		return "board";
	}

}
