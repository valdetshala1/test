package com.geoland.kfis.web.action.frm.dhpet.dhpetannualplan;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DhpetAnnualPlanSaveAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @version 1.1
 * @created Dec 8, 2015 , 1:42:42 PM
 * @created Dec 17, 2015, 3:33:47 PM
 */
public class DhpetAnnualPlanSaveAction extends DhpetAnnualPlanBaseAction {
	
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
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(annualplan!=null && (annualplan.getDhpetPeriodPlan()==null || (annualplan.getDhpetPeriodPlan()!=null && annualplan.getDhpetPeriodPlan().getId()==null)))
			addFieldError("annualplan.dhpetPeriodPlan", getMessage("dhpet.period.plan.empty"));
		else annualplan.setDhpetPeriodPlan(DAOFactory.getFactory().getDhpetPeriodPlanDAO().get(annualplan.getDhpetPeriodPlan().getId()));
		
		if(annualplan!=null && annualplan.getYear()==null)
			addFieldError("annualplan.year", getMessage("fin.input.year.empty"));
		else if(annualplan.getDhpetPeriodPlan()!=null && annualplan.getDhpetPeriodPlan().getStartYear()!=null && annualplan.getDhpetPeriodPlan().getEndYear()!=null && 
				(annualplan.getDhpetPeriodPlan().getStartYear()>annualplan.getYear() || annualplan.getDhpetPeriodPlan().getEndYear()<annualplan.getYear()))
			addFieldError("annualplan.year", getMessage("dhpet.annual.plan.year.out.range"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(annualplan.getCreatedDate()==null)
			annualplan.setCreatedDate(new Date());
		
		if(annualplan.getEmployee()==null || (annualplan.getEmployee()!=null && annualplan.getEmployee().getId()==null))
			annualplan.setEmployee(employee);
		
		if(file!=null){
			annualplan.setDoc(getFileBytes(file));
		}else if(annualplan.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from tdhpet_annual_plan where id="+annualplan.getId());
			sqlQuery.addScalar("doc");
			Object ob = sqlQuery.uniqueResult();
			if(ob!=null)
				annualplan.setDoc((byte[])ob);
		}
		User user = getUser().getUser();
		annualplan.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetAnnualPlanDAO().save(annualplan);
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
	 * @param employee the employee to set
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
