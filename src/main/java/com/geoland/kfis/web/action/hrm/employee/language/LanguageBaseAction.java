package com.geoland.kfis.web.action.hrm.employee.language;

import java.util.List;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeLanguage;
import com.geoland.kfis.model.Language;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Languagelevel;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class LanguageBaseAction.
 */
public class LanguageBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee language id. */
	protected Long employeeLanguageId;
	
	/** The employee language. */
	protected EmployeeLanguage employeeLanguage;
	
	/** The language level list. */
	private Languagelevel[] languageLevelList=Languagelevel.values();
	
	/**
	 * Exist language.
	 *
	 * @param emp the emp
	 * @param lang the lang
	 * @return true if employee(emp) with language(lang) exist
	 */
	public boolean existLanguage(Employee emp,Language lang){
		boolean exist=false;
		String query="select * from thrm_employee_language where employee_id="+emp.getId()+" and language_id="+lang.getId()+"";
		List <EmployeeLanguage> emloyeelanguageList=DAOFactory.getFactory().getEmployeeLanguageDAO().executeSQLQuery(query);
		if(!emloyeelanguageList.isEmpty()){
			exist=true;
		}
		return exist;
	}
	
	/**
	 * Gets the employee language id.
	 *
	 * @return the employee language id
	 */
	public Long getEmployeeLanguageId() {
		return employeeLanguageId;
	}
	
	/**
	 * Sets the employee language id.
	 *
	 * @param employeeLanguageId the new employee language id
	 */
	public void setEmployeeLanguageId(Long employeeLanguageId) {
		this.employeeLanguageId = employeeLanguageId;
	}
	
	/**
	 * Gets the employee language.
	 *
	 * @return the employee language
	 */
	public EmployeeLanguage getEmployeeLanguage() {
		return employeeLanguage;
	}
	
	/**
	 * Sets the employee language.
	 *
	 * @param employeeLanguage the new employee language
	 */
	public void setEmployeeLanguage(EmployeeLanguage employeeLanguage) {
		this.employeeLanguage = employeeLanguage;
	}
	
	/**
	 * Gets the language level list.
	 *
	 * @return the language level list
	 */
	public Languagelevel[] getLanguageLevelList() {
		return languageLevelList;
	}
	
	/**
	 * Sets the language level list.
	 *
	 * @param languageLevelList the new language level list
	 */
	public void setLanguageLevelList(Languagelevel[] languageLevelList) {
		this.languageLevelList = languageLevelList;
	}
	
	
	
	
	
}
