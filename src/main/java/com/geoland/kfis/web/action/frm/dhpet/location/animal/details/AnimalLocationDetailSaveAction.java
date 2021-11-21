/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.location.animal.details;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.DhpetAnimalLocation;
import com.geoland.kfis.model.DhpetAnimalLocationDetail;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalLocationDetailSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 21, 2015, 2:16:52 PM
 */
public class AnimalLocationDetailSaveAction extends
		AnimalLocationDetailBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3100420159974850082L;

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
		
		if(locationDetail!=null && (locationDetail.getDhpetAnimalLocation()==null ||(locationDetail.getDhpetAnimalLocation()!=null && locationDetail.getDhpetAnimalLocation().getId()==null)))
			addFieldError("detail.dhpetAnimalLocation", getMessage("dhpet.maint.of.mong.wild.animals.empty"));
		
		if(locationDetail!=null && locationDetail.getGender()==null)
			addFieldError("locationDetail.gender", getMessage("person.gender.empty"));
		
		if(locationDetail!=null && locationDetail.getAgeType()==null)
			addFieldError("locationDetail.ageType", getMessage("animal.location.detail.age.type.empty"));

		if(locationDetail!=null && locationDetail.getQuantity()==null)
			addFieldError("locationDetail.quantity", getMessage("requisition.quantity.empty"));
		
		if(locationDetail!=null && locationDetail.getGender()!=null && locationDetail.getAgeType()!=null && locationDetail.getDhpetAnimalLocation()!=null && locationDetail.getDhpetAnimalLocation().getId()!=null) {
			String query="select l.* from tdhpet_animal_location_detail as l where  l.animal_location_id="+locationDetail.getDhpetAnimalLocation().getId()+
					" and l.gender='"+locationDetail.getGender().getDOMKEY()+"' "+
					" and l.age_type='"+locationDetail.getAgeType().getDOMKEY()+"'";
			if(locationDetail.getId()!=null){
				query+=" and l.id!="+locationDetail.getId();
			}
			List<DhpetAnimalLocationDetail> hge=DAOFactory.getFactory().getDhpetAnimalLocationDetailDAO().executeSQLQuery(query);
			if(hge.size()>0){
				addFieldError("locationDetail.ageType", getMessage("animal.location.detail.age.type.exists"));
			}
		}
		
		if(locationDetail!=null && locationDetail.getDhpetAnimalLocation()!=null  && locationDetail.getDhpetAnimalLocation().getId()!=null && locationDetail.getDhpetAnimalLocation().getQuantity()!=null && locationDetail.getQuantity()!=null){
			String query="select sum(quantity) from tdhpet_animal_location_detail where animal_location_id="+locationDetail.getDhpetAnimalLocation().getId();
			if(locationDetail.getId()!=null){
				query+=" and id!="+locationDetail.getId();
			}
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sql=session.createSQLQuery(query);
			sql.addScalar("sum");
			Object sum=sql.uniqueResult();
			Long s = null;
			if(sum!=null)
				s = (new Long(sum.toString()))+locationDetail.getQuantity();
			else s=locationDetail.getQuantity();
			
			if(s>locationDetail.getDhpetAnimalLocation().getQuantity())
				addFieldError("locationDetail.quantity", getMessage("animal.location.detail.qty.big"));	
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
		if(locationDetail.getId()==null){
			locationDetail.setCreatedDate(new Date());
			locationDetail.setEmployee(employee);
		}
		User user = getUser().getUser();
		locationDetail.setCurrentUser(user);	
		
		DAOFactory.getFactory().getDhpetAnimalLocationDetailDAO().save(locationDetail);
		if(locationDetail.getDhpetAnimalLocation().getId()!=null) {
			recalculateAnimalQuantity(locationDetail.getDhpetAnimalLocation().getId());
		}
		return SUCCESS;
	}
	
    /**
     * Recalculate animal quantity.
     *
     * @param animalLocationId the animal location id
     */
    private void recalculateAnimalQuantity(Long animalLocationId) {
    	String query="select * from tdhpet_animal_location_detail where animal_location_id="+animalLocationId;
    	List<DhpetAnimalLocationDetail> ald=DAOFactory.getFactory().getDhpetAnimalLocationDetailDAO().executeSQLQuery(query);
        Long animalTotal=new Long(0);
    	for(DhpetAnimalLocationDetail d:ald) {
    		animalTotal+=d.getQuantity();
        }
    	DhpetAnimalLocation al=DAOFactory.getFactory().getDhpetAnimalLocationDAO().get(animalLocationId);
    	al.setQuantity(animalTotal);
    	DAOFactory.getFactory().getDhpetAnimalLocationDAO().save(al);
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
