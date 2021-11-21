package com.geoland.kfis.logic.hr.employee;

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
import com.geoland.kfis.persistence.dao.services.EmployeeDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoEmployee.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created April 18, 2014 7:15:43 PM
 * @Version 1.0
 */
public class BoEmployee extends BoBase<Employee> {

	/**
	 * Instantiates a new bo employee.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoEmployee(Employee persistence, Locale locale) {
		super(persistence, locale);
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.IBoBase#delete()
	 */
	@Override
	public void delete() throws BusinessException {
		getDao().delete(getPersistence());
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.IBoBase#validate()
	 */
	@Override
	public Map<String, String> validate() throws ValidationException {
		if(StringUtils.isEmpty(getPersistence().getFirstName()) || !StringUtils.isNotBlank(getPersistence().getFirstName()))
			addFieldError("employee.firstName", "employee.firstName.empty");
		else if(!StringUtils.isAlphaSpace(getPersistence().getFirstName()))
			addFieldError("employee.firstName.invalid.char", "person.field.invalid.char");
		if(StringUtils.isEmpty(getPersistence().getLastName())  || !StringUtils.isNotBlank(getPersistence().getFirstName()))
			addFieldError("employee.lastName", "employee.lastName.empty");
		else if(!StringUtils.isAlphaSpace(getPersistence().getLastName()))
			addFieldError("employee.lastName.invalid.char", "person.field.invalid.char");
		if(getPersistence().getBirthdate()==null)
			addFieldError("employee.birthdate", "employee.birthdate.empty");
		if(getPersistence().getEthnicity()==null)
			addFieldError("employee.ethnicity", "employee.ethnicity.empty");
		if(StringUtils.isEmpty(getPersistence().getPersonalId()))
			addFieldError("employee.personalId", "employee.personalId.empty");
		else{
			String query="select p.*, y.*,1 as clazz_ from tperson as p left join tparty as y on p.id = y.id where p.personal_id='"+getPersistence().getPersonalId()+"'";
			if(getPersistence().getId()!=null){
				query+=" and p.id!="+getPersistence().getId();
			}
			List<Person> personal_ids=DAOFactory.getFactory().getPersonDAO().executeSQLQuery(query);
				if(personal_ids.size()>0)
					addFieldError("employee.personalId.exists", "Personal ID exists");
		}
		if(getPersistence().getGender()==null || StringUtils.isEmpty(getPersistence().getGender().toString()))
			addFieldError("employee.gender", "employee.gender.empty");		
		
		if(getPersistence().getConctractType()==null)
			addFieldError("employee.conctractType", "employee.conctractType.empty");
		if(getPersistence().getRoleCode()==null)
			addFieldError("employee.roleCode","employee.role.empty");
		/*
		if(StringUtils.isEmpty(getPersistence().getFunctionalTitle()))
			addFieldError("employee.functionalTitle", "employee.functionalTitle.empty");	
		if(StringUtils.isEmpty(getPersistence().getGrade()))
			addFieldError("employee.acadGrad", "employee.acadGrad.empty");
		*/
		if(getPersistence().getJobTitle()==null)
			addFieldError("employee.jobTitle", "employee.jobTitle.empty");	
		if(getPersistence().getOrganisation()!=null && getPersistence().getOrganisation().getId()==null)
			addFieldError("employee.organisation.id", "employee.organisation.empty");	
		
		return getFieldErrors();
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.BoBase#getDao()
	 */
	@Override
	public EmployeeDAO getDao() {
		return DAOFactory.getFactory().getEmployeeDAO();
	}

}
