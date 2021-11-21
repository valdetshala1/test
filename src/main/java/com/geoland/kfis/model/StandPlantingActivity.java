package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import com.geoland.kfis.persistence.hibernate.usertypes.Prodtype;
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
 * StandPlantingActivity generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_stand_planting_activity", schema = "public")
public class StandPlantingActivity extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The stand. */
	private Stand stand;
	
	/** The person by pl created by. */
	private Person personByPlCreatedBy;
	
	/** The tree species. */
	private TreeSpecies treeSpecies;
	
	/** The contractor. */
	private Contractor contractor;
	
	/** The seedling inventory POS. */
	private SeedlingInventoryPOS seedlingInventoryPOS;
	
	/** The activity status. */
	private ActivityStatus activityStatus;
	
	/** The person by im created by. */
	private Person personByImCreatedBy;
	
	/** The activity. */
	private Activity activity;
	
	/** The prod type. */
	private Prodtype prodType;
	
	/** The work stage. */
	private String workStage;
	
	/** The seedling age. */
	private String seedlingAge;
	
	/** The pl area. */
	private Double plArea;
	
	/** The pl trees. */
	private Long plTrees;
	
	/** The pl created date. */
	private Date plCreatedDate;
	
	/** The im area. */
	private Double imArea;
	
	/** The im trees. */
	private Long imTrees;
	
	/** The im created date. */
	private Date imCreatedDate;
	
	/** The im contr assign date. */
	private Date imContrAssignDate;
	
	/** The im contr done date. */
	private Date imContrDoneDate;
	
	/** The im contr notes. */
	private String imContrNotes;

	/**
	 * Instantiates a new stand planting activity.
	 */
	public StandPlantingActivity() {
	}

	/**
	 * Instantiates a new stand planting activity.
	 *
	 * @param stand the stand
	 * @param treeSpecies the tree species
	 * @param activityStatus the activity status
	 * @param activity the activity
	 * @param workStage the work stage
	 */
	public StandPlantingActivity(Stand stand, TreeSpecies treeSpecies,
			ActivityStatus activityStatus, Activity activity, String workStage) {
		this.stand = stand;
		this.treeSpecies = treeSpecies;
		this.activityStatus = activityStatus;
		this.activity = activity;
		this.workStage = workStage;
	}

	/**
	 * Instantiates a new stand planting activity.
	 *
	 * @param stand the stand
	 * @param personByPlCreatedBy the person by pl created by
	 * @param treeSpecies the tree species
	 * @param contractor the contractor
	 * @param seedlingInventoryPOS the seedling inventory POS
	 * @param activityStatus the activity status
	 * @param personByImCreatedBy the person by im created by
	 * @param activity the activity
	 * @param prodType the prod type
	 * @param workStage the work stage
	 * @param seedlingAge the seedling age
	 * @param plArea the pl area
	 * @param plTrees the pl trees
	 * @param plCreatedDate the pl created date
	 * @param imArea the im area
	 * @param imTrees the im trees
	 * @param imCreatedDate the im created date
	 * @param imContrAssignDate the im contr assign date
	 * @param imContrDoneDate the im contr done date
	 * @param imContrNotes the im contr notes
	 */
	public StandPlantingActivity(Stand stand, Person personByPlCreatedBy,
			TreeSpecies treeSpecies, Contractor contractor,
			SeedlingInventoryPOS seedlingInventoryPOS,
			ActivityStatus activityStatus, Person personByImCreatedBy,
			Activity activity, Prodtype prodType, String workStage,
			String seedlingAge, Double plArea, Long plTrees,
			Date plCreatedDate, Double imArea, Long imTrees,
			Date imCreatedDate, Date imContrAssignDate, Date imContrDoneDate,
			String imContrNotes) {
		this.stand = stand;
		this.personByPlCreatedBy = personByPlCreatedBy;
		this.treeSpecies = treeSpecies;
		this.contractor = contractor;
		this.seedlingInventoryPOS = seedlingInventoryPOS;
		this.activityStatus = activityStatus;
		this.personByImCreatedBy = personByImCreatedBy;
		this.activity = activity;
		this.prodType = prodType;
		this.workStage = workStage;
		this.seedlingAge = seedlingAge;
		this.plArea = plArea;
		this.plTrees = plTrees;
		this.plCreatedDate = plCreatedDate;
		this.imArea = imArea;
		this.imTrees = imTrees;
		this.imCreatedDate = imCreatedDate;
		this.imContrAssignDate = imContrAssignDate;
		this.imContrDoneDate = imContrDoneDate;
		this.imContrNotes = imContrNotes;
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
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stand_id", nullable = false)
	public Stand getStand() {
		return this.stand;
	}

	/**
	 * Sets the stand.
	 *
	 * @param stand the new stand
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
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
	 * Gets the contractor.
	 *
	 * @return the contractor
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "im_contr_id")
	public Contractor getContractor() {
		return this.contractor;
	}

	/**
	 * Sets the contractor.
	 *
	 * @param contractor the new contractor
	 */
	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}

	/**
	 * Gets the seedling inventory POS.
	 *
	 * @return the seedling inventory POS
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "inventory_pos_id")
	public SeedlingInventoryPOS getSeedlingInventoryPOS() {
		return this.seedlingInventoryPOS;
	}

	/**
	 * Sets the seedling inventory POS.
	 *
	 * @param seedlingInventoryPOS the new seedling inventory POS
	 */
	public void setSeedlingInventoryPOS(
			SeedlingInventoryPOS seedlingInventoryPOS) {
		this.seedlingInventoryPOS = seedlingInventoryPOS;
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
	 * Gets the seedling age.
	 *
	 * @return the seedling age
	 */
	@Column(name = "seedling_age", length = 10)
	public String getSeedlingAge() {
		return this.seedlingAge;
	}

	/**
	 * Sets the seedling age.
	 *
	 * @param seedlingAge the new seedling age
	 */
	public void setSeedlingAge(String seedlingAge) {
		this.seedlingAge = seedlingAge;
	}

	/**
	 * Gets the pl area.
	 *
	 * @return the pl area
	 */
	@Column(name = "pl_area", precision = 17, scale = 17)
	public Double getPlArea() {
		return this.plArea;
	}

	/**
	 * Sets the pl area.
	 *
	 * @param plArea the new pl area
	 */
	public void setPlArea(Double plArea) {
		this.plArea = plArea;
	}

	/**
	 * Gets the pl trees.
	 *
	 * @return the pl trees
	 */
	@Column(name = "pl_trees")
	public Long getPlTrees() {
		return this.plTrees;
	}

	/**
	 * Sets the pl trees.
	 *
	 * @param plTrees the new pl trees
	 */
	public void setPlTrees(Long plTrees) {
		this.plTrees = plTrees;
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
	 * Gets the im area.
	 *
	 * @return the im area
	 */
	@Column(name = "im_area", precision = 17, scale = 17)
	public Double getImArea() {
		return this.imArea;
	}

	/**
	 * Sets the im area.
	 *
	 * @param imArea the new im area
	 */
	public void setImArea(Double imArea) {
		this.imArea = imArea;
	}

	/**
	 * Gets the im trees.
	 *
	 * @return the im trees
	 */
	@Column(name = "im_trees")
	public Long getImTrees() {
		return this.imTrees;
	}

	/**
	 * Sets the im trees.
	 *
	 * @param imTrees the new im trees
	 */
	public void setImTrees(Long imTrees) {
		this.imTrees = imTrees;
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
	 * Gets the im contr assign date.
	 *
	 * @return the im contr assign date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "im_contr_assign_date", length = 29)
	public Date getImContrAssignDate() {
		return this.imContrAssignDate;
	}

	/**
	 * Sets the im contr assign date.
	 *
	 * @param imContrAssignDate the new im contr assign date
	 */
	public void setImContrAssignDate(Date imContrAssignDate) {
		this.imContrAssignDate = imContrAssignDate;
	}

	/**
	 * Gets the im contr done date.
	 *
	 * @return the im contr done date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "im_contr_done_date", length = 29)
	public Date getImContrDoneDate() {
		return this.imContrDoneDate;
	}

	/**
	 * Sets the im contr done date.
	 *
	 * @param imContrDoneDate the new im contr done date
	 */
	public void setImContrDoneDate(Date imContrDoneDate) {
		this.imContrDoneDate = imContrDoneDate;
	}

	/**
	 * Gets the im contr notes.
	 *
	 * @return the im contr notes
	 */
	@Column(name = "im_contr_notes")
	public String getImContrNotes() {
		return this.imContrNotes;
	}

	/**
	 * Sets the im contr notes.
	 *
	 * @param imContrNotes the new im contr notes
	 */
	public void setImContrNotes(String imContrNotes) {
		this.imContrNotes = imContrNotes;
	}

}
