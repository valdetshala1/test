package com.geoland.kfis.web.action.frm.annualplan.harvest.transport;

import java.io.File;

import com.geoland.kfis.model.StandHarvestImplTransport;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class HarvTransportBaseAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created 1:52:21 PM Jan 14, 2016
 */
public class HarvTransportBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The harv impl transport. */
	protected StandHarvestImplTransport harvImplTransport;
	
	/** The transport id. */
	protected Long transportId;
	
	/** The file. */
	protected File file;
	
	/** The harv imp ids. */
	protected String[] harvImpIds;
	
	/** The harv to trans ids. */
	protected String harvToTransIds;
	
	/**
	 * Gets the harv impl transport.
	 *
	 * @return the harv impl transport
	 */
	public StandHarvestImplTransport getHarvImplTransport() {
		return harvImplTransport;
	}
	
	/**
	 * Sets the harv impl transport.
	 *
	 * @param harvImplTransport the new harv impl transport
	 */
	public void setHarvImplTransport(StandHarvestImplTransport harvImplTransport) {
		this.harvImplTransport = harvImplTransport;
	}
	
	/**
	 * Gets the transport id.
	 *
	 * @return the transport id
	 */
	public Long getTransportId() {
		return transportId;
	}
	
	/**
	 * Sets the transport id.
	 *
	 * @param transportId the new transport id
	 */
	public void setTransportId(Long transportId) {
		this.transportId = transportId;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}
	
	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	/**
	 * Gets the harv imp ids.
	 *
	 * @return the harv imp ids
	 */
	public String[] getHarvImpIds() {
		return harvImpIds;
	}
	
	/**
	 * Sets the harv imp ids.
	 *
	 * @param harvImpIds the new harv imp ids
	 */
	public void setHarvImpIds(String[] harvImpIds) {
		this.harvImpIds = harvImpIds;
	}
	
	/**
	 * Gets the harv to trans ids.
	 *
	 * @return the harv to trans ids
	 */
	public String getHarvToTransIds() {
		return harvToTransIds;
	}
	
	/**
	 * Sets the harv to trans ids.
	 *
	 * @param harvToTransIds the new harv to trans ids
	 */
	public void setHarvToTransIds(String harvToTransIds) {
		this.harvToTransIds = harvToTransIds;
	}
	
}
