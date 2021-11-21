package com.geoland.kfis.web.action.adm.rbac.operation;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;

// TODO: Auto-generated Javadoc
/**
 * The Class OperationAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Jun 30, 2014 3:26:09 PM
 * @Version 1.0
 */
public class OperationAction extends OperationBaseAction {
	
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
		String operationQuery="SELECT * FROM trbac_operation";
		rbacOperationList=DAOFactoryRbac.getFactory().getRbacOperationDAO().executeSQLQuery(operationQuery);
		return "page";
	}
}
