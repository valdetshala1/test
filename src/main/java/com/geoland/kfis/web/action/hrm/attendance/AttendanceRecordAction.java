package com.geoland.kfis.web.action.hrm.attendance;

import java.util.List;

import com.geoland.kfis.model.AttendanceRecord;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AttendanceRecordDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class AttendanceRecordAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Apr 25, 2014 ,10:19:46 AM
 * @Version 1.0
 */
public class AttendanceRecordAction extends AttendanceRecordBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		AttendanceRecordDAO attDAO = DAOFactory.getFactory()
				.getAttendanceRecordDAO();
		if (employeeDayIsOpen()) {
			String query = "SELECT * FROM thrm_attendance_record where punch_out_user_time IS NULL and employee_id="
					+ getUser().getEmployee().getId();
			List<AttendanceRecord> list = attDAO.executeSQLQuery(query);
			attendanceRecord =list.get(0);
		} 
		return "form";
	}
	
	/**
	 * Popup.
	 *
	 * @return the string
	 */
	public String popup() {
		return "popup";
	}

	/**
	 * List.
	 *
	 * @return the string
	 */
	public String list() {
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}
	
	/**
	 * Report popup.
	 *
	 * @return the string
	 */
	public String reportPopup() {
		return "reportPopup";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		AttendanceRecordDAO attDAO = DAOFactory.getFactory().getAttendanceRecordDAO();
		Employee emp = getUser().getEmployee();
		if(emp!=null){
			String supervisor_query="select count(*) from thrm_employee where person_id="+emp.getId();
			Integer count=DAOFactory.getFactory().getEmployeeDAO().countQuery(supervisor_query);
			if(count>0)
				isSupervisor=true;
			
			if (employeeDayIsOpen()) {
				String query = "SELECT a.* FROM thrm_attendance_record as a where a.punch_out_user_time IS NULL and a.employee_id="
						+ emp.getId();
				List<AttendanceRecord> list = attDAO.executeSQLQuery(query);
				attendanceRecord =list.get(0);
			} 
			return "page";
		}
		return null;
	}

}
