package com.geoland.kfis.web.action.hrm.leave.leaveentitlement;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.geoland.kfis.logic.hr.leave.leaveentitlement.BoLeaveEntitlement;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveEntitlementBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 3, 2014 8:54:59 AM
 * @Version 1.0
 */
public class LeaveEntitlementBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7424197273582271247L;
	
	/** The leave entitlement id. */
	protected Long leaveEntitlementId;
	
	/** The leave entitlement. */
	protected LeaveEntitlement leaveEntitlement;
	
	/** The bo leave entitlement. */
	protected BoLeaveEntitlement boLeaveEntitlement;
	
	/** The leave type list LE. */
	protected List<LeaveType> leaveTypeListLE;
	
	/** The employee list. */
	protected List<Employee> employeeList;
	
	/** The organisation. */
	protected String organisation;
	
	/** The org id. */
	private Long orgId;
	
	/** The le list. */
	public List<LeaveEntitlement> leList;
	
	/** The existing leave entitlement. */
	public List<LeaveEntitlement> existingLeaveEntitlement;
	
	/**
	 * Gets the days number.
	 *
	 * @param start the start
	 * @param end the end
	 * @return the days number
	 */
	public long getDaysNumber(Date start, Date end){ //metoda e shtuar
		
		long interval = 24*1000 * 60 * 60; // 1 hour in millis
//		Date start = getLeave().getFromDate();
		long curTime=start.getTime();
		Calendar c=Calendar.getInstance();
		c.setTime(start);
		long reqDays=0;
		while ( curTime <= getLeaveEntitlement().getToDate().getTime()) {
//		    dates.add(new Date(curTime));
		    curTime += interval;
		    if(c.get(Calendar.DAY_OF_WEEK)>1 && c.get(Calendar.DAY_OF_WEEK)<7){
		    	reqDays++;
		    }
		    c.setTimeInMillis(curTime);
		}
		return reqDays;
	}
	
	/**
	 * Gets the existing leave entitlement.
	 *
	 * @param leaveE the leave E
	 * @return the existing leave entitlement
	 */
	protected String getExistingLeaveEntitlement(List<LeaveEntitlement> leaveE){
		String leSQL="";
		if(leaveE!=null){
			 leSQL="SELECT le.* FROM thrm_leave_entitlement as le where (";
			 for (int i=0;i < leaveE.size();i++){
					if(i<leaveE.size()-1){
						leSQL=leSQL+"(employee_id="+leaveE.get(i).getEmployee().getId()+" and leave_type_id="
								   +leaveE.get(i).getLeaveType().getId()+") or ";
					}else {
						leSQL=leSQL+"(employee_id="+leaveE.get(i).getEmployee().getId()+" and leave_type_id="
								   +leaveE.get(i).getLeaveType().getId()+")) order by employee_id asc";
					}
				}
		}
		return leSQL;
	}
	
	/**
	 * Check employee.
	 *
	 * @param l the l
	 * @param employee the employee
	 * @param leaveType the leave type
	 * @return true, if successful
	 */
	public boolean checkEmployee(LeaveEntitlement l,Employee employee,LeaveType leaveType){
		boolean a=false;
				if(l.getEmployee().getId().equals(employee.getId()) && l.getLeaveType().getId().equals(leaveType.getId())){
					a=true;
		}
		return a;
	}
	
	/**
	 * Gets the leave entitlement id.
	 *
	 * @return the leaveEntitlementId
	 */
	public Long getLeaveEntitlementId() {
		return leaveEntitlementId;
	}
	
	/**
	 * Sets the leave entitlement id.
	 *
	 * @param leaveEntitlementId the leaveEntitlementId to set
	 */
	public void setLeaveEntitlementId(Long leaveEntitlementId) {
		this.leaveEntitlementId = leaveEntitlementId;
	}
	
	/**
	 * Gets the leave entitlement.
	 *
	 * @return the leaveEntitlement
	 */
	public LeaveEntitlement getLeaveEntitlement() {
		return leaveEntitlement;
	}
	
	/**
	 * Sets the leave entitlement.
	 *
	 * @param leaveEntitlement the leaveEntitlement to set
	 */
	public void setLeaveEntitlement(LeaveEntitlement leaveEntitlement) {
		this.leaveEntitlement = leaveEntitlement;
	}
	
	/**
	 * Gets the bo leave entitlement.
	 *
	 * @return the boLeaveEntitlement
	 */
	public BoLeaveEntitlement getBoLeaveEntitlement() {
		return boLeaveEntitlement;
	}
	
	/**
	 * Sets the bo leave entitlement.
	 *
	 * @param boLeaveEntitlement the boLeaveEntitlement to set
	 */
	public void setBoLeaveEntitlement(BoLeaveEntitlement boLeaveEntitlement) {
		this.boLeaveEntitlement = boLeaveEntitlement;
	}
	
	/**
	 * Gets the leave type list LE.
	 *
	 * @return the leaveTypeList
	 */
	public List<LeaveType> getLeaveTypeListLE() {
		return leaveTypeListLE;
	}
	
	/**
	 * Sets the leave type list LE.
	 *
	 * @param leaveTypeList the leaveTypeList to set
	 */
	public void setLeaveTypeListLE(List<LeaveType> leaveTypeList) {
		this.leaveTypeListLE = leaveTypeList;
	}

	/**
	 * Gets the employee list.
	 *
	 * @return the employeeList
	 */
	public List<Employee> getEmployeeList() {
		return employeeList;
	}
	
	/**
	 * Sets the employee list.
	 *
	 * @param employeeList the employeeList to set
	 */
	public void setEmployeeList(List<Employee> employeeList) {
		this.employeeList = employeeList;
	}
	
	/**
	 * Gets the organisation.
	 *
	 * @return the organisation
	 */
	public String getOrganisation() {
		return organisation;
	}
	
	/**
	 * Sets the organisation.
	 *
	 * @param organisation the organisation to set
	 */
	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}
	
	/**
	 * Gets the existing leave entitlement.
	 *
	 * @return the existingLeaveEntitlement
	 */
	public List<LeaveEntitlement> getExistingLeaveEntitlement() {
		return existingLeaveEntitlement;
	}
	
	/**
	 * Sets the existing leave entitlement.
	 *
	 * @param existingLeaveEntitlement the existingLeaveEntitlement to set
	 */
	public void setExistingLeaveEntitlement(
			List<LeaveEntitlement> existingLeaveEntitlement) {
		this.existingLeaveEntitlement = existingLeaveEntitlement;
	}
	
	/**
	 * Gets the le list.
	 *
	 * @return the leList
	 */
	public List<LeaveEntitlement> getLeList() {
		return leList;
	}
	
	/**
	 * Sets the le list.
	 *
	 * @param leList the leList to set
	 */
	public void setLeList(List<LeaveEntitlement> leList) {
		this.leList = leList;
	}
	
	/**
	 * Gets the org id.
	 *
	 * @return the orgId
	 */
	public Long getOrgId() {
		return orgId;
	}
	
	/**
	 * Sets the org id.
	 *
	 * @param orgId the orgId to set
	 */
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	
	
	
}
