package com.geoland.kfis.web.action.frm.dhpet.animalcapacity;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class AnimalCapacitySaveAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 2, 2014 1:22:46 PM
 * @Version 1.0
 */
public class AnimalCapacitySaveAction extends AnimalCapacityBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5314417917817333758L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		if(dhpetAnimalCapacity!=null && dhpetAnimalCapacity.getUseOfLand()==null)
			addFieldError("dhpetAnimalCapacity.useOfLand",getMessage("dhpet.animal.capacity.use.of.land.empty"));
		if(dhpetAnimalCapacity!=null){
			if(dhpetAnimalCapacity.getArea()==null)
				addFieldError("dhpetAnimalCapacity.area",getMessage("dhpet.animal.capacity.area.empty"));
			else if(dhpetAnimalCapacity.getArea()<0)
				addFieldError("dhpetAnimalCapacity.area",getMessage("dhpet.animal.capacity.area.greater.than.zero"));
		}
//		if(dhpetAnimalCapacity!=null && (dhpetAnimalCapacity.getDhpetWildAnimals()==null ||(dhpetAnimalCapacity.getDhpetWildAnimals()!=null && dhpetAnimalCapacity.getDhpetWildAnimals().getId()==null)))
//			addFieldError("dhpetAnimalCapacity.dhpetWildAnimals", getMessage("dhpet.wild.animals.empty"));
		if(dhpetAnimalCapacity!=null ){
			if(dhpetAnimalCapacity.getPercentage()==null) {
				addFieldError("dhpetAnimalCapacity.percentage",getMessage("dhpet.animal.capacity.percentage.empty"));
			}
			else if(dhpetAnimalCapacity.getPercentage()<0){
				addFieldError("dhpetAnimalCapacity.percentage",getMessage("dhpet.animal.capacity.percentage.greater.than.zero"));
			}
			else if(dhpetAnimalCapacity.getPercentage()>100)
				addFieldError("dhpetAnimalCapacity.percentage",getMessage("budget.mainntenance.budget.utilization.in.percent.large.value"));
		}
//		if(dhpetAnimalCapacity!=null && dhpetAnimalCapacity.getDhpetLocation().getId()==null)
//			addFieldError("dhpetAnimalCapacity.dhpetLocation", getMessage("dhpet.animal.capacity.location.empty"));

//		if(dhpetAnimalCapacity!=null && dhpetAnimalCapacity.getYear()==null)
//			addFieldError("dhpetAnimalCapacity.year", getMessage("fin.input.year.empty"));
		
		if(hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() throws Exception {
		if(dhpetAnimalCapacity.getId()==null){
			dhpetAnimalCapacity.setCreatedDate(new Date());
			dhpetAnimalCapacity.setEmployee(employee);
		}
		User user = getUser().getUser();
		getDhpetAnimalCapacity().setCurrentUser(user);
		DAOFactory.getFactory().getDhpetAnimalCapacityDAO().save(getDhpetAnimalCapacity());
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
