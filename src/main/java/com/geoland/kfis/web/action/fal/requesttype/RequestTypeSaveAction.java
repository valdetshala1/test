package com.geoland.kfis.web.action.fal.requesttype;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class RequestTypeSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Dec 18, 2015, 9:40:55 AM
 * v2.0
 */
public class RequestTypeSaveAction extends RequestTypeBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(requestType!=null && StringUtils.isEmpty(requestType.getNameAl()))
			addFieldError("requestType.nameAl", getMessage("indicator.name.empty"));
		
		if(requestType!=null && StringUtils.isEmpty(requestType.getNameEn()))
			addFieldError("requestType.nameEn", getMessage("indicator.nameEn.empty"));
		
		if(requestType!=null && StringUtils.isEmpty(requestType.getNameSr()))
			addFieldError("requestType.nameSr", getMessage("indicator.nameSr.empty"));
		
		if(requestType!=null && requestType.getPrice()==null)
			addFieldError("requestType.price", getMessage("fal.requesttype.price.validate"));
		
		if(requestType!=null && requestType.getPeriodType()==null)
			addFieldError("requestType.periodType", getMessage("fal.requestType.periodType.validate"));
		
		if(hasActionErrors() || hasFieldErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(requestType.getId()==null){
			requestType.setCreatedDate(new Date());
			requestType.setEmployee(getUser().getEmployee());
			}
		requestType.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getRequestTypeDAO().save(requestType);
		return SUCCESS;
	}
}
