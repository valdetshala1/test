package com.geoland.kfis.model;

// Generated Apr 27, 2015 4:19:24 PM by Hibernate Tools 4.0.0

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
 * PrcmtTenderBid generated by hbm2java.
 */
@Entity
@Table(name = "tprcmt_tender_bid", schema = "public")
public class PrcmtTenderBid extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The prcmt tender bidder. */
	private PrcmtTenderBidder prcmtTenderBidder;
	
	/** The prcmt tender request. */
	private PrcmtTenderRequest prcmtTenderRequest;
	
	/** The selected. */
	private boolean selected;
	
	/** The selected date. */
	private Date selectedDate;
	
	/** The doc type. */
	private String docType;
	
	/** The doc name. */
	private String docName;
	
	/** The doc. */
	private byte[] doc;
	
	/** The created date. */
	private Date createdDate;
	
	/** The note. */
	private String note;
	
	/** The bid value. */
	private Double bidValue;
	
	/** The prcmt tender complaints. */
	private Set<PrcmtTenderComplaint> prcmtTenderComplaints = new HashSet<PrcmtTenderComplaint>(
			0);

	/**
	 * Instantiates a new prcmt tender bid.
	 */
	public PrcmtTenderBid() {
	}

	/**
	 * Instantiates a new prcmt tender bid.
	 *
	 * @param employee the employee
	 * @param prcmtTenderBidder the prcmt tender bidder
	 * @param prcmtTenderRequest the prcmt tender request
	 * @param selected the selected
	 * @param createdDate the created date
	 * @param bidValue the bid value
	 */
	public PrcmtTenderBid(Employee employee,
			PrcmtTenderBidder prcmtTenderBidder,
			PrcmtTenderRequest prcmtTenderRequest, boolean selected,
			Date createdDate, Double bidValue) {
		this.employee = employee;
		this.prcmtTenderBidder = prcmtTenderBidder;
		this.prcmtTenderRequest = prcmtTenderRequest;
		this.selected = selected;
		this.createdDate = createdDate;
		this.bidValue = bidValue;
	}

	/**
	 * Instantiates a new prcmt tender bid.
	 *
	 * @param employee the employee
	 * @param prcmtTenderBidder the prcmt tender bidder
	 * @param prcmtTenderRequest the prcmt tender request
	 * @param selected the selected
	 * @param selectedDate the selected date
	 * @param docType the doc type
	 * @param docName the doc name
	 * @param doc the doc
	 * @param createdDate the created date
	 * @param note the note
	 * @param bidValue the bid value
	 * @param prcmtTenderComplaints the prcmt tender complaints
	 */
	public PrcmtTenderBid(Employee employee,
			PrcmtTenderBidder prcmtTenderBidder,
			PrcmtTenderRequest prcmtTenderRequest, boolean selected,
			Date selectedDate, String docType, String docName, byte[] doc,
			Date createdDate, String note, Double bidValue,
			Set<PrcmtTenderComplaint> prcmtTenderComplaints) {
		this.employee = employee;
		this.prcmtTenderBidder = prcmtTenderBidder;
		this.prcmtTenderRequest = prcmtTenderRequest;
		this.selected = selected;
		this.selectedDate = selectedDate;
		this.docType = docType;
		this.docName = docName;
		this.doc = doc;
		this.createdDate = createdDate;
		this.note = note;
		this.bidValue = bidValue;
		this.prcmtTenderComplaints = prcmtTenderComplaints;
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
	 * Gets the prcmt tender bidder.
	 *
	 * @return the prcmt tender bidder
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bidder_id", nullable = false)
	public PrcmtTenderBidder getPrcmtTenderBidder() {
		return this.prcmtTenderBidder;
	}

	/**
	 * Sets the prcmt tender bidder.
	 *
	 * @param prcmtTenderBidder the new prcmt tender bidder
	 */
	public void setPrcmtTenderBidder(PrcmtTenderBidder prcmtTenderBidder) {
		this.prcmtTenderBidder = prcmtTenderBidder;
	}

	/**
	 * Gets the prcmt tender request.
	 *
	 * @return the prcmt tender request
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tender_request_id", nullable = false)
	public PrcmtTenderRequest getPrcmtTenderRequest() {
		return this.prcmtTenderRequest;
	}

	/**
	 * Sets the prcmt tender request.
	 *
	 * @param prcmtTenderRequest the new prcmt tender request
	 */
	public void setPrcmtTenderRequest(PrcmtTenderRequest prcmtTenderRequest) {
		this.prcmtTenderRequest = prcmtTenderRequest;
	}

	/**
	 * Checks if is selected.
	 *
	 * @return true, if is selected
	 */
	@Column(name = "selected", nullable = false)
	public boolean isSelected() {
		return this.selected;
	}

	/**
	 * Sets the selected.
	 *
	 * @param selected the new selected
	 */
	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	/**
	 * Gets the selected date.
	 *
	 * @return the selected date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "selected_date", length = 29)
	public Date getSelectedDate() {
		return this.selectedDate;
	}

	/**
	 * Sets the selected date.
	 *
	 * @param selectedDate the new selected date
	 */
	public void setSelectedDate(Date selectedDate) {
		this.selectedDate = selectedDate;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	@Column(name = "doc_type", length = 100)
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
	@Column(name = "doc_name", length = 100)
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
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	@Column(name = "doc")
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
	 * Gets the bid value.
	 *
	 * @return the bid value
	 */
	@Column(name = "bid_value", nullable = false, precision = 17, scale = 17)
	public Double getBidValue() {
		return this.bidValue;
	}

	/**
	 * Sets the bid value.
	 *
	 * @param bidValue the new bid value
	 */
	public void setBidValue(Double bidValue) {
		this.bidValue = bidValue;
	}

	/**
	 * Gets the prcmt tender complaints.
	 *
	 * @return the prcmt tender complaints
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "prcmtTenderBid")
	public Set<PrcmtTenderComplaint> getPrcmtTenderComplaints() {
		return this.prcmtTenderComplaints;
	}

	/**
	 * Sets the prcmt tender complaints.
	 *
	 * @param prcmtTenderComplaints the new prcmt tender complaints
	 */
	public void setPrcmtTenderComplaints(
			Set<PrcmtTenderComplaint> prcmtTenderComplaints) {
		this.prcmtTenderComplaints = prcmtTenderComplaints;
	}

}
