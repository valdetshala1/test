package com.geoland.kfis.model;

// Generated Dec 18, 2015 2:07:23 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
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
 * DhpetAnimalLocation generated by hbm2java.
 */
@Entity
@Table(name = "tdhpet_animal_location", schema = "public")
public class DhpetAnimalLocation extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The dhpet wild animals. */
	private DhpetWildAnimals dhpetWildAnimals;
	
	/** The employee. */
	private Employee employee;
	
	/** The dhpet annual plan. */
	private DhpetAnnualPlan dhpetAnnualPlan;
	
	/** The quantity. */
	private Long quantity;
	
	/** The created date. */
	private Date createdDate;
	
	/** The dhpet animal location details. */
	private Set<DhpetAnimalLocationDetail> dhpetAnimalLocationDetails = new HashSet<DhpetAnimalLocationDetail>(
			0);
	
	/** The dhpet animal capacities. */
	private Set<DhpetAnimalCapacity> dhpetAnimalCapacities = new HashSet<DhpetAnimalCapacity>(
			0);

	/**
	 * Instantiates a new dhpet animal location.
	 */
	public DhpetAnimalLocation() {
	}

	/**
	 * Instantiates a new dhpet animal location.
	 *
	 * @param dhpetWildAnimals the dhpet wild animals
	 * @param employee the employee
	 * @param dhpetAnnualPlan the dhpet annual plan
	 * @param quantity the quantity
	 * @param createdDate the created date
	 */
	public DhpetAnimalLocation(DhpetWildAnimals dhpetWildAnimals,
			Employee employee, DhpetAnnualPlan dhpetAnnualPlan, Long quantity,
			Date createdDate) {
		this.dhpetWildAnimals = dhpetWildAnimals;
		this.employee = employee;
		this.dhpetAnnualPlan = dhpetAnnualPlan;
		this.quantity = quantity;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new dhpet animal location.
	 *
	 * @param dhpetWildAnimals the dhpet wild animals
	 * @param employee the employee
	 * @param dhpetAnnualPlan the dhpet annual plan
	 * @param quantity the quantity
	 * @param createdDate the created date
	 * @param dhpetAnimalLocationDetails the dhpet animal location details
	 * @param dhpetAnimalCapacities the dhpet animal capacities
	 */
	public DhpetAnimalLocation(DhpetWildAnimals dhpetWildAnimals,
			Employee employee, DhpetAnnualPlan dhpetAnnualPlan, Long quantity,
			Date createdDate,
			Set<DhpetAnimalLocationDetail> dhpetAnimalLocationDetails,
			Set<DhpetAnimalCapacity> dhpetAnimalCapacities) {
		this.dhpetWildAnimals = dhpetWildAnimals;
		this.employee = employee;
		this.dhpetAnnualPlan = dhpetAnnualPlan;
		this.quantity = quantity;
		this.createdDate = createdDate;
		this.dhpetAnimalLocationDetails = dhpetAnimalLocationDetails;
		this.dhpetAnimalCapacities = dhpetAnimalCapacities;
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
	 * Gets the dhpet wild animals.
	 *
	 * @return the dhpet wild animals
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "animal_id", nullable = false)
	public DhpetWildAnimals getDhpetWildAnimals() {
		return this.dhpetWildAnimals;
	}

	/**
	 * Sets the dhpet wild animals.
	 *
	 * @param dhpetWildAnimals the new dhpet wild animals
	 */
	public void setDhpetWildAnimals(DhpetWildAnimals dhpetWildAnimals) {
		this.dhpetWildAnimals = dhpetWildAnimals;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
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
	 * Gets the dhpet annual plan.
	 *
	 * @return the dhpet annual plan
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "annu_plan_id", nullable = false)
	public DhpetAnnualPlan getDhpetAnnualPlan() {
		return this.dhpetAnnualPlan;
	}

	/**
	 * Sets the dhpet annual plan.
	 *
	 * @param dhpetAnnualPlan the new dhpet annual plan
	 */
	public void setDhpetAnnualPlan(DhpetAnnualPlan dhpetAnnualPlan) {
		this.dhpetAnnualPlan = dhpetAnnualPlan;
	}

	/**
	 * Gets the quantity.
	 *
	 * @return the quantity
	 */
	@Column(name = "quantity", nullable = false)
	public Long getQuantity() {
		return this.quantity;
	}

	/**
	 * Sets the quantity.
	 *
	 * @param quantity the new quantity
	 */
	public void setQuantity(Long quantity) {
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
	 * Gets the dhpet animal location details.
	 *
	 * @return the dhpet animal location details
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dhpetAnimalLocation")
	public Set<DhpetAnimalLocationDetail> getDhpetAnimalLocationDetails() {
		return this.dhpetAnimalLocationDetails;
	}

	/**
	 * Sets the dhpet animal location details.
	 *
	 * @param dhpetAnimalLocationDetails the new dhpet animal location details
	 */
	public void setDhpetAnimalLocationDetails(
			Set<DhpetAnimalLocationDetail> dhpetAnimalLocationDetails) {
		this.dhpetAnimalLocationDetails = dhpetAnimalLocationDetails;
	}

	/**
	 * Gets the dhpet animal capacities.
	 *
	 * @return the dhpet animal capacities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dhpetAnimalLocation")
	public Set<DhpetAnimalCapacity> getDhpetAnimalCapacities() {
		return this.dhpetAnimalCapacities;
	}

	/**
	 * Sets the dhpet animal capacities.
	 *
	 * @param dhpetAnimalCapacities the new dhpet animal capacities
	 */
	public void setDhpetAnimalCapacities(
			Set<DhpetAnimalCapacity> dhpetAnimalCapacities) {
		this.dhpetAnimalCapacities = dhpetAnimalCapacities;
	}

}
