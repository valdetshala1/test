package com.geoland.kfis.model;

// Generated Mar 7, 2015 12:39:09 AM by Hibernate Tools 3.4.0.CR1

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
 * PurchaseOrderStatus generated by hbm2java.
 */
@Entity
@Table(name = "tpurchase_order_status", schema = "public")
public class PurchaseOrderStatus extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The purchase order. */
	private PurchaseOrder purchaseOrder;
	
	/** The person by updatedby. */
	private Person personByUpdatedby;
	
	/** The person by createdby. */
	private Person personByCreatedby;
	
	/** The status code. */
	private String statusCode;
	
	/** The textmsg. */
	private String textmsg;
	
	/** The created. */
	private Date created;
	
	/** The updated. */
	private Date updated;
	
	/** The purchase orders. */
	private Set<PurchaseOrder> purchaseOrders = new HashSet<PurchaseOrder>(0);

	/**
	 * Instantiates a new purchase order status.
	 */
	public PurchaseOrderStatus() {
	}

	/**
	 * Instantiates a new purchase order status.
	 *
	 * @param purchaseOrder the purchase order
	 * @param personByUpdatedby the person by updatedby
	 * @param personByCreatedby the person by createdby
	 * @param statusCode the status code
	 * @param created the created
	 * @param updated the updated
	 */
	public PurchaseOrderStatus(PurchaseOrder purchaseOrder,
			Person personByUpdatedby, Person personByCreatedby,
			String statusCode, Date created, Date updated) {
		this.purchaseOrder = purchaseOrder;
		this.personByUpdatedby = personByUpdatedby;
		this.personByCreatedby = personByCreatedby;
		this.statusCode = statusCode;
		this.created = created;
		this.updated = updated;
	}

	/**
	 * Instantiates a new purchase order status.
	 *
	 * @param purchaseOrder the purchase order
	 * @param personByUpdatedby the person by updatedby
	 * @param personByCreatedby the person by createdby
	 * @param statusCode the status code
	 * @param textmsg the textmsg
	 * @param created the created
	 * @param updated the updated
	 * @param purchaseOrders the purchase orders
	 */
	public PurchaseOrderStatus(PurchaseOrder purchaseOrder,
			Person personByUpdatedby, Person personByCreatedby,
			String statusCode, String textmsg, Date created, Date updated,
			Set<PurchaseOrder> purchaseOrders) {
		this.purchaseOrder = purchaseOrder;
		this.personByUpdatedby = personByUpdatedby;
		this.personByCreatedby = personByCreatedby;
		this.statusCode = statusCode;
		this.textmsg = textmsg;
		this.created = created;
		this.updated = updated;
		this.purchaseOrders = purchaseOrders;
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
	 * Gets the purchase order.
	 *
	 * @return the purchase order
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", nullable = false)
	public PurchaseOrder getPurchaseOrder() {
		return this.purchaseOrder;
	}

	/**
	 * Sets the purchase order.
	 *
	 * @param purchaseOrder the new purchase order
	 */
	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
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
	 * Gets the status code.
	 *
	 * @return the status code
	 */
	@Column(name = "status_code", nullable = false, length = 20)
	public String getStatusCode() {
		return this.statusCode;
	}

	/**
	 * Sets the status code.
	 *
	 * @param statusCode the new status code
	 */
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	/**
	 * Gets the textmsg.
	 *
	 * @return the textmsg
	 */
	@Column(name = "textmsg", length = 1000)
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
	 * Gets the purchase orders.
	 *
	 * @return the purchase orders
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "purchaseOrderStatus")
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

}