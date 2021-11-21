/**
 * 
 */
package com.geoland.kfis.web.action.adm.user;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.framework.persistence.model.rbac.RbacUseRole;
import com.geoland.kfis.model.PartyUser;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class UserSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 26, 2014 10:59:38 AM
 * @Version 1.0
 */
public class UserSaveAction extends UserBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5630938131121386236L;
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(getThisUser()!=null){
			roles=DAOFactoryRbac.getFactory().getRbacRoleDAO().executeSQLQuery("select r.* from trbac_role as r,trbac_user_role as rb where r.id=rb.role_id and rb.user_id="+getThisUser().getId());
		}
		
		if(person!=null && person.getId()!=null){
			person = DAOFactory.getFactory().getPersonDAO().get(person.getId());
			thisUser.setFirstName(person.getFirstName());
			thisUser.setLastName(person.getLastName());
			thisUser.setBirthdate(person.getBirthdate());
			thisUser.setGender(person.getGender());
			thisUser.setPersonalId(person.getPersonalId());
			thisUser.setDegree(person.getDegree());
		}
		if(forPerson && (person==null || (person!=null && person.getId()==null)))
			addFieldError("person.id", getMessage("this.user.person.empty"));
		if(thisUser!=null && (StringUtils.isEmpty(thisUser.getFirstName()) || !StringUtils.isNotBlank(thisUser.getFirstName())))
			addFieldError("thisUser.firstName", getMessage("person.firstName.empty"));
		else if(!StringUtils.isAlphaSpace(thisUser.getFirstName()))
			addFieldError("thisUser.firstName", getMessage("person.field.invalid.char"));
		if(thisUser!=null && (StringUtils.isEmpty(thisUser.getLastName()) || !StringUtils.isNotBlank(thisUser.getFirstName())))
			addFieldError("thisUser.lastName", getMessage("person.lastName.empty"));
		else if(!StringUtils.isAlphaSpace(thisUser.getLastName()))
			addFieldError("thisUser.lastName", getMessage("person.field.invalid.char"));
		
		if(thisUser!=null && StringUtils.isEmpty(thisUser.getUsername()))
			addFieldError("thisUser.username", getMessage("thisUser.username.epmty"));
		else{
			String query="select * from tuser where username='"+getThisUser().getUsername()+"'";
			if(getThisUser().getId()!=null){
				query+=" and id!="+thisUser.getId();
			}
			usernameExists=DAOFactoryRbac.getFactory().getUserDAO().executeSQLQuery(query);
				if(usernameExists.size()>0)
					addFieldError("thisUser.username", getMessage("this.user.username.exists"));
		}
		if(thisUser!=null && (StringUtils.isEmpty(userPassword.getPassword()) || userPassword.getPassword().length()<6))
			addFieldError("thisUser.password", getMessage("this.user.password.empty"));
		
		if(userPassword!=null && (userPassword.getId()==null || resetPassword==true)){
			if(thisUser!=null && StringUtils.isEmpty(passwordRepeat))
				addFieldError("passwordRepeat", getMessage("password.repeat.empty"));
			else if(!passwordRepeat.equals(userPassword.getPassword())){
				addFieldError("passwordRepeat", getMessage("password.repeat.dont.match"));
			}
		}
		if(thisUser!=null && thisUser.getBirthdate()==null)
			addFieldError("thisUser.birthdate", getMessage("person.birthdate.empty"));
		else{
			long differDays =calculateYearDifference(thisUser.getBirthdate());
			if(differDays<18)
				addFieldError("thisUser.birthdate", getMessage("birthdate.to.large"));
		}
		if(thisUser!=null && thisUser.getGender()==null)
			addFieldError("thisUser.gender", getMessage("person.gender.empty"));
		
		if(thisUser!=null && StringUtils.isEmpty(thisUser.getEmail()))
			addFieldError("thisUser.email", getMessage("thisUser.email.empty"));
		
		if(rbacRoles==null || rbacRoles.size()<=0){
			addFieldError("rbacRoles", getMessage("rbacRoles.empty"));
			if(roles!=null)
				roles.clear();
		}
			
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date createdDate = new Date();
		User currentUser = getUser().getUser();
		if(StringUtils.isEmpty(userPassword.getHashValue()))
			userPassword.setHashValue(null); //don't let hashvalue to be stored as empty string
		
		if(userPassword!=null && (userPassword.getId()==null || resetPassword==true)){
			userPassword.setPasswordStatus(new Character('I'));
			userPassword.setHashValue(null);
		}
		userPassword.setCreatedDate(createdDate);
		userPassword.setActive(true);
		userPassword.setCurrentUser(currentUser);
		DAOFactoryRbac.getFactory().getUserPasswordDAO().save(userPassword);
		
		thisUser.setUserPassword(userPassword);
		thisUser.setCreatedDate(createdDate);
		thisUser.setCurrentUser(currentUser);
		DAOFactoryRbac.getFactory().getUserDAO().save(thisUser);
		
		if(person!=null && person.getId()!=null){
			if(partyUser==null){
				partyUser = new PartyUser();
			}
			partyUser.setParty(person);
			partyUser.setUser(thisUser);
			partyUser.setCurrentUser(currentUser);
			DAOFactory.getFactory().getPartyUserDAO().save(partyUser);
		}
		
		if(thisUser!=null && thisUser.getId()!=null){
			rbacUserRole=DAOFactoryRbac.getFactory().getRbacUserRoleDAO().executeSQLQuery("select * from trbac_user_role where user_id="+thisUser.getId());
			for(RbacUseRole rbuser:rbacUserRole){
				if(!checkUser(rbuser)){
					rbuser.setCurrentUser(currentUser);
					DAOFactoryRbac.getFactory().getRbacUserRoleDAO().delete(rbuser);
					roles.remove(rbuser.getRbacRole());
				}
			}
			if(rbacRoles!=null && !rbacRoles.isEmpty()){
				for(String role:rbacRoles){
					if(!checkRole(role,rbacUserRole)){
						RbacRole r=DAOFactoryRbac.getFactory().getRbacRoleDAO().get(Long.valueOf(role));
						RbacUseRole rb= new RbacUseRole(thisUser, r);
						rb.setCurrentUser(currentUser);
						DAOFactoryRbac.getFactory().getRbacUserRoleDAO().save(rb);
						roles.add(r);
					}
				}
			}
		}
		return SUCCESS;
	}
}
