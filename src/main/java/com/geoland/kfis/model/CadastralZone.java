package com.geoland.kfis.model;

// Generated Jan 19, 2016 4:36:13 PM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;

import org.hibernate.annotations.Type;
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * CadastralZone generated by hbm2java.
 */
@Entity
@Table(name = "tgis_cadastral_zone", schema = "public")
@TypeDef(name = "geometry", typeClass = GeometryType.class)
public class CadastralZone extends AbstractPersistentObject implements
		java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The cadastral municipality. */
	private CadastralMunicipality cadastralMunicipality;
	
	/** The name. */
	private String name;
	
	/** The name sr. */
	private String nameSr;
	
	/** The name en. */
	private String nameEn;
	
	/** The geom. */
	private Geometry theGeom;
	
	/** The cad id. */
	private String cadId;
	
	/** The private requests. */
	private Set<PrivateRequest> privateRequests = new HashSet<PrivateRequest>(0);

	/**
	 * Instantiates a new cadastral zone.
	 */
	public CadastralZone() {
	}

	/**
	 * Instantiates a new cadastral zone.
	 *
	 * @param cadastralMunicipality the cadastral municipality
	 * @param name the name
	 * @param theGeom the the geom
	 */
	public CadastralZone(CadastralMunicipality cadastralMunicipality,
			String name, Geometry theGeom) {
		this.cadastralMunicipality = cadastralMunicipality;
		this.name = name;
		this.theGeom = theGeom;
	}

	/**
	 * Instantiates a new cadastral zone.
	 *
	 * @param cadastralMunicipality the cadastral municipality
	 * @param name the name
	 * @param nameSr the name sr
	 * @param nameEn the name en
	 * @param theGeom the the geom
	 * @param cadId the cad id
	 * @param privateRequests the private requests
	 */
	public CadastralZone(CadastralMunicipality cadastralMunicipality,
			String name, String nameSr, String nameEn, Geometry theGeom,
			String cadId, Set<PrivateRequest> privateRequests) {
		this.cadastralMunicipality = cadastralMunicipality;
		this.name = name;
		this.nameSr = nameSr;
		this.nameEn = nameEn;
		this.theGeom = theGeom;
		this.cadId = cadId;
		this.privateRequests = privateRequests;
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
	 * Gets the cadastral municipality.
	 *
	 * @return the cadastral municipality
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "municipality_id", nullable = false)
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
	 * Gets the name.
	 *
	 * @return the name
	 */
	@Column(name = "name", nullable = false, length = 100)
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
	@Column(name = "name_sr", length = 100)
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
	@Column(name = "name_en", length = 100)
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
	 * Gets the the geom.
	 *
	 * @return the the geom
	 */
	@Column(name = "the_geom", nullable = false)
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
	 * Gets the cad id.
	 *
	 * @return the cad id
	 */
	@Column(name = "cad_id", length = 9)
	public String getCadId() {
		return this.cadId;
	}

	/**
	 * Sets the cad id.
	 *
	 * @param cadId the new cad id
	 */
	public void setCadId(String cadId) {
		this.cadId = cadId;
	}

	/**
	 * Gets the private requests.
	 *
	 * @return the private requests
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cadastralZone")
	public Set<PrivateRequest> getPrivateRequests() {
		return this.privateRequests;
	}

	/**
	 * Sets the private requests.
	 *
	 * @param privateRequests the new private requests
	 */
	public void setPrivateRequests(Set<PrivateRequest> privateRequests) {
		this.privateRequests = privateRequests;
	}

}