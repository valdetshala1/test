package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.geoland.framework.persistence.base.AbstractPersistentObject;

// TODO: Auto-generated Javadoc
/**
 * Party generated by hbm2java.
 */
@Entity
@Table(name = "tparty", schema = "public")
@Inheritance(strategy = InheritanceType.JOINED)
public class Party extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	protected Long id;
	
	/** The address. */
	private Address address;
	
	/** The party type. */
	//private Partytype partyType;
	private String partyType;
	
	/** The active. */
	//private Date createdDate;
	private Boolean active;
	
	/** The party roles. */
	private Set<PartyRole> partyRoles = new HashSet<PartyRole>(0);
	
	/**
	 * Instantiates a new party.
	 */
	public Party() {
	}

	/**
	 * Instantiates a new party.
	 *
	 * @param partyType the party type
	 */
	public Party(String partyType) {
		this.partyType = partyType;
		//this.createdDate = createdDate;
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
	 * Gets the address.
	 *
	 * @return the address
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "address_id")
	public Address getAddress() {
		return this.address;
	}

	/**
	 * Sets the address.
	 *
	 * @param address the new address
	 */
	public void setAddress(Address address) {
		this.address = address;
	}

	/*
	@Column(name = "party_type", nullable = false, length = 1)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.PartytypeUserType")
	public Partytype getPartyType() {
		return this.partyType;
	}

	public void setPartyType(Partytype partyType) {
		this.partyType = partyType;
	}
	*/
	
	/**
	 * Gets the party type.
	 *
	 * @return the party type
	 */
	@Column(name = "party_type", nullable = false, length = 1)
	public String getPartyType() {
		return this.partyType;
	}

	/**
	 * Sets the party type.
	 *
	 * @param partyType the new party type
	 */
	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}	

	/*
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", nullable = false, length = 29)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	*/
	
	/**
	 * Gets the party roles.
	 *
	 * @return the party roles
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "party")
	public Set<PartyRole> getPartyRoles() {
		return this.partyRoles;
	}

	/**
	 * Sets the party roles.
	 *
	 * @param partyRoles the new party roles
	 */
	public void setPartyRoles(Set<PartyRole> partyRoles) {
		this.partyRoles = partyRoles;
	}

	/**
	 * Gets the active.
	 *
	 * @return the active
	 */
	public Boolean getActive() {
		return active;
	}

	/**
	 * Sets the active.
	 *
	 * @param active the new active
	 */
	public void setActive(Boolean active) {
		this.active = active;
	}	

}
