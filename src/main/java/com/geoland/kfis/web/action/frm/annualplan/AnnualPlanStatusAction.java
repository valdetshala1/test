package com.geoland.kfis.web.action.frm.annualplan;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanStatusAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 27, 2014 , 11:25:05 AM
 */
public class AnnualPlanStatusAction extends AnnualPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = getUser().getEmployee();
		if (employee == null)
			addActionError("");
		
		String unControledActivity = "";
		
		if (annualplan.getId() == null)
			addFieldError("", "");
		else{
			annualplan=DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplan.getId());
			if(annualplan.getAnnualPlanningStatus().getStatus()!=submitAP && annualplan.getAnnualPlanningStatus().getStatus()!=replanAP)
				addFieldError("", "");
		}
		if (decisionStatus == null)
			addFieldError("statusDecision", getMessage("order.item.status.code.empty"));

		if (!hasFieldErrors() && !hasActionErrors() && decisionStatus!=replanAP) {
			String[][] tableName = getTableNames();
			Long planId = annualplan.getId();
			Session session = HibSessionFactory.getSessionFactory()
					.getCurrentSession();
			for (int n = 0; n < tableName.length; n++) {
				long count = countByStatusForDecision(tableName[n][0], planId, session);
				if (count > 0) {
					unControledActivity=tableName[n][1];
					addFieldError("", "");
					break;
				}
			}
		}
		
		if (hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
			response.addHeader("unControledActivity", unControledActivity);
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

		status.setStatus(decisionStatus);
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

}
