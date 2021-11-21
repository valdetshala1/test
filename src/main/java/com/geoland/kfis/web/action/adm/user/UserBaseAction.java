/**
 * 
 */
package com.geoland.kfis.web.action.adm.user;

import java.util.List;

import com.geoland.framework.logic.BoUser;
import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.UserPassword;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.framework.persistence.model.rbac.RbacUseRole;
import com.geoland.kfis.model.PartyUser;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class UserBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 26, 2014 10:22:45 AM
 * @Version 1.0
 */
public class UserBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2931652584472673823L;
	
	/** The bo user. */
	protected BoUser boUser;
	
	/** The user id. */
	protected Long userId;
	
	/** The parent person id. */
	protected Long parentPersonId;
	
	/** The this user. */
	protected User thisUser;
	
	/** The rbac roles. */
	protected List<String> rbacRoles;
	
	/** The rbac role list. */
	protected List<RbacRole> rbacRoleList;
	
	/** The rbac user role. */
	protected List<RbacUseRole> rbacUserRole;
	
	/** The roles. */
	protected List<RbacRole> roles;
	
	/** The person. */
	protected Person person;
	
	/** The parent person. */
	protected Person parentPerson;
	
	/** The username exists. */
	protected List<User> usernameExists;
	
	/** The party user. */
	protected PartyUser partyUser;
	
	/** The user password id. */
	protected Long userPasswordId;
	
	/** The user password. */
	protected UserPassword userPassword;
	
	/** The reset password. */
	protected boolean resetPassword;
	
	/** The password repeat. */
	protected String passwordRepeat;
	
	/** The for person. */
	protected boolean forPerson = true;
	
	/**
	 * Check user.
	 *
	 * @param rbu the rbu
	 * @return true, if successful
	 */
	protected boolean checkUser(RbacUseRole rbu){
		if(getThisUser()!=null){
			if(rbacRoles!=null)
			for(String r:rbacRoles){
				
				if(r.equals(rbu.getRbacRole().getId().toString())){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * Check role.
	 *
	 * @param role the role
	 * @param rbu the rbu
	 * @return true, if successful
	 */
	protected boolean checkRole(String role,List<RbacUseRole> rbu){
		if(getThisUser()!=null){
			for(RbacUseRole r : rbu){
				if(role.equals(r.getRbacRole().getId().toString())){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 *  check if this username is taken.
	 *
	 * @param user the user
	 * @return true, if successful
	 */
	
	protected boolean checkUsername(User user){
		if(user.getUsername().equalsIgnoreCase(thisUser.getUsername())){
			return true;
		}
		return false;
	}

	/**
	 * Gets the user id.
	 *
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}
	
	/**
	 * Sets the user id.
	 *
	 * @param userId the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	/**
	 * Gets the this user.
	 *
	 * @return the thisUser
	 */
	public User getThisUser() {
		return thisUser;
	}
	
	/**
	 * Sets the this user.
	 *
	 * @param thisUser the thisUser to set
	 */
	public void setThisUser(User thisUser) {
		this.thisUser = thisUser;
	}
	
	/**
	 * Gets the rbac roles.
	 *
	 * @return the rbacRoles
	 */
	public List<String> getRbacRoles() {
		return rbacRoles;
	}
	
	/**
	 * Sets the rbac roles.
	 *
	 * @param rbacRoles the rbacRoles to set
	 */
	public void setRbacRoles(List<String> rbacRoles) {
		this.rbacRoles = rbacRoles;
	}
	
	/**
	 * Gets the rbac role list.
	 *
	 * @return the rbacRoleList
	 */
	public List<RbacRole> getRbacRoleList() {
		//only exu - external user role
		if(!forPerson) {
			rbacRoleList =DAOFactoryRbac.getFactory().getRbacRoleDAO().executeSQLQuery("select * from trbac_role where code = 'exu'");
		}else {
			rbacRoleList =DAOFactoryRbac.getFactory().getRbacRoleDAO().executeSQLQuery("select * from trbac_role where code != 'exu'");
		}
		
		return rbacRoleList;
	}
	
	/**
	 * Sets the rbac role list.
	 *
	 * @param rbacRoleList the rbacRoleList to set
	 */
	public void setRbacRoleList(List<RbacRole> rbacRoleList) {
		this.rbacRoleList = rbacRoleList;
	}
	
	/**
	 * Gets the rbac user role.
	 *
	 * @return the rbac user role
	 */
	public List<RbacUseRole> getRbacUserRole() {
		return rbacUserRole;
	}
	
	/**
	 * Sets the rbac user role.
	 *
	 * @param rbacUserRole the new rbac user role
	 */
	public void setRbacUserRole(List<RbacUseRole> rbacUserRole) {
		this.rbacUserRole = rbacUserRole;
	}
	
	/**
	 * Gets the roles.
	 *
	 * @return the roles
	 */
	public List<RbacRole> getRoles() {
		return roles;
	}
	
	/**
	 * Sets the roles.
	 *
	 * @param roles the roles to set
	 */
	public void setRoles(List<RbacRole> roles) {
		this.roles = roles;
	}
	
	/**
	 * Gets the username exists.
	 *
	 * @return the usernameExists
	 */
	public List<User> getUsernameExists() {
		return usernameExists;
	}
	
	/**
	 * Sets the username exists.
	 *
	 * @param usernameExists the usernameExists to set
	 */
	public void setUsernameExists(List<User> usernameExists) {
		this.usernameExists = usernameExists;
	}
	
	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson() {
		return person;
	}
	
	/**
	 * Sets the person.
	 *
	 * @param person the person to set
	 */
	public void setPerson(Person person) {
		this.person = person;
	}
	
	/**
	 * Gets the party user.
	 *
	 * @return the partyUser
	 */
	public PartyUser getPartyUser() {
		return partyUser;
	}
	
	/**
	 * Sets the party user.
	 *
	 * @param partyUser the partyUser to set
	 */
	public void setPartyUser(PartyUser partyUser) {
		this.partyUser = partyUser;
	}
	
	/**
	 * Gets the parent person id.
	 *
	 * @return the parent person id
	 */
	public Long getParentPersonId() {
		return parentPersonId;
	}
	
	/**
	 * Sets the parent person id.
	 *
	 * @param parentPersonId the new parent person id
	 */
	public void setParentPersonId(Long parentPersonId) {
		this.parentPersonId = parentPersonId;
	}
	
	/**
	 * Gets the parent person.
	 *
	 * @return the parent person
	 */
	public Person getParentPerson() {
		return parentPerson;
	}
	
	/**
	 * Sets the parent person.
	 *
	 * @param parentPerson the new parent person
	 */
	public void setParentPerson(Person parentPerson) {
		this.parentPerson = parentPerson;
	}
	
	/**
	 * Gets the user password id.
	 *
	 * @return the userPasswordId
	 */
	public Long getUserPasswordId() {
		return userPasswordId;
	}
	
	/**
	 * Sets the user password id.
	 *
	 * @param userPasswordId the userPasswordId to set
	 */
	public void setUserPasswordId(Long userPasswordId) {
		this.userPasswordId = userPasswordId;
	}
	
	/**
	 * Gets the user password.
	 *
	 * @return the userPassword
	 */
	public UserPassword getUserPassword() {
		return userPassword;
	}
	
	/**
	 * Sets the user password.
	 *
	 * @param userPassword the userPassword to set
	 */
	public void setUserPassword(UserPassword userPassword) {
		this.userPassword = userPassword;
	}
	
	/**
	 * Checks if is reset password.
	 *
	 * @return the resetPassword
	 */
	public boolean isResetPassword() {
		return resetPassword;
	}
	
	/**
	 * Sets the reset password.
	 *
	 * @param resetPassword the resetPassword to set
	 */
	public void setResetPassword(boolean resetPassword) {
		this.resetPassword = resetPassword;
	}
	
	/**
	 * Gets the password repeat.
	 *
	 * @return the passwordRepeat
	 */
	public String getPasswordRepeat() {
		return passwordRepeat;
	}
	
	/**
	 * Sets the password repeat.
	 *
	 * @param passwordRepeat the passwordRepeat to set
	 */
	public void setPasswordRepeat(String passwordRepeat) {
		this.passwordRepeat = passwordRepeat;
	}
	
	/**
	 * Checks if is for person.
	 *
	 * @return the forPerson
	 */
	public boolean isForPerson() {
		return forPerson;
	}
	
	/**
	 * Sets the for person.
	 *
	 * @param forPerson the forPerson to set
	 */
	public void setForPerson(boolean forPerson) {
		this.forPerson = forPerson;
	}
	
	
}
