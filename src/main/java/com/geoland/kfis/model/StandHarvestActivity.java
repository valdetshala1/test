package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

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
 * StandHarvestActivity generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_stand_harvest_activity", schema = "public")
public class StandHarvestActivity extends AbstractPersistentObject implements
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
	
	/** The activity status. */
	private ActivityStatus activityStatus;
	
	/** The person by im created by. */
	private Person personByImCreatedBy;
	
	/** The activity. */
	private Activity activity;
	
	/** The remarks. */
	private String remarks;
	
	/** The work stage. */
	private String workStage;
	
	/** The pl tech volume. */
	private Double plTechVolume;
	
	/** The pl fire volume. */
	private Double plFireVolume;
	
	/** The pl pulp volume. */
	private Double plPulpVolume;
	
	/** The pl created date. */
	private Date plCreatedDate;
	
	/** The im tech volume. */
	private Double imTechVolume;
	
	/** The im fire volume. */
	private Double imFireVolume;
	
	/** The im pulp volume. */
	private Double imPulpVolume;
	
	/** The im created date. */
	private Date imCreatedDate;
	
	/** The damage volume. */
	private Double damageVolume;

	/**
	 * Instantiates a new stand harvest activity.
	 */
	public StandHarvestActivity() {
	}

	/**
	 * Instantiates a new stand harvest activity.
	 *
	 * @param stand the stand
	 * @param treeSpecies the tree species
	 * @param activityStatus the activity status
	 * @param activity the activity
	 * @param workStage the work stage
	 */
	public StandHarvestActivity(Stand stand, TreeSpecies treeSpecies,
			ActivityStatus activityStatus, Activity activity, String workStage) {
		this.stand = stand;
		this.treeSpecies = treeSpecies;
		this.activityStatus = activityStatus;
		this.activity = activity;
		this.workStage = workStage;
	}

	/**
	 * Instantiates a new stand harvest activity.
	 *
	 * @param stand the stand
	 * @param personByPlCreatedBy the person by pl created by
	 * @param treeSpecies the tree species
	 * @param activityStatus the activity status
	 * @param personByImCreatedBy the person by im created by
	 * @param activity the activity
	 * @param remarks the remarks
	 * @param workStage the work stage
	 * @param plTechVolume the pl tech volume
	 * @param plFireVolume the pl fire volume
	 * @param plPulpVolume the pl pulp volume
	 * @param plCreatedDate the pl created date
	 * @param imTechVolume the im tech volume
	 * @param imFireVolume the im fire volume
	 * @param imPulpVolume the im pulp volume
	 * @param imCreatedDate the im created date
	 * @param damageVolume the damage volume
	 */
	public StandHarvestActivity(Stand stand, Person personByPlCreatedBy,
			TreeSpecies treeSpecies, ActivityStatus activityStatus,
			Person personByImCreatedBy, Activity activity, String remarks,
			String workStage, Double plTechVolume, Double plFireVolume,
			Double plPulpVolume, Date plCreatedDate, Double imTechVolume,
			Double imFireVolume, Double imPulpVolume, Date imCreatedDate,
			Double damageVolume) {
		this.stand = stand;
		this.personByPlCreatedBy = personByPlCreatedBy;
		this.treeSpecies = treeSpecies;
		this.activityStatus = activityStatus;
		this.personByImCreatedBy = personByImCreatedBy;
		this.activity = activity;
		this.remarks = remarks;
		this.workStage = workStage;
		this.plTechVolume = plTechVolume;
		this.plFireVolume = plFireVolume;
		this.plPulpVolume = plPulpVolume;
		this.plCreatedDate = plCreatedDate;
		this.imTechVolume = imTechVolume;
		this.imFireVolume = imFireVolume;
		this.imPulpVolume = imPulpVolume;
		this.imCreatedDate = imCreatedDate;
		this.damageVolume = damageVolume;
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
	 * Gets the remarks.
	 *
	 * @return the remarks
	 */
	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	/**
	 * Sets the remarks.
	 *
	 * @param remarks the new remarks
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
	 * Gets the pl tech volume.
	 *
	 * @return the pl tech volume
	 */
	@Column(name = "pl_tech_volume", precision = 17, scale = 17)
	public Double getPlTechVolume() {
		return this.plTechVolume;
	}

	/**
	 * Sets the pl tech volume.
	 *
	 * @param plTechVolume the new pl tech volume
	 */
	public void setPlTechVolume(Double plTechVolume) {
		this.plTechVolume = plTechVolume;
	}

	/**
	 * Gets the pl fire volume.
	 *
	 * @return the pl fire volume
	 */
	@Column(name = "pl_fire_volume", precision = 17, scale = 17)
	public Double getPlFireVolume() {
		return this.plFireVolume;
	}

	/**
	 * Sets the pl fire volume.
	 *
	 * @param plFireVolume the new pl fire volume
	 */
	public void setPlFireVolume(Double plFireVolume) {
		this.plFireVolume = plFireVolume;
	}

	/**
	 * Gets the pl pulp volume.
	 *
	 * @return the pl pulp volume
	 */
	@Column(name = "pl_pulp_volume", precision = 17, scale = 17)
	public Double getPlPulpVolume() {
		return this.plPulpVolume;
	}

	/**
	 * Sets the pl pulp volume.
	 *
	 * @param plPulpVolume the new pl pulp volume
	 */
	public void setPlPulpVolume(Double plPulpVolume) {
		this.plPulpVolume = plPulpVolume;
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
	 * Gets the im tech volume.
	 *
	 * @return the im tech volume
	 */
	@Column(name = "im_tech_volume", precision = 17, scale = 17)
	public Double getImTechVolume() {
		return this.imTechVolume;
	}

	/**
	 * Sets the im tech volume.
	 *
	 * @param imTechVolume the new im tech volume
	 */
	public void setImTechVolume(Double imTechVolume) {
		this.imTechVolume = imTechVolume;
	}

	/**
	 * Gets the im fire volume.
	 *
	 * @return the im fire volume
	 */
	@Column(name = "im_fire_volume", precision = 17, scale = 17)
	public Double getImFireVolume() {
		return this.imFireVolume;
	}

	/**
	 * Sets the im fire volume.
	 *
	 * @param imFireVolume the new im fire volume
	 */
	public void setImFireVolume(Double imFireVolume) {
		this.imFireVolume = imFireVolume;
	}

	/**
	 * Gets the im pulp volume.
	 *
	 * @return the im pulp volume
	 */
	@Column(name = "im_pulp_volume", precision = 17, scale = 17)
	public Double getImPulpVolume() {
		return this.imPulpVolume;
	}

	/**
	 * Sets the im pulp volume.
	 *
	 * @param imPulpVolume the new im pulp volume
	 */
	public void setImPulpVolume(Double imPulpVolume) {
		this.imPulpVolume = imPulpVolume;
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
	 * Gets the damage volume.
	 *
	 * @return the damage volume
	 */
	@Column(name = "damage_volume", precision = 17, scale = 17)
	public Double getDamageVolume() {
		return this.damageVolume;
	}

	/**
	 * Sets the damage volume.
	 *
	 * @param damageVolume the new damage volume
	 */
	public void setDamageVolume(Double damageVolume) {
		this.damageVolume = damageVolume;
	}

}