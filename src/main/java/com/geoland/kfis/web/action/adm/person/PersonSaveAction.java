/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 10:33:05 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.adm.person;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.PartyRole;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PersonSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 10:33:05 AM
 * @Version 1.0
 */
public class PersonSaveAction extends PersonBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;  
	  
  	/** The file. */
  	private File file;
	    
    	/** The content type. */
    	private String contentType;
	    
    	/** The filename. */
    	private String filename;
//	    private String addAddress;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(person.getActive()==null)
			person.setActive(false);
		try {
			addValidationErrors(getPersonBo().validate());
			if(isCheckAddress()){
				addValidationErrors(getAddressBo().validate());
			}
			if(person.getBirthdate()!=null){
				long differDays =calculateYearDifference(personBo.getPersistence().getBirthdate());
				if(differDays<18)
					addFieldError("person.birthdate.to.large", getMessage("birthdate.to.large"));
			}
		} catch (ValidationException e) {
			addActionError(e.getMessage());
			e.printStackTrace();
		}
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User currentUser = getUser().getUser();
		Person pers=getPersonBo().getPersistence(); 
		if(isCheckAddress()){
			getAddressBo().getPersistence().setCurrentUser(currentUser);
			getAddressBo().save();
			pers.setAddress(getAddress());
		}
		//pers.setPartyType(Partytype.PERSON);
		pers.setPartyType("P");
		//pers.setCreatedDate(new Date());
		if(parentPerson!=null && parentPerson.getId()!=null)
			pers.setParty(parentPerson);
		
	
		
		if(file!=null){
			pers.setPhoto(getFileBytes(file));
		}else if(pers.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select p.photo from tperson as p left join tparty as y on p.id = y.id where p.id="+pers.getId());
			sqlQuery.addScalar("photo");
			Object ob1 = sqlQuery.uniqueResult();
			pers.setPhoto((byte[])ob1);
		}
		if(pers.getPhoto()!=null)
			photo=new String(Base64.encodeBase64(pers.getPhoto()));
		getPersonBo().getPersistence().setCurrentUser(getUser().getUser());
		getPersonBo().save();
	
		if(pers.getId()!=null){
			String query="select * from tparty_role where party_id="+pers.getId();
			List<PartyRole> pr=DAOFactory.getFactory().getPartyRoleDAO().executeSQLQuery(query);
		
			if(partyRole!=null && partyRole.getRoleCode()!=null){
					if(pr.size()>0){
						partyRole=pr.get(0);
					}else {
						partyRole.setParty(pers);
					}
					codeRole=partyRole.getRoleCode().getDOMKEY();
					partyRole.setCurrentUser(currentUser);
					DAOFactory.getFactory().getPartyRoleDAO().save(partyRole);
	
			}else {
				if(pr.size()>0){
					partyRole=pr.get(0);
					partyRole.setCurrentUser(currentUser);
					DAOFactory.getFactory().getPartyRoleDAO().delete(partyRole);
					codeRole="";
				}
			}
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
