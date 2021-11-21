package com.geoland.kfis.web.action.ads.order.requisition;

import com.geoland.kfis.model.Requisition;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class RequisitionBaseAction.
 */
public class RequisitionBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4211767952681749531L;
	
	/** The requisition. */
	protected Requisition requisition;
	
	/** The requisition id. */
	protected Long requisitionId;
	
	/** The req id. */
	private Long req_id;
	
	/**
	 * Gets the requisition.
	 *
	 * @return the requisition
	 */
	public Requisition getRequisition() {
		return requisition;
	}
	
	/**
	 * Sets the requisition.
	 *
	 * @param requisition the new requisition
	 */
	public void setRequisition(Requisition requisition) {
		this.requisition = requisition;
	}
	
	/**
	 * Gets the requisition id.
	 *
	 * @return the requisition id
	 */
	public Long getRequisitionId() {
		return requisitionId;
	}
	
	/**
	 * Sets the requisition id.
	 *
	 * @param requisitionId the new requisition id
	 */
	public void setRequisitionId(Long requisitionId) {
		this.requisitionId = requisitionId;
	}
	
	/**
	 * Gets the req id.
	 *
	 * @return the req id
	 */
	public Long getReq_id() {
		return req_id;
	}
	
	/**
	 * Sets the req id.
	 *
	 * @param req_id the new req id
	 */
	public void setReq_id(Long req_id) {
		this.req_id = req_id;
	}
	

	
}
