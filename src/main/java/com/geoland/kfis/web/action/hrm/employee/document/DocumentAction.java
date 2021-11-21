package com.geoland.kfis.web.action.hrm.employee.document;

import java.io.IOException;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class DocumentAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 22, 2014 10:30:09 AM
 * @Version 1.0
 */
public class DocumentAction extends DocumentBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6154683029858949113L;

	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		
		if(documentId!=null){
			employeeDocument=DAOFactory.getFactory().getEmployeeDocumentDAO().get(documentId);
		}
		
		return "form";
	}
}
