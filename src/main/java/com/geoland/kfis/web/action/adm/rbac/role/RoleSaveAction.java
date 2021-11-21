/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.role;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;

// TODO: Auto-generated Javadoc
/**
 * The Class RoleSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 29, 2014 1:31:39 AM
 * @Version 1.0
 */
public class RoleSaveAction extends RoleBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {

		if(StringUtils.isEmpty(getRole().getName()))
			addFieldError("role.name", getMessage("role.name.empty"));
		if(StringUtils.isEmpty(getRole().getNameEn()))
			addFieldError("role.nameEn", getMessage("finance.type.name.en.empty"));
		if(StringUtils.isEmpty(getRole().getNameSr()))
			addFieldError("role.nameSr", getMessage("finance.type.name.sr.empty"));
		if(StringUtils.isEmpty(getRole().getCode()))
			addFieldError("role.code", getMessage("role.code.empty"));
		else{
			String roleCodes="select count(*) from trbac_role where code='"+role.getCode()+"'";
			if(role.getId()!=null)
				roleCodes+=" and id!="+role.getId();
			Integer count = DAOFactoryRbac.getFactory().getRbacRoleDAO().countQuery(roleCodes);
			if(count>0){
				addFieldError("role.code", getMessage("role.code.exists"));
			}
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
		getRole().setCurrentUser(currentUser);
		DAOFactoryRbac.getFactory().getRbacRoleDAO().save(getRole());
		return SUCCESS;
		
	}
}
