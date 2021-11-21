/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 10:59:31 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.logic.adm.person;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.PersonDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoPerson.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 21, 2014 10:59:31 AM
 * @Version 1.0
 */
public class BoPerson extends BoBase<Person> {

	/**
	 * Instantiates a new bo person.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoPerson(Person persistence, Locale locale) {
		super(persistence, locale);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.IBoBase#validate()
	 */
	@Override
	public Map<String, String> validate() throws ValidationException {
		if(StringUtils.isEmpty(getPersistence().getFirstName()))
			addFieldError("person.firstName", "person.firstName.empty");
		else if(!StringUtils.isAlphaSpace(getPersistence().getFirstName()))
			addFieldError("person.firstName.invalid.char", "person.field.invalid.char");
		if(StringUtils.isEmpty(getPersistence().getLastName()))
			addFieldError("person.lastName", "person.lastName.empty");	
		else if(!StringUtils.isAlphaSpace(getPersistence().getLastName()))
			addFieldError("person.lastName.invalid.char", "person.field.invalid.char");
		if(getPersistence().getBirthdate()==null)
			addFieldError("person.birthdate", "person.birthdate.empty");
		if(getPersistence().getEthnicity()==null)
			addFieldError("person.ethnicity", "person.ethnicity.empty");
		if(StringUtils.isEmpty(getPersistence().getPersonalId()))
			addFieldError("person.personalId", "person.personalId.empty");
		else{
			String query="select p.*, y.*,1 as clazz_ from tperson as p left join tparty as y on p.id = y.id where p.personal_id='"+getPersistence().getPersonalId()+"'";
			if(getPersistence().getId()!=null){
				query+=" and p.id!="+getPersistence().getId();
			}
			List<Person> personal_ids=DAOFactory.getFactory().getPersonDAO().executeSQLQuery(query);
				if(personal_ids.size()>0)
					addFieldError("person.personalId", "Personal ID exists");
		}
		if(getPersistence().getGender()==null || StringUtils.isEmpty(getPersistence().getGender().toString()))
			addFieldError("person.gender", "person.gender.empty");	
		
		return getFieldErrors();
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.IBoBase#delete()
	 */
	@Override
	public void delete() throws BusinessException {
		getDao().delete(getPersistence());
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.BoBase#getDao()
	 */
	@Override
	public PersonDAO getDao() {
		return DAOFactory.getFactory().getPersonDAO();
	}
	
	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee(){
		return DAOFactory.getFactory().getEmployeeDAO().get(getPersistence().getId());
	}
}
