package com.geoland.kfis.web.action.base.security;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jasypt.util.password.StrongPasswordEncryptor;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.UserPassword;

// TODO: Auto-generated Javadoc
/**
 * The Class UserPwdSaveAction.
 *
 * @author GEO&LAND
 * @created September 3, 2014 10:51:14 PM
 * @Version 1.0
 */
public class UserPwdSaveAction extends UserBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8069881519632006689L;
	
	/** The log. */
	Logger log = Logger.getLogger(UserPwdSaveAction.class);
	
	/** The password encryptor. */
	StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
	
	/** The pwdold. */
	private String pwdold;
	
	/** The pwdnew. */
	private String pwdnew;
	
	/** The pwdnewrepeat. */
	private String pwdnewrepeat;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		//if user is logged-in, then must be checked as encrypted password		
		if(getUser() != null){
			if(!passwordEncryptor.checkPassword(pwdold, getUser().getUser().getUserPassword().getPassword())) {
				loginLog(getUser().getUser().getUsername(), pwdold, Boolean.FALSE);
				addFieldError("pwdold", getMessage("label.admin.pwdold.incorrect"));
			}
			setKuser(getUser().getUser());
		}else if(StringUtils.isNotEmpty(username)){
			User kuser = (User) DAOFactoryRbac.getFactory().getUserDAO().findByUniqueField("username", username);	
			if('I' == kuser.getUserPassword().getPasswordStatus().charValue() && 
					!pwdold.equals(kuser.getUserPassword().getPassword())) {
				loginLog(username, pwdold, Boolean.FALSE);
				addFieldError("pwdold", getMessage("label.admin.pwdold.incorrect"));
			}
			setKuser(kuser);
		}else{
			String msg = "Fatal Application error occurred while user login. Please contact administration";
			addFieldError("fatal", msg);
			addActionError(msg);
		}
	
		if(pwdold==null || StringUtils.isEmpty(pwdold)){
			addFieldError("pwdold", getMessage("label.admin.pwdold.empty"));
		}
		
		if(pwdnew==null || StringUtils.isEmpty(pwdnew)){
			addFieldError("pwdnew", getMessage("label.admin.pwdnew.empty"));
		}
		
		if(pwdnew!=null && pwdnew.length()<6){
			addFieldError("pwdnew", getMessage("label.admin.pwdnew.lt6"));
		}		
		
		if(pwdnewrepeat==null || StringUtils.isEmpty(pwdnewrepeat)){
			addFieldError("pwdnewrepeat", getMessage("label.admin.pwdnewrepeat.empty"));
		}
		
		if(pwdnewrepeat!=null && pwdnewrepeat.length()<6){
			addFieldError("pwdnewrepeat", getMessage("label.admin.pwdnewrepeat.lt6"));
		}
		
		if(pwdnew!=null && pwdnewrepeat!=null && !pwdnew.equals(pwdnewrepeat)){
			addActionError(getMessage("label.admin.pwdnewrepeat.notequals"));
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		User orginal = (User) DAOFactoryRbac.getFactory().getUserDAO().get(getKuser().getId());
		String encryptedPassword = passwordEncryptor.encryptPassword(pwdnew);
		UserPassword userPassword = orginal.getUserPassword();
		userPassword.setPassword(encryptedPassword);
		userPassword.setCreatedDate(new Date());
		userPassword.setPasswordStatus(Character.valueOf('C'));
		userPassword.setHashValue(hashPassword(pwdnew));

		DAOFactoryRbac.getFactory().getUserDAO().save(orginal);
		
		loginLog(orginal.getUsername(), "passwordEncrypted", Boolean.TRUE);
		setupUserSession(orginal);
		
		return SUCCESS;
	}
	
	/**
	 * Gets the pwdold.
	 *
	 * @return the pwdold
	 */
	public String getPwdold() {
		return pwdold;
	}


	/**
	 * Sets the pwdold.
	 *
	 * @param pwdold the new pwdold
	 */
	public void setPwdold(String pwdold) {
		this.pwdold = pwdold;
	}


	/**
	 * Gets the pwdnew.
	 *
	 * @return the pwdnew
	 */
	public String getPwdnew() {
		return pwdnew;
	}


	/**
	 * Sets the pwdnew.
	 *
	 * @param pwdnew the new pwdnew
	 */
	public void setPwdnew(String pwdnew) {
		this.pwdnew = pwdnew;
	}


	/**
	 * Gets the pwdnewrepeat.
	 *
	 * @return the pwdnewrepeat
	 */
	public String getPwdnewrepeat() {
		return pwdnewrepeat;
	}


	/**
	 * Sets the pwdnewrepeat.
	 *
	 * @param pwdnewrepeat the new pwdnewrepeat
	 */
	public void setPwdnewrepeat(String pwdnewrepeat) {
		this.pwdnewrepeat = pwdnewrepeat;
	}


	
}
