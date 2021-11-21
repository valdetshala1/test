/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.object;

import java.util.List;

import com.geoland.framework.persistence.model.rbac.RbacObject;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ObjectBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 29, 2014 1:31:46 AM
 * @Version 1.0
 */
public class ObjectBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The role id. */
	protected Long roleId;
	
	/** The object id. */
	protected Long objectId;
	
	/** The parent id. */
	protected Long parentId;
	
	/** The domain id. */
	protected Long domainId;
	
	/** The privilege id. */
	protected Long privilegeId;
	
	/** The rbac object. */
	protected RbacObject rbacObject;
	
	/** The rbac object parent. */
	protected RbacObject rbacObjectParent;
	
	/** The rbac object list. */
	protected List<RbacObject> rbacObjectList;
	
	
	/**
	 * Gets the object id.
	 *
	 * @return the object id
	 */
	public Long getObjectId() {
		return objectId;
	}
	
	/**
	 * Sets the object id.
	 *
	 * @param objectId the new object id
	 */
	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}
	
	/**
	 * Gets the parent id.
	 *
	 * @return the parent id
	 */
	public Long getParentId() {
		return parentId;
	}
	
	/**
	 * Sets the parent id.
	 *
	 * @param parentId the new parent id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
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
	 * Gets the domain id.
	 *
	 * @return the domain id
	 */
	public Long getDomainId() {
		return domainId;
	}
	
	/**
	 * Sets the domain id.
	 *
	 * @param domainId the new domain id
	 */
	public void setDomainId(Long domainId) {
		this.domainId = domainId;
	}
	
	/**
	 * Gets the privilege id.
	 *
	 * @return the privilege id
	 */
	public Long getPrivilegeId() {
		return privilegeId;
	}
	
	/**
	 * Sets the privilege id.
	 *
	 * @param privilegeId the new privilege id
	 */
	public void setPrivilegeId(Long privilegeId) {
		this.privilegeId = privilegeId;
	}
	
	/**
	 * Gets the rbac object.
	 *
	 * @return the rbac object
	 */
	public RbacObject getRbacObject() {
		return rbacObject;
	}
	
	/**
	 * Sets the rbac object.
	 *
	 * @param rbacObject the new rbac object
	 */
	public void setRbacObject(RbacObject rbacObject) {
		this.rbacObject = rbacObject;
	}
	
	/**
	 * Gets the rbac object list.
	 *
	 * @return the rbac object list
	 */
	public List<RbacObject> getRbacObjectList() {
		return rbacObjectList;
	}
	
	/**
	 * Sets the rbac object list.
	 *
	 * @param rbacObjectList the new rbac object list
	 */
	public void setRbacObjectList(List<RbacObject> rbacObjectList) {
		this.rbacObjectList = rbacObjectList;
	}
	
	/**
	 * Gets the rbac object parent.
	 *
	 * @return the rbac object parent
	 */
	public RbacObject getRbacObjectParent() {
		return rbacObjectParent;
	}
	
	/**
	 * Sets the rbac object parent.
	 *
	 * @param rbacObjectParent the new rbac object parent
	 */
	public void setRbacObjectParent(RbacObject rbacObjectParent) {
		this.rbacObjectParent = rbacObjectParent;
	}
	
}
