package com.geoland.kfis.model;

// Generated Apr 20, 2015 3:54:26 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
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
 * DpMngmt generated by hbm2java.
 */
@Entity
@Table(name = "tdp_mngmt", schema = "public")
public class DpMngmt extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The person by owner id. */
	private Person personByOwnerId;
	
	/** The person by createdby. */
	private Person personByCreatedby;
	
	/** The doc type. */
	private DocType docType;
	
	/** The dp mngmt status. */
	private DpMngmtStatus dpMngmtStatus;
	
	/** The person by updatedby. */
	private Person personByUpdatedby;
	
	/** The organisation. */
	private Organisation organisation;
	
	/** The isactive. */
	private String isactive;
	
	/** The channel type. */
	private String channelType;
	
	/** The created. */
	private Date created;
	
	/** The updated. */
	private Date updated;
	
	/** The documentno. */
	private String documentno;
	
	/** The doc subject. */
	private String docSubject;
	
	/** The datetrx. */
	private Date datetrx;
	
	/** The shipper. */
	private String shipper;
	
	/** The receiver. */
	private String receiver;
	
	/** The processing. */
	private String processing;
	
	/** The processed. */
	private String processed;
	
	/** The posted. */
	private String posted;
	
	/** The description. */
	private String description;
	
	/** The textmsg. */
	private String textmsg;
	
	/** The issued date. */
	private Date issuedDate;
	
	/** The received date. */
	private Date receivedDate;
	
	/** The stored date. */
	private Date storedDate;
	
	/** The dp mngmt attaches. */
	private Set<DpMngmtAttach> dpMngmtAttaches = new HashSet<DpMngmtAttach>(0);
	
	/** The requisitions. */
	private Set<Requisition> requisitions = new HashSet<Requisition>(0);
	
	/** The purchase orders. */
	private Set<PurchaseOrder> purchaseOrders = new HashSet<PurchaseOrder>(0);
	
	/** The dp mngmt statuses. */
	private Set<DpMngmtStatus> dpMngmtStatuses = new HashSet<DpMngmtStatus>(0);

	/**
	 * Instantiates a new dp mngmt.
	 */
	public DpMngmt() {
	}

	/**
	 * Instantiates a new dp mngmt.
	 *
	 * @param personByCreatedby the person by createdby
	 * @param docType the doc type
	 * @param personByUpdatedby the person by updatedby
	 * @param isactive the isactive
	 * @param channelType the channel type
	 * @param created the created
	 * @param updated the updated
	 * @param documentno the documentno
	 * @param docSubject the doc subject
	 * @param datetrx the datetrx
	 * @param processed the processed
	 * @param posted the posted
	 */
	public DpMngmt(Person personByCreatedby, DocType docType,
			Person personByUpdatedby, String isactive, String channelType,
			Date created, Date updated, String documentno, String docSubject,
			Date datetrx, String processed, String posted) {
		this.personByCreatedby = personByCreatedby;
		this.docType = docType;
		this.personByUpdatedby = personByUpdatedby;
		this.isactive = isactive;
		this.channelType = channelType;
		this.created = created;
		this.updated = updated;
		this.documentno = documentno;
		this.docSubject = docSubject;
		this.datetrx = datetrx;
		this.processed = processed;
		this.posted = posted;
	}

	/**
	 * Instantiates a new dp mngmt.
	 *
	 * @param personByOwnerId the person by owner id
	 * @param personByCreatedby the person by createdby
	 * @param docType the doc type
	 * @param dpMngmtStatus the dp mngmt status
	 * @param personByUpdatedby the person by updatedby
	 * @param organisation the organisation
	 * @param isactive the isactive
	 * @param channelType the channel type
	 * @param created the created
	 * @param updated the updated
	 * @param documentno the documentno
	 * @param docSubject the doc subject
	 * @param datetrx the datetrx
	 * @param shipper the shipper
	 * @param receiver the receiver
	 * @param processing the processing
	 * @param processed the processed
	 * @param posted the posted
	 * @param description the description
	 * @param textmsg the textmsg
	 * @param issuedDate the issued date
	 * @param receivedDate the received date
	 * @param storedDate the stored date
	 * @param dpMngmtAttaches the dp mngmt attaches
	 * @param requisitions the requisitions
	 * @param purchaseOrders the purchase orders
	 * @param dpMngmtStatuses the dp mngmt statuses
	 */
	public DpMngmt(Person personByOwnerId, Person personByCreatedby,
			DocType docType, DpMngmtStatus dpMngmtStatus,
			Person personByUpdatedby, Organisation organisation,
			String isactive, String channelType, Date created, Date updated,
			String documentno, String docSubject, Date datetrx, String shipper,
			String receiver, String processing, String processed,
			String posted, String description, String textmsg, Date issuedDate,
			Date receivedDate, Date storedDate,
			Set<DpMngmtAttach> dpMngmtAttaches, Set<Requisition> requisitions,
			Set<PurchaseOrder> purchaseOrders,
			Set<DpMngmtStatus> dpMngmtStatuses) {
		this.personByOwnerId = personByOwnerId;
		this.personByCreatedby = personByCreatedby;
		this.docType = docType;
		this.dpMngmtStatus = dpMngmtStatus;
		this.personByUpdatedby = personByUpdatedby;
		this.organisation = organisation;
		this.isactive = isactive;
		this.channelType = channelType;
		this.created = created;
		this.updated = updated;
		this.documentno = documentno;
		this.docSubject = docSubject;
		this.datetrx = datetrx;
		this.shipper = shipper;
		this.receiver = receiver;
		this.processing = processing;
		this.processed = processed;
		this.posted = posted;
		this.description = description;
		this.textmsg = textmsg;
		this.issuedDate = issuedDate;
		this.receivedDate = receivedDate;
		this.storedDate = storedDate;
		this.dpMngmtAttaches = dpMngmtAttaches;
		this.requisitions = requisitions;
		this.purchaseOrders = purchaseOrders;
		this.dpMngmtStatuses = dpMngmtStatuses;
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
	 * Gets the person by owner id.
	 *
	 * @return the person by owner id
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "owner_id")
	public Person getPersonByOwnerId() {
		return this.personByOwnerId;
	}

	/**
	 * Sets the person by owner id.
	 *
	 * @param personByOwnerId the new person by owner id
	 */
	public void setPersonByOwnerId(Person personByOwnerId) {
		this.personByOwnerId = personByOwnerId;
	}

	/**
	 * Gets the person by createdby.
	 *
	 * @return the person by createdby
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "createdby", nullable = false)
	public Person getPersonByCreatedby() {
		return this.personByCreatedby;
	}

	/**
	 * Sets the person by createdby.
	 *
	 * @param personByCreatedby the new person by createdby
	 */
	public void setPersonByCreatedby(Person personByCreatedby) {
		this.personByCreatedby = personByCreatedby;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "doctype_id", nullable = false)
	public DocType getDocType() {
		return this.docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(DocType docType) {
		this.docType = docType;
	}

	/**
	 * Gets the dp mngmt status.
	 *
	 * @return the dp mngmt status
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	public DpMngmtStatus getDpMngmtStatus() {
		return this.dpMngmtStatus;
	}

	/**
	 * Sets the dp mngmt status.
	 *
	 * @param dpMngmtStatus the new dp mngmt status
	 */
	public void setDpMngmtStatus(DpMngmtStatus dpMngmtStatus) {
		this.dpMngmtStatus = dpMngmtStatus;
	}

	/**
	 * Gets the person by updatedby.
	 *
	 * @return the person by updatedby
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "updatedby", nullable = false)
	public Person getPersonByUpdatedby() {
		return this.personByUpdatedby;
	}

	/**
	 * Sets the person by updatedby.
	 *
	 * @param personByUpdatedby the new person by updatedby
	 */
	public void setPersonByUpdatedby(Person personByUpdatedby) {
		this.personByUpdatedby = personByUpdatedby;
	}

	/**
	 * Gets the organisation.
	 *
	 * @return the organisation
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "department_id")
	public Organisation getOrganisation() {
		return this.organisation;
	}

	/**
	 * Sets the organisation.
	 *
	 * @param organisation the new organisation
	 */
	public void setOrganisation(Organisation organisation) {
		this.organisation = organisation;
	}

	/**
	 * Gets the isactive.
	 *
	 * @return the isactive
	 */
	@Column(name = "isactive", nullable = false, length = 1)
	public String getIsactive() {
		return this.isactive;
	}

	/**
	 * Sets the isactive.
	 *
	 * @param isactive the new isactive
	 */
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

	/**
	 * Gets the channel type.
	 *
	 * @return the channel type
	 */
	@Column(name = "channel_type", nullable = false, length = 1)
	public String getChannelType() {
		return this.channelType;
	}

	/**
	 * Sets the channel type.
	 *
	 * @param channelType the new channel type
	 */
	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}

	/**
	 * Gets the created.
	 *
	 * @return the created
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created", nullable = false, length = 29)
	public Date getCreated() {
		return this.created;
	}

	/**
	 * Sets the created.
	 *
	 * @param created the new created
	 */
	public void setCreated(Date created) {
		this.created = created;
	}

	/**
	 * Gets the updated.
	 *
	 * @return the updated
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated", nullable = false, length = 29)
	public Date getUpdated() {
		return this.updated;
	}

	/**
	 * Sets the updated.
	 *
	 * @param updated the new updated
	 */
	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	/**
	 * Gets the documentno.
	 *
	 * @return the documentno
	 */
	@Column(name = "documentno", nullable = false, length = 36)
	public String getDocumentno() {
		return this.documentno;
	}

	/**
	 * Sets the documentno.
	 *
	 * @param documentno the new documentno
	 */
	public void setDocumentno(String documentno) {
		this.documentno = documentno;
	}

	/**
	 * Gets the doc subject.
	 *
	 * @return the doc subject
	 */
	@Column(name = "doc_subject", nullable = false)
	public String getDocSubject() {
		return this.docSubject;
	}

	/**
	 * Sets the doc subject.
	 *
	 * @param docSubject the new doc subject
	 */
	public void setDocSubject(String docSubject) {
		this.docSubject = docSubject;
	}

	/**
	 * Gets the datetrx.
	 *
	 * @return the datetrx
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "datetrx", nullable = false, length = 29)
	public Date getDatetrx() {
		return this.datetrx;
	}

	/**
	 * Sets the datetrx.
	 *
	 * @param datetrx the new datetrx
	 */
	public void setDatetrx(Date datetrx) {
		this.datetrx = datetrx;
	}

	/**
	 * Gets the shipper.
	 *
	 * @return the shipper
	 */
	@Column(name = "shipper")
	public String getShipper() {
		return this.shipper;
	}

	/**
	 * Sets the shipper.
	 *
	 * @param shipper the new shipper
	 */
	public void setShipper(String shipper) {
		this.shipper = shipper;
	}

	/**
	 * Gets the receiver.
	 *
	 * @return the receiver
	 */
	@Column(name = "receiver")
	public String getReceiver() {
		return this.receiver;
	}

	/**
	 * Sets the receiver.
	 *
	 * @param receiver the new receiver
	 */
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	/**
	 * Gets the processing.
	 *
	 * @return the processing
	 */
	@Column(name = "processing", length = 1)
	public String getProcessing() {
		return this.processing;
	}

	/**
	 * Sets the processing.
	 *
	 * @param processing the new processing
	 */
	public void setProcessing(String processing) {
		this.processing = processing;
	}

	/**
	 * Gets the processed.
	 *
	 * @return the processed
	 */
	@Column(name = "processed", nullable = false, length = 60)
	public String getProcessed() {
		return this.processed;
	}

	/**
	 * Sets the processed.
	 *
	 * @param processed the new processed
	 */
	public void setProcessed(String processed) {
		this.processed = processed;
	}

	/**
	 * Gets the posted.
	 *
	 * @return the posted
	 */
	@Column(name = "posted", nullable = false, length = 60)
	public String getPosted() {
		return this.posted;
	}

	/**
	 * Sets the posted.
	 *
	 * @param posted the new posted
	 */
	public void setPosted(String posted) {
		this.posted = posted;
	}

	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	/**
	 * Sets the description.
	 *
	 * @param description the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the textmsg.
	 *
	 * @return the textmsg
	 */
	@Column(name = "textmsg")
	public String getTextmsg() {
		return this.textmsg;
	}

	/**
	 * Sets the textmsg.
	 *
	 * @param textmsg the new textmsg
	 */
	public void setTextmsg(String textmsg) {
		this.textmsg = textmsg;
	}

	/**
	 * Gets the issued date.
	 *
	 * @return the issued date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "issued_date", length = 29)
	public Date getIssuedDate() {
		return this.issuedDate;
	}

	/**
	 * Sets the issued date.
	 *
	 * @param issuedDate the new issued date
	 */
	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	/**
	 * Gets the received date.
	 *
	 * @return the received date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "received_date", length = 29)
	public Date getReceivedDate() {
		return this.receivedDate;
	}

	/**
	 * Sets the received date.
	 *
	 * @param receivedDate the new received date
	 */
	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}

	/**
	 * Gets the stored date.
	 *
	 * @return the stored date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "stored_date", length = 29)
	public Date getStoredDate() {
		return this.storedDate;
	}

	/**
	 * Sets the stored date.
	 *
	 * @param storedDate the new stored date
	 */
	public void setStoredDate(Date storedDate) {
		this.storedDate = storedDate;
	}

	/**
	 * Gets the dp mngmt attaches.
	 *
	 * @return the dp mngmt attaches
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dpMngmt")
	public Set<DpMngmtAttach> getDpMngmtAttaches() {
		return this.dpMngmtAttaches;
	}

	/**
	 * Sets the dp mngmt attaches.
	 *
	 * @param dpMngmtAttaches the new dp mngmt attaches
	 */
	public void setDpMngmtAttaches(Set<DpMngmtAttach> dpMngmtAttaches) {
		this.dpMngmtAttaches = dpMngmtAttaches;
	}

	/**
	 * Gets the requisitions.
	 *
	 * @return the requisitions
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dpMngmt")
	public Set<Requisition> getRequisitions() {
		return this.requisitions;
	}

	/**
	 * Sets the requisitions.
	 *
	 * @param requisitions the new requisitions
	 */
	public void setRequisitions(Set<Requisition> requisitions) {
		this.requisitions = requisitions;
	}

	/**
	 * Gets the purchase orders.
	 *
	 * @return the purchase orders
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dpMngmt")
	public Set<PurchaseOrder> getPurchaseOrders() {
		return this.purchaseOrders;
	}

	/**
	 * Sets the purchase orders.
	 *
	 * @param purchaseOrders the new purchase orders
	 */
	public void setPurchaseOrders(Set<PurchaseOrder> purchaseOrders) {
		this.purchaseOrders = purchaseOrders;
	}

	/**
	 * Gets the dp mngmt statuses.
	 *
	 * @return the dp mngmt statuses
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dpMngmt")
	public Set<DpMngmtStatus> getDpMngmtStatuses() {
		return this.dpMngmtStatuses;
	}

	/**
	 * Sets the dp mngmt statuses.
	 *
	 * @param dpMngmtStatuses the new dp mngmt statuses
	 */
	public void setDpMngmtStatuses(Set<DpMngmtStatus> dpMngmtStatuses) {
		this.dpMngmtStatuses = dpMngmtStatuses;
	}

}