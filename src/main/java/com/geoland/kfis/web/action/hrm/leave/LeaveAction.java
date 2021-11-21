package com.geoland.kfis.web.action.hrm.leave;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Leave;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Travelstatus;

import net.sf.json.JSONObject;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 23, 2014 11:42:35 PM
 * @Version 1.0
 */
public class LeaveAction extends LeaveBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(getLeaveId()!=null){
			Leave le = DAOFactory.getFactory().getLeaveDAO().get(getLeaveId());
			setLeave(le);	
		}

		List<LeaveType> ltResult = DAOFactory.getFactory().getLeaveTypeDAO().executeSQLQuery("select lt.* from thrm_leave_type as lt order by lt.name asc");
		setLeaveTypeList(ltResult);
		
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
	 * Status form.
	 *
	 * @return the string
	 */
	public String statusForm(){
		if(getLeaveId()!=null){
			setLeave(DAOFactory.getFactory().getLeaveDAO().get(getLeaveId()));
			if(!getLeave().getStatus().equals(Travelstatus.PENDING))
				statusSave=true;
			else statusSave=false;
		}
		return "status_form";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		List<LeaveType> ltResult = DAOFactory.getFactory().getLeaveTypeDAO().executeSQLQuery("select lt.* from thrm_leave_type as lt order by lt.name asc");
		setLeaveTypeList(ltResult);	
		return "page";
	}	
	
	
	/**
	 * Calendar page.
	 *
	 * @return the string
	 */
	public String calendarPage(){
		//get all leave appointments for the current month
		//int month = Calendar.getInstance().get(Calendar.MONTH);
		//int fieldCount = Calendar.getInstance().get(Calendar.FIELD_COUNT);
		HttpServletRequest request = ServletActionContext.getRequest();
		String year = request.getParameter("current_year");
		String month = request.getParameter("current_month");
		String query = null;
		if(StringUtils.isNotEmpty(year) && StringUtils.isNotEmpty(month))
			query = "select t.* from thrm_leave as t where from_date >= '" + year + "-" + month + "-1' and to_date <= '" + year + "-" + month + "-30'";
		else
			query = "select t.* from thrm_leave as t";
		
		List<Leave> leaves = DAOFactory.getFactory().getLeaveDAO().executeSQLQuery(query);
		setLeaveList(leaves);
		
		return "calendar_page";
	}
	
	/**
	 * Calendar form.
	 *
	 * @return the string
	 */
	public String calendarForm(){
		return "calendar_form";
	}	
	
	/*
	 * 		            title: '<s:property value="leaveType.name"/> - <s:property value="employee.firstName"/> <s:property value="employee.lastName"/>',
		            start: new Date('<s:date name="fromDate" format="yyyy-MM-dd"/>'),
		            end: new Date('<s:date name="toDate" format="yyyy-MM-dd"/>'),
		            description: 'long description',
		            className: ["event", "bg-color-<s:property value='leaveType.bgColor'/>"],
		            <s:if test="leaveType.code == 'MED'">icon: 'fa-ambulance'</s:if>
					<s:elseif test="leaveType.code == 'VAC'">icon: 'fa-sun-o'</s:elseif>
					<s:else>icon: 'fa-sun-o'</s:else>
	 */
	
	/**
	 * Calendar date.
	 *
	 * @return the string
	 * @throws Exception the exception
	 */
	public String calendarDate() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String year = request.getParameter("current_year");
			String month = request.getParameter("current_month");
			String query = null;
//			Month month1=Month.values()[new Integer(month).intValue()];
//			System.out.println(month1.getValue());
			Calendar c = Calendar.getInstance();
//			c.setTime(today);
			
			int monthValue =c.get(Calendar.MONTH)+1;
//			int maxLength = month1.maxLength();
//			if(monthValue==2 && (new Integer(year).intValue())%4!=0)
//				maxLength-=1;
//			System.out.println(maxLength);
//			if(StringUtils.isNotEmpty(year) && StringUtils.isNotEmpty(month))
//				query = "select t.* from thrm_leave as t where from_date >= '" + year + "-" + monthValue + "-1' and to_date <= '" + year + "-" + monthValue + "-"+maxLength+"'";
//			else
//				query = "select t.* from thrm_leave as t";
//			
			List<JSONObject> mylist = new ArrayList<JSONObject>();
			String employee = "";
			
			List<Leave> leaves = DAOFactory.getFactory().getLeaveDAO().executeSQLQuery(query);
			for (Leave item : leaves) {
				JSONObject jo = new JSONObject();
				jo.element("id", item.getId());
				jo.element("status", item.getStatus());
				employee = item.getLeaveType().getName() + " - " + item.getEmployee().getFirstName() + " " + item.getEmployee().getLastName();
				jo.element("title", employee);
				jo.element("start", DATE_FORMAT_CAL.format(item.getFromDate()));
				jo.element("end", DATE_FORMAT_CAL.format(item.getToDate()));
				jo.element("description", "");
				jo.element("className", "bg-color-" + item.getLeaveType().getBgColor());
				if("MED".equals(item.getLeaveType().getCode())){
					jo.element("icon", "fa-ambulance");
				}else if("VAC".equals(item.getLeaveType().getCode())){
					jo.element("icon", "fa-sun-o");
				}else{	
					jo.element("icon", "fa-apple");
				}
				mylist.add(jo);
			}
			
			out.write(mylist.toString());	
			out.flush();			
			out.flush();
		} finally {
			out.close();
		}		
		return null;
	}	
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		monthList=com.geoland.kfis.persistence.hibernate.usertypes.Month.values();
		return "report_generator";
	}
	
}
