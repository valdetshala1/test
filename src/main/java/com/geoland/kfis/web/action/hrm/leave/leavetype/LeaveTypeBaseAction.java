package com.geoland.kfis.web.action.hrm.leave.leavetype;

import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveTypeBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 24, 2014 12:03:44 AM
 * @Version 1.0
 */
public class LeaveTypeBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The leave type id. */
	protected Long leaveTypeId;
	
	/** The leave type. */
	protected LeaveType leaveType;
	
	/**
	 * Gets the leave type id.
	 *
	 * @return the leave type id
	 */
	public Long getLeaveTypeId() {
		return leaveTypeId;
	}
	
	/**
	 * Sets the leave type id.
	 *
	 * @param leaveTypeId the new leave type id
	 */
	public void setLeaveTypeId(Long leaveTypeId) {
		this.leaveTypeId = leaveTypeId;
	}
	
	/**
	 * Gets the leave type.
	 *
	 * @return the leave type
	 */
	public LeaveType getLeaveType() {
		return leaveType;
	}
	
	/**
	 * Sets the leave type.
	 *
	 * @param leaveType the new leave type
	 */
	public void setLeaveType(LeaveType leaveType) {
		this.leaveType = leaveType;
	}
	

}
