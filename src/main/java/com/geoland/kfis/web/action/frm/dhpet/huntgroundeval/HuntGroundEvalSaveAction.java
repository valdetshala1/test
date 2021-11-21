package com.geoland.kfis.web.action.frm.dhpet.huntgroundeval;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.DhpetHuntGroundEval;
import com.geoland.kfis.model.DhpetWildAnimalsRequest;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class HuntGroundEvalSaveAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 7, 2014 10:27:48 AM
 * @Version 1.0
 */
public class HuntGroundEvalSaveAction extends HuntGroundEvalBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6312923595495129640L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate(){
		employee=getUser().getEmployee();
		if(employee==null){
			addActionError("");
		}
//		if(dhpetHuntGroundEval!=null && dhpetHuntGroundEval.getDhpetWildAnimals().getId()==null)
//			addFieldError("dhpetHuntGroundEval.dhpetWildAnimals",getMessage("dhpet.wild.animals.empty"));
		if(dhpetHuntGroundEval!=null && dhpetHuntGroundEval.getDefinedPoint()==null)
			addFieldError("dhpetHuntGroundEval.definedPoint", getMessage("dhpet.definedPoint.empty"));
		
		if(dhpetHuntGroundEval!=null && dhpetHuntGroundEval.getDhpetWildAnimalsRequest().getId()==null){
			addFieldError("dhpetHuntGroundEval.requestFor",getMessage("dhpet.request.for.empty"));
		}else {
			DhpetWildAnimalsRequest ar=DAOFactory.getFactory().getDhpetWildAnimalsRequestDAO().get(dhpetHuntGroundEval.getDhpetWildAnimalsRequest().getId());
			dhpetHuntGroundEval.getDhpetWildAnimalsRequest().setRequestFor(ar.getRequestFor());
			dhpetHuntGroundEval.getDhpetWildAnimalsRequest().setMaxPoint(ar.getMaxPoint());
			if(dhpetHuntGroundEval.getDefinedPoint()!=null){
				if(dhpetHuntGroundEval.getDefinedPoint()>dhpetHuntGroundEval.getDhpetWildAnimalsRequest().getMaxPoint()){
					addFieldError("dhpetHuntGroundEval.definedPoint", getMessage("dhpet.definedPoint.is.bigger.than.max.point"));
				}
			}
			
		}
		if(dhpetHuntGroundEval!=null && dhpetHuntGroundEval.getDhpetAnimalLocation().getId()==null)
			addFieldError("animal.dhpetWildAnimals", getMessage("dhpet.wild.animals.empty"));
//		if(dhpetHuntGroundEval!=null && dhpetHuntGroundEval.getYear()==null)
//			addFieldError("dhpetHuntGroundEval.year", getMessage("fin.input.year.empty"));
			
		if(dhpetHuntGroundEval!=null && dhpetHuntGroundEval.getDhpetWildAnimalsRequest().getId()!=null 
				&& dhpetHuntGroundEval.getDhpetAnimalLocation().getId()!=null){
			String query="select hge.* from tdhpet_hunt_ground_eval as hge where  hge.animal_location_id="+dhpetHuntGroundEval.getDhpetAnimalLocation().getId()+" and animal_request_id="+dhpetHuntGroundEval.getDhpetWildAnimalsRequest().getId();
			if(dhpetHuntGroundEval.getId()!=null){
				query+=" and hge.id!="+dhpetHuntGroundEval.getId();
			}
			List<DhpetHuntGroundEval> hge=DAOFactory.getFactory().getDhpetHuntGroundEvalDAO().executeSQLQuery(query);
			if(hge.size()>0){
				addFieldError("dhpetHuntGroundEval.requestFor", getMessage("dhpetHuntGroundEval.requestFor.exist"));
			}
		}
		
		
		if(hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute(){
		if(dhpetHuntGroundEval.getId()==null){
			dhpetHuntGroundEval.setCreatedDate(new Date());
			dhpetHuntGroundEval.setEmployee(employee);
		}
		User user = getUser().getUser();
		dhpetHuntGroundEval.setCurrentUser(user);	
			
		DAOFactory.getFactory().getDhpetHuntGroundEvalDAO().save(dhpetHuntGroundEval);
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
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
}
