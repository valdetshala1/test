package com.geoland.kfis.model;

// Generated Jan 15, 2016 10:41:39 AM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * ParcelOwner generated by hbm2java.
 */
@Entity
@Table(name = "tparcel_owner", schema = "public")
public class ParcelOwner extends AbstractPersistentObject implements
		java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The cadposslist. */
	private String cadposslist;
	
	/** The cadzone. */
	private Long cadzone;
	
	/** The ownerid. */
	private String ownerid;
	
	/** The owner up. */
	private String ownerUp;
	
	/** The livingplace. */
	private String livingplace;
	
	/** The street. */
	private String street;
	
	/** The housenr. */
	private String housenr;
	
	/** The partsn. */
	private String partsn;
	
	/** The pers stat. */
	private String persStat;
	
	/** The pc. */
	private Short pc;
	
	/** The parcel details. */
	private Set<ParcelDetail> parcelDetails = new HashSet<ParcelDetail>(0);

	/**
	 * Instantiates a new parcel owner.
	 */
	public ParcelOwner() {
	}

	/**
	 * Instantiates a new parcel owner.
	 *
	 * @param cadposslist the cadposslist
	 * @param cadzone the cadzone
	 * @param ownerid the ownerid
	 * @param ownerUp the owner up
	 * @param livingplace the livingplace
	 * @param street the street
	 * @param housenr the housenr
	 * @param partsn the partsn
	 * @param persStat the pers stat
	 * @param pc the pc
	 * @param parcelDetails the parcel details
	 */
	public ParcelOwner(String cadposslist, Long cadzone, String ownerid,
			String ownerUp, String livingplace, String street, String housenr,
			String partsn, String persStat, Short pc,
			Set<ParcelDetail> parcelDetails) {
		this.cadposslist = cadposslist;
		this.cadzone = cadzone;
		this.ownerid = ownerid;
		this.ownerUp = ownerUp;
		this.livingplace = livingplace;
		this.street = street;
		this.housenr = housenr;
		this.partsn = partsn;
		this.persStat = persStat;
		this.pc = pc;
		this.parcelDetails = parcelDetails;
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
	 * Gets the cadposslist.
	 *
	 * @return the cadposslist
	 */
	@Column(name = "cadposslist", length = 20)
	public String getCadposslist() {
		return this.cadposslist;
	}

	/**
	 * Sets the cadposslist.
	 *
	 * @param cadposslist the new cadposslist
	 */
	public void setCadposslist(String cadposslist) {
		this.cadposslist = cadposslist;
	}

	/**
	 * Gets the cadzone.
	 *
	 * @return the cadzone
	 */
	@Column(name = "cadzone")
	public Long getCadzone() {
		return this.cadzone;
	}

	/**
	 * Sets the cadzone.
	 *
	 * @param cadzone the new cadzone
	 */
	public void setCadzone(Long cadzone) {
		this.cadzone = cadzone;
	}

	/**
	 * Gets the ownerid.
	 *
	 * @return the ownerid
	 */
	@Column(name = "ownerid", length = 15)
	public String getOwnerid() {
		return this.ownerid;
	}

	/**
	 * Sets the ownerid.
	 *
	 * @param ownerid the new ownerid
	 */
	public void setOwnerid(String ownerid) {
		this.ownerid = ownerid;
	}

	/**
	 * Gets the owner up.
	 *
	 * @return the owner up
	 */
	@Column(name = "owner_up", length = 150)
	public String getOwnerUp() {
		return this.ownerUp;
	}

	/**
	 * Sets the owner up.
	 *
	 * @param ownerUp the new owner up
	 */
	public void setOwnerUp(String ownerUp) {
		this.ownerUp = ownerUp;
	}

	/**
	 * Gets the livingplace.
	 *
	 * @return the livingplace
	 */
	@Column(name = "livingplace")
	public String getLivingplace() {
		return this.livingplace;
	}

	/**
	 * Sets the livingplace.
	 *
	 * @param livingplace the new livingplace
	 */
	public void setLivingplace(String livingplace) {
		this.livingplace = livingplace;
	}

	/**
	 * Gets the street.
	 *
	 * @return the street
	 */
	@Column(name = "street", length = 150)
	public String getStreet() {
		return this.street;
	}

	/**
	 * Sets the street.
	 *
	 * @param street the new street
	 */
	public void setStreet(String street) {
		this.street = street;
	}

	/**
	 * Gets the housenr.
	 *
	 * @return the housenr
	 */
	@Column(name = "housenr", length = 4)
	public String getHousenr() {
		return this.housenr;
	}

	/**
	 * Sets the housenr.
	 *
	 * @param housenr the new housenr
	 */
	public void setHousenr(String housenr) {
		this.housenr = housenr;
	}

	/**
	 * Gets the partsn.
	 *
	 * @return the partsn
	 */
	@Column(name = "partsn")
	public String getPartsn() {
		return this.partsn;
	}

	/**
	 * Sets the partsn.
	 *
	 * @param partsn the new partsn
	 */
	public void setPartsn(String partsn) {
		this.partsn = partsn;
	}

	/**
	 * Gets the pers stat.
	 *
	 * @return the pers stat
	 */
	@Column(name = "pers_stat", length = 250)
	public String getPersStat() {
		return this.persStat;
	}

	/**
	 * Sets the pers stat.
	 *
	 * @param persStat the new pers stat
	 */
	public void setPersStat(String persStat) {
		this.persStat = persStat;
	}

	/**
	 * Gets the pc.
	 *
	 * @return the pc
	 */
	@Column(name = "pc")
	public Short getPc() {
		return this.pc;
	}

	/**
	 * Sets the pc.
	 *
	 * @param pc the new pc
	 */
	public void setPc(Short pc) {
		this.pc = pc;
	}

	/**
	 * Gets the parcel details.
	 *
	 * @return the parcel details
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parcelOwner")
	public Set<ParcelDetail> getParcelDetails() {
		return this.parcelDetails;
	}

	/**
	 * Sets the parcel details.
	 *
	 * @param parcelDetails the new parcel details
	 */
	public void setParcelDetails(Set<ParcelDetail> parcelDetails) {
		this.parcelDetails = parcelDetails;
	}

}
