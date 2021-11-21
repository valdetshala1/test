/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.permission;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.rbac.RbacObject;
import com.geoland.framework.persistence.model.rbac.RbacOperation;
import com.geoland.framework.persistence.model.rbac.RbacPermission;
import com.geoland.framework.persistence.model.rbac.RbacRole;

// TODO: Auto-generated Javadoc
/**
 * The Class PermissionSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created July 1, 2014 11:31:48 AM
 * @Version 1.0
 */
public class PermissionSaveAction extends PermissionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1769671403084554571L;
	
	/** The input map. */
	private Map<String, RbacPermission> inputMap = new HashMap<String, RbacPermission>();

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void validate() {
		
		if(roleId == null){
			addFieldError("role.id", getMessage("role.id.empty"));
		}else{
			JSONArray array = (JSONArray) JSONSerializer.toJSON(jsonPermission);
			for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
				JSONObject obj = iterator.next();
				if(obj.get("checkbox") != null && obj.getBoolean("checkbox") == true){
					Long id = Long.valueOf(obj.getString("id")); 
					String operation = obj.getString("operation");
					//System.out.println("object id: " + id + " --> operation: " + operation);
					
					RbacObject rbacObject = DAOFactoryRbac.getFactory().getRbacObjectDAO().get(id);
					RbacRole rbacRole = DAOFactoryRbac.getFactory().getRbacRoleDAO().get(roleId);
					RbacOperation rbacOperation = DAOFactoryRbac.getFactory().getRbacOperationDAO().findByUniqueField("name", operation);
					
					RbacPermission p = new RbacPermission();
					p.setRbacRole(rbacRole);
					p.setRbacObject(rbacObject);
					p.setRbacOperation(rbacOperation);
					String key = rbacRole.getId() + "#" + rbacObject.getId() + "#" +  rbacOperation.getId();
					inputMap.put(key, p);
				}
			}
		}
		
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User currentUser = getUser().getUser();
		String query = "select * from trbac_permission where role_id = " + roleId;
		List<RbacPermission> pers = DAOFactoryRbac.getFactory().getRbacPermissionDAO().executeSQLQuery(query);
		Map<String, RbacPermission> existsMap = new HashMap<String, RbacPermission>();
		for (RbacPermission e : pers) {
			String key = e.getRbacRole().getId() + "#" + e.getRbacObject().getId() + "#" +  e.getRbacOperation().getId();
			existsMap.put(key, e);
		}
		
		if(inputMap.keySet().equals(existsMap.keySet())){
//	        System.out.println("Maps are same");
	    }else {
//	        System.out.println("Maps are not same");

	        Map<String, RbacPermission> insert = new HashMap<String, RbacPermission>();
	        Map<String, RbacPermission> remove = new HashMap<String, RbacPermission>();

	        
	        for(String key: inputMap.keySet()){
	        	if(!existsMap.containsKey(key)){
	        		insert.put(key, inputMap.get(key));
	        	}
	        }
	        for(String key: existsMap.keySet()){
	        	if(!inputMap.containsKey(key)){
	        		remove.put(key, existsMap.get(key));
	        	}
	        }
	        
//	        System.out.println("insert: " + insert.keySet());
	        for (Map.Entry<String, RbacPermission> entry : insert.entrySet()){
	            entry.getValue().setCurrentUser(currentUser);
	            DAOFactoryRbac.getFactory().getRbacPermissionDAO().save(entry.getValue());
	        }
	        
//	        System.out.println("remove: " + remove.keySet());
	        for (Map.Entry<String, RbacPermission> entry : remove.entrySet()){
	            entry.getValue().setCurrentUser(currentUser);
	            DAOFactoryRbac.getFactory().getRbacPermissionDAO().delete(entry.getValue());
	        }	        
				        
	    }
		
		return SUCCESS;
	}
	
	
}