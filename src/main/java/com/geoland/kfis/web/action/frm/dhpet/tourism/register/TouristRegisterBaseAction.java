/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.tourism.register;

import com.geoland.kfis.model.DhpetTouristRegister;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristRegisterBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 27, 2016, 3:28:04 PM
 */
public class TouristRegisterBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9094518720279607730L;

	/** The register id. */
	protected Long registerId;
	
	/** The register. */
	protected DhpetTouristRegister register;
	
	/**
	 * Gets the register id.
	 *
	 * @return the registerId
	 */
	public Long getRegisterId() {
		return registerId;
	}
	
	/**
	 * Sets the register id.
	 *
	 * @param registerId the registerId to set
	 */
	public void setRegisterId(Long registerId) {
		this.registerId = registerId;
	}
	
	/**
	 * Gets the register.
	 *
	 * @return the register
	 */
	public DhpetTouristRegister getRegister() {
		return register;
	}
	
	/**
	 * Sets the register.
	 *
	 * @param register the register to set
	 */
	public void setRegister(DhpetTouristRegister register) {
		this.register = register;
	}
	
	
}
