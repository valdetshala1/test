package com.geoland.kfis.web.action.hrm.leave;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.logic.hr.leave.BoLeave;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Leave;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Travelstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 23, 2014 11:46:33 PM
 * @Version 1.0
 */
public class LeaveSaveAction extends LeaveBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The file. */
	private File file;
	
	/** The employee. */
	private Employee employee;
	
	/** The l. */
	private Leave l;
	
	/** The le. */
	private LeaveEntitlement le;
	
	/** The bl. */
	private BoLeave bl;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addFieldError("", "");
		
		List<LeaveType> ltResult = DAOFactory.getFactory().getLeaveTypeDAO().executeSQLQuery("select lt.* from thrm_leave_type as lt order by lt.name asc");
		setLeaveTypeList(ltResult);
		try {
			if(!changeStatus){
				addValidationErrors(getBoLeave().validate());
				if(compareDates(getLeave().getFromDate(), getLeave().getToDate()))
					addFieldError("leave.toDate.invalid", getMessage("leave.to.date.greater"));
				if(getLeave().getDaysRequested()!=null && getLeave().getFromDate()!=null && getLeave().getToDate()!=null){
					long actual=getDaysNumber(getLeave().getFromDate(), getLeave().getToDate());
					if(actual<getLeave().getDaysRequested())
						addFieldError("leave.daysRequested.big", getMessage("leave.daysRequested.big"));
				}
			}
			else{
				l=DAOFactory.getFactory().getLeaveDAO().get(getLeave().getId());
				List<LeaveEntitlement> entitlement=DAOFactory.getFactory().getLeaveEntitlementDAO().executeSQLQuery("select * from thrm_leave_entitlement where employee_id="+l.getEmployee().getId()+ " and leave_type_id="+l.getLeaveType().getId());
				le=entitlement.get(0);
				
				if(getLeave().getDaysApproved()!=null){
//					if(getLeave().getDaysApproved()!=l.getDaysApproved() && le.getNoOfDays()<getLeave().getDaysApproved() && statusSave==false)
//						addFieldError("leave.daysApproved.less", getMessage("leave.days.less"));
					if(getLeave().getDaysApproved()>l.getDaysRequested())
						addFieldError("leave.daysApproved.less", getMessage("leave.days.too.large"));
				}else{
					addFieldError("leave.daysApproved", getMessage("leave.days.approved.empty"));
				}
				
				if(getLeave().getDaysSpent()!=null){
					if(getLeave().getDaysApproved()!=null && getLeave().getDaysSpent()>getLeave().getDaysApproved())
						addFieldError("leave.daysSpent", getMessage("leave.days.spent.too.large"));
				}
				
			}
			
		} catch (ValidationException e) {
			addActionError(e.getMessage());
			e.printStackTrace();
		}
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		getLeave().setApprovedUser(employee);
		getLeave().setCreatedDate(new Date());
		getLeave().setPartyByCreatedBy(employee);
		if(changeStatus && getLeave().getId()!=null){
			Double nr1=l.getDaysApproved();//existing days approved
			Travelstatus exStatus=l.getStatus();
			l.setApprovedDate(new Date());
			l.setStatus(getLeave().getStatus());
			l.setDaysApproved(getLeave().getDaysApproved());
			l.setApprovedComments(getLeave().getApprovedComments());
			l.setReturnDate(getLeave().getReturnDate());
			l.setDaysSpent(getLeave().getDaysSpent());
			l.setApprovedUser(employee);
			
			l.setCurrentUser(user);
			DAOFactory.getFactory().getLeaveDAO().save(l);
			if(l.getStatus()==Travelstatus.APPROVED){
				Double nr2=l.getDaysApproved();//days approved from UI
				if(nr1==null && nr2!=null) {
					le.setDaysUsed(le.getDaysUsed()+getLeave().getDaysApproved());
					le.setNoOfDays(le.getNoOfDays()-getLeave().getDaysApproved());
					le.setCurrentUser(user);
					DAOFactory.getFactory().getLeaveEntitlementDAO().save(le);
				}else if(nr1!=null && nr2!=null && (!nr1.toString().equals(nr2.toString()) || !exStatus.equals(getLeave().getStatus()) )){
					le.setDaysUsed(le.getDaysUsed()+getLeave().getDaysApproved());
					le.setNoOfDays(le.getNoOfDays()-getLeave().getDaysApproved());
					le.setCurrentUser(user);
					DAOFactory.getFactory().getLeaveEntitlementDAO().save(le);
				}
			}
		}else{
			if(getLeave().getStatus()==null)
				getLeave().setStatus(Travelstatus.PENDING);
			getLeave().setRequestedUserId(employee.getId());
			getLeave().setRequestedDate(new Date());
		}
		if(file!=null){
			getLeave().setDoc(getFileBytes(file));
		}else if(getLeave().getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from thrm_leave where id="+getLeave().getId());
			sqlQuery.addScalar("doc");
			Object ob1 = sqlQuery.uniqueResult();
			getLeave().setDoc((byte[])ob1);
		}
		if(!changeStatus)
			getLeave().setCurrentUser(user);
			DAOFactory.getFactory().getLeaveDAO().save(getLeave());
		return SUCCESS;
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
	 * Gets the l.
	 *
	 * @return the l
	 */
	public Leave getL() {
		return l;
	}

	/**
	 * Sets the l.
	 *
	 * @param l the l to set
	 */
	public void setL(Leave l) {
		this.l = l;
	}

	/**
	 * Gets the le.
	 *
	 * @return the le
	 */
	public LeaveEntitlement getLe() {
		return le;
	}

	/**
	 * Sets the le.
	 *
	 * @param le the le to set
	 */
	public void setLe(LeaveEntitlement le) {
		this.le = le;
	}

	/**
	 * Gets the bl.
	 *
	 * @return the bl
	 */
	public BoLeave getBl() {
		return bl;
	}

	/**
	 * Sets the bl.
	 *
	 * @param bl the bl to set
	 */
	public void setBl(BoLeave bl) {
		this.bl = bl;
	}
}
