/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.plot;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.jdbc.Work;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.web.action.dem.importshape.stand.ShapeStandMigrateAction;

// TODO: Auto-generated Javadoc
/**
 * The Class PlotMigrateAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 20, 2015, 10:51:36 AM
 */
public class PlotMigrateAction extends ImportPlotBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6794396133457682618L;
	
	/** The log. */
	private static Logger log = Logger.getLogger(ShapeStandMigrateAction.class);
	
	/** The employee. */
	private Employee employee;
	
	/** The reg code. */
	private String reg_code;
	
	/** The mu code. */
	private String mu_code;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
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
		Session currentSession = HibSessionFactory.getSessionFactory().getCurrentSession();
		currentSession.doWork(new Work() {
			 @Override
             public void execute(Connection conn) throws SQLException {
				String query1 = "SELECT f_frm_migrate_shape_plots("+employee.getId()+",'"+reg_code+"','"+mu_code+"')";
				CallableStatement pc1 = conn.prepareCall(query1);
				boolean b1 = pc1.execute();
				log.info(query1 + " was executed = " + b1);
				
				String query2 = "delete from shape_plots";
				CallableStatement pc2 = conn.prepareCall(query2);
				boolean b2 = pc2.execute();
				log.info(query2 + " was executed = " + b2);
				
				String query3 = "delete from shape_plot_trees";
				CallableStatement pc3 = conn.prepareCall(query3);
				boolean b3 = pc3.execute();
				log.info(query3 + " was executed = " + b3);
			 }
		});
		
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
	 * Gets the reg code.
	 *
	 * @return the reg_code
	 */
	public String getReg_code() {
		return reg_code;
	}

	/**
	 * Sets the reg code.
	 *
	 * @param reg_code the reg_code to set
	 */
	public void setReg_code(String reg_code) {
		this.reg_code = reg_code;
	}

	/**
	 * Gets the mu code.
	 *
	 * @return the mu_code
	 */
	public String getMu_code() {
		return mu_code;
	}

	/**
	 * Sets the mu code.
	 *
	 * @param mu_code the mu_code to set
	 */
	public void setMu_code(String mu_code) {
		this.mu_code = mu_code;
	}

}
