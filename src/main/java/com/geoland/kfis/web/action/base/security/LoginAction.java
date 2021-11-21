package com.geoland.kfis.web.action.base.security;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jasypt.util.password.StrongPasswordEncryptor;

import com.geoland.kfis.logic.security.BoUserSecurity;

// TODO: Auto-generated Javadoc
/**
 * The Class LoginAction.
 *
 * @author GEO&LAND
 * @created April 19, 2014 12:23:50 PM
 * @Version 1.0
 */
public class LoginAction extends UserBaseAction{
	
	/** The log. */
	Logger log = Logger.getLogger(LoginAction.class);
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		BoUserSecurity boUser = getUser();
		if(boUser != null)
			kuser = boUser.getUser();
		
		if(kuser == null){
			try {
				kuser = findUser();
				if (kuser == null) {
					addFieldError("username", getMessage("login.validate.user"));
					log.info("Username not found: " + username);
		        }else{
		        	if(kuser.isActive()){
			        	if('I' == kuser.getUserPassword().getPasswordStatus().charValue()){
			    			if(!password.equals(kuser.getUserPassword().getPassword())) {
			    				addFieldError("password", getMessage("login.validate.user.password"));
			    			}else{
			    				loginLog(username, password, Boolean.TRUE);
			    			}
			        	}else{
			    			StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
			    			if(!passwordEncryptor.checkPassword(password, kuser.getUserPassword().getPassword())) {
			    				addFieldError("password", getMessage("login.validate.user.password"));
			    			}else{
			    				loginLog(username, "passwordEncrypted", Boolean.TRUE);
			    				setupUserSession();
			    			}
			        	}
		        	}else{
		        		addFieldError("username", getMessage("login.validate.user.not.active"));
		        	}
		        }
				
				if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
					loginLog(username, password, Boolean.FALSE);
				}				
				
			} catch (Exception exc) {
				addActionError(exc.getMessage());
				log.error(exc.getMessage() + " user failed for:" + getUsername(), exc);
				setUser(null);
			}
		}

	}

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(language != null){
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("request_locale", language);
			Locale locale = new Locale(language, language.toUpperCase()); 
			setLocale(locale);
		}
		gridLang(language);
		if(kuser != null && 'I' == kuser.getUserPassword().getPasswordStatus().charValue()){
			return "change_pwd";
		}else{
			return SUCCESS;
		}
	}	
	
	
}
