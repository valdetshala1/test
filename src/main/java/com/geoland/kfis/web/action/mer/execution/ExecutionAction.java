package com.geoland.kfis.web.action.mer.execution;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class ExecutionAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 4:56:02 PM
 */
public class ExecutionAction extends ExecutionBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(executionId!=null){
			execution=DAOFactory.getFactory().getMerStrategyExecutionDAO().get(executionId);
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
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		if(!getUser().checkAccess("strat", "_read"))
			org_id=getUser().getOrganisationId();
		return "report_generator";
	}

}
