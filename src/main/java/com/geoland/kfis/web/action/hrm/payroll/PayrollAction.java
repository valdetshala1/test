package com.geoland.kfis.web.action.hrm.payroll;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.EmployeeSalaryPayrollAdjustment;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * Class PayrollAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020 22:16:54
 * @Version 1.0
 */
public class PayrollAction extends PayrollBaseAction {
	
	private static final long serialVersionUID = 1L;
	private Long apkId;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		loadPayroll(payrollId);
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String list() throws IOException{
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String grid() throws IOException{
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String page() throws IOException{
		return "page";
	}
	

	/**
	 * Report popup.
	 *
	 * @return the string
	 */
	public String reportPopup(){
		String sql="select id from torganisation where orga_name='APK'";
	    Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
	    SQLQuery query=session.createSQLQuery(sql);
	    query.addScalar("id", LongType.INSTANCE);
	    List list=query.list();
	    if(list!=null && list.size()>0)
	    	apkId=(Long)query.list().get(0);
		return "reportPopup";
	}
	
	public Long getApkId() {
		return apkId;
	}
	
}
