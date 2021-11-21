package com.geoland.kfis.web.action.adm.rbac.base;

import java.util.List;

import com.geoland.framework.persistence.model.rbac.RbacOperation;
import com.geoland.framework.persistence.model.rbac.RbacPermission;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class RbacBaseAction.
 */
public class RbacBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3939411150824543507L;
	
	/**
	 * Gets the operation id.
	 *
	 * @param op_list the op list
	 * @param op_name the op name
	 * @return id of operation based on its name or null if it doesn't exist
	 */
	public Long getOperationId(List<RbacOperation> op_list,String op_name){
		for(RbacOperation op:op_list){
			if(op_name.equals(op.getName())){
				return op.getId();
			}
		}
		return null;
	}
	
	/**
	 * Gets the permissions to delete.
	 *
	 * @param new_list the new list
	 * @param old_perm the old perm
	 * @return the permissions to delete
	 */
	public RbacPermission getPermissionsToDelete(List<RbacPermission> new_list, RbacPermission old_perm){
		for(RbacPermission perm:new_list){
			if(perm.getRbacRole().getId()==old_perm.getRbacRole().getId() && perm.getRbacObject().getId()==old_perm.getRbacObject().getId() 
					&& perm.getRbacOperation().getId()==old_perm.getRbacOperation().getId()){
				return null;
			}
		}
		
		return old_perm;
	}
	
}
