package com.geoland.kfis.web.action.hrm.employee.soscontact;

import com.geoland.kfis.model.EmployeeSosContact;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class SosContactBaseAction.
 */
public class SosContactBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The sos contact id. */
	protected Long sosContactId;
	
	/** The sos contact. */
	protected EmployeeSosContact sosContact;
	
	/**
	 * Gets the sos contact id.
	 *
	 * @return the sos contact id
	 */
	public Long getSosContactId() {
		return sosContactId;
	}
	
	/**
	 * Sets the sos contact id.
	 *
	 * @param sosContactId the new sos contact id
	 */
	public void setSosContactId(Long sosContactId) {
		this.sosContactId = sosContactId;
	}
	
	/**
	 * Gets the sos contact.
	 *
	 * @return the sos contact
	 */
	public EmployeeSosContact getSosContact() {
		return sosContact;
	}
	
	/**
	 * Sets the sos contact.
	 *
	 * @param sosContact the new sos contact
	 */
	public void setSosContact(EmployeeSosContact sosContact) {
		this.sosContact = sosContact;
	}
	
}
