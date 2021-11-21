package com.geoland.kfis.web.action.adm.user;
import java.util.ArrayList;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * @author Festim Krasniqi,GEO&LAND
 * @created May 26, 2014 10:42:37 AM
 * @Version 1.0
 *
 */
public class UserAction extends UserBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 259790977876892060L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(userId != null){
			thisUser = DAOFactoryRbac.getFactory().getUserDAO().get(userId);

			roles = DAOFactoryRbac.getFactory().getRbacRoleDAO().executeSQLQuery("select r.* from trbac_role as r,trbac_user_role as rb where r.id=rb.role_id and rb.user_id="+userId);
			
			setRbacRoles(new ArrayList<String>());
			for(RbacRole r:roles){
				rbacRoles.add(r.getId().toString());
			}
			
			Integer count = DAOFactory.getFactory().getPartyUserDAO().countQuery("select count(*) from tparty_user where user_id = " + userId);
			if(count>=1){
				partyUser = DAOFactory.getFactory().getPartyUserDAO().findByUniqueField("user", thisUser);
				person = DAOFactory.getFactory().getPersonDAO().get(partyUser.getParty().getId());
				forPerson=true;
			}else {
				forPerson=false;
			}
			
			userPassword=DAOFactoryRbac.getFactory().getUserPasswordDAO().get(thisUser.getUserPassword().getId());
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
//		thisUser=DAOFactoryRbac.getFactory().getUserDAO().get(userId);
//		DAOFactoryRbac.getFactory().getUserDAO().delete(thisUser);
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
