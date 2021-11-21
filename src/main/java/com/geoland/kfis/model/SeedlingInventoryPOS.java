package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import com.geoland.kfis.persistence.hibernate.usertypes.Prodtype;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * SeedlingInventoryPOS generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_seedling_inventory_pos", schema = "public")
public class SeedlingInventoryPOS extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The person by created by. */
	private Person personByCreatedBy;
	
	/** The person by approved by. */
	private Person personByApprovedBy;
	
	/** The tree species. */
	private TreeSpecies treeSpecies;
	
	/** The person by changed by. */
	private Person personByChangedBy;
	
	/** The seedling inventory. */
	private SeedlingInventory seedlingInventory;
	
	/** The prod type. */
	private Prodtype prodType;
	
	/** The age. */
	private Short age;
	
	/** The quantity. */
	private BigDecimal quantity;
	
	/** The created date. */
	private Date createdDate;
	
	/** The note. */
	private String note;
	
	/** The changed date. */
	private Date changedDate;
	
	/** The isapproved. */
	private String isapproved;
	
	/** The approved date. */
	private Date approvedDate;
	
	/** The isdelivered. */
	private String isdelivered;
	
	/** The pickup date. */
	private Date pickupDate;
	
	/** The pickup contact. */
	private String pickupContact;
	
	/** The stand planting activities. */
	private Set<StandPlantingActivity> standPlantingActivities = new HashSet<StandPlantingActivity>(
			0);

	/**
	 * Instantiates a new seedling inventory POS.
	 */
	public SeedlingInventoryPOS() {
	}

	/**
	 * Instantiates a new seedling inventory POS.
	 *
	 * @param personByCreatedBy the person by created by
	 * @param treeSpecies the tree species
	 * @param seedlingInventory the seedling inventory
	 * @param age the age
	 * @param quantity the quantity
	 * @param createdDate the created date
	 * @param isapproved the isapproved
	 * @param isdelivered the isdelivered
	 */
	public SeedlingInventoryPOS(Person personByCreatedBy,
			TreeSpecies treeSpecies, SeedlingInventory seedlingInventory,
			Short age, BigDecimal quantity, Date createdDate,
			String isapproved, String isdelivered) {
		this.personByCreatedBy = personByCreatedBy;
		this.treeSpecies = treeSpecies;
		this.seedlingInventory = seedlingInventory;
		this.age = age;
		this.quantity = quantity;
		this.createdDate = createdDate;
		this.isapproved = isapproved;
		this.isdelivered = isdelivered;
	}

	/**
	 * Instantiates a new seedling inventory POS.
	 *
	 * @param personByCreatedBy the person by created by
	 * @param personByApprovedBy the person by approved by
	 * @param treeSpecies the tree species
	 * @param personByChangedBy the person by changed by
	 * @param seedlingInventory the seedling inventory
	 * @param prodType the prod type
	 * @param age the age
	 * @param quantity the quantity
	 * @param createdDate the created date
	 * @param note the note
	 * @param changedDate the changed date
	 * @param isapproved the isapproved
	 * @param approvedDate the approved date
	 * @param isdelivered the isdelivered
	 * @param pickupDate the pickup date
	 * @param pickupContact the pickup contact
	 * @param standPlantingActivities the stand planting activities
	 */
	public SeedlingInventoryPOS(Person personByCreatedBy,
			Person personByApprovedBy, TreeSpecies treeSpecies,
			Person personByChangedBy, SeedlingInventory seedlingInventory,
			Prodtype prodType, Short age, BigDecimal quantity,
			Date createdDate, String note, Date changedDate, String isapproved,
			Date approvedDate, String isdelivered, Date pickupDate,
			String pickupContact,
			Set<StandPlantingActivity> standPlantingActivities) {
		this.personByCreatedBy = personByCreatedBy;
		this.personByApprovedBy = personByApprovedBy;
		this.treeSpecies = treeSpecies;
		this.personByChangedBy = personByChangedBy;
		this.seedlingInventory = seedlingInventory;
		this.prodType = prodType;
		this.age = age;
		this.quantity = quantity;
		this.createdDate = createdDate;
		this.note = note;
		this.changedDate = changedDate;
		this.isapproved = isapproved;
		this.approvedDate = approvedDate;
		this.isdelivered = isdelivered;
		this.pickupDate = pickupDate;
		this.pickupContact = pickupContact;
		this.standPlantingActivities = standPlantingActivities;
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
	 * Gets the person by created by.
	 *
	 * @return the person by created by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Person getPersonByCreatedBy() {
		return this.personByCreatedBy;
	}

	/**
	 * Sets the person by created by.
	 *
	 * @param personByCreatedBy the new person by created by
	 */
	public void setPersonByCreatedBy(Person personByCreatedBy) {
		this.personByCreatedBy = personByCreatedBy;
	}

	/**
	 * Gets the person by approved by.
	 *
	 * @return the person by approved by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "approved_by")
	public Person getPersonByApprovedBy() {
		return this.personByApprovedBy;
	}

	/**
	 * Sets the person by approved by.
	 *
	 * @param personByApprovedBy the new person by approved by
	 */
	public void setPersonByApprovedBy(Person personByApprovedBy) {
		this.personByApprovedBy = personByApprovedBy;
	}

	/**
	 * Gets the tree species.
	 *
	 * @return the tree species
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tree_species_id", nullable = false)
	public TreeSpecies getTreeSpecies() {
		return this.treeSpecies;
	}

	/**
	 * Sets the tree species.
	 *
	 * @param treeSpecies the new tree species
	 */
	public void setTreeSpecies(TreeSpecies treeSpecies) {
		this.treeSpecies = treeSpecies;
	}

	/**
	 * Gets the person by changed by.
	 *
	 * @return the person by changed by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "changed_by")
	public Person getPersonByChangedBy() {
		return this.personByChangedBy;
	}

	/**
	 * Sets the person by changed by.
	 *
	 * @param personByChangedBy the new person by changed by
	 */
	public void setPersonByChangedBy(Person personByChangedBy) {
		this.personByChangedBy = personByChangedBy;
	}

	/**
	 * Gets the seedling inventory.
	 *
	 * @return the seedling inventory
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "inventory_id", nullable = false)
	public SeedlingInventory getSeedlingInventory() {
		return this.seedlingInventory;
	}

	/**
	 * Sets the seedling inventory.
	 *
	 * @param seedlingInventory the new seedling inventory
	 */
	public void setSeedlingInventory(SeedlingInventory seedlingInventory) {
		this.seedlingInventory = seedlingInventory;
	}

	/**
	 * Gets the prod type.
	 *
	 * @return the prod type
	 */
	@Column(name = "prod_type", length = 50)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.ProdtypeUserType")
	public Prodtype getProdType() {
		return this.prodType;
	}

	/**
	 * Sets the prod type.
	 *
	 * @param prodType the new prod type
	 */
	public void setProdType(Prodtype prodType) {
		this.prodType = prodType;
	}

	/**
	 * Gets the age.
	 *
	 * @return the age
	 */
	@Column(name = "age", nullable = false)
	public Short getAge() {
		return this.age;
	}

	/**
	 * Sets the age.
	 *
	 * @param age the new age
	 */
	public void setAge(Short age) {
		this.age = age;
	}

	/**
	 * Gets the quantity.
	 *
	 * @return the quantity
	 */
	@Column(name = "quantity", nullable = false, precision = 10, scale = 0)
	public BigDecimal getQuantity() {
		return this.quantity;
	}

	/**
	 * Sets the quantity.
	 *
	 * @param quantity the new quantity
	 */
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
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

	/**
	 * Gets the note.
	 *
	 * @return the note
	 */
	@Column(name = "note")
	public String getNote() {
		return this.note;
	}

	/**
	 * Sets the note.
	 *
	 * @param note the new note
	 */
	public void setNote(String note) {
		this.note = note;
	}

	/**
	 * Gets the changed date.
	 *
	 * @return the changed date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "changed_date", length = 29)
	public Date getChangedDate() {
		return this.changedDate;
	}

	/**
	 * Sets the changed date.
	 *
	 * @param changedDate the new changed date
	 */
	public void setChangedDate(Date changedDate) {
		this.changedDate = changedDate;
	}

	/**
	 * Gets the isapproved.
	 *
	 * @return the isapproved
	 */
	@Column(name = "isapproved", nullable = false, length = 1)
	public String getIsapproved() {
		return this.isapproved;
	}

	/**
	 * Sets the isapproved.
	 *
	 * @param isapproved the new isapproved
	 */
	public void setIsapproved(String isapproved) {
		this.isapproved = isapproved;
	}

	/**
	 * Gets the approved date.
	 *
	 * @return the approved date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "approved_date", length = 29)
	public Date getApprovedDate() {
		return this.approvedDate;
	}

	/**
	 * Sets the approved date.
	 *
	 * @param approvedDate the new approved date
	 */
	public void setApprovedDate(Date approvedDate) {
		this.approvedDate = approvedDate;
	}

	/**
	 * Gets the isdelivered.
	 *
	 * @return the isdelivered
	 */
	@Column(name = "isdelivered", nullable = false, length = 1)
	public String getIsdelivered() {
		return this.isdelivered;
	}

	/**
	 * Sets the isdelivered.
	 *
	 * @param isdelivered the new isdelivered
	 */
	public void setIsdelivered(String isdelivered) {
		this.isdelivered = isdelivered;
	}

	/**
	 * Gets the pickup date.
	 *
	 * @return the pickup date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pickup_date", length = 29)
	public Date getPickupDate() {
		return this.pickupDate;
	}

	/**
	 * Sets the pickup date.
	 *
	 * @param pickupDate the new pickup date
	 */
	public void setPickupDate(Date pickupDate) {
		this.pickupDate = pickupDate;
	}

	/**
	 * Gets the pickup contact.
	 *
	 * @return the pickup contact
	 */
	@Column(name = "pickup_contact")
	public String getPickupContact() {
		return this.pickupContact;
	}

	/**
	 * Sets the pickup contact.
	 *
	 * @param pickupContact the new pickup contact
	 */
	public void setPickupContact(String pickupContact) {
		this.pickupContact = pickupContact;
	}

	/**
	 * Gets the stand planting activities.
	 *
	 * @return the stand planting activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "seedlingInventoryPOS")
	public Set<StandPlantingActivity> getStandPlantingActivities() {
		return this.standPlantingActivities;
	}

	/**
	 * Sets the stand planting activities.
	 *
	 * @param standPlantingActivities the new stand planting activities
	 */
	public void setStandPlantingActivities(
			Set<StandPlantingActivity> standPlantingActivities) {
		this.standPlantingActivities = standPlantingActivities;
	}

}
