package com.geoland.kfis.web.action.ads.logistic.protocolports;

import com.geoland.kfis.model.ProtocolPorts;
import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class ProtocolPortsBaseAction.
 *
 * @author Arta Hoxha , GEO&LAND
 * @version 1.0
 * @created Apr 4, 2016 , 11:39:09 AM
 */
public class ProtocolPortsBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The protocol id. */
	protected Long protocolId;
	
	/** The protocol ports. */
	protected ProtocolPorts protocolPorts;
	
	/**
	 * Gets the protocol id.
	 *
	 * @return the protocol id
	 */
	public Long getProtocolId() {
		return protocolId;
	}
	
	/**
	 * Sets the protocol id.
	 *
	 * @param protocolId the new protocol id
	 */
	public void setProtocolId(Long protocolId) {
		this.protocolId = protocolId;
	}
	
	/**
	 * Gets the protocol ports.
	 *
	 * @return the protocol ports
	 */
	public ProtocolPorts getProtocolPorts() {
		return protocolPorts;
	}
	
	/**
	 * Sets the protocol ports.
	 *
	 * @param protocolPorts the new protocol ports
	 */
	public void setProtocolPorts(ProtocolPorts protocolPorts) {
		this.protocolPorts = protocolPorts;
	}

	
	
}
