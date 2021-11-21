package com.geoland.kfis.web.action.adm.forestowner;

import java.io.File;
import java.util.List;

import com.geoland.framework.logic.BoUser;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.UserPassword;
import com.geoland.kfis.logic.adm.address.BoAddress;
import com.geoland.kfis.logic.adm.person.BoPerson;
import com.geoland.kfis.model.Address;
import com.geoland.kfis.model.PartyUser;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.hibernate.usertypes.Ethnicity;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ForestOwnerBaseAction.
 */
public class ForestOwnerBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The persforestowner. */
	protected Person persforestowner;
	
	/** The person bo. */
	protected BoPerson personBo;
	
	/** The persforestowner id. */
	protected Long persforestownerId;
	
	/** The user image. */
	protected File userImage;
	
	/** The address. */
	protected Address address;
	
	/** The address bo. */
	protected BoAddress addressBo;
	
	/** The check address. */
	protected boolean checkAddress;
	
	/** The bo user. */
	protected BoUser boUser;
	
	/** The user id. */
	protected Long userId;
	
	/** The this user. */
	protected User thisUser;
	
	/** The username exists. */
	protected List<User> usernameExists;
	
	/** The user password. */
	protected UserPassword userPassword;
	
	/** The reset password. */
	protected boolean resetPassword;
	
	/** The password repeat. */
	protected String passwordRepeat;
	
	/** The party user. */
	protected PartyUser partyUser;
	
	/** The ethnicitie list. */
	protected Ethnicity[] ethnicitieList=Ethnicity.values();
	
	/**
	 * Gets the persforestowner.
	 *
	 * @return the persforestowner
	 */
	public Person getPersforestowner() {
		return persforestowner;
	}
	
	/**
	 * Sets the persforestowner.
	 *
	 * @param persforestowner the new persforestowner
	 */
	public void setPersforestowner(Person persforestowner) {
		this.persforestowner = persforestowner;
	}

	/**
	 * Gets the person bo.
	 *
	 * @return the personBo
	 */
	public BoPerson getPersonBo() {
		if(persforestowner!=null && personBo==null){
			personBo=new BoPerson(persforestowner, getLocale());
		}
		return personBo;
	}
	
	/**
	 * Sets the person bo.
	 *
	 * @param personBo the new person bo
	 */
	public void setPersonBo(BoPerson personBo) {
		this.personBo = personBo;
	}
	
	/**
	 * Gets the persforestowner id.
	 *
	 * @return the persforestowner id
	 */
	public Long getPersforestownerId() {
		return persforestownerId;
	}
	
	/**
	 * Sets the persforestowner id.
	 *
	 * @param persforestownerId the new persforestowner id
	 */
	public void setPersforestownerId(Long persforestownerId) {
		this.persforestownerId = persforestownerId;
	}
	
	/**
	 * Gets the user image.
	 *
	 * @return the user image
	 */
	public File getUserImage() {
		return userImage;
	}
	
	/**
	 * Sets the user image.
	 *
	 * @param userImage the new user image
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
	 * @param address the new address
	 */
	public void setAddress(Address address) {
		this.address = address;
	}
	
	/**
	 * Gets the address bo.
	 *
	 * @return the address bo
	 */
	public BoAddress getAddressBo() {
		if(address!=null && addressBo==null)
			addressBo=new BoAddress(address, getLocale());
		return addressBo;
	}
	
	/**
	 * Sets the address bo.
	 *
	 * @param addressBo the new address bo
	 */
	public void setAddressBo(BoAddress addressBo) {
		this.addressBo = addressBo;
	}
	
	/**
	 * Checks if is check address.
	 *
	 * @return true, if is check address
	 */
	public boolean isCheckAddress() {
		return checkAddress;
	}
	
	/**
	 * Sets the check address.
	 *
	 * @param checkAddress the new check address
	 */
	public void setCheckAddress(boolean checkAddress) {
		this.checkAddress = checkAddress;
	}
	
	/**
	 * Gets the bo user.
	 *
	 * @return the bo user
	 */
	public BoUser getBoUser() {
		return boUser;
	}
	
	/**
	 * Sets the bo user.
	 *
	 * @param boUser the new bo user
	 */
	public void setBoUser(BoUser boUser) {
		this.boUser = boUser;
	}
	
	/**
	 * Gets the user id.
	 *
	 * @return the user id
	 */
	public Long getUserId() {
		return userId;
	}
	
	/**
	 * Sets the user id.
	 *
	 * @param userId the new user id
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	/**
	 * Gets the this user.
	 *
	 * @return the this user
	 */
	public User getThisUser() {
		return thisUser;
	}
	
	/**
	 * Sets the this user.
	 *
	 * @param thisUser the new this user
	 */
	public void setThisUser(User thisUser) {
		this.thisUser = thisUser;
	}
	
	/**
	 * Gets the username exists.
	 *
	 * @return the username exists
	 */
	public List<User> getUsernameExists() {
		return usernameExists;
	}
	
	/**
	 * Sets the username exists.
	 *
	 * @param usernameExists the new username exists
	 */
	public void setUsernameExists(List<User> usernameExists) {
		this.usernameExists = usernameExists;
	}
	
	/**
	 * Gets the user password.
	 *
	 * @return the user password
	 */
	public UserPassword getUserPassword() {
		return userPassword;
	}
	
	/**
	 * Sets the user password.
	 *
	 * @param userPassword the new user password
	 */
	public void setUserPassword(UserPassword userPassword) {
		this.userPassword = userPassword;
	}
	
	/**
	 * Checks if is reset password.
	 *
	 * @return true, if is reset password
	 */
	public boolean isResetPassword() {
		return resetPassword;
	}
	
	/**
	 * Sets the reset password.
	 *
	 * @param resetPassword the new reset password
	 */
	public void setResetPassword(boolean resetPassword) {
		this.resetPassword = resetPassword;
	}
	
	/**
	 * Gets the password repeat.
	 *
	 * @return the password repeat
	 */
	public String getPasswordRepeat() {
		return passwordRepeat;
	}
	
	/**
	 * Sets the password repeat.
	 *
	 * @param passwordRepeat the new password repeat
	 */
	public void setPasswordRepeat(String passwordRepeat) {
		this.passwordRepeat = passwordRepeat;
	}
	
	/**
	 * Gets the party user.
	 *
	 * @return the party user
	 */
	public PartyUser getPartyUser() {
		return partyUser;
	}
	
	/**
	 * Sets the party user.
	 *
	 * @param partyUser the new party user
	 */
	public void setPartyUser(PartyUser partyUser) {
		this.partyUser = partyUser;
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
}
