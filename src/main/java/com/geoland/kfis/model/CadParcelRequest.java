package com.geoland.kfis.model;

// Generated Nov 18, 2015 11:56:28 AM by Hibernate Tools 4.0.0

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
 * CadParcelRequest generated by hbm2java.
 */
@Entity
@Table(name = "tfal_cad_parcel_request", schema = "public")
public class CadParcelRequest extends AbstractPersistentObject implements
		java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The request. */
	private Request request;
	
	/** The cadastral zone. */
	private String cadastralZone;
	
	/** The parcel num. */
	private Long parcelNum;

	/**
	 * Instantiates a new cad parcel request.
	 */
	public CadParcelRequest() {
	}

	/**
	 * Instantiates a new cad parcel request.
	 *
	 * @param request the request
	 * @param cadastralZone the cadastral zone
	 * @param parcelNum the parcel num
	 */
	public CadParcelRequest(Request request, String cadastralZone,
			Long parcelNum) {
		this.request = request;
		this.cadastralZone = cadastralZone;
		this.parcelNum = parcelNum;
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
	 * Gets the request.
	 *
	 * @return the request
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "request_id", nullable = false)
	public Request getRequest() {
		return this.request;
	}

	/**
	 * Sets the request.
	 *
	 * @param request the new request
	 */
	public void setRequest(Request request) {
		this.request = request;
	}

	/**
	 * Gets the cadastral zone.
	 *
	 * @return the cadastral zone
	 */
	@Column(name = "cadastral_zone", nullable = false, length = 100)
	public String getCadastralZone() {
		return this.cadastralZone;
	}

	/**
	 * Sets the cadastral zone.
	 *
	 * @param cadastralZone the new cadastral zone
	 */
	public void setCadastralZone(String cadastralZone) {
		this.cadastralZone = cadastralZone;
	}

	/**
	 * Gets the parcel num.
	 *
	 * @return the parcel num
	 */
	@Column(name = "parcel_num", nullable = false)
	public Long getParcelNum() {
		return this.parcelNum;
	}

	/**
	 * Sets the parcel num.
	 *
	 * @param parcelNum the new parcel num
	 */
	public void setParcelNum(Long parcelNum) {
		this.parcelNum = parcelNum;
	}

}
