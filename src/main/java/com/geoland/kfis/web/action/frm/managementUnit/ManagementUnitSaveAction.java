package com.geoland.kfis.web.action.frm.managementUnit;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class ManagementUnitSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 14, 2015, 4:04:55 PM
 * v2.0
 */
public class ManagementUnitSaveAction extends ManagementUnitBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(managementUnit!=null && (managementUnit.getRegion()==null || managementUnit.getRegion().getId() == null))
			addFieldError("managementUnit.region.id", getMessage("managementUnit.region.id"));
		
		if(managementUnit!=null && StringUtils.isEmpty(managementUnit.getMuName()))
			addFieldError("managementUnit.muName", getMessage("managementUnit.muName"));
		
		if(managementUnit!=null && StringUtils.isEmpty(managementUnit.getMuCode()))
			addFieldError("managementUnit.muCode", getMessage("managementUnit.muCode"));
		
		if(getFieldErrors().isEmpty()){
			String sql = "select count(*) from tgis_management_unit where region_id="+managementUnit.getRegion().getId()+" and mu_code='"+managementUnit.getMuCode()+"'";
			
			if(managementUnit!=null && managementUnit.getId()!=null){
				sql+=" and id!="+managementUnit.getId() ;
			}
			Integer count = DAOFactory.getFactory().getManagementUnitDAO().countQuery(sql);
			if(count>0)
				addFieldError("managementUnit.muCode", getMessage("frm.menagementunit.mucode.duplicate"));
		}
		
		if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		managementUnit.setCurrentUser(user);
		DAOFactory.getFactory().getManagementUnitDAO().save(managementUnit);
		return SUCCESS;
	}
}
