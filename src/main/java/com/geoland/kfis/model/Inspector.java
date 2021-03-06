package com.geoland.kfis.model;

// Generated Apr 7, 2015 2:09:50 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * Inspector generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_inspector", schema = "public")
public class Inspector extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The inspection. */
	private Inspection inspection;
	
	/** The employee. */
	private Employee employee;

	/**
	 * Instantiates a new inspector.
	 */
	public Inspector() {
	}

	/**
	 * Instantiates a new inspector.
	 *
	 * @param inspection the inspection
	 * @param employee the employee
	 */
	public Inspector(Inspection inspection, Employee employee) {
		this.inspection = inspection;
		this.employee = employee;
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
	 * Gets the inspection.
	 *
	 * @return the inspection
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "office_activity_id", nullable = false)
	public Inspection getInspection() {
		return this.inspection;
	}

	/**
	 * Sets the inspection.
	 *
	 * @param inspection the new inspection
	 */
	public void setInspection(Inspection inspection) {
		this.inspection = inspection;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee_id", nullable = false)
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

}
