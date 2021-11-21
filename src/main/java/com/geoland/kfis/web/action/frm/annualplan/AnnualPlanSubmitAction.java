package com.geoland.kfis.web.action.frm.annualplan;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.AnnualPlanningStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanSubmitAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:50:05 PM, Nov 27, 2014
 */
public class AnnualPlanSubmitAction extends AnnualPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file;
	
	/** The status. */
	private AnnualPlanningStatus status;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		String unsubmitedActivity="";
		String noActivity="";
		employee = getUser().getEmployee();
		if (employee == null)
			addActionError("");
		if (annualplan.getId() == null)
			addFieldError("", "");
		else {
			annualplan=DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplan.getId());
			if(annualplan.getActivities().size()>0){
				String[][] tableName = getTableNames();
				Long planId = annualplan.getId();
				Session session = HibSessionFactory.getSessionFactory()
						.getCurrentSession();
					for (int n = 0; n < tableName.length; n++) {
						long count = countByStatusForSubmit(tableName[n][0], planId, session);
						if (count > 0) {
							unsubmitedActivity=getMessage("annual.plan.un.submited.activities."+tableName[n][1]);
							addFieldError("", "");
							break;
						}
					}
			}else{
				addFieldError("", "");
				noActivity=getMessage("annual.plan.no.activity");
			}
		}
//		if (decisionStatus == null)
//			addFieldError("statusDecision", getMessage("statusDecision.empty"));

		if (hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
			response.addHeader("unsubmitedActivity", unsubmitedActivity);
			response.addHeader("noActivity", noActivity);
		}

	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		annualplan = DAOFactory.getFactory().getAnnualPlanningDAO()
				.get(annualplan.getId());
		status.setAnnualPlanning(annualplan);
		status.setCreatedDate(new Date());
		status.setPerson(employee);
		
		status.setStatus(Activitystatus.SUBMITTED);
		annualplan.setAnnualPlanningStatus(status);

		DAOFactory.getFactory().getAnnualPlanningStatusDAO().save(status);
		DAOFactory.getFactory().getAnnualPlanningDAO().save(annualplan);
		return SUCCESS;
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
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
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

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.frm.annualplan.AnnualPlanBaseAction#getStatus()
	 */
	public AnnualPlanningStatus getStatus() {
		return status;
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.frm.annualplan.AnnualPlanBaseAction#setStatus(com.geoland.kfis.model.AnnualPlanningStatus)
	 */
	public void setStatus(AnnualPlanningStatus status) {
		this.status = status;
	}

	
}
