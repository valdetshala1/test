package com.geoland.kfis.web.action.base.security;

import java.io.Serializable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.logic.BoUser;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.web.action.base.Constants;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

// TODO: Auto-generated Javadoc
/**
 * The Class AuthenticationInterceptor.
 *
 * @author GEO&LAND
 * @created April 19, 2014 12:22:52 PM
 * @Version 1.0
 */
public class AuthenticationInterceptor extends AbstractInterceptor implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5483760449610387809L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		User user = null;
		String actionName = actionInvocation.getProxy().getActionName();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Map<String, Object> sessionAttrs = actionInvocation.getInvocationContext().getSession();
		BoUser boUser = (BoUser) sessionAttrs.get(Constants.USER_KEY);
		if(boUser != null){
			user = boUser.getUser();
		}

		if (user == null && actionName.equals(Constants.WELCOME)) {
			return Constants.HOME; 
		}else if(user == null && actionName.equals(Constants.LOGINPAGE)) {
			return Constants.LOGIN_PAGE; 
		}else if (user != null || actionName.equals(Constants.LANGUAGE)){
//			if(boUser.checkAccess("annpl", "_read")){
//				return Constants.LOGIN_PAGE;
//			}
            return actionInvocation.invoke();
		}else if(session.isNew()){
			saveUrl(request, sessionAttrs);
			cleanSession(session, request, sessionAttrs);
			HttpServletResponse response = ServletActionContext.getResponse();
        	response.sendRedirect(Constants.USER_LOGIN);
        	return null;
        }else if (user == null && 
        		(actionName.equals(Constants.LOGIN) || actionName.equals(Constants.LOGIN_PWD))) {
        	return actionInvocation.invoke();
	    }else if (user == null && 
        		(!actionName.equals(Constants.LOGIN) && !actionName.equals(Constants.LOGIN_PWD))) {
        	saveUrl(request, sessionAttrs);
        	cleanSession(session, request, sessionAttrs);
        	return Constants.AUTHORIZATION_REQUIRED;
        }else{
        	HttpServletResponse response = ServletActionContext.getResponse();
        	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        	return Constants.USER_LOGIN;
        }
	}
	
	/**
	 * Save url.
	 *
	 * @param request the request
	 * @param sessionAttrs the session attrs
	 */
	private void saveUrl(HttpServletRequest request, Map<String, Object> sessionAttrs){
    	String path = request.getRequestURI().substring(request.getContextPath().length());
    	String queryString = request.getQueryString();
    	sessionAttrs.put("savedUrl", path+(queryString==null?"":("?"+queryString)));
   	}
	
	/**
	 * Clean session.
	 *
	 * @param session the session
	 * @param request the request
	 * @param sessionAttrs the session attrs
	 */
	private void cleanSession(HttpSession session, HttpServletRequest request,Map<String, Object> sessionAttrs){
		sessionAttrs.remove(Constants.USER_KEY);
		session.removeAttribute(Constants.USER_KEY);
    	HttpServletResponse response = ServletActionContext.getResponse();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        /*
    	//response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
    	//response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);		
		if(!request.isRequestedSessionIdValid()){		
	    	//session.invalidate();
		}
		*/
	}
}
