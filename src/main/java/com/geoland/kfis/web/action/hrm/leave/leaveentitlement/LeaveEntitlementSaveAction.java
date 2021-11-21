package com.geoland.kfis.web.action.hrm.leave.leaveentitlement;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveEntitlementSaveAction.
 */
public class LeaveEntitlementSaveAction extends LeaveEntitlementBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3617027420728650525L;
	
	/** The created by. */
	private Employee createdBy;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		createdBy=getUser().getEmployee();
		if(createdBy==null){
			addActionError("");
		}
		if(StringUtils.isNotEmpty(organisation) && organisation!=null){
			StringTokenizer st=new StringTokenizer(organisation,",");
			organisation=st.nextToken();
			organisation = StringUtils.deleteWhitespace(organisation);
			if (!StringUtils.isEmpty(organisation)) {
				employeeList = DAOFactory
						.getFactory()
						.getEmployeeDAO()
						.executeSQLQuery(
								"select e.*, p.*, y.* from thrm_employee as e left join tperson as p on e.id = p.id left join tparty as y on p.id = y.id where e.organisation_id='"
										+ organisation + "'");
			}
		}
		if (StringUtils.isEmpty(organisation)
				&& getLeaveEntitlement().getEmployee().getId() == null)
			addFieldError("leaveEntitlement.employee.id",
					getMessage("leaveEntitlement.employee.empty"));
		if (getLeaveEntitlement().getLeaveType() == null)
			addFieldError("leaveEntitlement.leaveType",
					getMessage("leaveEntitlement.leaveType.empty"));
		if (getLeaveEntitlement().getNoOfDays() == null)
			addFieldError("leaveEntitlement.noOfDays",
					getMessage("leaveEntitlement.noOfDays.empty"));
		else if(getLeaveEntitlement().getNoOfDays()<0)
			addFieldError("leaveEntitlement.noOfDays", getMessage("leave.entitlement.no.of.days.at.least.zero"));
		if (getLeaveEntitlement().getFromDate() == null)
			addFieldError("leaveEntitlement.fromDate",
					getMessage("leaveEntitlement.fromDate.empty"));
		if (getLeaveEntitlement().getToDate() == null)
			addFieldError("leaveEntitlement.toDate",
					getMessage("leaveEntitlement.toDate.empty"));
		if(compareDates(getLeaveEntitlement().getFromDate(), getLeaveEntitlement().getToDate()))
			addFieldError("leaveEntitlement.toDate", getMessage("contract.invalid.date"));
		if(getLeaveEntitlement().getNoOfDays()!=null && getLeaveEntitlement().getFromDate()!=null && getLeaveEntitlement().getToDate()!=null){ //if i shtuar
			long actual=getDaysNumber(getLeaveEntitlement().getFromDate(), getLeaveEntitlement().getToDate());
			if(actual<getLeaveEntitlement().getNoOfDays())
				addFieldError("leaveEntitlement.noOfDays", getMessage("leave.daysRequested.big"));
		}
		if(getLeaveEntitlement().getDaysUsed() == null)
			getLeaveEntitlement().setDaysUsed(0.0);
		if(getLeaveEntitlement()!=null && getLeaveEntitlement().getId()==null && getLeaveEntitlement().getEmployee().getId()!=null && getLeaveEntitlement().getLeaveType().getId()!=null){
			List<LeaveEntitlement> le=DAOFactory.getFactory().getLeaveEntitlementDAO().executeSQLQuery("select * from thrm_leave_entitlement where employee_id="+getLeaveEntitlement().getEmployee().getId()+" and leave_type_id="+getLeaveEntitlement().getLeaveType().getId());
			if(le!=null && le.size()>0){
				addFieldError("leaveEntitlement.leaveType", getMessage("There is an entitlement for this Employee and this leave type!!"));
			}
		}
		
		
		List<LeaveType> ltResult = DAOFactory
				.getFactory()
				.getLeaveTypeDAO()
				.executeSQLQuery(
						"select lt.* from thrm_leave_type as lt order by name asc");
		setLeaveTypeListLE(ltResult);

		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		User user = getUser().getUser();
		leList = new ArrayList<LeaveEntitlement>();
		
		if (employeeList == null) {
			String query="select le.* from thrm_leave_entitlement as le " + "where le.employee_id=" + getLeaveEntitlement().getEmployee().getId() + 
					" and le.leave_type_id=" + getLeaveEntitlement().getLeaveType().getId() + " and "+getLeaveEntitlement().getId()+" is null";
			existingLeaveEntitlement = DAOFactory.getFactory().getLeaveEntitlementDAO().executeSQLQuery(query);
			LeaveEntitlement le=null;
			if (existingLeaveEntitlement != null && !existingLeaveEntitlement.isEmpty()) {
//				for (LeaveEntitlement ex : existingLeaveEntitlement) {
//					if (checkEmployee(ex, getLeaveEntitlement().getEmployee(),
//							getLeaveEntitlement().getLeaveType())) {
//						
//						double usedDays=getLeaveEntitlement().getDaysUsed();
//						double a = ex.getNoOfDays() + getLeaveEntitlement().getNoOfDays()-usedDays;
//						setLeaveEntitlement(ex);
//						getLeaveEntitlement().setDaysUsed(usedDays);
//						getLeaveEntitlement().setNoOfDays(a);
//					}
//				}
				le=existingLeaveEntitlement.get(0);
				le.setNoOfDays(le.getNoOfDays()+getLeaveEntitlement().getNoOfDays());
				
				le.setCreatedBy(createdBy);
				le.setCreatedDate(new Date());			
				setLeaveEntitlement(le);
				getLeaveEntitlement().setCurrentUser(user);
				DAOFactory.getFactory().getLeaveEntitlementDAO().save(getLeaveEntitlement());
			}
			getLeaveEntitlement().setCreatedBy(createdBy);
			getLeaveEntitlement().setCreatedDate(new Date());
			getLeaveEntitlement().setCurrentUser(user);
			DAOFactory.getFactory().getLeaveEntitlementDAO().save(getLeaveEntitlement());
		} else {
			if (employeeList.size() > 0) {
				for (Employee emp : employeeList) {
					LeaveEntitlement leaveE = new LeaveEntitlement();
					leaveE.setDaysUsed(getLeaveEntitlement().getDaysUsed());
					leaveE.setEmployee(emp);
					leaveE.setFromDate(getLeaveEntitlement().getFromDate());
					leaveE.setToDate(getLeaveEntitlement().getToDate());
					leaveE.setLeaveType(getLeaveEntitlement().getLeaveType());
					leaveE.setDaysUsed(getLeaveEntitlement().getDaysUsed());
					leaveE.setNoOfDays(getLeaveEntitlement().getNoOfDays());
					leaveE.setNote(getLeaveEntitlement().getNote());
					leList.add(leaveE);
				}
				String sqlQuery = getExistingLeaveEntitlement(leList);
				if (sqlQuery != null) {
					existingLeaveEntitlement = DAOFactory.getFactory()
							.getLeaveEntitlementDAO().executeSQLQuery(sqlQuery);
				}
				for (LeaveEntitlement leave : leList) {
					Date fromDate=leave.getFromDate();
					Date toDate=leave.getToDate();
					if (existingLeaveEntitlement != null) {
						for (LeaveEntitlement ex : existingLeaveEntitlement) {
							if (checkEmployee(ex, leave.getEmployee(), leave.getLeaveType())) {
								double a = ex.getNoOfDays() + leave.getNoOfDays();
								setLeaveEntitlement(ex);
								leave = getLeaveEntitlement();
								leave.setNoOfDays(a);
							}
						}
					}
					leave.setFromDate(fromDate);
					leave.setToDate(toDate);
					leave.setCreatedBy(createdBy);
					leave.setCreatedDate(new Date());
					leave.setCurrentUser(user);
					DAOFactory.getFactory().getLeaveEntitlementDAO()
							.save(leave);
				}
			}
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
