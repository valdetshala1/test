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
 * ProtectionActivity generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_protection_activity", schema = "public")
public class ProtectionActivity extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The units metric. */
	private UnitsMetric unitsMetric;
	
	/** The management unit. */
	private ManagementUnit managementUnit;
	
	/** The cadastral municipality. */
	private CadastralMunicipality cadastralMunicipality;
	
	/** The person by pl created by. */
	private Person personByPlCreatedBy;
	
	/** The activity status. */
	private ActivityStatus activityStatus;
	
	/** The person by im created by. */
	private Person personByImCreatedBy;
	
	/** The activity. */
	private Activity activity;
	
	/** The work stage. */
	private String workStage;
	
	/** The pl value. */
	private Double plValue;
	
	/** The im value. */
	private Double imValue;
	
	/** The pl created date. */
	private Date plCreatedDate;
	
	/** The im created date. */
	private Date imCreatedDate;

	/**
	 * Instantiates a new protection activity.
	 */
	public ProtectionActivity() {
	}

	/**
	 * Instantiates a new protection activity.
	 *
	 * @param unitsMetric the units metric
	 * @param cadastralMunicipality the cadastral municipality
	 * @param activityStatus the activity status
	 * @param activity the activity
	 * @param workStage the work stage
	 * @param plValue the pl value
	 */
	public ProtectionActivity(UnitsMetric unitsMetric,
			CadastralMunicipality cadastralMunicipality,
			ActivityStatus activityStatus, Activity activity, String workStage,
			Double plValue) {
		this.unitsMetric = unitsMetric;
		this.cadastralMunicipality = cadastralMunicipality;
		this.activityStatus = activityStatus;
		this.activity = activity;
		this.workStage = workStage;
		this.plValue = plValue;
	}

	/**
	 * Instantiates a new protection activity.
	 *
	 * @param unitsMetric the units metric
	 * @param managementUnit the management unit
	 * @param cadastralMunicipality the cadastral municipality
	 * @param personByPlCreatedBy the person by pl created by
	 * @param activityStatus the activity status
	 * @param personByImCreatedBy the person by im created by
	 * @param activity the activity
	 * @param workStage the work stage
	 * @param plValue the pl value
	 * @param imValue the im value
	 * @param plCreatedDate the pl created date
	 * @param imCreatedDate the im created date
	 */
	public ProtectionActivity(UnitsMetric unitsMetric,
			ManagementUnit managementUnit,
			CadastralMunicipality cadastralMunicipality,
			Person personByPlCreatedBy, ActivityStatus activityStatus,
			Person personByImCreatedBy, Activity activity, String workStage,
			Double plValue, Double imValue, Date plCreatedDate,
			Date imCreatedDate) {
		this.unitsMetric = unitsMetric;
		this.managementUnit = managementUnit;
		this.cadastralMunicipality = cadastralMunicipality;
		this.personByPlCreatedBy = personByPlCreatedBy;
		this.activityStatus = activityStatus;
		this.personByImCreatedBy = personByImCreatedBy;
		this.activity = activity;
		this.workStage = workStage;
		this.plValue = plValue;
		this.imValue = imValue;
		this.plCreatedDate = plCreatedDate;
		this.imCreatedDate = imCreatedDate;
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
	 * Gets the units metric.
	 *
	 * @return the units metric
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "measure_unit_id", nullable = false)
	public UnitsMetric getUnitsMetric() {
		return this.unitsMetric;
	}

	/**
	 * Sets the units metric.
	 *
	 * @param unitsMetric the new units metric
	 */
	public void setUnitsMetric(UnitsMetric unitsMetric) {
		this.unitsMetric = unitsMetric;
	}

	/**
	 * Gets the management unit.
	 *
	 * @return the management unit
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mu_id")
	public ManagementUnit getManagementUnit() {
		return this.managementUnit;
	}

	/**
	 * Sets the management unit.
	 *
	 * @param managementUnit the new management unit
	 */
	public void setManagementUnit(ManagementUnit managementUnit) {
		this.managementUnit = managementUnit;
	}

	/**
	 * Gets the cadastral municipality.
	 *
	 * @return the cadastral municipality
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mun_id", nullable = false)
	public CadastralMunicipality getCadastralMunicipality() {
		return this.cadastralMunicipality;
	}

	/**
	 * Sets the cadastral municipality.
	 *
	 * @param cadastralMunicipality the new cadastral municipality
	 */
	public void setCadastralMunicipality(
			CadastralMunicipality cadastralMunicipality) {
		this.cadastralMunicipality = cadastralMunicipality;
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
	 * Gets the pl value.
	 *
	 * @return the pl value
	 */
	@Column(name = "pl_value", nullable = false, precision = 17, scale = 17)
	public Double getPlValue() {
		return this.plValue;
	}

	/**
	 * Sets the pl value.
	 *
	 * @param plValue the new pl value
	 */
	public void setPlValue(Double plValue) {
		this.plValue = plValue;
	}

	/**
	 * Gets the im value.
	 *
	 * @return the im value
	 */
	@Column(name = "im_value", precision = 17, scale = 17)
	public Double getImValue() {
		return this.imValue;
	}

	/**
	 * Sets the im value.
	 *
	 * @param imValue the new im value
	 */
	public void setImValue(Double imValue) {
		this.imValue = imValue;
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

}
