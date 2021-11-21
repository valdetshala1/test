package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestStatusAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 10, 2014 , 2:55:57 PM
 */
public class PrivateRequestStatusAction extends PrivateRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The activity id list. */
	private String activityIdList;
	
	/** The status. */
	private ActivityStatus status;
	
	/** The alw tech volume. */
	double alwTechVolume;
	
	/** The alw fire volume. */
	double alwFireVolume;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		
		if(privateRequest!=null && privateRequest.getAlwTechVolume()==null)
			addFieldError("privateRequest.alwTechVolume",getMessage("privateRequest.alwTechVolume.empty"));
		else {
				if(privateRequest!=null && privateRequest.getPlTechVolume()!=null){
					if(privateRequest.getPlTechVolume()<privateRequest.getAlwTechVolume()){
						addFieldError("privateRequest.alwTechVolume",getMessage("privateRequest.alwTechVolume.is.bigger.than.plTechVolume"));		
					}else {
						alwTechVolume=privateRequest.getAlwTechVolume();
					}
				}else {
					addFieldError("privateRequest.plTechVolume",getMessage("privateRequest.plTechVolume.empty"));
				}
			
		}
		
		if(privateRequest!=null && privateRequest.getAlwFireVolume()==null)
			addFieldError("privateRequest.alwFireVolume",getMessage("privateRequest.alwFireVolume.empty"));
		else{
			
			if(privateRequest!=null && privateRequest.getPlFireVolume()!=null){
				if(privateRequest.getPlFireVolume()<privateRequest.getAlwFireVolume()){
					addFieldError("privateRequest.alwFireVolume",getMessage("privateRequest.alwFireVolume.is.bigger.than.plFireVolume"));	
				}else {
					alwFireVolume=privateRequest.getAlwFireVolume();
				}
			
			}else {
				addFieldError("privateRequest.plFireVolume",getMessage("privateRequest.plFireVolume.empty"));
			}
			
			
		}
		if(annualplan!=null && annualplan.getId()==null){
			addFieldError("annualplan.id",getMessage("annualplan.id.empty"));
			
		}

//		if(getFieldErrors().isEmpty()){
//			validateAllowedVlBasedInAnnPl(annualplan, privateRequest);
//		}
		
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
	
		privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequest.getId());
		privateRequest.setAlwTechVolume(alwTechVolume);
		privateRequest.setAlwFireVolume(alwFireVolume);
		
		Employee person = getUser().getEmployee();
		privateRequest.setEmployeeByAlwCreatedBy(person);
		privateRequest.setAlwCreatedDate(new Date());
			if(privateRequest.getActivityStatus().getStatus().equals(Activitystatus.NEW)){
				status.setCreatedDate(new Date());
				status.setActivity(privateRequest.getActivity());
				status.setPerson(person);
				status.setStatus(Activitystatus.SUBMITTED);
				
				privateRequest.setActivityStatus(status);
				
				DAOFactory.getFactory().getActivityStatusDAO().save(status);
				DAOFactory.getFactory().getPrivateRequestDAO().save(privateRequest);
			}
		
		return SUCCESS;
	}

	/**
	 * Gets the activity id list.
	 *
	 * @return the activity id list
	 */
	public String getActivityIdList() {
		return activityIdList;
	}

	/**
	 * Sets the activity id list.
	 *
	 * @param activityIdList the new activity id list
	 */
	public void setActivityIdList(String activityIdList) {
		this.activityIdList = activityIdList;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public ActivityStatus getStatus() {
		return status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(ActivityStatus status) {
		this.status = status;
	}
	


	
	

}
