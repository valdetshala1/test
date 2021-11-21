package com.geoland.kfis.model;

// Generated Oct 19, 2015 3:54:57 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.TypeDef;
import org.hibernate.spatial.GeometryType;
import com.vividsolutions.jts.geom.Geometry;
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
import org.hibernate.annotations.Type;

// TODO: Auto-generated Javadoc
/**
 * Region generated by hbm2java.
 */
@Entity
@Table(name = "tgis_region", schema = "public")
@TypeDef(name = "geometry", typeClass = GeometryType.class)
public class Region extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The name. */
	private String name;
	
	/** The name sr. */
	private String nameSr;
	
	/** The name en. */
	private String nameEn;
	
	/** The code. */
	private String code;
	
	/** The geom. */
	private Geometry theGeom;
	
	/** The management units. */
	private Set<ManagementUnit> managementUnits = new HashSet<ManagementUnit>(0);
	
	/** The subregions. */
	private Set<Subregion> subregions = new HashSet<Subregion>(0);
	
	/** The inspections. */
	private Set<Inspection> inspections = new HashSet<Inspection>(0);
	
	/** The cadastral municipalities. */
	private Set<CadastralMunicipality> cadastralMunicipalities = new HashSet<CadastralMunicipality>(
			0);
	
	/** The fire reports. */
	private Set<FireReport> fireReports = new HashSet<FireReport>(0);
	
	/** The fiskos imports. */
	private Set<FiskosImport> fiskosImports = new HashSet<FiskosImport>(0);

	/**
	 * Instantiates a new region.
	 */
	public Region() {
	}

	/**
	 * Instantiates a new region.
	 *
	 * @param name the name
	 */
	public Region(String name) {
		this.name = name;
	}

	/**
	 * Instantiates a new region.
	 *
	 * @param name the name
	 * @param nameSr the name sr
	 * @param nameEn the name en
	 * @param code the code
	 * @param theGeom the the geom
	 * @param managementUnits the management units
	 * @param subregions the subregions
	 * @param inspections the inspections
	 * @param cadastralMunicipalities the cadastral municipalities
	 * @param fireReports the fire reports
	 * @param fiskosImports the fiskos imports
	 */
	public Region(String name, String nameSr, String nameEn, String code,
			Geometry theGeom, Set<ManagementUnit> managementUnits,
			Set<Subregion> subregions, Set<Inspection> inspections,
			Set<CadastralMunicipality> cadastralMunicipalities,
			Set<FireReport> fireReports, Set<FiskosImport> fiskosImports) {
		this.name = name;
		this.nameSr = nameSr;
		this.nameEn = nameEn;
		this.code = code;
		this.theGeom = theGeom;
		this.managementUnits = managementUnits;
		this.subregions = subregions;
		this.inspections = inspections;
		this.cadastralMunicipalities = cadastralMunicipalities;
		this.fireReports = fireReports;
		this.fiskosImports = fiskosImports;
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
	 * Gets the name.
	 *
	 * @return the name
	 */
	@Column(name = "name", nullable = false, length = 80)
	public String getName() {
		return this.name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the name sr.
	 *
	 * @return the name sr
	 */
	@Column(name = "name_sr", length = 80)
	public String getNameSr() {
		return this.nameSr;
	}

	/**
	 * Sets the name sr.
	 *
	 * @param nameSr the new name sr
	 */
	public void setNameSr(String nameSr) {
		this.nameSr = nameSr;
	}

	/**
	 * Gets the name en.
	 *
	 * @return the name en
	 */
	@Column(name = "name_en", length = 80)
	public String getNameEn() {
		return this.nameEn;
	}

	/**
	 * Sets the name en.
	 *
	 * @param nameEn the new name en
	 */
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	/**
	 * Gets the code.
	 *
	 * @return the code
	 */
	@Column(name = "code", length = 2)
	public String getCode() {
		return this.code;
	}

	/**
	 * Sets the code.
	 *
	 * @param code the new code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * Gets the the geom.
	 *
	 * @return the the geom
	 */
	@Column(name = "the_geom")
	@Type(type = "org.hibernate.spatial.GeometryType")
	public Geometry getTheGeom() {
		return this.theGeom;
	}

	/**
	 * Sets the the geom.
	 *
	 * @param theGeom the new the geom
	 */
	public void setTheGeom(Geometry theGeom) {
		this.theGeom = theGeom;
	}

	/**
	 * Gets the management units.
	 *
	 * @return the management units
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "region")
	public Set<ManagementUnit> getManagementUnits() {
		return this.managementUnits;
	}

	/**
	 * Sets the management units.
	 *
	 * @param managementUnits the new management units
	 */
	public void setManagementUnits(Set<ManagementUnit> managementUnits) {
		this.managementUnits = managementUnits;
	}

	/**
	 * Gets the subregions.
	 *
	 * @return the subregions
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "region")
	public Set<Subregion> getSubregions() {
		return this.subregions;
	}

	/**
	 * Sets the subregions.
	 *
	 * @param subregions the new subregions
	 */
	public void setSubregions(Set<Subregion> subregions) {
		this.subregions = subregions;
	}

	/**
	 * Gets the inspections.
	 *
	 * @return the inspections
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "region")
	public Set<Inspection> getInspections() {
		return this.inspections;
	}

	/**
	 * Sets the inspections.
	 *
	 * @param inspections the new inspections
	 */
	public void setInspections(Set<Inspection> inspections) {
		this.inspections = inspections;
	}

	/**
	 * Gets the cadastral municipalities.
	 *
	 * @return the cadastral municipalities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "region")
	public Set<CadastralMunicipality> getCadastralMunicipalities() {
		return this.cadastralMunicipalities;
	}

	/**
	 * Sets the cadastral municipalities.
	 *
	 * @param cadastralMunicipalities the new cadastral municipalities
	 */
	public void setCadastralMunicipalities(
			Set<CadastralMunicipality> cadastralMunicipalities) {
		this.cadastralMunicipalities = cadastralMunicipalities;
	}

	/**
	 * Gets the fire reports.
	 *
	 * @return the fire reports
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "region")
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
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "region")
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

}
