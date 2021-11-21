package com.geoland.kfis.logic.security;

import java.util.Locale;

import com.geoland.framework.logic.BoUser;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class BoUserSecurity.
 *
 * @author GEO&LAND
 * @created October 29, 2014 11:34:37 AM
 * @Version 1.0
 */
public class BoUserSecurity extends BoUser {

	/**
	 * Instantiates a new bo user security.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoUserSecurity(User persistence, Locale locale) {
		super(persistence, locale);
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee(){
		Employee employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getPersistence().getId());
		return employee;
	}
	
	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson(){
		Person person = DAOFactory.getFactory().getPartyUserDAO().getPerson(getPersistence().getId());
		return person;
	}	
	
	/**
	 * Gets the organisation.
	 *
	 * @return the organisation
	 */
	public Organisation getOrganisation(){
		if(getEmployee()!=null){
			return getEmployee().getOrganisation();
		}
		return null;
	}
	
	/**
	 * Gets the organisation id.
	 *
	 * @return the organisation id
	 */
	public Long getOrganisationId(){
		if(getEmployee()!=null){
			return getEmployee().getOrganisation().getId();
		}
		return null;
	}
	
	/**
	 * Operational Level.
	 *
	 * @return the operational level
	 */
	public short getOperationalLevel(){
		if(getEmployee()!=null){
			return getEmployee().getOrganisation().getOperLevel();
		}
		return 0;
	}
	
	/**
	 * Gets the operational level val.
	 *
	 * @return the operational level val
	 */
	public Character getOperationalLevelVal(){
		if(getEmployee()!=null){
			return getEmployee().getOrganisation().getOperLevelVal();
		}
		return null;
	}
	
	/**
	 * Gets the region.
	 *
	 * @return the region
	 */
	public Region getRegion(){
		Region region=DAOFactory.getFactory().getEmployeeDAO().getRegion(getOrganisationId());
		return region;
	}
	
	/**
	 * Gets the cadastral municipality.
	 *
	 * @return the cadastral municipality
	 */
	public CadastralMunicipality getCadastralMunicipality(){
		CadastralMunicipality cm=DAOFactory.getFactory().getEmployeeDAO().getCadastralMunicipality(getOrganisationId());
		return cm;
	}
}
