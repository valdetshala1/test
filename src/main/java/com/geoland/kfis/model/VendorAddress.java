package com.geoland.kfis.model;

// Generated Jan 20, 2015 9:31:40 AM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * VendorAddress generated by hbm2java.
 */
@Entity
@Table(name = "tvendor_address", schema = "public")
public class VendorAddress extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The vendor id. */
	private Long vendorId;
	
	/** The sequence number. */
	private Long sequenceNumber;
	
	/** The address text. */
	private String addressText;
	
	/** The city name. */
	private String cityName;
	
	/** The state code. */
	private String stateCode;
	
	/** The postal code. */
	private String postalCode;
	
	/** The phone number. */
	private String phoneNumber;
	
	/** The mobile number. */
	private String mobileNumber;
	
	/** The fax number. */
	private String faxNumber;
	
	/** The email. */
	private String email;
	
	/** The change date. */
	private Date changeDate;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new vendor address.
	 */
	public VendorAddress() {
	}

	/**
	 * Instantiates a new vendor address.
	 *
	 * @param employee the employee
	 * @param vendorId the vendor id
	 * @param sequenceNumber the sequence number
	 * @param addressText the address text
	 * @param cityName the city name
	 * @param changeDate the change date
	 * @param createdDate the created date
	 */
	public VendorAddress(Employee employee, Long vendorId, Long sequenceNumber,
			String addressText, String cityName, Date changeDate,
			Date createdDate) {
		this.employee = employee;
		this.vendorId = vendorId;
		this.sequenceNumber = sequenceNumber;
		this.addressText = addressText;
		this.cityName = cityName;
		this.changeDate = changeDate;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new vendor address.
	 *
	 * @param employee the employee
	 * @param vendorId the vendor id
	 * @param sequenceNumber the sequence number
	 * @param addressText the address text
	 * @param cityName the city name
	 * @param stateCode the state code
	 * @param postalCode the postal code
	 * @param phoneNumber the phone number
	 * @param mobileNumber the mobile number
	 * @param faxNumber the fax number
	 * @param email the email
	 * @param changeDate the change date
	 * @param createdDate the created date
	 */
	public VendorAddress(Employee employee, Long vendorId, Long sequenceNumber,
			String addressText, String cityName, String stateCode,
			String postalCode, String phoneNumber, String mobileNumber,
			String faxNumber, String email, Date changeDate, Date createdDate) {
		this.employee = employee;
		this.vendorId = vendorId;
		this.sequenceNumber = sequenceNumber;
		this.addressText = addressText;
		this.cityName = cityName;
		this.stateCode = stateCode;
		this.postalCode = postalCode;
		this.phoneNumber = phoneNumber;
		this.mobileNumber = mobileNumber;
		this.faxNumber = faxNumber;
		this.email = email;
		this.changeDate = changeDate;
		this.createdDate = createdDate;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.base.AbstractPersistentObject#getId()
	 */
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.base.AbstractPersistentObject#setId(java.lang.Long)
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Employee getEmployee() {
		return this.employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	/**
	 * Gets the vendor id.
	 *
	 * @return the vendor id
	 */
	@Column(name = "vendor_id", nullable = false)
	public Long getVendorId() {
		return this.vendorId;
	}

	/**
	 * Sets the vendor id.
	 *
	 * @param vendorId the new vendor id
	 */
	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}

	/**
	 * Gets the sequence number.
	 *
	 * @return the sequence number
	 */
	@Column(name = "sequence_number", nullable = false)
	public Long getSequenceNumber() {
		return this.sequenceNumber;
	}

	/**
	 * Sets the sequence number.
	 *
	 * @param sequenceNumber the new sequence number
	 */
	public void setSequenceNumber(Long sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}

	/**
	 * Gets the address text.
	 *
	 * @return the address text
	 */
	@Column(name = "address_text", nullable = false, length = 150)
	public String getAddressText() {
		return this.addressText;
	}

	/**
	 * Sets the address text.
	 *
	 * @param addressText the new address text
	 */
	public void setAddressText(String addressText) {
		this.addressText = addressText;
	}

	/**
	 * Gets the city name.
	 *
	 * @return the city name
	 */
	@Column(name = "city_name", nullable = false, length = 50)
	public String getCityName() {
		return this.cityName;
	}

	/**
	 * Sets the city name.
	 *
	 * @param cityName the new city name
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	/**
	 * Gets the state code.
	 *
	 * @return the state code
	 */
	@Column(name = "state_code", length = 50)
	public String getStateCode() {
		return this.stateCode;
	}

	/**
	 * Sets the state code.
	 *
	 * @param stateCode the new state code
	 */
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	/**
	 * Gets the postal code.
	 *
	 * @return the postal code
	 */
	@Column(name = "postal_code", length = 20)
	public String getPostalCode() {
		return this.postalCode;
	}

	/**
	 * Sets the postal code.
	 *
	 * @param postalCode the new postal code
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	/**
	 * Gets the phone number.
	 *
	 * @return the phone number
	 */
	@Column(name = "phone_number", length = 50)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	/**
	 * Sets the phone number.
	 *
	 * @param phoneNumber the new phone number
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * Gets the mobile number.
	 *
	 * @return the mobile number
	 */
	@Column(name = "mobile_number", length = 50)
	public String getMobileNumber() {
		return this.mobileNumber;
	}

	/**
	 * Sets the mobile number.
	 *
	 * @param mobileNumber the new mobile number
	 */
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	/**
	 * Gets the fax number.
	 *
	 * @return the fax number
	 */
	@Column(name = "fax_number", length = 50)
	public String getFaxNumber() {
		return this.faxNumber;
	}

	/**
	 * Sets the fax number.
	 *
	 * @param faxNumber the new fax number
	 */
	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	/**
	 * Gets the email.
	 *
	 * @return the email
	 */
	@Column(name = "email", length = 150)
	public String getEmail() {
		return this.email;
	}

	/**
	 * Sets the email.
	 *
	 * @param email the new email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * Gets the change date.
	 *
	 * @return the change date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "change_date", nullable = false, length = 29)
	public Date getChangeDate() {
		return this.changeDate;
	}

	/**
	 * Sets the change date.
	 *
	 * @param changeDate the new change date
	 */
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	/**
	 * Gets the created date.
	 *
	 * @return the created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", nullable = false, length = 29)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	/**
	 * Sets the created date.
	 *
	 * @param createdDate the new created date
	 */
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}
