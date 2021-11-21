/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.periodplan;

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
 * The Class PeriodPlanSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 17, 2015, 10:20:26 AM
 */
public class PeriodPlanSaveAction extends PeriodPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -504553382944954780L;
	
	/** The emp. */
	private Employee emp;
	
	/** The file. */
	private File file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		emp=getUser().getEmployee();
		if(emp==null)
			addActionError("");
		
		if(period!=null && (period.getDhpetLocation()==null ||(period.getDhpetLocation()!=null && period.getDhpetLocation().getId()==null)))
			addFieldError("period.location", getMessage("dhpet.animal.capacity.location.empty"));
		
		if(period!=null && period.getStartYear()==null)
			addFieldError("period.startYear", getMessage("period.startYear.empty"));

		if(period!=null && period.getEndYear()==null)
			addFieldError("period.endYear", getMessage("period.endYear.empty"));
		
		if(period!=null && period.getEndYear()!=null && period.getStartYear()!=null && period.getEndYear()<period.getStartYear())
			addFieldError("period.endYear", getMessage("dhpet.period.plan.end.year.bigger.start.year"));
		
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
		if(period.getCreatedDate()==null)
			period.setCreatedDate(new Date());
		
		if(period.getEmployee()==null || (period.getEmployee()!=null && period.getEmployee().getId()==null))
			period.setEmployee(emp);
		
		if(file!=null){
			period.setDoc(getFileBytes(file));
		}else if(period.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from tdhpet_period_plan where id="+period.getId());
			sqlQuery.addScalar("doc");
			Object ob = sqlQuery.uniqueResult();
			if(ob!=null)
				period.setDoc((byte[])ob);
		}
		User user = getUser().getUser();
		period.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetPeriodPlanDAO().save(period);
		
		return SUCCESS;
	}

	/**
	 * Gets the emp.
	 *
	 * @return the emp
	 */
	public Employee getEmp() {
		return emp;
	}

	/**
	 * Sets the emp.
	 *
	 * @param emp the emp to set
	 */
	public void setEmp(Employee emp) {
		this.emp = emp;
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
