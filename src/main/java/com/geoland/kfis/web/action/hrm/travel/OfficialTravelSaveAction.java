/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 22, 2014 3:41:15 PM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.hrm.travel;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.OfficalTravel;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Travelstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class OfficialTravelSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 22, 2014 3:41:15 PM
 * @Version 1.0
 */
public class OfficialTravelSaveAction extends OfficialTravelBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7124262814850641800L;
	
	/** The file. */
	private File file;
	
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
		try {
			if(!changeStatus){
				addValidationErrors(getBoOfficialTravel().validate());
				if(compareDates(getOfficialTravel().getFromDate(), getOfficialTravel().getToDate()))
					addFieldError("officialTravel.toDate.invalid", getMessage("contract.invalid.date"));
			}
			else{
				OfficalTravel o=DAOFactory.getFactory().getOfficialTravelDAO().get(getOfficialTravel().getId());
				if(getOfficialTravel().getDaysApproved()!=null){
					if(getOfficialTravel().getDaysApproved()>o.getDaysRequested())
						addFieldError("officialTravel.daysApproved.to.large", getMessage("officialTravel.daysApproved.toolarge"));
				}
				else addFieldError("officialTravel.daysApproved", getMessage("officialTravel.daysApproved.empty"));
				
				if(getOfficialTravel().getDaysApproved()!=null && getOfficialTravel().getDaysSpent()!=null && getOfficialTravel().getDaysApproved()<getOfficialTravel().getDaysSpent())
					addFieldError("officialTravel.daysSpent", getMessage("officialTravel.daysSpent.tolarge"));
			}
		} catch (ValidationException e) {
			addActionError(e.getMessage());
			e.printStackTrace();
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		OfficalTravel ot = getBoOfficialTravel().getPersistence();

		if(changeStatus){
			ot=DAOFactory.getFactory().getOfficialTravelDAO().get(getOfficialTravel().getId());
			ot.setApprovedDate(new Date());
			ot.setPartyByApprovedUserId(employee);
			ot.setStatus(getOfficialTravel().getStatus());
			ot.setDaysApproved(getOfficialTravel().getDaysApproved());
			ot.setApprovedComments(getOfficialTravel().getApprovedComments());
			ot.setReturnDate(getOfficialTravel().getReturnDate());
			ot.setDaysSpent(getOfficialTravel().getDaysSpent());
		} else{
			ot.setStatus(Travelstatus.PENDING);
			ot.setPartyByRequestedUserId(employee);
			ot.setRequestedDate(new Date());
			ot.setPartyByCreatedBy(employee);
		}
		if(file!=null){
			ot.setDoc(getFileBytes(file));
			ot.setDocSize(file.getTotalSpace());
		}else if(ot.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from thrm_offical_travel where id="+ot.getId());
			sqlQuery.addScalar("doc");
			Object ob1 = sqlQuery.uniqueResult();
			ot.setDoc((byte[])ob1);
		}
		ot.setCreatedDate(new Date());
		User user = getUser().getUser();
		ot.setCurrentUser(user);
		DAOFactory.getFactory().getOfficialTravelDAO().save(ot);
		
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

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
	}
}
