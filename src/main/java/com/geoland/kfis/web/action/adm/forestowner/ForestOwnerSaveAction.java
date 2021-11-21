package com.geoland.kfis.web.action.adm.forestowner;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.framework.persistence.model.rbac.RbacUseRole;
import com.geoland.kfis.model.PartyRole;
import com.geoland.kfis.model.PartyUser;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Partyrole;
import com.geoland.kfis.persistence.hibernate.usertypes.Partytype;

// TODO: Auto-generated Javadoc
/**
 * The Class ForestOwnerSaveAction.
 */
public class ForestOwnerSaveAction extends ForestOwnerBaseAction {

	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	  
  	/** The file. */
  	private File file;
	  
  	/** The content type. */
  	private String contentType;
	  
  	/** The filename. */
  	private String filename;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		try {
			addValidationErrors(getPersonBo().validate());
			if(isCheckAddress()){
				addValidationErrors(getAddressBo().validate());
			}
			if(persforestowner.getBirthdate()!=null){
				long differDays =calculateYearDifference(personBo.getPersistence().getBirthdate());
				if(differDays<18)
					addFieldError("person.birthdate.to.large", getMessage("birthdate.to.large"));
			}
		} catch (ValidationException e) {
			addActionError(e.getMessage());
			e.printStackTrace();
		}
		
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
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
		
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Person pers=getPersonBo().getPersistence(); 
		User currentUser = getUser().getUser();
		if(isCheckAddress()){
			getAddressBo().getPersistence().setCurrentUser(currentUser);
			getAddressBo().save();
			pers.setAddress(getAddress());
		}
		//pers.setPartyType(Partytype.PERSON);
		pers.setPartyType("P");
		pers.setActive(true);
		
		if(file!=null){
			pers.setPhoto(getFileBytes(file));
		}else if(pers.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select p.photo from tperson as p left join tparty as y on p.id = y.id where p.id="+pers.getId());
			sqlQuery.addScalar("photo");
			Object ob1 = sqlQuery.uniqueResult();
			pers.setPhoto((byte[])ob1);
		}
		getPersonBo().getPersistence().setCurrentUser(currentUser);
		getPersonBo().save();
		PartyRole partyRole=new PartyRole();
		if(pers!=null){
			partyRole.setParty(pers);
			partyRole.setRoleCode(Partyrole.FORESTOWNER);
			partyRole.setCurrentUser(currentUser);
			
			DAOFactory.getFactory().getPartyRoleDAO().save(partyRole);
		}
	
		
		thisUser.setFirstName(persforestowner.getFirstName());
		thisUser.setLastName(persforestowner.getLastName());
		thisUser.setBirthdate(persforestowner.getBirthdate());
		thisUser.setGender(persforestowner.getGender());
		thisUser.setPersonalId(persforestowner.getPersonalId());
		thisUser.setDegree(persforestowner.getDegree());
		
		Date createdDate = new Date();
		
		if(StringUtils.isEmpty(userPassword.getHashValue()))
			userPassword.setHashValue(null); //don't let hashvalue to be stored as empty string
		
		if(userPassword!=null && (userPassword.getId()==null || resetPassword==true)){
			userPassword.setPasswordStatus(new Character('I'));
			userPassword.setHashValue(null);
		}
		userPassword.setCreatedDate(createdDate);
		userPassword.setActive(true);
		DAOFactoryRbac.getFactory().getUserPasswordDAO().save(userPassword);
		
		thisUser.setUserPassword(userPassword);
		thisUser.setCreatedDate(createdDate);
		thisUser.setActive(true);
		thisUser.setCurrentUser(currentUser);
		
		DAOFactoryRbac.getFactory().getUserDAO().save(thisUser);
		
		String forestOwnerRoleQuery="select r.* from trbac_role as r where r.code='foc'";
		RbacRole  rbacRole=DAOFactoryRbac.getFactory().getRbacRoleDAO().executeSQLQuery(forestOwnerRoleQuery).get(0);
		RbacUseRole rur=new RbacUseRole();
		rur.setRbacRole(rbacRole);
		rur.setUser(thisUser);
		DAOFactoryRbac.getFactory().getRbacUserRoleDAO().save(rur);
		if(persforestowner!=null && persforestowner.getId()!=null){
			if(partyUser==null){
				partyUser = new PartyUser();
			}
			partyUser.setParty(persforestowner);
			partyUser.setUser(thisUser);
			partyUser.setCurrentUser(currentUser);
			DAOFactory.getFactory().getPartyUserDAO().save(partyUser);
		}
		return SUCCESS;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}

	/**
	 * Gets the content type.
	 *
	 * @return the content type
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * Sets the content type.
	 *
	 * @param contentType the new content type
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * Gets the filename.
	 *
	 * @return the filename
	 */
	public String getFilename() {
		return filename;
	}

	/**
	 * Sets the filename.
	 *
	 * @param filename the new filename
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}
	

}
