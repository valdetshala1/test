/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.location.animal;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.DhpetAnimalLocation;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalLocationSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:48:53 PM, Mar 10, 2015
 */
public class AnimalLocationSaveAction extends AnimalLocationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1982990737238031743L;

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
		
		if(animal!=null && (animal.getDhpetAnnualPlan()==null || (animal.getDhpetAnnualPlan()!=null && animal.getDhpetAnnualPlan().getId()==null)))
			addFieldError("animal.dhpetAnnualPlan", getMessage("fin.input.year.empty"));
		
		if(animal!=null && (animal.getDhpetWildAnimals()==null || (animal.getDhpetWildAnimals()!=null && animal.getDhpetWildAnimals().getId()==null)))
			addFieldError("animal.dhpetWildAnimals", getMessage("dhpet.maint.of.mong.wild.animals.empty"));
		
//		if(animal!=null && animal.getQuantity()==null)
//			addFieldError("animal.quantity", getMessage("dhpet.maint.of.mong.quantity.empty"));
		
		if(animal!=null && animal.getDhpetWildAnimals().getId()!=null && animal.getDhpetAnnualPlan().getId()!=null){
			String query="select l.* from tdhpet_animal_location as l where  l.annu_plan_id="+animal.getDhpetAnnualPlan().getId()+" and animal_id="+animal.getDhpetWildAnimals().getId();
			if(animal.getId()!=null){
				query+=" and l.id!="+animal.getId();
			}
			List<DhpetAnimalLocation> hge=DAOFactory.getFactory().getDhpetAnimalLocationDAO().executeSQLQuery(query);
			if(hge.size()>0){
				addFieldError("animal.dhpetWildAnimals", getMessage("animal.dhpetWildAnimals.exist"));
			}
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		if(animal.getId()==null){
			animal.setCreatedDate(new Date());
			animal.setEmployee(employee);
			animal.setQuantity(new Long(0));
		}
		User user = getUser().getUser();
		animal.setCurrentUser(user);
		
		DAOFactory.getFactory().getDhpetAnimalLocationDAO().save(animal);
		
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
