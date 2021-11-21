package com.geoland.kfis.web.action.frm.dhpet.wildanimal.animalrequest;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.DhpetWildAnimalsRequest;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalRequestSaveAction.
 */
public class AnimalRequestSaveAction  extends AnimalRequestBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null){
			addActionError("");
		}
		if(animalsRequest!=null && animalsRequest.getRequestFor()==null){
			addFieldError("animalsRequest.requestFor", getMessage("animalsRequest.requestFor.empty"));
		}else {
			if(animalsRequest.getDhpetWildAnimals().getId()!=null ){
					String query="select * from tdhpet_wild_animals_request where request_for='"+animalsRequest.getRequestFor()+"' and animal_id="+animalsRequest.getDhpetWildAnimals().getId();
					if(animalsRequest.getId()!=null){
								query+=" and id!="+animalsRequest.getId();
					}
					List<DhpetWildAnimalsRequest> ar=DAOFactory.getFactory().getDhpetWildAnimalsRequestDAO().executeSQLQuery(query);
					if(ar.size()>0){
						addFieldError("animalsRequest.requestFor", getMessage("animalsRequest.requestFor.exist"));
					}
			}
		}
			
		if(animalsRequest!=null && animalsRequest.getMaxPoint()==null)
			addFieldError("animalsRequest.maxPoint", "animalsRequest.maxPoint.empty");
		
		if(hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(animalsRequest.getId()==null){
			animalsRequest.setCreatedDate(new Date());
			animalsRequest.setEmployee(employee);
			
		}
		User user = getUser().getUser();
		animalsRequest.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetWildAnimalsRequestDAO().save(animalsRequest);
		return  SUCCESS;
	}
	
	
	

}
