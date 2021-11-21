/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.permission;


// TODO: Auto-generated Javadoc
/**
 * The Class PermissionAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created July 1, 2014 11:27:08 AM
 * @Version 1.0
 */

public class PermissionAction extends PermissionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5661516611989613783L;
	
	/**
	 * View.
	 *
	 * @return the string
	 */
	public String view(){
		
		if(permissionId!=null){
		}
		
		return "view";
	}
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(permissionId!=null){
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
