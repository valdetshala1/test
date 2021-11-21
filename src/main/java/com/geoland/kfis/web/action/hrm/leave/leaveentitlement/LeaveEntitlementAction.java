package com.geoland.kfis.web.action.hrm.leave.leaveentitlement;

import java.util.List;

import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveEntitlementAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 3, 2014 8:55:08 AM
 * @Version 1.0
 */
public class LeaveEntitlementAction extends LeaveEntitlementBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(getLeaveEntitlementId()!=null){
			LeaveEntitlement le = DAOFactory.getFactory().getLeaveEntitlementDAO().get(getLeaveEntitlementId());
			setLeaveEntitlement(le);
		}
		List<LeaveType> ltResult = DAOFactory.getFactory().getLeaveTypeDAO().executeSQLQuery("select lt.* from thrm_leave_type as lt order by name asc");
		setLeaveTypeListLE(ltResult);
		
		return "form";
	}
	
	/**
	 * Pop up.
	 *
	 * @return the string
	 */
	public String popUp(){
		if(getLeaveEntitlementId()!=null){
			LeaveEntitlement le = DAOFactory.getFactory().getLeaveEntitlementDAO().get(getLeaveEntitlementId());
			setLeaveEntitlement(le);
		}
		return "popup";
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
		List<LeaveType> ltResult = DAOFactory.getFactory().getLeaveTypeDAO().executeSQLQuery("select lt.* from thrm_leave_type as lt order by name asc");
		setLeaveTypeListLE(ltResult);		
		return "page";
	}
}
