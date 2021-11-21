package com.geoland.kfis.web.action.base.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

// TODO: Auto-generated Javadoc
/**
 * The Class SessionInterceptor.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 19, 2014 12:24:38 PM
 * @Version 1.0
 */
public class SessionInterceptor extends AbstractInterceptor{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8947761686583802443L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		//ActionContext context = actionInvocation.getInvocationContext();
	    HttpServletRequest  request  = ServletActionContext.getRequest();
	    HttpServletResponse response = ServletActionContext.getResponse();
	    HttpSession         session  = request.getSession();
	    if(session.isNew()){
	        response.sendRedirect("Login.do");
	    }
	    
		return actionInvocation.invoke(); 
	}
}
