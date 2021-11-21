package com.geoland.kfis.web.action.hrm.attendance;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AttendanceRecordSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created April 25, 2014 ,10:20:10 AM
 * @Version 1.0
 */
public class AttendanceRecordSaveAction extends AttendanceRecordBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

    /** The created by. */
    private Employee createdBy;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		createdBy=getUser().getEmployee();
		if(createdBy==null)
			addActionError("");
		
		if(toChangeStatus.length()!=0){}
		else{
			if (attendanceRecord!=null && attendanceRecord.getEmployee() == null) {
				
				if (createdBy == null) {
					addFieldError("attendanceRecord.employee",getMessage("attendanceRecord.employee.empty"));
				} else {
					attendanceRecord.setEmployee(createdBy);
//					attendanceRecord.setPerson(employee.getPerson());
	
				}
	
			}
			if (attendanceRecord.getId() != null && attendanceRecord.getPunchInUserTime() != null && attendanceRecord.getPunchOutUserTime() == null) {
	
				addFieldError("attendanceRecord.punchOutUserTime",getMessage("attendanceRecord.punchOutUserTime.empty"));
			}
			
			if(attendanceRecord!=null && compareDates(attendanceRecord.getPunchInUserTime(), attendanceRecord.getPunchOutUserTime())){
				addFieldError("attendanceRecord.punchOutUserTime",getMessage("contract.invalid.date"));
				attendanceRecord.setPunchOutUserTime(null);
			}
				
			
			if (!employeeDayIsOpen() && attendanceMoreOpenDay) {
				addFieldError("attendanceMoreOpenDay",getMessage("attendanceRecord.MoreOpenDay"));
			}
			
			if(attendanceRecord.getId()==null && attendanceRecord.getPunchInUserTime()==null){
				addFieldError("attendanceRecord.punchInUserTime",getMessage("attendanceRecord.punchInUserTime.empty"));
			}
		}
		
		
			
		if (!getFieldErrors().isEmpty()) {

			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(attendanceRecord!=null && attendanceRecord.getId()==null){
			attendanceRecord.setEmployee(getUser().getEmployee());
			attendanceRecord.setCreatedDate(new Date());
			attendanceRecord.setEmployeeByCreatedBy(createdBy);
		}
		User user = getUser().getUser();
		if(toChangeStatus.length()!=0){
			String split[] = toChangeStatus.split(",");
			for (String item : split) {
				Long attendId = Long.valueOf(item);
				attendanceRecord=DAOFactory.getFactory().getAttendanceRecordDAO().get(attendId);
				if(hasRightToChangeStatus(createdBy,attendanceRecord.getEmployee())){
					attendanceRecord.setSupervisorDate(new Date());
					attendanceRecord.setStatus(statusEdit);
					attendanceRecord.setNote(statusNote);
					attendanceRecord.setPerson(createdBy);
					attendanceRecord.setCurrentUser(user);
					DAOFactory.getFactory().getAttendanceRecordDAO().save(attendanceRecord);
				}
			}
		}
		else{
			if (attendanceRecord.getPunchInUtcTime() != null && attendanceRecord.getPunchOutUtcTime() == null) {
				attendanceRecord.setPunchOutUtcTime(new Date());
			} else {
				attendanceRecord.setStatus(attendancestatusList[0]);
				attendanceRecord.setPunchInUtcTime(new Date());
			}
			attendanceRecord.setCurrentUser(user);
			DAOFactory.getFactory().getAttendanceRecordDAO().save(attendanceRecord);
		}
		
		return SUCCESS;
	}

	/**
	 * Gets the created by.
	 *
	 * @return the createdBy
	 */
	public Employee getCreatedBy() {
		return createdBy;
	}

	/**
	 * Sets the created by.
	 *
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(Employee createdBy) {
		this.createdBy = createdBy;
	}
}
