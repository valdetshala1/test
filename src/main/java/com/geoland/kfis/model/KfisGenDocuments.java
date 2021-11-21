package com.geoland.kfis.model;
// Generated Jan 18, 2018 10:09:56 AM by Hibernate Tools 4.0.1.Final

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
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * KfisGenDocuments generated by hbm2java.
 */
@Entity
@Table(name = "tkfis_gen_documents", schema = "public", uniqueConstraints = @UniqueConstraint(columnNames = "uid"))
public class KfisGenDocuments extends AbstractPersistentObject implements java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The person. */
	private Person person;
	
	/** The uid. */
	private String uid;
	
	/** The url. */
	private String url;
	
	/** The generated date. */
	private Date generatedDate;
	
	/** The accessed. */
	private Boolean accessed;
	
	/** The A uid. */
	private String AUid;

	/**
	 * Instantiates a new kfis gen documents.
	 */
	public KfisGenDocuments() {
	}

	/**
	 * Instantiates a new kfis gen documents.
	 *
	 * @param uid the uid
	 * @param url the url
	 */
	public KfisGenDocuments(String uid, String url) {
		this.uid = uid;
		this.url = url;
	}

	/**
	 * Instantiates a new kfis gen documents.
	 *
	 * @param person the person
	 * @param uid the uid
	 * @param url the url
	 * @param generatedDate the generated date
	 * @param accessed the accessed
	 * @param AUid the a uid
	 */
	public KfisGenDocuments(Person person, String uid, String url, Date generatedDate, Boolean accessed, String AUid) {
		this.person = person;
		this.uid = uid;
		this.url = url;
		this.generatedDate = generatedDate;
		this.accessed = accessed;
		this.AUid = AUid;
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
	@JoinColumn(name = "generated_by")
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
	 * Gets the uid.
	 *
	 * @return the uid
	 */
	@Column(name = "uid", unique = true, nullable = false, length = 8)
	public String getUid() {
		return this.uid;
	}

	/**
	 * Sets the uid.
	 *
	 * @param uid the new uid
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * Gets the url.
	 *
	 * @return the url
	 */
	@Column(name = "url", nullable = false, length = 250)
	public String getUrl() {
		return this.url;
	}

	/**
	 * Sets the url.
	 *
	 * @param url the new url
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * Gets the generated date.
	 *
	 * @return the generated date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "generated_date", length = 29)
	public Date getGeneratedDate() {
		return this.generatedDate;
	}

	/**
	 * Sets the generated date.
	 *
	 * @param generatedDate the new generated date
	 */
	public void setGeneratedDate(Date generatedDate) {
		this.generatedDate = generatedDate;
	}

	/**
	 * Gets the accessed.
	 *
	 * @return the accessed
	 */
	@Column(name = "accessed")
	public Boolean getAccessed() {
		return this.accessed;
	}

	/**
	 * Sets the accessed.
	 *
	 * @param accessed the new accessed
	 */
	public void setAccessed(Boolean accessed) {
		this.accessed = accessed;
	}

	/**
	 * Gets the a uid.
	 *
	 * @return the a uid
	 */
	@Column(name = "a_uid", length = 50)
	public String getAUid() {
		return this.AUid;
	}

	/**
	 * Sets the a uid.
	 *
	 * @param AUid the new a uid
	 */
	public void setAUid(String AUid) {
		this.AUid = AUid;
	}

}