package com.geoland.kfis.model;

// Generated Dec 22, 2015 10:41:54 AM by Hibernate Tools 4.0.0

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

import com.geoland.framework.persistence.base.AbstractPersistentObject;
import com.geoland.kfis.persistence.hibernate.usertypes.Animaldeathcause;
import com.geoland.kfis.persistence.hibernate.usertypes.Gender;

// TODO: Auto-generated Javadoc
/**
 * DhpetHuntedAnimalDetail generated by hbm2java.
 */
@Entity
@Table(name = "tdhpet_hunted_animal_detail", schema = "public")
public class DhpetHuntedAnimalDetail extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The dhpet hunted animals. */
	private DhpetHuntedAnimals dhpetHuntedAnimals;
	
	/** The employee. */
	private Employee employee;
	
	/** The gender. */
	private Gender gender;
	
	/** The age. */
	private Long age;
	
	/** The weight. */
	private Double weight;
	
	/** The death cause. */
	private Animaldeathcause deathCause;
	
	/** The animals number. */
	private Long animalsNumber;
	
	/** The notes. */
	private String notes;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new dhpet hunted animal detail.
	 */
	public DhpetHuntedAnimalDetail() {
	}

	/**
	 * Instantiates a new dhpet hunted animal detail.
	 *
	 * @param dhpetHuntedAnimals the dhpet hunted animals
	 * @param employee the employee
	 * @param gender the gender
	 * @param deathCause the death cause
	 * @param animalsNumber the animals number
	 * @param createdDate the created date
	 */
	public DhpetHuntedAnimalDetail(DhpetHuntedAnimals dhpetHuntedAnimals,
			Employee employee, Gender gender, Animaldeathcause deathCause,
			Long animalsNumber, Date createdDate) {
		this.dhpetHuntedAnimals = dhpetHuntedAnimals;
		this.employee = employee;
		this.gender = gender;
		this.deathCause = deathCause;
		this.animalsNumber = animalsNumber;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new dhpet hunted animal detail.
	 *
	 * @param dhpetHuntedAnimals the dhpet hunted animals
	 * @param employee the employee
	 * @param gender the gender
	 * @param age the age
	 * @param weight the weight
	 * @param deathCause the death cause
	 * @param animalsNumber the animals number
	 * @param notes the notes
	 * @param createdDate the created date
	 */
	public DhpetHuntedAnimalDetail(DhpetHuntedAnimals dhpetHuntedAnimals,
			Employee employee, Gender gender, Long age, Double weight,
			Animaldeathcause deathCause, Long animalsNumber, String notes,
			Date createdDate) {
		this.dhpetHuntedAnimals = dhpetHuntedAnimals;
		this.employee = employee;
		this.gender = gender;
		this.age = age;
		this.weight = weight;
		this.deathCause = deathCause;
		this.animalsNumber = animalsNumber;
		this.notes = notes;
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
	 * Gets the dhpet hunted animals.
	 *
	 * @return the dhpet hunted animals
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hunted_animal_id", nullable = false)
	public DhpetHuntedAnimals getDhpetHuntedAnimals() {
		return this.dhpetHuntedAnimals;
	}

	/**
	 * Sets the dhpet hunted animals.
	 *
	 * @param dhpetHuntedAnimals the new dhpet hunted animals
	 */
	public void setDhpetHuntedAnimals(DhpetHuntedAnimals dhpetHuntedAnimals) {
		this.dhpetHuntedAnimals = dhpetHuntedAnimals;
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
	 * Gets the gender.
	 *
	 * @return the gender
	 */
	@Column(name = "gender", nullable = false, length = 1)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.GenderUserType")
	public Gender getGender() {
		return this.gender;
	}

	/**
	 * Sets the gender.
	 *
	 * @param gender the new gender
	 */
	public void setGender(Gender gender) {
		this.gender = gender;
	}

	/**
	 * Gets the age.
	 *
	 * @return the age
	 */
	@Column(name = "age")
	public Long getAge() {
		return this.age;
	}

	/**
	 * Sets the age.
	 *
	 * @param age the new age
	 */
	public void setAge(Long age) {
		this.age = age;
	}

	/**
	 * Gets the weight.
	 *
	 * @return the weight
	 */
	@Column(name = "weight", precision = 17, scale = 17)
	public Double getWeight() {
		return this.weight;
	}

	/**
	 * Sets the weight.
	 *
	 * @param weight the new weight
	 */
	public void setWeight(Double weight) {
		this.weight = weight;
	}

	/**
	 * Gets the death cause.
	 *
	 * @return the death cause
	 */
	@Column(name = "death_cause", nullable = false, length = 3)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.AnimaldeathcauseUserType")
	public Animaldeathcause getDeathCause() {
		return this.deathCause;
	}

	/**
	 * Sets the death cause.
	 *
	 * @param deathCause the new death cause
	 */
	public void setDeathCause(Animaldeathcause deathCause) {
		this.deathCause = deathCause;
	}

	/**
	 * Gets the animals number.
	 *
	 * @return the animals number
	 */
	@Column(name = "animals_number", nullable = false)
	public Long getAnimalsNumber() {
		return this.animalsNumber;
	}

	/**
	 * Sets the animals number.
	 *
	 * @param animalsNumber the new animals number
	 */
	public void setAnimalsNumber(Long animalsNumber) {
		this.animalsNumber = animalsNumber;
	}

	/**
	 * Gets the notes.
	 *
	 * @return the notes
	 */
	@Column(name = "notes")
	public String getNotes() {
		return this.notes;
	}

	/**
	 * Sets the notes.
	 *
	 * @param notes the new notes
	 */
	public void setNotes(String notes) {
		this.notes = notes;
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

}