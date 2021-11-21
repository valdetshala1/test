/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contract.paymentperiod;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Contract;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PaymentPeriodSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 8, 2014, 9:17:39 AM
 */
public class PaymentPeriodSaveAction extends PaymentPeriodBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 473151915628411581L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(payment!=null && payment.getContract().getId()==null)
			addFieldError("payment.contract", getMessage("payment.contract.empty"));
		if(payment!=null && payment.getStartDate()==null)
			addFieldError("payment.startDate", getMessage("payment.start.date.empty"));
		
		if(payment!=null && payment.getCompletionDate()==null)
			addFieldError("payment.completionDate", getMessage("payment.completion.date.empty"));
		
		if(payment!=null && payment.getPaymentPeriod()==null)
			addFieldError("payment.paymentPeriod", getMessage("payment.payment.period.empty"));
		
		if(compareDates(payment.getStartDate(), payment.getCompletionDate()))
			addFieldError("payment.completionDate", getMessage("contract.invalid.date"));
		
//		if(payment!=null && payment.getContract().getId()!=null && payment.getPaymentPeriod()!=null){
//			Contract contract = DAOFactory.getFactory().getContractDAO().get(payment.getContract().getId());
//			if(contract!=null){
//				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
//				SQLQuery s=null;
//				Double exPayment=null;
//				if(payment.getId()!=null){
//					String exBalanceQuery="select payment_period from tfin_payment_period p join tfin_contract c on c.id=p.contract_id where p.id="+payment.getId();
//					s=session.createSQLQuery(exBalanceQuery);
//					s.addScalar("payment_period");
//					List list=s.list();
//					exPayment = (Double)list.get(0);
//				}
//				if(exPayment==null || (exPayment!=null && !exPayment.equals(payment.getPaymentPeriod()))){
//					String query = "select ("+contract.getContractCosts()+"-(sum(payment_period)+"+payment.getPaymentPeriod()+")) as balance from tfin_payment_period p join tfin_contract c on c.id=p.contract_id where c.id="+payment.getContract().getId();
//					s=session.createSQLQuery(query);
//					s.addScalar("balance");
//					List list=s.list();
//					Double balance = (Double)list.get(0);
//					if(balance!=null)
//						payment.setPaymentBalance(balance);
//					else
//						payment.setPaymentBalance(contract.getContractCosts()-payment.getPaymentPeriod());
//				}
//			}
//		}
		
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
		payment.setCreatedTime(new Date());
		payment.setEmployee(employee);
		
		DAOFactory.getFactory().getPaymentPeriodDAO().save(payment);
		if(file!=null){
			doc.setDoc(getFileBytes(file));

			doc.setContract(payment.getContract());
			doc.setCreatedDate(new Date());
			doc.setEmployee(employee);
			DAOFactory.getFactory().getContractDocDAO().save(doc);
		}
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
}
