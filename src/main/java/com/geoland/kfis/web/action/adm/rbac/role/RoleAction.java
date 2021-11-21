package com.geoland.kfis.web.action.adm.rbac.role;


import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.rbac.RbacRole;

// TODO: Auto-generated Javadoc
/**
 * The Class RoleAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 29, 2014 1:32:20 AM
 * @Version 1.0
 */
public class RoleAction extends RoleBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(roleId!=null){
			RbacRole role=DAOFactoryRbac.getFactory().getRbacRoleDAO().get(roleId);
			setRole(role);
		}
		
		return "form";
	}	
	
	/**
	 * Delete.
	 *
	 * @return the string
	 * @throws Exception the exception
	 */
	public String delete() throws Exception {
		return "delete";
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
