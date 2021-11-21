/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.stand;

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
import com.geoland.kfis.web.action.dem.importshape.ImportShapeBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class ShapeStandMigrateAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 13, 2015, 1:38:17 PM
 */
public class ShapeStandMigrateAction extends ImportShapeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 864501985610750032L;
	
	/** The log. */
	private static Logger log = Logger.getLogger(ShapeStandMigrateAction.class);
	
	/** The employee. */
	private Employee employee;
	
	/** The from. */
	private String from;
	
	/** The to. */
	private String to;
	
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
				String query1 = "SELECT f_frm_migrate_shape_stand("+employee.getId()+",'"+from+"','"+to+"')";
				CallableStatement pc1 = conn.prepareCall(query1);
				boolean b1 = pc1.execute();
				log.info(query1 + " was executed = " + b1);
				
				String query2 = "delete from shape_stand";
				CallableStatement pc2 = conn.prepareCall(query2);
				boolean b2 = pc2.execute();
				log.info(query2 + " was executed = " + b2);
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
	 * Gets the from.
	 *
	 * @return the from
	 */
	public String getFrom() {
		return from;
	}

	/**
	 * Sets the from.
	 *
	 * @param from the from to set
	 */
	public void setFrom(String from) {
		this.from = from;
	}

	/**
	 * Gets the to.
	 *
	 * @return the to
	 */
	public String getTo() {
		return to;
	}

	/**
	 * Sets the to.
	 *
	 * @param to the to to set
	 */
	public void setTo(String to) {
		this.to = to;
	}

	
}
