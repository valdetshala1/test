/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.role;


import java.util.ArrayList;
import java.util.List;

import com.geoland.framework.persistence.model.rbac.RbacOperation;
import com.geoland.framework.persistence.model.rbac.RbacPermission;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.kfis.web.action.adm.rbac.base.RbacBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class RoleBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 29, 2014 1:31:46 AM
 * @Version 1.0
 */
public class RoleBaseAction extends RbacBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The role. */
	protected RbacRole role;
	
	/** The role id. */
	protected Long roleId;
	
	/** The permissions. */
	protected List<String> permissions;
	
	/** The permissions list. */
	protected List<RbacPermission> permissionsList;
	
	/** The perm. */
	protected List<RbacPermission> perm=new ArrayList<>();
	
	/** The json object operation. */
	protected String jsonObjectOperation;
	
	/** The operations. */
	protected List<RbacOperation> operations;
	
	/**
	 * Check if permission exists.
	 *
	 * @param permission the permission
	 * @param list the list
	 * @return true, if successful
	 */
	public boolean checkIfPermissionExists(String permission,List<RbacPermission> list){
		for(RbacPermission p:list){
			if(permission.equals(p.getId().toString()))
				return true;
		}
		return false;
	}
	
	/**
	 * Check permission.
	 *
	 * @param p the p
	 * @return true, if successful
	 */
	public boolean checkPermission(RbacPermission p){
		if(permissions!=null){
			for(String permission:permissions){
				if(permission.equals(p.getId().toString()))
					return true;
			}
		}
		return false;
	}
	
	/**
	 * Gets the permissions list.
	 *
	 * @return the permissionsList
	 */
	public List<RbacPermission> getPermissionsList() {
		return permissionsList;
	}

	/**
	 * Sets the permissions list.
	 *
	 * @param permissionsList the permissionsList to set
	 */
	public void setPermissionsList(List<RbacPermission> permissionsList) {
		this.permissionsList = permissionsList;
	}

	/**
	 * Gets the perm.
	 *
	 * @return the perm
	 */
	public List<RbacPermission> getPerm() {
		return perm;
	}

	/**
	 * Sets the perm.
	 *
	 * @param perm the perm to set
	 */
	public void setPerm(List<RbacPermission> perm) {
		this.perm = perm;
	}

	/**
	 * Gets the role.
	 *
	 * @return the role
	 */
	public RbacRole getRole() {
		return role;
	}

	/**
	 * Sets the role.
	 *
	 * @param role the new role
	 */
	public void setRole(RbacRole role) {
		this.role = role;
	}

	/**
	 * Gets the role id.
	 *
	 * @return the role id
	 */
	public Long getRoleId() {
		return roleId;
	}

	/**
	 * Sets the role id.
	 *
	 * @param roleId the new role id
	 */
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	/**
	 * Gets the permissions.
	 *
	 * @return the permissions
	 */
	public List<String> getPermissions() {
		return permissions;
	}

	/**
	 * Sets the permissions.
	 *
	 * @param permissions the new permissions
	 */
	public void setPermissions(List<String> permissions) {
		this.permissions = permissions;
	}
	
	/**
	 * Gets the json object operation.
	 *
	 * @return the jsonObjectOperation
	 */
	public String getJsonObjectOperation() {
		return jsonObjectOperation;
	}
	
	/**
	 * Sets the json object operation.
	 *
	 * @param jsonObjectOperation the jsonObjectOperation to set
	 */
	public void setJsonObjectOperation(String jsonObjectOperation) {
		this.jsonObjectOperation = jsonObjectOperation;
	}
	
	/**
	 * Gets the operations.
	 *
	 * @return the operations
	 */
	public List<RbacOperation> getOperations() {
		return operations;
	}
	
	/**
	 * Sets the operations.
	 *
	 * @param operations the operations to set
	 */
	public void setOperations(List<RbacOperation> operations) {
		this.operations = operations;
	}
}
