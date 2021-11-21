/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.operation;

import java.util.List;

import com.geoland.framework.persistence.model.rbac.RbacOperation;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class OperationBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created June 30, 2014 3:24:53 PM
 * @Version 1.0
 */
public class OperationBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The operation id. */
	protected Long operationId;
	
	/** The permission id. */
	protected Long permissionId;
	
	/** The operation. */
	protected RbacOperation operation;
	
	/** The rbac operation list. */
	protected List<RbacOperation> rbacOperationList;
	
	/**
	 * Gets the operation id.
	 *
	 * @return the operation id
	 */
	public Long getOperationId() {
		return operationId;
	}
	
	/**
	 * Sets the operation id.
	 *
	 * @param operationId the new operation id
	 */
	public void setOperationId(Long operationId) {
		this.operationId = operationId;
	}
	
	/**
	 * Gets the operation.
	 *
	 * @return the operation
	 */
	public RbacOperation getOperation() {
		return operation;
	}
	
	/**
	 * Sets the operation.
	 *
	 * @param operation the new operation
	 */
	public void setOperation(RbacOperation operation) {
		this.operation = operation;
	}
	
	/**
	 * Gets the rbac operation list.
	 *
	 * @return the rbac operation list
	 */
	public List<RbacOperation> getRbacOperationList() {
		return rbacOperationList;
	}
	
	/**
	 * Sets the rbac operation list.
	 *
	 * @param rbacOperationList the new rbac operation list
	 */
	public void setRbacOperationList(List<RbacOperation> rbacOperationList) {
		this.rbacOperationList = rbacOperationList;
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
}
