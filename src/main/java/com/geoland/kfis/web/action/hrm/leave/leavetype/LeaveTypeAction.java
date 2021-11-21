package com.geoland.kfis.web.action.hrm.leave.leavetype;

import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveTypeAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 24, 2014 12:14:08 AM
 * @Version 1.0
 */
public class LeaveTypeAction extends LeaveTypeBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(getLeaveTypeId()!=null){
			LeaveType lt = DAOFactory.getFactory().getLeaveTypeDAO().get(getLeaveTypeId());
			setLeaveType(lt);	
		}
		return "form";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}		
}
