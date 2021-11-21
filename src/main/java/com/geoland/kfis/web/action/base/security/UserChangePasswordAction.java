/**
 * 
 */
package com.geoland.kfis.web.action.base.security;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.jasypt.util.password.StrongPasswordEncryptor;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.UserPassword;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class UserChangePasswordAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:15:26 PM, May 4, 2015
 */
public class UserChangePasswordAction extends UserBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7432657408766125756L;
	
	/** The pwdold. */
	private String pwdold;
	
	/** The pwdnew. */
	private String pwdnew;
	
	/** The pwdnewrepeat. */
	private String pwdnewrepeat;
	
	/** The u. */
	private User u;
	
	/** The password encryptor. */
	StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		u=getUser().getUser();
		if(u!=null){
			if(pwdold==null || StringUtils.isEmpty(pwdold)){
				addFieldError("pwdold", getMessage("label.admin.pwdold.empty"));
			}else{
				
				if(!passwordEncryptor.checkPassword(pwdold, u.getUserPassword().getPassword()))
					addFieldError("pwdold", getMessage("password.repeat.dont.match"));
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
			
			if((pwdnew!=null && StringUtils.isNotEmpty(pwdnew)) && (pwdnewrepeat!=null && StringUtils.isNotEmpty(pwdnewrepeat)) && !pwdnew.equals(pwdnewrepeat)){
				addFieldError("pwdnewrepeat",getMessage("password.repeat.dont.match"));
			}
			
		}else addActionError("");
		
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
//		User orginal = (User) DAOFactoryRbac.getFactory().getUserDAO().get(u.getId());
		String encryptedPassword = passwordEncryptor.encryptPassword(pwdnew);
		UserPassword userPassword = u.getUserPassword();
		userPassword.setPassword(encryptedPassword);
		userPassword.setCreatedDate(new Date());
		userPassword.setPasswordStatus(Character.valueOf('C'));
		userPassword.setHashValue(hashPassword(pwdnew));

		DAOFactoryRbac.getFactory().getUserPasswordDAO().save(userPassword);
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
	 * @param pwdold the pwdold to set
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
	 * @param pwdnew the pwdnew to set
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
	 * @param pwdnewrepeat the pwdnewrepeat to set
	 */
	public void setPwdnewrepeat(String pwdnewrepeat) {
		this.pwdnewrepeat = pwdnewrepeat;
	}

}
