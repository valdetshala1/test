package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import com.geoland.kfis.persistence.hibernate.usertypes.Prodtype;
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
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * SeedActivity generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_seed_activity", schema = "public", uniqueConstraints = @UniqueConstraint(columnNames = {
		"year", "prod_type", "tree_species_id" }))
public class SeedActivity extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The person by pr created by. */
	private Person personByPrCreatedBy;
	
	/** The person by pl created by. */
	private Person personByPlCreatedBy;
	
	/** The tree species. */
	private TreeSpecies treeSpecies;
	
	/** The activity status. */
	private ActivityStatus activityStatus;
	
	/** The person by im created by. */
	private Person personByImCreatedBy;
	
	/** The activity. */
	private Activity activity;
	
	/** The institute. */
	private String institute;
	
	/** The year. */
	private Short year;
	
	/** The prod type. */
	private Prodtype prodType;
	
	/** The work stage. */
	private String workStage;
	
	/** The pr value. */
	private Long prValue;
	
	/** The pl value. */
	private Long plValue;
	
	/** The ex value. */
	private Long exValue;
	
	/** The im value. */
	private Long imValue;
	
	/** The pr created date. */
	private Date prCreatedDate;
	
	/** The pl created date. */
	private Date plCreatedDate;
	
	/** The im created date. */
	private Date imCreatedDate;
	
	/** The seedling inventories. */
	private Set<SeedlingInventory> seedlingInventories = new HashSet<SeedlingInventory>(
			0);

	/**
	 * Instantiates a new seed activity.
	 */
	public SeedActivity() {
	}

	/**
	 * Instantiates a new seed activity.
	 *
	 * @param treeSpecies the tree species
	 * @param activityStatus the activity status
	 * @param activity the activity
	 * @param year the year
	 * @param prodType the prod type
	 * @param workStage the work stage
	 */
	public SeedActivity(TreeSpecies treeSpecies, ActivityStatus activityStatus,
			Activity activity, Short year, Prodtype prodType, String workStage) {
		this.treeSpecies = treeSpecies;
		this.activityStatus = activityStatus;
		this.activity = activity;
		this.year = year;
		this.prodType = prodType;
		this.workStage = workStage;
	}

	/**
	 * Instantiates a new seed activity.
	 *
	 * @param personByPrCreatedBy the person by pr created by
	 * @param personByPlCreatedBy the person by pl created by
	 * @param treeSpecies the tree species
	 * @param activityStatus the activity status
	 * @param personByImCreatedBy the person by im created by
	 * @param activity the activity
	 * @param institute the institute
	 * @param year the year
	 * @param prodType the prod type
	 * @param workStage the work stage
	 * @param prValue the pr value
	 * @param plValue the pl value
	 * @param exValue the ex value
	 * @param imValue the im value
	 * @param prCreatedDate the pr created date
	 * @param plCreatedDate the pl created date
	 * @param imCreatedDate the im created date
	 * @param seedlingInventories the seedling inventories
	 */
	public SeedActivity(Person personByPrCreatedBy, Person personByPlCreatedBy,
			TreeSpecies treeSpecies, ActivityStatus activityStatus,
			Person personByImCreatedBy, Activity activity, String institute,
			Short year, Prodtype prodType, String workStage, Long prValue,
			Long plValue, Long exValue, Long imValue, Date prCreatedDate,
			Date plCreatedDate, Date imCreatedDate,
			Set<SeedlingInventory> seedlingInventories) {
		this.personByPrCreatedBy = personByPrCreatedBy;
		this.personByPlCreatedBy = personByPlCreatedBy;
		this.treeSpecies = treeSpecies;
		this.activityStatus = activityStatus;
		this.personByImCreatedBy = personByImCreatedBy;
		this.activity = activity;
		this.institute = institute;
		this.year = year;
		this.prodType = prodType;
		this.workStage = workStage;
		this.prValue = prValue;
		this.plValue = plValue;
		this.exValue = exValue;
		this.imValue = imValue;
		this.prCreatedDate = prCreatedDate;
		this.plCreatedDate = plCreatedDate;
		this.imCreatedDate = imCreatedDate;
		this.seedlingInventories = seedlingInventories;
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
	 * Gets the person by pr created by.
	 *
	 * @return the person by pr created by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pr_created_by")
	public Person getPersonByPrCreatedBy() {
		return this.personByPrCreatedBy;
	}

	/**
	 * Sets the person by pr created by.
	 *
	 * @param personByPrCreatedBy the new person by pr created by
	 */
	public void setPersonByPrCreatedBy(Person personByPrCreatedBy) {
		this.personByPrCreatedBy = personByPrCreatedBy;
	}

	/**
	 * Gets the person by pl created by.
	 *
	 * @return the person by pl created by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pl_created_by")
	public Person getPersonByPlCreatedBy() {
		return this.personByPlCreatedBy;
	}

	/**
	 * Sets the person by pl created by.
	 *
	 * @param personByPlCreatedBy the new person by pl created by
	 */
	public void setPersonByPlCreatedBy(Person personByPlCreatedBy) {
		this.personByPlCreatedBy = personByPlCreatedBy;
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
	 * Gets the activity status.
	 *
	 * @return the activity status
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id", nullable = false)
	public ActivityStatus getActivityStatus() {
		return this.activityStatus;
	}

	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the new activity status
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}

	/**
	 * Gets the person by im created by.
	 *
	 * @return the person by im created by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "im_created_by")
	public Person getPersonByImCreatedBy() {
		return this.personByImCreatedBy;
	}

	/**
	 * Sets the person by im created by.
	 *
	 * @param personByImCreatedBy the new person by im created by
	 */
	public void setPersonByImCreatedBy(Person personByImCreatedBy) {
		this.personByImCreatedBy = personByImCreatedBy;
	}

	/**
	 * Gets the activity.
	 *
	 * @return the activity
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "activity_id", nullable = false)
	public Activity getActivity() {
		return this.activity;
	}

	/**
	 * Sets the activity.
	 *
	 * @param activity the new activity
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	/**
	 * Gets the institute.
	 *
	 * @return the institute
	 */
	@Column(name = "institute", length = 100)
	public String getInstitute() {
		return this.institute;
	}

	/**
	 * Sets the institute.
	 *
	 * @param institute the new institute
	 */
	public void setInstitute(String institute) {
		this.institute = institute;
	}

	/**
	 * Gets the year.
	 *
	 * @return the year
	 */
	@Column(name = "year", nullable = false)
	public Short getYear() {
		return this.year;
	}

	/**
	 * Sets the year.
	 *
	 * @param year the new year
	 */
	public void setYear(Short year) {
		this.year = year;
	}

	/**
	 * Gets the prod type.
	 *
	 * @return the prod type
	 */
	@Column(name = "prod_type", nullable = false, length = 50)
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
	 * Gets the work stage.
	 *
	 * @return the work stage
	 */
	@Column(name = "work_stage", nullable = false, length = 1)
	public String getWorkStage() {
		return this.workStage;
	}

	/**
	 * Sets the work stage.
	 *
	 * @param workStage the new work stage
	 */
	public void setWorkStage(String workStage) {
		this.workStage = workStage;
	}

	/**
	 * Gets the pr value.
	 *
	 * @return the pr value
	 */
	@Column(name = "pr_value")
	public Long getPrValue() {
		return this.prValue;
	}

	/**
	 * Sets the pr value.
	 *
	 * @param prValue the new pr value
	 */
	public void setPrValue(Long prValue) {
		this.prValue = prValue;
	}

	/**
	 * Gets the pl value.
	 *
	 * @return the pl value
	 */
	@Column(name = "pl_value")
	public Long getPlValue() {
		return this.plValue;
	}

	/**
	 * Sets the pl value.
	 *
	 * @param plValue the new pl value
	 */
	public void setPlValue(Long plValue) {
		this.plValue = plValue;
	}

	/**
	 * Gets the ex value.
	 *
	 * @return the ex value
	 */
	@Column(name = "ex_value")
	public Long getExValue() {
		return this.exValue;
	}

	/**
	 * Sets the ex value.
	 *
	 * @param exValue the new ex value
	 */
	public void setExValue(Long exValue) {
		this.exValue = exValue;
	}

	/**
	 * Gets the im value.
	 *
	 * @return the im value
	 */
	@Column(name = "im_value")
	public Long getImValue() {
		return this.imValue;
	}

	/**
	 * Sets the im value.
	 *
	 * @param imValue the new im value
	 */
	public void setImValue(Long imValue) {
		this.imValue = imValue;
	}

	/**
	 * Gets the pr created date.
	 *
	 * @return the pr created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pr_created_date", length = 29)
	public Date getPrCreatedDate() {
		return this.prCreatedDate;
	}

	/**
	 * Sets the pr created date.
	 *
	 * @param prCreatedDate the new pr created date
	 */
	public void setPrCreatedDate(Date prCreatedDate) {
		this.prCreatedDate = prCreatedDate;
	}

	/**
	 * Gets the pl created date.
	 *
	 * @return the pl created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pl_created_date", length = 29)
	public Date getPlCreatedDate() {
		return this.plCreatedDate;
	}

	/**
	 * Sets the pl created date.
	 *
	 * @param plCreatedDate the new pl created date
	 */
	public void setPlCreatedDate(Date plCreatedDate) {
		this.plCreatedDate = plCreatedDate;
	}

	/**
	 * Gets the im created date.
	 *
	 * @return the im created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "im_created_date", length = 29)
	public Date getImCreatedDate() {
		return this.imCreatedDate;
	}

	/**
	 * Sets the im created date.
	 *
	 * @param imCreatedDate the new im created date
	 */
	public void setImCreatedDate(Date imCreatedDate) {
		this.imCreatedDate = imCreatedDate;
	}

	/**
	 * Gets the seedling inventories.
	 *
	 * @return the seedling inventories
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "seedActivity")
	public Set<SeedlingInventory> getSeedlingInventories() {
		return this.seedlingInventories;
	}

	/**
	 * Sets the seedling inventories.
	 *
	 * @param seedlingInventories the new seedling inventories
	 */
	public void setSeedlingInventories(
			Set<SeedlingInventory> seedlingInventories) {
		this.seedlingInventories = seedlingInventories;
	}

}
