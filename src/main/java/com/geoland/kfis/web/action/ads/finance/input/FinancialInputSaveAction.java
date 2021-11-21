/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.input;

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
import com.geoland.kfis.persistence.hibernate.usertypes.Fininputstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class FinancialInputSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 3, 2014, 1:43:38 PM
 */
public class FinancialInputSaveAction extends FinancialInputBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3973438456242160611L;
	
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
			addActionError("login.user.employee.role.empty");
		if(status.getStatus()!=null && status.getStatus()!=Fininputstatus.CREATED)
			addFieldError("", getMessage("fin.input.no.change"));
		if(finInput.getYear()==null)
			addFieldError("finInput.year", getMessage("fin.input.year.empty"));
		if(finInput.getMonth()==null)
			addFieldError("finInput.month", getMessage("fin.input.month.empty"));
		if(finInput.getOrganisation().getId()==null)
			addFieldError("finInput.organisation", getMessage("fin.input.organisation.empty"));
		if(finInput.getFinancialType().getId()==null)
			addFieldError("finInput.financialType", getMessage("fin.input.financial.type.empty"));
		if(finInput.getCumulativeValue()==null)
			addFieldError("finInput.cumulativeValue", getMessage("finInput.cumulativeValue.empty"));

		if(finInput.getInputDate() == null)
			addFieldError("finInput.inputDate", getMessage("finInput.inputDate.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		if(finInput.getId()==null){
			finInput.setCreatedTime(cdate);
			finInput.setEmployee(employee);
		}
		
		finInput.setFinInputStatus(status);
		
		if(status.getId()==null){
			status.setCreateDate(cdate);
			status.setEmployee(employee);
		}
		if(status.getStatus()==null){
			Character opl = employee.getOrganisation().getOperLevelVal();
			status.setStatus(opl.equals('M')?Fininputstatus.CREATED:opl.equals('R')?Fininputstatus.REGIONALVALIDATED:Fininputstatus.CENTRALAPPROVAL);
		}
		
		if(file!=null){
			status.setDoc(getFileBytes(file));
		}else if(status.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from tfin_input_status where id="+status.getId());
			sqlQuery.addScalar("doc");
			Object doc = sqlQuery.uniqueResult();
			status.setDoc((byte[])doc);
		}
		status.setFinancialInput(finInput);
		User user=getUser().getUser();
		finInput.setCurrentUser(user);
		DAOFactory.getFactory().getFinancialInputDAO().save(finInput);
		status.setCurrentUser(user);
		DAOFactory.getFactory().getFinInputStatusDAO().save(status);
		
		checkStatus(finInput);
		
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
