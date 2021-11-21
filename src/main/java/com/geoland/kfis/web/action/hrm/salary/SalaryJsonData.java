package com.geoland.kfis.web.action.hrm.salary;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * Class SalaryJsonData
 * @author BEKIM BAJRAKTARI
 * @created 07.05.2020 11:27:23
 * @Version 1.0
 */
public class SalaryJsonData extends GridBaseAction {

	private static final long serialVersionUID = 1L;
	
	/*
	  [{
			                label: 'Employee',
			                backgroundColor: "#949FB1",
			                data: [46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46]
			            }, {
			                label: 'Payroll started',
			                backgroundColor: "#3498db",
			                data: [getData(json, 'NEW', 1), 
				                getData(json, 'NEW', 2), 
				                getData(json, 'NEW', 3), 
				                getData(json, 'NEW', 4), 
				                getData(json, 'NEW', 5), 
				                getData(json, 'NEW', 6), 
				                getData(json, 'NEW', 7), 
				                getData(json, 'NEW', 8),
				                getData(json, 'NEW', 9),
				                getData(json, 'NEW', 10),
				                getData(json, 'NEW', 11),
				                getData(json, 'NEW', 12)],		                
			            }, {
			                label: 'Payroll calulated',
			                backgroundColor: "#FDB45C",
			                data: [getData(json, 'CAL', 1), 
			                getData(json, 'CAL', 2), 
			                getData(json, 'CAL', 3), 
			                getData(json, 'CAL', 4), 
			                getData(json, 'CAL', 5), 
			                getData(json, 'CAL', 6), 
			                getData(json, 'CAL', 7), 
			                getData(json, 'CAL', 8),
			                getData(json, 'CAL', 9),
			                getData(json, 'CAL', 10),
			                getData(json, 'CAL', 11),
			                getData(json, 'CAL', 12)]	                
			  		                
			            }, {
			                label: 'Payroll Finalizied',
			                backgroundColor: "#46BFBD",
			                data: [getData(json, 'FIN', 1), getData(json, 'FIN', 2), 
				                getData(json, 'FIN', 3), getData(json, 'FIN', 4), getData(json, 'FIN', 5), getData(json, 'FIN', 6), getData(json, 'FIN', 7), getData(json, 'FIN', 8),getData(json, 'FIN', 9),
				                getData(json, 'FIN', 10),
				                getData(json, 'FIN', 11),
				                getData(json, 'FIN', 12)],                		                
			                
			            }
			            ]
	 
	 
	 */	
	public void getSalaryMonthsByStatus() throws IOException,BusinessException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpServletRequest request=ServletActionContext.getRequest();
		try {

			String employeeCountQuery = "select count(*) from thrm_employee";
			Integer employeeCount = DAOFactory.getFactory().getEmployeeDAO().countQuery(employeeCountQuery);
			
			String salaryCountQuery = "select count(*) from thrm_employee_salary";
			Integer salaryCount = DAOFactory.getFactory().getEmployeeSalaryDAO().countQuery(salaryCountQuery);
			
			String payrollCountQuery = "select count(*) from thrm_employee_salary_payroll";
			Integer payrollCount = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().countQuery(payrollCountQuery);
			
			StringBuilder bui = new StringBuilder();
			bui.append("select p.fiscal_year, p.pay_month, p.status, count(p.*) from  thrm_employee_salary_payroll as p left join thrm_employee_salary as s on p.employee_id = s.employee_id left join thrm_employee as e on e.id = s.employee_id");
			bui.append(" ");
			bui.append("group by p.fiscal_year, p.pay_month, p.status");
			bui.append(" ");
			bui.append("order by p.pay_month");		 
			String fieldNames[] = new String[]{"fiscal_year", "pay_month", "status", "count"};
			String fieldTypes[] = new String[]{"LONG", "LONG", "STRING", "LONG"};
			List<Object[]> dataView = DAOFactory.getFactory().getEmployeeSalaryDAO().getDataView(fieldNames, fieldTypes, bui.toString());			
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows=new JSONArray();
			if(dataView!=null && !dataView.isEmpty()){
					JSONArray months = new JSONArray();
				
					JSONObject labelEmployee =new JSONObject(); 
					labelEmployee.element("label", "Employee");
					labelEmployee.element("backgroundColor", "#979a9a");
					months = getMonthValues(employeeCount);
					labelEmployee.element("data", months);
					rows.add(labelEmployee);
					
					
					JSONObject labelSalary =new JSONObject();
					labelSalary.element("label", "Salary defined");
					labelSalary.element("backgroundColor", "#5f6a6a");
					months = getMonthValues(salaryCount);
					labelSalary.element("data", months);
					rows.add(labelSalary);
				
					JSONObject stNew=new JSONObject();
					stNew.element("label", "Payroll started");
					stNew.element("backgroundColor", "#3498db");
					months = getMonthValues("NEW", dataView);
					stNew.element("data", months);
					rows.add(stNew);
					
					JSONObject stCal=new JSONObject();
					stCal.element("label", "Payroll calulated");
					stCal.element("backgroundColor", "#FDB45C");
					months = getMonthValues("CAL", dataView);
					stCal.element("data", months);
					rows.add(stCal);			

					JSONObject stFin=new JSONObject();
					stFin.element("label", "Payroll finalized");
					stFin.element("backgroundColor", "#46BFBD");
					months = getMonthValues("FIN", dataView);
					stFin.element("data", months);
					rows.add(stFin);					
					
	//					jo.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));

			}
			
			/*
	        barChartData = {
		            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
		            datasets: jsonDataX.rows
		        };
	        */
			
			JSONObject chartData = new JSONObject(); 
			chartData.element("labels", getMonthLabels());
			chartData.element("datasets", rows);
			data.element("data", chartData);
			out.append(data.toString());
//			System.out.println(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("SalaryJsonData.getSalaryMonthsByStatus",e);
			throw new BusinessException("SalaryJsonData.getSalaryMonthsByStatus",e);
		}finally{
			out.close();
		}
	}
	
	protected JSONArray getMonthLabels() {
		JSONArray months = new JSONArray();
		months.add("January");
		months.add("February");
		months.add("March");
		months.add("April");
		months.add("May");
		months.add("June");
		months.add("July");
		months.add("August");
		months.add("September");
		months.add("October");
		months.add("November");
		months.add("December");
		return months;
	}

	protected JSONArray getMonthValues(String status, List<Object[]> dataView) {

		Map<Long, Long> map = new HashMap<Long, Long>();
		for(int i=1; i<=12;i++) {
			map.put(new Long(i), new Long(0));
		}
		
		for (Object[] objects : dataView) {	
			if(status.equals(objects[2])) {
				map.put(new Long(objects[1].toString()), new Long(objects[3].toString()));
			}
		}
		
		JSONArray months = new JSONArray();
		for (Map.Entry<Long, Long> entry : map.entrySet()) {
//		    System.out.println(entry.getKey() + "/" + entry.getValue());
		    months.add(entry.getValue());
		}		
				
		
		return months;
	}
	
	protected JSONArray getMonthValues(Integer value) {
		JSONArray months = new JSONArray();
		for(int i=1; i<=12;i++) {
			months.add(value);
		}
		return months;
	}

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
	
}
