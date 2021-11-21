package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrivateActivity;
import com.geoland.kfis.model.PrivateRequestImpl;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestControlAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 17, 2014 , 9:40:11 AM
 */
public class PrivateRequestControlAction extends PrivateRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The control status. */
	protected Activitystatus controlStatus; 
	
	/** The employee. */
	protected Employee employee;
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(employee==null)
			addActionError("");
		privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequest.getId());
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(privateRequest.getActivity());
		activityStatus.setPerson(employee);
		privateRequest.setActivityStatus(activityStatus);
		
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		
		if(activityStatus.getStatus()==Activitystatus.APPROVED){
			 List<PrivateRequestImpl> pvtReqImplList=new ArrayList<>(privateRequest.getPrivateRequestImpls());
			 
			 double apTechVolume=0;
			 double apFireVolume=0;
			 for(PrivateRequestImpl p: pvtReqImplList ){
				 
				 apTechVolume+=p.getTechVolume();
				 apFireVolume+=p.getFireVolume();
			 }
			 privateRequest.setApFireVolume(apFireVolume);
			 privateRequest.setApTechVolume(apTechVolume);
			 privateRequest.setApCreatedDate(new Date());
			 privateRequest.setApCreatedBy(getUser().getEmployee());
			 privateRequest.getActivity().getAnnualPlanning();
			 String query=" select pa.* from tfrm_private_activity as pa " +
			 		" left join tfrm_activity as a on pa.activity_id=a.id" +
			 		" left join tfrm_annual_planning as ap on " +
			 		" a.annual_planning_id=ap.id where ap.id="+privateRequest.getActivity().getAnnualPlanning().getId();
			
			 PrivateActivity pa=DAOFactory.getFactory().getPrivateActivityDAO().executeSQLQuery(query).get(0);
			 if(pa!=null){
				 setImplValueForPrivatePlan(pa);
			 }
			 
			 
		}
		DAOFactory.getFactory().getPrivateRequestDAO().save(privateRequest);
		
		return SUCCESS;
	}

	/**
	 * Gets the control status.
	 *
	 * @return the control status
	 */
	public Activitystatus getControlStatus() {
		return controlStatus;
	}

	/**
	 * Sets the control status.
	 *
	 * @param controlStatus the new control status
	 */
	public void setControlStatus(Activitystatus controlStatus) {
		this.controlStatus = controlStatus;
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

	/**
	 * Gets the activity status.
	 *
	 * @return the activity status
	 */
	public ActivityStatus getActivityStatus() {
		return activityStatus;
	}

	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the new activity status
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}
	
}
