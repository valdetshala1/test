package com.geoland.kfis.web.action.base.security;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.UserLoginAttempt;
import com.geoland.kfis.logic.security.BoUserSecurity;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class UserBaseAction.
 *
 * @author GEO&LAND
 * @created September 3, 2014 10:50:45 PM
 * @Version 1.0
 */
public class UserBaseAction extends BaseActionSupport{
	
	/** The log. */
	Logger log = Logger.getLogger(UserBaseAction.class);
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8069881519632006689L;
	
	/** The username. */
	protected String username;
	
	/** The password. */
	protected String password;
	
	/** The language. */
	protected String language;
	
	/** The kuser. */
	protected User kuser;

	/**
	 * Login log.
	 *
	 * @param login the login
	 * @param pwd the pwd
	 * @param status the status
	 */
	protected void loginLog(String login, String pwd, Boolean status){
		if(StringUtils.isNotEmpty(login)){
			HttpServletRequest request =  ServletActionContext.getRequest();
			/*
			String userIpAddress = request.getHeader("X-Forwarded-For");
			if(userIpAddress == null) {
			   userIpAddress = request.getRemoteAddr();
			}		
			*/
			String userIpAddress = getClientIPAddress(request);
			
	        //Get User Agent String
	        String userAgent = request.getHeader("User-Agent");
	
			UserLoginAttempt ula = new UserLoginAttempt();
			ula.setAccountName(login);
			ula.setPassword(pwd);
			ula.setIpNumber(userIpAddress);
			ula.setBrowserType(userAgent);
			ula.setSuccess(status);
			ula.setCreatedDate(new Date());
			
			DAOFactoryRbac.getFactory().getUserLoginAttemptDAO().save(ula);
		}
	}
	
	/**
	 * Find user.
	 *
	 * @return the user
	 * @throws Exception the exception
	 */
	protected User findUser() throws Exception {
		User user = (User) DAOFactoryRbac.getFactory().getUserDAO().findByUniqueField("username", username);
		return user;
	}
	
	/**
	 * Setup user session.
	 *
	 * @throws Exception the exception
	 */
	protected void setupUserSession() throws Exception {
		BoUserSecurity boUser = new BoUserSecurity(kuser, getLocale());
    	setUser(boUser);
    	if(StringUtils.isNotEmpty(language)){
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("request_locale", language);
			Locale locale = new Locale(language, language.toUpperCase()); 
			setLocale(locale);
		}
	}
	
	
	/**
	 * Gets the client IP address.
	 *
	 * @param request the request
	 * @return the client IP address
	 */
	protected String getClientIPAddress(HttpServletRequest request){
		// Due Apache redirection, the real client ip-address will be in this header value
		String ipAddress=request.getHeader("X-FORWARDED-FOR"); 

		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
		}
		if (ipAddress.contains(",")) {
			ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
		}

		return ipAddress;
	}
	
	/**
	 * Sets the up user session.
	 *
	 * @param kuser the new up user session
	 * @throws Exception the exception
	 */
	protected void setupUserSession(User kuser) throws Exception {
		BoUserSecurity boUser = new BoUserSecurity(kuser, getLocale());
    	setUser(boUser);
		if(StringUtils.isNotEmpty(language)){
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("request_locale", language);
			Locale locale = new Locale(language, language.toUpperCase()); 
			setLocale(locale);
		}
	}	
	
	/**
	 * Encryptor.
	 *
	 * @param password the password
	 * @return encrypted password
	 */
	protected static String encryptor(String password){
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		encryptor.setPassword("EncryptionPassword");	
		String encryptedPassword = encryptor.encrypt(password);
		System.out.println("correct! " + encryptedPassword);
		return encryptedPassword;
	}
	
	/**
	 * Hash password.
	 *
	 * @param password the password
	 * @return password hash
	 */
	protected static String hashPassword(String password) {
		String hashword = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(password.getBytes());
			BigInteger hash = new BigInteger(1, md5.digest());
			hashword = hash.toString(16);
		} catch (NoSuchAlgorithmException nsae) {
			// ignore
		}
		return hashword;
	}

	/**
	 * Gets the pass.
	 *
	 * @param pass the pass
	 * @return the pass
	 * @throws NoSuchAlgorithmException the no such algorithm exception
	 */
	protected String getPass(String pass) throws NoSuchAlgorithmException {
		MessageDigest m = MessageDigest.getInstance("MD5");
		byte[] data = pass.getBytes(); 
		m.update(data,0,data.length);
		BigInteger i = new BigInteger(1,m.digest());
		return String.format("%1$032X", i);
	}
	

	/**
	 * Show.
	 *
	 * @return the string
	 * @throws Exception the exception
	 */
	public String show() throws Exception{
		kuser = getUser().getUser();
		return "show";
	}
	
	/**
	 * Change password.
	 *
	 * @return the string
	 */
	public String changePassword(){
		return "change_password";
	}
	
	/**
	 * Login page.
	 *
	 * @return the string
	 */
	public String loginPage(){
		return "login_page";
	}
	
	/**
	 * Gets the username.
	 *
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * Sets the username.
	 *
	 * @param username the new username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * Gets the password.
	 *
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Sets the password.
	 *
	 * @param password the new password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * Gets the language.
	 *
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}

	/**
	 * Sets the language.
	 *
	 * @param language the new language
	 */
	public void setLanguage(String language) {
		this.language = language;
	}

	/**
	 * Gets the kuser.
	 *
	 * @return the kuser
	 */
	public User getKuser() {
		return kuser;
	}

	/**
	 * Sets the kuser.
	 *
	 * @param kuser the new kuser
	 */
	public void setKuser(User kuser) {
		this.kuser = kuser;
	}


}
