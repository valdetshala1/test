package com.geoland.kfis.model;

// Generated Oct 19, 2015 3:54:57 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.TypeDef;
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
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * ManagementUnit generated by hbm2java.
 */
@Entity
@Table(name = "tgis_management_unit", schema = "public")
public class ManagementUnit extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The region. */
	private Region region;
	
	/** The mu name. */
	private String muName;
	
	/** The remarks. */
	private String remarks;
	
	/** The mu code. */
	private String muCode;
	
	/** The fiskos datas. */
	private Set<FiskosData> fiskosDatas = new HashSet<FiskosData>(0);
	
	/** The compartments. */
	private Set<Compartment> compartments = new HashSet<Compartment>(0);
	
	/** The protection activities. */
	private Set<ProtectionActivity> protectionActivities = new HashSet<ProtectionActivity>(
			0);
	
	/** The fire reports. */
	private Set<FireReport> fireReports = new HashSet<FireReport>(0);
	
	/** The fiskos imports. */
	private Set<FiskosImport> fiskosImports = new HashSet<FiskosImport>(0);
	
	/** The management unit periods. */
	private Set<ManagementUnitPeriod> managementUnitPeriods = new HashSet<ManagementUnitPeriod>(
			0);

	/**
	 * Instantiates a new management unit.
	 */
	public ManagementUnit() {
	}

	/**
	 * Instantiates a new management unit.
	 *
	 * @param region the region
	 * @param muName the mu name
	 */
	public ManagementUnit(Region region, String muName) {
		this.region = region;
		this.muName = muName;
	}

	/**
	 * Instantiates a new management unit.
	 *
	 * @param region the region
	 * @param muName the mu name
	 * @param remarks the remarks
	 * @param muCode the mu code
	 * @param fiskosDatas the fiskos datas
	 * @param compartments the compartments
	 * @param protectionActivities the protection activities
	 * @param fireReports the fire reports
	 * @param fiskosImports the fiskos imports
	 * @param managementUnitPeriods the management unit periods
	 */
	public ManagementUnit(Region region, String muName, String remarks,
			String muCode, Set<FiskosData> fiskosDatas,
			Set<Compartment> compartments,
			Set<ProtectionActivity> protectionActivities,
			Set<FireReport> fireReports, Set<FiskosImport> fiskosImports,
			Set<ManagementUnitPeriod> managementUnitPeriods) {
		this.region = region;
		this.muName = muName;
		this.remarks = remarks;
		this.muCode = muCode;
		this.fiskosDatas = fiskosDatas;
		this.compartments = compartments;
		this.protectionActivities = protectionActivities;
		this.fireReports = fireReports;
		this.fiskosImports = fiskosImports;
		this.managementUnitPeriods = managementUnitPeriods;
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
	 * Gets the region.
	 *
	 * @return the region
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "region_id", nullable = false)
	public Region getRegion() {
		return this.region;
	}

	/**
	 * Sets the region.
	 *
	 * @param region the new region
	 */
	public void setRegion(Region region) {
		this.region = region;
	}

	/**
	 * Gets the mu name.
	 *
	 * @return the mu name
	 */
	@Column(name = "mu_name", nullable = false, length = 150)
	public String getMuName() {
		return this.muName;
	}

	/**
	 * Sets the mu name.
	 *
	 * @param muName the new mu name
	 */
	public void setMuName(String muName) {
		this.muName = muName;
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
	 * Gets the mu code.
	 *
	 * @return the mu code
	 */
	@Column(name = "mu_code", length = 10)
	public String getMuCode() {
		return this.muCode;
	}

	/**
	 * Sets the mu code.
	 *
	 * @param muCode the new mu code
	 */
	public void setMuCode(String muCode) {
		this.muCode = muCode;
	}

	/**
	 * Gets the fiskos datas.
	 *
	 * @return the fiskos datas
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managementUnit")
	public Set<FiskosData> getFiskosDatas() {
		return this.fiskosDatas;
	}

	/**
	 * Sets the fiskos datas.
	 *
	 * @param fiskosDatas the new fiskos datas
	 */
	public void setFiskosDatas(Set<FiskosData> fiskosDatas) {
		this.fiskosDatas = fiskosDatas;
	}

	/**
	 * Gets the compartments.
	 *
	 * @return the compartments
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managementUnit")
	public Set<Compartment> getCompartments() {
		return this.compartments;
	}

	/**
	 * Sets the compartments.
	 *
	 * @param compartments the new compartments
	 */
	public void setCompartments(Set<Compartment> compartments) {
		this.compartments = compartments;
	}

	/**
	 * Gets the protection activities.
	 *
	 * @return the protection activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managementUnit")
	public Set<ProtectionActivity> getProtectionActivities() {
		return this.protectionActivities;
	}

	/**
	 * Sets the protection activities.
	 *
	 * @param protectionActivities the new protection activities
	 */
	public void setProtectionActivities(
			Set<ProtectionActivity> protectionActivities) {
		this.protectionActivities = protectionActivities;
	}

	/**
	 * Gets the fire reports.
	 *
	 * @return the fire reports
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managementUnit")
	public Set<FireReport> getFireReports() {
		return this.fireReports;
	}

	/**
	 * Sets the fire reports.
	 *
	 * @param fireReports the new fire reports
	 */
	public void setFireReports(Set<FireReport> fireReports) {
		this.fireReports = fireReports;
	}

	/**
	 * Gets the fiskos imports.
	 *
	 * @return the fiskos imports
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managementUnit")
	public Set<FiskosImport> getFiskosImports() {
		return this.fiskosImports;
	}

	/**
	 * Sets the fiskos imports.
	 *
	 * @param fiskosImports the new fiskos imports
	 */
	public void setFiskosImports(Set<FiskosImport> fiskosImports) {
		this.fiskosImports = fiskosImports;
	}

	/**
	 * Gets the management unit periods.
	 *
	 * @return the management unit periods
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managementUnit")
	public Set<ManagementUnitPeriod> getManagementUnitPeriods() {
		return this.managementUnitPeriods;
	}

	/**
	 * Sets the management unit periods.
	 *
	 * @param managementUnitPeriods the new management unit periods
	 */
	public void setManagementUnitPeriods(
			Set<ManagementUnitPeriod> managementUnitPeriods) {
		this.managementUnitPeriods = managementUnitPeriods;
	}

}