package com.geoland.kfis.web.action.hrm.employee.soscontact;

import java.io.IOException;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class SosContactAction.
 */
public class SosContactAction extends SosContactBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		if(sosContactId!=null){
			sosContact=DAOFactory.getFactory().getEmployeeSosContactDAO().get(sosContactId);
		}
		
		return "form";
	}
	
}
