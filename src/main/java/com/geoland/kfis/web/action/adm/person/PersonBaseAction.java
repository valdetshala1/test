package com.geoland.kfis.web.action.adm.person;

import java.io.File;

import com.geoland.kfis.logic.adm.address.BoAddress;
import com.geoland.kfis.logic.adm.person.BoPerson;
import com.geoland.kfis.model.Address;
import com.geoland.kfis.model.PartyRole;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.hibernate.usertypes.Ethnicity;
import com.geoland.kfis.persistence.hibernate.usertypes.Partyrole;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PersonBaseAction.
 *
 * @author GEO&LAND
 * @created April 21, 2014 10:33:24 AM
 * @Version 1.0
 */
public class PersonBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The person. */
	protected Person person;
	
	/** The parent person. */
	protected Person parentPerson;
	
	/** The person bo. */
	protected BoPerson personBo;
	
	/** The person id. */
	protected Long personId;
	
	/** The parent person id. */
	protected Long parentPersonId;
	
	/** The user image. */
	protected File userImage;
	
	/** The address. */
	protected Address address;
	
	/** The address bo. */
	protected BoAddress addressBo;
	
	/** The check address. */
	protected boolean checkAddress;
	
	/** The personrole. */
	protected Partyrole[] personrole=Partyrole.values();
	
	/** The party role. */
	protected PartyRole partyRole;
	
	/** The code role. */
	protected String codeRole;
	
	/** The ethnicitie list. */
	protected Ethnicity[] ethnicitieList=Ethnicity.values();
	
	/** The photo. */
	protected String photo;
	
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
	 * Gets the person id.
	 *
	 * @return the personId
	 */
	public Long getPersonId() {
		return personId;
	}
	
	/**
	 * Sets the person id.
	 *
	 * @param personId the personId to set
	 */
	public void setPersonId(Long personId) {
		this.personId = personId;
	}
	
	/**
	 * Gets the person bo.
	 *
	 * @return the personBo
	 */
	public BoPerson getPersonBo() {
		if(person!=null && personBo==null){
			personBo=new BoPerson(person, getLocale());
		}
		return personBo;
	}
	
	/**
	 * Sets the person bo.
	 *
	 * @param personBo the personBo to set
	 */
	public void setPersonBo(BoPerson personBo) {
		this.personBo = personBo;
	}
	
	/**
	 * Gets the user image.
	 *
	 * @return the userImage
	 */
	public File getUserImage() {
		return userImage;
	}
	
	/**
	 * Sets the user image.
	 *
	 * @param userImage the userImage to set
	 */
	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}
	
	/**
	 * Gets the address.
	 *
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}
	
	/**
	 * Sets the address.
	 *
	 * @param address the address to set
	 */
	public void setAddress(Address address) {
		this.address = address;
	}
	
	/**
	 * Gets the address bo.
	 *
	 * @return the addressBo
	 */
	public BoAddress getAddressBo() {
		if(address!=null && addressBo==null)
			addressBo=new BoAddress(address, getLocale());
		return addressBo;
	}
	
	/**
	 * Sets the address bo.
	 *
	 * @param addressBo the addressBo to set
	 */
	public void setAddressBo(BoAddress addressBo) {
		this.addressBo = addressBo;
	}
	
	/**
	 * Checks if is check address.
	 *
	 * @return the checkAddress
	 */
	public boolean isCheckAddress() {
		return checkAddress;
	}
	
	/**
	 * Sets the check address.
	 *
	 * @param checkAddress the checkAddress to set
	 */
	public void setCheckAddress(boolean checkAddress) {
		this.checkAddress = checkAddress;
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
	 * Gets the personrole.
	 *
	 * @return the personrole
	 */
	public Partyrole[] getPersonrole() {
		return personrole;
	}
	
	/**
	 * Sets the personrole.
	 *
	 * @param personrole the new personrole
	 */
	public void setPersonrole(Partyrole[] personrole) {
		this.personrole = personrole;
	}
	
	/**
	 * Gets the party role.
	 *
	 * @return the party role
	 */
	public PartyRole getPartyRole() {
		return partyRole;
	}
	
	/**
	 * Sets the party role.
	 *
	 * @param partyRole the new party role
	 */
	public void setPartyRole(PartyRole partyRole) {
		this.partyRole = partyRole;
	}
	
	/**
	 * Gets the code role.
	 *
	 * @return the code role
	 */
	public String getCodeRole() {
		return codeRole;
	}
	
	/**
	 * Sets the code role.
	 *
	 * @param codeRole the new code role
	 */
	public void setCodeRole(String codeRole) {
		this.codeRole = codeRole;
	}
	
	/**
	 * Gets the ethnicitie list.
	 *
	 * @return the ethnicitie list
	 */
	public Ethnicity[] getEthnicitieList() {
		return ethnicitieList;
	}
	
	/**
	 * Sets the ethnicitie list.
	 *
	 * @param ethnicitieList the new ethnicitie list
	 */
	public void setEthnicitieList(Ethnicity[] ethnicitieList) {
		this.ethnicitieList = ethnicitieList;
	}
	
	/**
	 * Gets the photo.
	 *
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	
	/**
	 * Sets the photo.
	 *
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
