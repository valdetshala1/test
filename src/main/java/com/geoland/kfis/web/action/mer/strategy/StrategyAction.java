/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class StrategyAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 5:19:18 PM, Mar 25, 2015
 */
public class StrategyAction extends StrategyBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2692359909191059520L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(strategyId!=null)
			setStrategy(DAOFactory.getFactory().getMerStrategyDAO().get(strategyId));
		
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
	 * Board.
	 *
	 * @return the string
	 */
	public String board(){
		if(strategyId!=null)
			setStrategy(DAOFactory.getFactory().getMerStrategyDAO().get(strategyId));
		return "board";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}
}
