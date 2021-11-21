package com.geoland.kfis.web.action.hrm.salary;

import java.io.IOException;
import java.util.List;

import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * Class SalaryAction
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020 22:16:54
 * @Version 1.0
 */
public class SalaryAction extends SalaryBaseAction {
	
	private static final long serialVersionUID = 1L;
	
	protected List<Object[]> dataView;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		if(getSalaryId() != null){
			salary = DAOFactory.getFactory().getEmployeeSalaryDAO().get(getSalaryId());
			adjustments = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().getEmployeeSalaryAdjustments(salary.getEmployee().getId());
		}
		
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
	 * Dashboard
	 * 
	 * @return dashboard
	 * @throws IOException
	 */
	public String dashboard() throws IOException{
		
		/*statistics*/
		String employeeCountQuery = "select count(*) from thrm_employee";
		employeeCount = DAOFactory.getFactory().getEmployeeDAO().countQuery(employeeCountQuery);
		
		String salaryCountQuery = "select count(*) from thrm_employee_salary";
		salaryCount = DAOFactory.getFactory().getEmployeeSalaryDAO().countQuery(salaryCountQuery);
		
		String payrollCountQuery = "select count(*) from thrm_employee_salary_payroll";
		payrollCount = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().countQuery(payrollCountQuery);
		
		StringBuilder bui = new StringBuilder();
		bui.append("select p.fiscal_year, p.pay_month, p.status, count(p.*) from  thrm_employee_salary_payroll as p left join thrm_employee_salary as s on p.employee_id = s.employee_id left join thrm_employee as e on e.id = s.employee_id");
		bui.append(" ");
		bui.append("group by p.fiscal_year, p.pay_month, p.status");
		bui.append(" ");
		bui.append("order by p.pay_month");		 
		String fieldNames[] = new String[]{"fiscal_year", "pay_month", "status", "count"};
		String fieldTypes[] = new String[]{"LONG", "LONG", "STRING", "LONG"};
		dataView = DAOFactory.getFactory().getRequisitionStatusDAO().getDataView(fieldNames, fieldTypes, bui.toString());
		/*
		if(dataView!=null && !dataView.isEmpty()){
			for (Object[] objects : dataView) {
				System.out.println(objects[0] + ", " + objects[1] + ", " + objects[3]);
			}
		}
	datasets: [{
		label: 'NEW'
		data: [12x werte]
	  },{
		label: 'CAL'
		data: [12x werte]
	  },{
		label: 'FIN'
		data: [12x werte]
	  }		
		*/
		
		
		
				
		
		return "dashboard";
	}	

	public List<Object[]> getDataView() {
		return dataView;
	}
	
	public void setDataView(List<Object[]> dataView) {
		this.dataView = dataView;
	}
}
