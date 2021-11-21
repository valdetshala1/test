package com.geoland.kfis.web.action.ads.order;

import com.geoland.kfis.model.PurchaseOrder;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class OrderBaseAction.
 */
public class OrderBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4211767952681749531L;

	/** The order id. */
	protected Long orderId;
	
	/** The order. */
	protected PurchaseOrder order;
	
	
	/**
	 * Gets the order id.
	 *
	 * @return the orderId
	 */
	public Long getOrderId() {
		return orderId;
	}
	
	/**
	 * Sets the order id.
	 *
	 * @param orderId the orderId to set
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	
	/**
	 * Gets the order.
	 *
	 * @return the order
	 */
	public PurchaseOrder getOrder() {
		return order;
	}
	
	/**
	 * Sets the order.
	 *
	 * @param order the order to set
	 */
	public void setOrder(PurchaseOrder order) {
		this.order = order;
	}
	
	
	
	
	
}
