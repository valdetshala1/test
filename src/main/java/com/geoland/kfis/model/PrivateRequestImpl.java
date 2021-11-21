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
 * PrivateRequestImpl generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_private_request_impl", schema = "public")
public class PrivateRequestImpl extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The tree species. */
	private TreeSpecies treeSpecies;
	
	/** The private request. */
	private PrivateRequest privateRequest;
	
	/** The diameter 13. */
	private Double diameter13;
	
	/** The factor. */
	private Double factor;
	
	/** The height. */
	private Double height;
	
	/** The tech volume. */
	private Double techVolume;
	
	/** The fire volume. */
	private Double fireVolume;
	
	/** The pulp volume. */
	private Double pulpVolume;
	
	/** The volume total. */
	private Double volumeTotal;
	
	/** The remarks. */
	private String remarks;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new private request impl.
	 */
	public PrivateRequestImpl() {
	}

	/**
	 * Instantiates a new private request impl.
	 *
	 * @param treeSpecies the tree species
	 * @param privateRequest the private request
	 * @param diameter13 the diameter 13
	 * @param factor the factor
	 * @param height the height
	 */
	public PrivateRequestImpl(TreeSpecies treeSpecies,
			PrivateRequest privateRequest, Double diameter13, Double factor,
			Double height) {
		this.treeSpecies = treeSpecies;
		this.privateRequest = privateRequest;
		this.diameter13 = diameter13;
		this.factor = factor;
		this.height = height;
	}

	/**
	 * Instantiates a new private request impl.
	 *
	 * @param employee the employee
	 * @param treeSpecies the tree species
	 * @param privateRequest the private request
	 * @param diameter13 the diameter 13
	 * @param factor the factor
	 * @param height the height
	 * @param techVolume the tech volume
	 * @param fireVolume the fire volume
	 * @param pulpVolume the pulp volume
	 * @param volumeTotal the volume total
	 * @param remarks the remarks
	 * @param createdDate the created date
	 */
	public PrivateRequestImpl(Employee employee, TreeSpecies treeSpecies,
			PrivateRequest privateRequest, Double diameter13, Double factor,
			Double height, Double techVolume, Double fireVolume,
			Double pulpVolume, Double volumeTotal, String remarks,
			Date createdDate) {
		this.employee = employee;
		this.treeSpecies = treeSpecies;
		this.privateRequest = privateRequest;
		this.diameter13 = diameter13;
		this.factor = factor;
		this.height = height;
		this.techVolume = techVolume;
		this.fireVolume = fireVolume;
		this.pulpVolume = pulpVolume;
		this.volumeTotal = volumeTotal;
		this.remarks = remarks;
		this.createdDate = createdDate;
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
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by")
	public Employee getEmployee() {
		return this.employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
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
	 * Gets the private request.
	 *
	 * @return the private request
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "request_id", nullable = false)
	public PrivateRequest getPrivateRequest() {
		return this.privateRequest;
	}

	/**
	 * Sets the private request.
	 *
	 * @param privateRequest the new private request
	 */
	public void setPrivateRequest(PrivateRequest privateRequest) {
		this.privateRequest = privateRequest;
	}

	/**
	 * Gets the diameter 13.
	 *
	 * @return the diameter 13
	 */
	@Column(name = "diameter_1_3", nullable = false, precision = 17, scale = 17)
	public Double getDiameter13() {
		return this.diameter13;
	}

	/**
	 * Sets the diameter 13.
	 *
	 * @param diameter13 the new diameter 13
	 */
	public void setDiameter13(Double diameter13) {
		this.diameter13 = diameter13;
	}

	/**
	 * Gets the factor.
	 *
	 * @return the factor
	 */
	@Column(name = "factor", nullable = false, precision = 17, scale = 17)
	public Double getFactor() {
		return this.factor;
	}

	/**
	 * Sets the factor.
	 *
	 * @param factor the new factor
	 */
	public void setFactor(Double factor) {
		this.factor = factor;
	}

	/**
	 * Gets the height.
	 *
	 * @return the height
	 */
	@Column(name = "height", nullable = false, precision = 17, scale = 17)
	public Double getHeight() {
		return this.height;
	}

	/**
	 * Sets the height.
	 *
	 * @param height the new height
	 */
	public void setHeight(Double height) {
		this.height = height;
	}

	/**
	 * Gets the tech volume.
	 *
	 * @return the tech volume
	 */
	@Column(name = "tech_volume", precision = 17, scale = 17)
	public Double getTechVolume() {
		return this.techVolume;
	}

	/**
	 * Sets the tech volume.
	 *
	 * @param techVolume the new tech volume
	 */
	public void setTechVolume(Double techVolume) {
		this.techVolume = techVolume;
	}

	/**
	 * Gets the fire volume.
	 *
	 * @return the fire volume
	 */
	@Column(name = "fire_volume", precision = 17, scale = 17)
	public Double getFireVolume() {
		return this.fireVolume;
	}

	/**
	 * Sets the fire volume.
	 *
	 * @param fireVolume the new fire volume
	 */
	public void setFireVolume(Double fireVolume) {
		this.fireVolume = fireVolume;
	}

	/**
	 * Gets the pulp volume.
	 *
	 * @return the pulp volume
	 */
	@Column(name = "pulp_volume", precision = 17, scale = 17)
	public Double getPulpVolume() {
		return this.pulpVolume;
	}

	/**
	 * Sets the pulp volume.
	 *
	 * @param pulpVolume the new pulp volume
	 */
	public void setPulpVolume(Double pulpVolume) {
		this.pulpVolume = pulpVolume;
	}

	/**
	 * Gets the volume total.
	 *
	 * @return the volume total
	 */
	@Column(name = "volume_total", precision = 17, scale = 17)
	public Double getVolumeTotal() {
		return this.volumeTotal;
	}

	/**
	 * Sets the volume total.
	 *
	 * @param volumeTotal the new volume total
	 */
	public void setVolumeTotal(Double volumeTotal) {
		this.volumeTotal = volumeTotal;
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
	 * Gets the created date.
	 *
	 * @return the created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", length = 29)
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

}
