/**
 * 
 */
package com.geoland.kfis.web.action.adm.bpartner;

import com.geoland.kfis.model.Bpartner;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class BPartnerBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:26:00 PM, Feb 11, 2015
 */
public class BPartnerBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8600571685357686729L;
	
	/** The party id. */
	protected Long partyId;
	
	/** The bpartner id. */
	protected Long bpartnerId;
	
	/** The bpartner. */
	protected Bpartner bpartner;
	
	/**
	 * Gets the bpartner id.
	 *
	 * @return the bpartner id
	 */
	public Long getBpartnerId() {
		return bpartnerId;
	}
	
	/**
	 * Sets the bpartner id.
	 *
	 * @param bpartnerId the new bpartner id
	 */
	public void setBpartnerId(Long bpartnerId) {
		this.bpartnerId = bpartnerId;
	}
	
	/**
	 * Gets the bpartner.
	 *
	 * @return the bpartner
	 */
	public Bpartner getBpartner() {
		return bpartner;
	}
	
	/**
	 * Sets the bpartner.
	 *
	 * @param bpartner the new bpartner
	 */
	public void setBpartner(Bpartner bpartner) {
		this.bpartner = bpartner;
	}
	
	/**
	 * Gets the party id.
	 *
	 * @return the party id
	 */
	public Long getPartyId() {
		return partyId;
	}
	
	/**
	 * Sets the party id.
	 *
	 * @param partyId the new party id
	 */
	public void setPartyId(Long partyId) {
		this.partyId = partyId;
	}
	
}
