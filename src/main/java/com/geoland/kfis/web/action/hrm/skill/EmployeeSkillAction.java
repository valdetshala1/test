package com.geoland.kfis.web.action.hrm.skill;

import java.io.IOException;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class EmployeeSkillAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 14, 2014 11:45:56 AM
 * @Version 1.0
 */
public class EmployeeSkillAction extends EmployeeSkillBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Training.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String training() throws IOException{
		if(skillId!=null){
			employeeSkill=DAOFactory.getFactory().getEmployeeSkillDAO().get(skillId);
		}
		return "training";
	}
	
	/**
	 * Certification.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String certification() throws IOException{
		if(skillId!=null){
			employeeSkill=DAOFactory.getFactory().getEmployeeSkillDAO().get(skillId);
		}
		return "certification";
	}
	
	/**
	 * Education.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String education() throws IOException{
		if(skillId!=null){
			employeeSkill=DAOFactory.getFactory().getEmployeeSkillDAO().get(skillId);
		}
		return "education";
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
