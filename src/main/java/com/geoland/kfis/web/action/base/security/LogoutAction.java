package com.geoland.kfis.web.action.base.security;

import org.apache.struts2.ServletActionContext;


// TODO: Auto-generated Javadoc
/**
 * The Class LogoutAction.
 *
 * @author GEO&LAND
 * @created April 19, 2014 12:24:07 PM
 * @Version 1.0
 */
public class LogoutAction extends UserBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1407489519949570200L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(getUser()!=null && getUser().getUser()!=null){
			loginLog(getUser().getUser().getUsername(), "LogoutAction", Boolean.TRUE);
		}
		
		setUser(null);
		ServletActionContext.getRequest().getSession().invalidate();
		
		return SUCCESS;
	}
	
}
