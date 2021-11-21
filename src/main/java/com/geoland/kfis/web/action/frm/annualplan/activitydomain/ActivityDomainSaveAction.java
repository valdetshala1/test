package com.geoland.kfis.web.action.frm.annualplan.activitydomain;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
import org.apache.commons.lang.StringUtils;

// TODO: Auto-generated Javadoc
/**
 * The Class ActivityDomainSaveAction.
 */
public class ActivityDomainSaveAction extends ActivityDomainBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(activityDomain!=null && StringUtils.isEmpty(activityDomain.getNameAl())){
			addFieldError("activityDomain.nameAl", getMessage("frm.activityDomain.nameAl.empty"));
		}
		if(activityDomain!=null && StringUtils.isEmpty(activityDomain.getNameEn())){
			addFieldError("activityDomain.nameEn", getMessage("frm.activityDomain.nameEn.empty"));
		}
		if(activityDomain!=null && StringUtils.isEmpty(activityDomain.getCode())){
			addFieldError("activityDomain.code", getMessage("frm.activityDomain.code.empty"));
		}
		if (hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}

	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(parentId==null){
			activityDomain.setActivityDomain(null);
		}
		if(activityDomain.getSort()==null){
			activityDomain.setSort(new Short("0"));
		}
		
		DAOFactory.getFactory().getActivityDomainDAO().save(activityDomain);
		return SUCCESS;
	}
	
}
