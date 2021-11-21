
package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PartyUser;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PartyUserDAO.
 *
 * @author GEO&LAND
 * @created April 19, 2014 12:10:49 PM
 * @Version 1.0
 */
public class PartyUserDAO extends GenericDAO<PartyUser, Long> {
	
	/**
	 * Gets the person.
	 *
	 * @param userId the user id
	 * @return {@link Person}
	 */
	public Person getPerson(Long userId){
		Person person=null;
		Long personId;
		String query="select * from tparty_user where user_id="+userId;
		List<PartyUser> list=DAOFactory.getFactory().getPartyUserDAO().executeSQLQuery(query);
		if(list!=null && !list.isEmpty()){
			PartyUser partyUser=list.get(0);
			if("P".equals(partyUser.getParty().getPartyType())){
				personId = partyUser.getParty().getId();
				person = (Person) DAOFactory.getFactory().getPersonDAO().get(personId);
			}else if("E".equals(partyUser.getParty().getPartyType())){
				personId = partyUser.getParty().getId();
				person = (Person) DAOFactory.getFactory().getPersonDAO().get(personId);
			}
		}
		return person;
	}
	
	/**
	 * Gets the employee.
	 *
	 * @param userId the user id
	 * @return {@link Employee}
	 */
	public Employee getEmployee(Long userId){
		Employee employee = null;
		Person person = getPerson(userId);
		if (person instanceof Employee) {
			employee = (Employee) person;
		}else if(person!=null){
			String query = "select e.*, p.*, a.* from thrm_employee as e left join tperson as p on e.id = p.id left join tparty as a on a.id = p.id where e.person_id = " + person.getId();
			List<Employee> result = DAOFactory.getFactory().getEmployeeDAO().executeSQLQuery(query);
			if(!result.isEmpty())
				employee = result.get(0);
		}
			
		return employee;
	}

}
