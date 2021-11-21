package com.geoland.kfis.web.action.hrm.employee.language;

import java.io.IOException;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LanguageAction.
 */
public class LanguageAction extends LanguageBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		if(employeeLanguageId!=null){
			employeeLanguage=DAOFactory.getFactory().getEmployeeLanguageDAO().get(employeeLanguageId);
			employeeLanguage.setLanguage(DAOFactory.getFactory().getLanguageDAO().get(employeeLanguage.getLanguage().getId()));
		}
		
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String list() throws IOException{
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String grid() throws IOException{
		return "grid";
	}

	
	/**
	 * Page.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String page() throws IOException{
		return "page";
	}	
	
}
