/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.huntedanimals.details;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class HuntedAnimalDetailSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 22, 2015, 10:22:41 AM
 */
public class HuntedAnimalDetailSaveAction extends HuntedAnimalDetailBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6857141337917555547L;

	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(huntDetail!=null && (huntDetail.getDhpetHuntedAnimals()==null || (huntDetail.getDhpetHuntedAnimals()!=null && huntDetail.getDhpetHuntedAnimals().getId()==null)))
			addFieldError("huntDetail.dhpetHuntedAnimals", getMessage("dhpet.wild.animals.empty"));
		
		if(huntDetail!=null && huntDetail.getGender()==null)
			addFieldError("huntDetail.gender", getMessage("person.gender.empty"));
		
		if(huntDetail!=null && huntDetail.getDeathCause()==null)
			addFieldError("huntDetail.deathCause", getMessage("hunt.deathCause.empty"));
		
		if(huntDetail!=null && huntDetail.getAnimalsNumber()==null)
			addFieldError("huntDetail.animalsNumber", getMessage("hunt.animalsNumber.empty"));
		
		if(huntDetail!=null && huntDetail.getDhpetHuntedAnimals()!=null  && huntDetail.getDhpetHuntedAnimals().getId()!=null 
				&& huntDetail.getDhpetHuntedAnimals().getAnimalsNumber()!=null && huntDetail.getAnimalsNumber()!=null){
			
			String query="select sum(animals_number) from tdhpet_hunted_animal_detail where hunted_animal_id="+huntDetail.getDhpetHuntedAnimals().getId();
			if(huntDetail.getId()!=null){
				query+=" and id!="+huntDetail.getId();
			}
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sql=session.createSQLQuery(query);
			sql.addScalar("sum");
			Object sum=sql.uniqueResult();
			Long s=null;
			if(sum!=null)
				s = (new Long(sum.toString()))+huntDetail.getAnimalsNumber();
			else s=huntDetail.getAnimalsNumber();
			
			if(s>huntDetail.getDhpetHuntedAnimals().getAnimalsNumber())
				addFieldError("huntDetail.animalsNumber", getMessage("animal.location.detail.qty.big"));
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(huntDetail.getId()==null){
			huntDetail.setEmployee(employee);
			huntDetail.setCreatedDate(new Date());
		}
		User user = getUser().getUser();
		huntDetail.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetHuntedAnimalDetailDAO().save(huntDetail);
		return SUCCESS;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
