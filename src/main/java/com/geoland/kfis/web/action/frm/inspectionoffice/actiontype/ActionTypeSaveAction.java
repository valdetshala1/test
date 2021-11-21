package com.geoland.kfis.web.action.frm.inspectionoffice.actiontype;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class ActionTypeSaveAction.
 *
 * @author Detjana Kastrati, GEO&LAND
 * @version 1.0
 * @created Feb 27, 2015, 9:44:40 AM
 */
public class ActionTypeSaveAction extends ActionTypeBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(actionType!=null && StringUtils.isEmpty(actionType.getNameAl()))
			addFieldError("actionType.nameAl", getMessage("dhpet.wild.animals.name.al.empty"));
		
		if(actionType!=null && StringUtils.isEmpty(actionType.getNameEn()))
			addFieldError("actionType.nameEn", getMessage("finance.type.name.en.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
		
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		getActionType().setCurrentUser(user);
		DAOFactory.getFactory().getInspActionTypeDAO().save(getActionType());
		return SUCCESS;
	}

}
