package com.geoland.kfis.web.action.hrm.leave;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.geoland.kfis.logic.hr.leave.BoLeave;
import com.geoland.kfis.model.Leave;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.persistence.hibernate.usertypes.Travelstatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 23, 2014 11:40:45 PM
 * @Version 1.0
 */
public class LeaveBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The date format cal. */
	protected static SimpleDateFormat DATE_FORMAT_CAL = new SimpleDateFormat("yyyy-MM-dd");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");

	/** The leave id. */
	private Long leaveId;
	
	/** The leave. */
	private Leave leave;
	
	/** The bo leave. */
	private BoLeave boLeave;
	
	/** The leave type list. */
	private List<LeaveType> leaveTypeList;
	
	/** The leave list. */
	private List<Leave> leaveList;
	
	/** The leave status id. */
	protected String leaveStatusId;
	
	/** The change status. */
	protected boolean changeStatus;
	
	/** The status list. */
	protected Travelstatus[] statusList=Travelstatus.values();
	
	/** The status save. */
	protected boolean statusSave;
	
	/** The month list. */
	protected Month monthList[];
	
	/**
	 * Gets the days number.
	 *
	 * @param start the start
	 * @param end the end
	 * @return the days number
	 */
	public long getDaysNumber(Date start, Date end){
		long interval = 24*1000 * 60 * 60; // 1 hour in millis
//		Date start = getLeave().getFromDate();
		long curTime=start.getTime();
		Calendar c=Calendar.getInstance();
		c.setTime(start);
		long reqDays=0;
		while ( curTime <= getLeave().getToDate().getTime()) {
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
	 * Gets the leave id.
	 *
	 * @return the leave id
	 */
	public Long getLeaveId() {
		return leaveId;
	}
	
	/**
	 * Sets the leave id.
	 *
	 * @param leaveId the new leave id
	 */
	public void setLeaveId(Long leaveId) {
		this.leaveId = leaveId;
	}
	
	/**
	 * Gets the leave.
	 *
	 * @return the leave
	 */
	public Leave getLeave() {
		return leave;
	}
	
	/**
	 * Sets the leave.
	 *
	 * @param leave the new leave
	 */
	public void setLeave(Leave leave) {
		this.leave = leave;
	}
	
	/**
	 * Gets the bo leave.
	 *
	 * @return the bo leave
	 */
	public BoLeave getBoLeave() {
		if(boLeave==null)
			boLeave = new BoLeave(leave, getLocale(),statusSave);
		
		return boLeave;
	}
	
	/**
	 * Sets the bo leave.
	 *
	 * @param boLeave the new bo leave
	 */
	public void setBoLeave(BoLeave boLeave) {
		this.boLeave = boLeave;
	}
	
	/**
	 * Sets the leave type list.
	 *
	 * @param leaveTypeList the new leave type list
	 */
	public void setLeaveTypeList(List<LeaveType> leaveTypeList) {
		this.leaveTypeList = leaveTypeList;
	}
	
	/**
	 * Gets the leave type list.
	 *
	 * @return the leave type list
	 */
	public List<LeaveType> getLeaveTypeList() {
		return leaveTypeList;
	}

	/**
	 * Sets the leave list.
	 *
	 * @param leaveList the new leave list
	 */
	public void setLeaveList(List<Leave> leaveList) {
		this.leaveList = leaveList;
	}
	
	/**
	 * Gets the leave list.
	 *
	 * @return the leave list
	 */
	public List<Leave> getLeaveList() {
		return leaveList;
	}
	
	/**
	 * Gets the leave status id.
	 *
	 * @return the leave status id
	 */
	public String getLeaveStatusId() {
		return leaveStatusId;
	}
	
	/**
	 * Sets the leave status id.
	 *
	 * @param leaveStatusId the new leave status id
	 */
	public void setLeaveStatusId(String leaveStatusId) {
		this.leaveStatusId = leaveStatusId;
	}
	
	/**
	 * Checks if is change status.
	 *
	 * @return true, if is change status
	 */
	public boolean isChangeStatus() {
		return changeStatus;
	}
	
	/**
	 * Sets the change status.
	 *
	 * @param changeStatus the new change status
	 */
	public void setChangeStatus(boolean changeStatus) {
		this.changeStatus = changeStatus;
	}
	
	/**
	 * Gets the status list.
	 *
	 * @return the status list
	 */
	public Travelstatus[] getStatusList() {
		return statusList;
	}
	
	/**
	 * Sets the status list.
	 *
	 * @param statusList the new status list
	 */
	public void setStatusList(Travelstatus[] statusList) {
		this.statusList = statusList;
	}
	
	/**
	 * Checks if is status save.
	 *
	 * @return the statusSave
	 */
	public boolean isStatusSave() {
		return statusSave;
	}
	
	/**
	 * Sets the status save.
	 *
	 * @param statusSave the statusSave to set
	 */
	public void setStatusSave(boolean statusSave) {
		this.statusSave = statusSave;
	}
	
	/**
	 * Gets the month list.
	 *
	 * @return the monthList
	 */
	public Month[] getMonthList() {
		return monthList;
	}
	
	/**
	 * Sets the month list.
	 *
	 * @param monthList the monthList to set
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}
	
}
