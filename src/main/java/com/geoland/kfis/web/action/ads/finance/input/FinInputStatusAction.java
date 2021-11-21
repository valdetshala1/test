package com.geoland.kfis.web.action.ads.finance.input;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class FinInputStatusAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:56:16 PM, Jun 4, 2015
 */
public class FinInputStatusAction extends FinancialInputBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1512668907846144142L;
	
	/** The file. */
	private File file;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("login.user.employee.role.empty");
		
		if(finInput==null || (finInput!=null && finInput.getId()==null))
			addFieldError("", getMessage(""));
		if(status==null && (status!=null && status.getStatus()==null))
			addFieldError("status.status", getMessage("order.item.status.code.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate=new Date();
		if(status.getId()==null){
			status.setCreateDate(cdate);
			status.setEmployee(employee);
		}
		
		finInput=DAOFactory.getFactory().getFinancialInputDAO().get(finInput.getId());
		finInput.setFinInputStatus(status);
		
		status.setFinancialInput(finInput);
		if(file!=null){
			status.setDoc(getFileBytes(file));
		}
		
		DAOFactory.getFactory().getFinancialInputDAO().save(finInput);
		DAOFactory.getFactory().getFinInputStatusDAO().save(status);
		
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
}
