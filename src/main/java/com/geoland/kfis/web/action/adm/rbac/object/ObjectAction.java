package com.geoland.kfis.web.action.adm.rbac.object;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;


// TODO: Auto-generated Javadoc
/**
 * The Class ObjectAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 29, 2014 1:32:20 AM
 * @Version 1.0
 */
public class ObjectAction extends ObjectBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(objectId != null){
			rbacObject = DAOFactoryRbac.getFactory().getRbacObjectDAO().get(objectId);
			if(rbacObject != null){
				parentId = rbacObject.getParentId();
				if(parentId != null){
					rbacObjectParent = DAOFactoryRbac.getFactory().getRbacObjectDAO().get(parentId);
				}
			}
		}
		
		return "form";
	}	
	
	/**
	 * Popup.
	 *
	 * @return the string
	 * @throws Exception the exception
	 */
	public String popup() throws Exception {
		return "popup";
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
