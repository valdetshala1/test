package com.geoland.kfis.model.view;

// Generated Oct 13, 2015 11:18:25 AM by Hibernate Tools 4.0.0

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Embeddable;

// TODO: Auto-generated Javadoc
/**
 * ShapeFieldsControlViewId generated by hbm2java.
 */
@Embeddable
public class ShapeFieldsControlViewId implements java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The stand id. */
	private String standId;
	
	/** The field. */
	private String field;
	
	/** The value. */
	private BigDecimal value;

	/**
	 * Instantiates a new shape fields control view id.
	 */
	public ShapeFieldsControlViewId() {
	}

	/**
	 * Instantiates a new shape fields control view id.
	 *
	 * @param standId the stand id
	 * @param field the field
	 * @param value the value
	 */
	public ShapeFieldsControlViewId(String standId, String field,
			BigDecimal value) {
		this.standId = standId;
		this.field = field;
		this.value = value;
	}

	/**
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	@Column(name = "stand_id", length = 254)
	public String getStandId() {
		return this.standId;
	}

	/**
	 * Sets the stand id.
	 *
	 * @param standId the new stand id
	 */
	public void setStandId(String standId) {
		this.standId = standId;
	}

	/**
	 * Gets the field.
	 *
	 * @return the field
	 */
	@Column(name = "field")
	public String getField() {
		return this.field;
	}

	/**
	 * Sets the field.
	 *
	 * @param field the new field
	 */
	public void setField(String field) {
		this.field = field;
	}

	/**
	 * Gets the value.
	 *
	 * @return the value
	 */
	@Column(name = "value", precision = 131089, scale = 0)
	public BigDecimal getValue() {
		return this.value;
	}

	/**
	 * Sets the value.
	 *
	 * @param value the new value
	 */
	public void setValue(BigDecimal value) {
		this.value = value;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ShapeFieldsControlViewId))
			return false;
		ShapeFieldsControlViewId castOther = (ShapeFieldsControlViewId) other;

		return ((this.getStandId() == castOther.getStandId()) || (this
				.getStandId() != null && castOther.getStandId() != null && this
				.getStandId().equals(castOther.getStandId())))
				&& ((this.getField() == castOther.getField()) || (this
						.getField() != null && castOther.getField() != null && this
						.getField().equals(castOther.getField())))
				&& ((this.getValue() == castOther.getValue()) || (this
						.getValue() != null && castOther.getValue() != null && this
						.getValue().equals(castOther.getValue())));
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getStandId() == null ? 0 : this.getStandId().hashCode());
		result = 37 * result
				+ (getField() == null ? 0 : this.getField().hashCode());
		result = 37 * result
				+ (getValue() == null ? 0 : this.getValue().hashCode());
		return result;
	}

}