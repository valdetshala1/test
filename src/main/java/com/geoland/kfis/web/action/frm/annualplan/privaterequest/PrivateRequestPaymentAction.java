package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestPaymentAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 17, 2014 , 9:40:11 AM
 */
public class PrivateRequestPaymentAction extends PrivateRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	protected Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(privateRequest!=null && privateRequest.getPaymentValue()==null)
			addFieldError("privateRequest.paymentValue", getMessage("privateRequest.paymentValue"));
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(employee==null)
			addActionError("");
		Double payment=privateRequest.getPaymentValue();
		privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequest.getId());
		privateRequest.setPaymentValue(payment);
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		privateRequest.setPayment(Boolean.TRUE);
		DAOFactory.getFactory().getPrivateRequestDAO().save(privateRequest);
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

	

	
	
	
}
