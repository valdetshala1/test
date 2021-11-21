package com.geoland.kfis.web.action.hrm.attendance;

import com.geoland.kfis.logic.hr.attendance.BoAttendanceRecord;
import com.geoland.kfis.model.AttendanceRecord;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AttendanceRecordDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Attendancestatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AttendanceRecordBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Apr 25, 2014 ,10:20:02 AM
 * @Version 1.0
 */
public class AttendanceRecordBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The attendance id. */
	protected Long attendanceId;
	
	/** The attendance record. */
	protected AttendanceRecord attendanceRecord;
	
	/** The attendance record bo. */
	protected BoAttendanceRecord attendanceRecordBo;
	
	/** The attendance more open day. */
	protected boolean attendanceMoreOpenDay;
	
	/** The is supervisor. */
	protected Boolean isSupervisor;
	
	/** The to change status. */
	protected String toChangeStatus="";
	
	/** The status edit. */
	protected Attendancestatus statusEdit;
	
	/** The status note. */
	protected String statusNote;
	
	/** The attendancestatus list. */
	protected Attendancestatus[] attendancestatusList=Attendancestatus.values();
	
	/** The month list. */
	protected Month[] monthList=Month.values();
	
	/** The party id. */
	protected long partyId;
	
	/**
	 * employeeDayIsOpen- return true if evidence of day is open.
	 *
	 * @return true, if successful
	 */
	protected boolean employeeDayIsOpen() {
		boolean dayIsOpen = false;
		attendanceMoreOpenDay=false;
		AttendanceRecordDAO dao = DAOFactory.getFactory()
				.getAttendanceRecordDAO();
		//TODO: Bekim
		String countQuery = "SELECT count(*) FROM thrm_attendance_record where punch_out_user_time IS NULL and employee_id="
				+ getUser().getEmployee().getId();
		Integer count = dao.countQuery(countQuery);
		if (count == 1) {
			dayIsOpen = true;
		} else if (count > 1) {
			attendanceMoreOpenDay = true;
		}

		return dayIsOpen;

	}
	
	/**
	 * Checks for right to change status.
	 *
	 * @param emp the emp
	 * @param p the p
	 * @return true, if successful
	 */
	protected boolean hasRightToChangeStatus(Employee emp,Employee p){
		if(emp.getId().equals(p.getId()) && !emp.getId().equals(p.getPerson().getId()))
			return false;
		return true;
	}

	/**
	 * Gets the attendance record bo.
	 *
	 * @return the attendanceRecordBo
	 */
	public BoAttendanceRecord getAttendanceRecordBo() {
		return attendanceRecordBo;
	}

	/**
	 * Sets the attendance record bo.
	 *
	 * @param attendanceRecordBo            the attendanceRecordBo to set
	 */
	public void setAttendanceRecordBo(BoAttendanceRecord attendanceRecordBo) {
		this.attendanceRecordBo = attendanceRecordBo;
	}

	/**
	 * Gets the attendance id.
	 *
	 * @return the attendanceId
	 */
	public Long getAttendanceId() {
		return attendanceId;
	}

	/**
	 * Sets the attendance id.
	 *
	 * @param attendanceId            the attendanceId to set
	 */
	public void setAttendanceId(Long attendanceId) {
		this.attendanceId = attendanceId;
	}

	/**
	 * Gets the attendance record.
	 *
	 * @return the attendanceRecord
	 */
	public AttendanceRecord getAttendanceRecord() {
		if (attendanceRecord != null && attendanceRecordBo == null) {
			attendanceRecordBo = new BoAttendanceRecord(attendanceRecord,
					getLocale());
		}
		return attendanceRecord;
	}

	/**
	 * Sets the attendance record.
	 *
	 * @param attendanceRecord            the attendanceRecord to set
	 */
	public void setAttendanceRecord(AttendanceRecord attendanceRecord) {
		this.attendanceRecord = attendanceRecord;
	}

	/**
	 * Gets the checks if is supervisor.
	 *
	 * @return the checks if is supervisor
	 */
	public Boolean getIsSupervisor() {
		return isSupervisor;
	}

	/**
	 * Sets the checks if is supervisor.
	 *
	 * @param isSupervisor            the isSupervisor to set
	 */
	public void setIsSupervisor(Boolean isSupervisor) {
		this.isSupervisor = isSupervisor;
	}

	/**
	 * Checks if is attendance more open day.
	 *
	 * @return true, if is attendance more open day
	 */
	public boolean isAttendanceMoreOpenDay() {
		return attendanceMoreOpenDay;
	}

	/**
	 * Sets the attendance more open day.
	 *
	 * @param attendanceMoreOpenDay the new attendance more open day
	 */
	public void setAttendanceMoreOpenDay(boolean attendanceMoreOpenDay) {
		this.attendanceMoreOpenDay = attendanceMoreOpenDay;
	}

	
	/**
	 * Gets the to change status.
	 *
	 * @return the to change status
	 */
	public String getToChangeStatus() {
		return toChangeStatus;
	}

	/**
	 * Sets the to change status.
	 *
	 * @param toChangeStatus the new to change status
	 */
	public void setToChangeStatus(String toChangeStatus) {
		this.toChangeStatus = toChangeStatus;
	}

	/**
	 * Gets the status edit.
	 *
	 * @return the status edit
	 */
	public Attendancestatus getStatusEdit() {
		return statusEdit;
	}

	/**
	 * Sets the status edit.
	 *
	 * @param statusEdit the new status edit
	 */
	public void setStatusEdit(Attendancestatus statusEdit) {
		this.statusEdit = statusEdit;
	}

	/**
	 * Gets the attendancestatus list.
	 *
	 * @return the attendancestatus list
	 */
	public Attendancestatus[] getAttendancestatusList() {
		return attendancestatusList;
	}

	/**
	 * Sets the attendancestatus list.
	 *
	 * @param attendancestatusList the new attendancestatus list
	 */
	public void setAttendancestatusList(Attendancestatus[] attendancestatusList) {
		this.attendancestatusList = attendancestatusList;
	}

	/**
	 * Gets the status note.
	 *
	 * @return the status note
	 */
	public String getStatusNote() {
		return statusNote;
	}

	/**
	 * Sets the status note.
	 *
	 * @param statusNote the new status note
	 */
	public void setStatusNote(String statusNote) {
		this.statusNote = statusNote;
	}

	/**
	 * Gets the month list.
	 *
	 * @return the month list
	 */
	public Month[] getMonthList() {
		return monthList;
	}

	/**
	 * Sets the month list.
	 *
	 * @param monthList the new month list
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}

	/**
	 * Gets the party id.
	 *
	 * @return the party id
	 */
	public long getPartyId() {
		return partyId;
	}

	/**
	 * Sets the party id.
	 *
	 * @param partyId the new party id
	 */
	public void setPartyId(long partyId) {
		this.partyId = partyId;
	}
	
	
	

}
