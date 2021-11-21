/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.permission;

import java.util.List;

import com.geoland.framework.persistence.model.rbac.RbacObject;
import com.geoland.framework.persistence.model.rbac.RbacOperation;
import com.geoland.framework.persistence.model.rbac.RbacPermission;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PermissionBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created July 1, 2014 11:20:58 AM
 * @Version 1.0
 */
public class PermissionBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The role id. */
	protected Long roleId;
	
	/** The permission id. */
	protected Long permissionId;
	
	/** The permission. */
	protected RbacPermission permission;
	
	/** The json permission. */
	protected String jsonPermission;
	
	/** The object. */
	protected List<String> object;
	
	/** The operation. */
	protected List<String> operation;
	
	/** The object list. */
	protected List <RbacObject> objectList;
	
	/** The operation list. */
	protected List <RbacOperation> operationList; 
	
	/** The objecthas. */
	protected List <RbacObject> objecthas;
	
	/** The operationhas. */
	protected List <RbacOperation> operationhas;
	
	/**
	 *  
	 *
	 * @param checkObjectId the check object id
	 * @return true, if successful
	 */
	protected boolean checkPermissionObj(String checkObjectId){
		if(permission!=null){
			if(object!=null)
			for(String r:object){
				if(r.equals(checkObjectId)){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 *  
	 *
	 * @param checkOperationId the check operation id
	 * @return true, if successful
	 */
	protected boolean checkPermissionOp(String checkOperationId){
		if(permission!=null){
			if(checkOperationId!=null)
			for(String r:operation){
				if(r.equals(checkOperationId)){
					return true;
				}
			}
		}
		return false;
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
	 * Gets the permission id.
	 *
	 * @return the permission id
	 */
	public Long getPermissionId() {
		return permissionId;
	}
	
	/**
	 * Sets the permission id.
	 *
	 * @param permissionId the new permission id
	 */
	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
	
	/**
	 * Gets the permission.
	 *
	 * @return the permission
	 */
	public RbacPermission getPermission() {
		return permission;
	}
	
	/**
	 * Sets the permission.
	 *
	 * @param permission the new permission
	 */
	public void setPermission(RbacPermission permission) {
		this.permission = permission;
	}

	/**
	 * Gets the json permission.
	 *
	 * @return the json permission
	 */
	public String getJsonPermission() {
		return jsonPermission;
	}
	
	/**
	 * Sets the json permission.
	 *
	 * @param jsonPermission the new json permission
	 */
	public void setJsonPermission(String jsonPermission) {
		this.jsonPermission = jsonPermission;
	}
	
	/**
	 * Gets the object.
	 *
	 * @return the object
	 */
	public List<String> getObject() {
		return object;
	}
	
	/**
	 * Sets the object.
	 *
	 * @param object the new object
	 */
	public void setObject(List<String> object) {
		this.object = object;
	}
	
	/**
	 * Gets the operation.
	 *
	 * @return the operation
	 */
	public List<String> getOperation() {
		return operation;
	}
	
	/**
	 * Sets the operation.
	 *
	 * @param operation the new operation
	 */
	public void setOperation(List<String> operation) {
		this.operation = operation;
	}
	
	/**
	 * Gets the object list.
	 *
	 * @return the object list
	 */
	public List<RbacObject> getObjectList() {
		return objectList;
	}
	
	/**
	 * Sets the object list.
	 *
	 * @param objectList the new object list
	 */
	public void setObjectList(List<RbacObject> objectList) {
		this.objectList = objectList;
	}
	
	/**
	 * Gets the operation list.
	 *
	 * @return the operation list
	 */
	public List<RbacOperation> getOperationList() {
		return operationList;
	}
	
	/**
	 * Sets the operation list.
	 *
	 * @param operationList the new operation list
	 */
	public void setOperationList(List<RbacOperation> operationList) {
		this.operationList = operationList;
	}
	
	/**
	 * Gets the objecthas.
	 *
	 * @return the objecthas
	 */
	public List<RbacObject> getObjecthas() {
		return objecthas;
	}
	
	/**
	 * Sets the objecthas.
	 *
	 * @param objecthas the new objecthas
	 */
	public void setObjecthas(List<RbacObject> objecthas) {
		this.objecthas = objecthas;
	}
	
	/**
	 * Gets the operationhas.
	 *
	 * @return the operationhas
	 */
	public List<RbacOperation> getOperationhas() {
		return operationhas;
	}
	
	/**
	 * Sets the operationhas.
	 *
	 * @param operationhas the new operationhas
	 */
	public void setOperationhas(List<RbacOperation> operationhas) {
		this.operationhas = operationhas;
	}

	
}
