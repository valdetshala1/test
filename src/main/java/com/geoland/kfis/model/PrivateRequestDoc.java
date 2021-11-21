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
 * PrivateRequestDoc generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_private_request_doc", schema = "public")
public class PrivateRequestDoc extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The party. */
	private Party party;
	
	/** The private request. */
	private PrivateRequest privateRequest;
	
	/** The doc type. */
	private String docType;
	
	/** The doc name. */
	private String docName;
	
	/** The doc size. */
	private Long docSize;
	
	/** The doc. */
	private byte[] doc;
	
	/** The note. */
	private String note;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new private request doc.
	 */
	public PrivateRequestDoc() {
	}

	/**
	 * Instantiates a new private request doc.
	 *
	 * @param party the party
	 * @param privateRequest the private request
	 * @param docType the doc type
	 * @param docName the doc name
	 * @param docSize the doc size
	 * @param doc the doc
	 * @param createdDate the created date
	 */
	public PrivateRequestDoc(Party party, PrivateRequest privateRequest,
			String docType, String docName, Long docSize, byte[] doc,
			Date createdDate) {
		this.party = party;
		this.privateRequest = privateRequest;
		this.docType = docType;
		this.docName = docName;
		this.docSize = docSize;
		this.doc = doc;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new private request doc.
	 *
	 * @param party the party
	 * @param privateRequest the private request
	 * @param docType the doc type
	 * @param docName the doc name
	 * @param docSize the doc size
	 * @param doc the doc
	 * @param note the note
	 * @param createdDate the created date
	 */
	public PrivateRequestDoc(Party party, PrivateRequest privateRequest,
			String docType, String docName, Long docSize, byte[] doc,
			String note, Date createdDate) {
		this.party = party;
		this.privateRequest = privateRequest;
		this.docType = docType;
		this.docName = docName;
		this.docSize = docSize;
		this.doc = doc;
		this.note = note;
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
	 * Gets the party.
	 *
	 * @return the party
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Party getParty() {
		return this.party;
	}

	/**
	 * Sets the party.
	 *
	 * @param party the new party
	 */
	public void setParty(Party party) {
		this.party = party;
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
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	@Column(name = "doc_type", nullable = false, length = 100)
	public String getDocType() {
		return this.docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}

	/**
	 * Gets the doc name.
	 *
	 * @return the doc name
	 */
	@Column(name = "doc_name", nullable = false, length = 100)
	public String getDocName() {
		return this.docName;
	}

	/**
	 * Sets the doc name.
	 *
	 * @param docName the new doc name
	 */
	public void setDocName(String docName) {
		this.docName = docName;
	}

	/**
	 * Gets the doc size.
	 *
	 * @return the doc size
	 */
	@Column(name = "doc_size", nullable = false)
	public Long getDocSize() {
		return this.docSize;
	}

	/**
	 * Sets the doc size.
	 *
	 * @param docSize the new doc size
	 */
	public void setDocSize(Long docSize) {
		this.docSize = docSize;
	}

	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	@Column(name = "doc", nullable = false)
	public byte[] getDoc() {
		return this.doc;
	}

	/**
	 * Sets the doc.
	 *
	 * @param doc the new doc
	 */
	public void setDoc(byte[] doc) {
		this.doc = doc;
	}

	/**
	 * Gets the note.
	 *
	 * @return the note
	 */
	@Column(name = "note")
	public String getNote() {
		return this.note;
	}

	/**
	 * Sets the note.
	 *
	 * @param note the new note
	 */
	public void setNote(String note) {
		this.note = note;
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