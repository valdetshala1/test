package com.geoland.kfis.model;

// Generated Nov 12, 2015 1:29:12 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.spatial.GeometryType;
import com.vividsolutions.jts.geom.Geometry;
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
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

// TODO: Auto-generated Javadoc
/**
 * StandPlantingImplDeclare generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_stand_planting_impl_declare", schema = "public")
@TypeDef(name = "geometry", typeClass = GeometryType.class)
public class StandPlantingImplDeclare extends AbstractPersistentObject
		implements java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The person. */
	private Person person;
	
	/** The stand planting activity. */
	private StandPlantingActivity standPlantingActivity;
	
	/** The im area. */
	private Double imArea;
	
	/** The im trees. */
	private Long imTrees;
	
	/** The im date. */
	private Date imDate;
	
	/** The created date. */
	private Date createdDate;
	
	/** The im geom. */
	private Geometry imGeom;

	/**
	 * Instantiates a new stand planting impl declare.
	 */
	public StandPlantingImplDeclare() {
	}

	/**
	 * Instantiates a new stand planting impl declare.
	 *
	 * @param person the person
	 * @param standPlantingActivity the stand planting activity
	 * @param imArea the im area
	 * @param imTrees the im trees
	 * @param imDate the im date
	 * @param createdDate the created date
	 * @param imGeom the im geom
	 */
	public StandPlantingImplDeclare(Person person,
			StandPlantingActivity standPlantingActivity, Double imArea,
			Long imTrees, Date imDate, Date createdDate, Geometry imGeom) {
		this.person = person;
		this.standPlantingActivity = standPlantingActivity;
		this.imArea = imArea;
		this.imTrees = imTrees;
		this.imDate = imDate;
		this.createdDate = createdDate;
		this.imGeom = imGeom;
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
	 * Gets the person.
	 *
	 * @return the person
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Person getPerson() {
		return this.person;
	}

	/**
	 * Sets the person.
	 *
	 * @param person the new person
	 */
	public void setPerson(Person person) {
		this.person = person;
	}

	/**
	 * Gets the stand planting activity.
	 *
	 * @return the stand planting activity
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "plant_activity_id", nullable = false)
	public StandPlantingActivity getStandPlantingActivity() {
		return this.standPlantingActivity;
	}

	/**
	 * Sets the stand planting activity.
	 *
	 * @param standPlantingActivity the new stand planting activity
	 */
	public void setStandPlantingActivity(
			StandPlantingActivity standPlantingActivity) {
		this.standPlantingActivity = standPlantingActivity;
	}

	/**
	 * Gets the im area.
	 *
	 * @return the im area
	 */
	@Column(name = "im_area", nullable = false, precision = 17, scale = 17)
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
	@Column(name = "im_trees", nullable = false)
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
	 * Gets the im date.
	 *
	 * @return the im date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "im_date", nullable = false, length = 13)
	public Date getImDate() {
		return this.imDate;
	}

	/**
	 * Sets the im date.
	 *
	 * @param imDate the new im date
	 */
	public void setImDate(Date imDate) {
		this.imDate = imDate;
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
	 * Gets the im geom.
	 *
	 * @return the im geom
	 */
	@Column(name = "im_geom", nullable = false)
	@Type(type = "org.hibernate.spatial.GeometryType")
	public Geometry getImGeom() {
		return this.imGeom;
	}

	/**
	 * Sets the im geom.
	 *
	 * @param imGeom the new im geom
	 */
	public void setImGeom(Geometry imGeom) {
		this.imGeom = imGeom;
	}

}