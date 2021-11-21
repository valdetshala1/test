/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.object;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;

// TODO: Auto-generated Javadoc
/**
 * The Class ObjectSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 29, 2014 1:31:39 AM
 * @Version 1.0
 */
public class ObjectSaveAction extends ObjectBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(rbacObject == null)
			addActionError("Fatal error on creating Rbac Object");
		
		if(rbacObject != null && StringUtils.isEmpty(rbacObject.getName())){
			addFieldError("rbacObject.name", getMessage("rbacObject.name.empty"));
		}
		
		if(rbacObject != null && StringUtils.isEmpty(rbacObject.getCode())){
			addFieldError("rbacObject.code", getMessage("rbacObject.code.empty"));
		}else if(rbacObject.getCode().length()>6){
			addFieldError("rbacObject.code", getMessage("rbacObject.code.length"));
		}else{
			String query = "select count(*) as count, id from trbac_object where code = '" + rbacObject.getCode() + "' group by id";
			List<Object[]> view = DAOFactoryRbac.getFactory().getRbacObjectDAO().getDataView(new String[]{"count", "id"}, new String[]{"INTEGER", "LONG"}, query);
			if(view!=null && view.size()>1){
				addFieldError("rbacObject.code", getMessage("rbacObject.code.unique.constraint.violated"));
			}else if(view!=null && view.size() == 1){
				Object[] objects = view.get(0);
				Long tmpId =  (Long) objects[1];
				if(!tmpId.equals(rbacObject.getId())){
					addFieldError("rbacObject.code", getMessage("rbacObject.code.unique.constraint.violated"));
				}
			}
		}
		
		if(rbacObject != null && rbacObject.getParentId() == null){
			addFieldError("rbacObject.parentId", getMessage("rbacObject.parentId.empty"));
		}else{
			rbacObjectParent = DAOFactoryRbac.getFactory().getRbacObjectDAO().get(rbacObject.getParentId());
		}

		
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
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
		rbacObject.setLocked((short)0);
		rbacObject.setCurrentUser(currentUser);
		DAOFactoryRbac.getFactory().getRbacObjectDAO().save(rbacObject);

		return SUCCESS;
	}
}
