/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.AnnualBudgetAllocation;
import com.geoland.kfis.model.BudgetMainntenance;
import com.geoland.kfis.model.Contract;
import com.geoland.kfis.model.ContractDoc;
import com.geoland.kfis.model.Contractor;
import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.model.EmployeeSalaryTaxRates;
import com.geoland.kfis.model.FinInputStatus;
import com.geoland.kfis.model.FinancialInput;
import com.geoland.kfis.model.FinancialOutput;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.PaymentPeriod;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AnnuBudgetAllocationDAO;
import com.geoland.kfis.persistence.dao.services.BudgetMainntenanceDAO;
import com.geoland.kfis.persistence.dao.services.ContractDAO;
import com.geoland.kfis.persistence.dao.services.ContractDocDAO;
import com.geoland.kfis.persistence.dao.services.ContractorDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeSalaryDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeSalaryPayrollDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeSalaryTaxRatesDAO;
import com.geoland.kfis.persistence.dao.services.FinInputStatusDAO;
import com.geoland.kfis.persistence.dao.services.FinancialInputDAO;
import com.geoland.kfis.persistence.dao.services.FinancialOutputDAO;
import com.geoland.kfis.persistence.dao.services.FinancialTypeDAO;
import com.geoland.kfis.persistence.dao.services.PaymentPeriodDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Fininputstatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

// TODO: Auto-generated Javadoc
/**
 * The Class FinanceGridAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 3, 2014, 2:53:49 PM
 */
public class FinanceGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8879169597163255888L;
	
	/**
	 * Gets the status icon.
	 *
	 * @param status the status
	 * @param language the language
	 * @return icon
	 */
	private String getStatusIcon(Fininputstatus status,String language){
		String icon = "status_" + status.getDOMKEY().toLowerCase() + ".png";
		String title="al".equals(language)?status.getDOMTEXT():"en".equals(language)?status.getDOMTEXT_EN():status.getDOMTEXT_SR();
		String content = "<img src='img/status/" + icon + "' border='0' alt='" + title + "'" + " title='" + title + "'" + "style='display: block; margin-left: auto; margin-right: auto;' align='center'/>";
		return content;
	}
	
	
	/**
	 * grid financialInput method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financialInput() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			FinancialInputDAO dao = DAOFactory.getFactory().getFinancialInputDAO();
			String lang = getLocale().getLanguage().toLowerCase();
			
//			Long org_id = getUser().getOrganisationId();
//			Character opl_val = getUser().getOrganisation().getOperLevelVal();
			
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String allocation=request.getParameter("allocation");
			String municipality_id = request.getParameter("municipality_id");
			municipality_id = getUser().getOrganisationId().toString();
			
			Organisation org = getUser().getOrganisation();
			String countQuery = "select count(*) from tfin_input";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String cond = " WHERE ";
			String query="select distinct i.*,o.*,f.*,fis.* from tfin_input i left join torganisation o on o.id=i.municipality_id left join tfin_type f on i.input_type_id=f.id " +
					" left join tfin_input_status as fis on i.current_status=fis.id";
			
			if(StringUtils.isNotEmpty(allocation) && allocation.equals("true")){
				query+=cond+" fis.status='"+Fininputstatus.CENTRALAPPROVAL+"'";
				cond= " AND ";
			}else if(org.getOperLevelVal()!='C'){
				query+= cond+"  (o.id=any (get_all_children_array("+org.getId()+")) or o.id="+org.getId()+")";
				cond= " AND ";
			}

			if(StringUtils.isNotEmpty(year)){
				query+=cond+" i.year="+year;
				cond=" AND ";
				if(StringUtils.isNotEmpty(month)){
					if(month.length()>2){
						Month m=Month.valueOf(month);
						query+=cond+" i.month='"+m.getDOMKEY()+"'";
					}else {
						query+= cond+" i.month='"+month+"'";
					}
					
				}
				
				// Bug Fix : Allocation not showing financial inputs in grid 
				// Comment the below part
				/*if(StringUtils.isNotEmpty(municipality_id)){
					query+=cond+" i.municipality_id="+municipality_id;
				}*/
			}
			else if(StringUtils.isNotEmpty(month)){
				if(month.length()>2){
					Month m=Month.valueOf(month);
					query+=cond+" i.month='"+m.getDOMKEY()+"'";
				}else {
					query+=cond+" i.month='"+month+"'";
				}
				cond=" AND ";
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field=getSidx();
				if(ob_field.equals("financial_type"))
					ob_field = ("al".equals(lang)?"f.name":"en".equals(lang)?"f.name_en":"f.name_sr");
				else if(ob_field.equals("municipality")){
					ob_field = ("al".equals(lang)?"o.orga_name":"en".equals(lang)?"o.orga_name_en":"o.orga_name_sr");
				}
				query += " order by " + ob_field + " " + getSord();
			}
			query += " LIMIT " + limit + " offset " + start;
			List<FinancialInput> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(FinancialInput f:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", f.getId());
				jsonObject.element("status", f.getFinInputStatus().getStatus().getDOMKEY());
				jsonObject.element("status_icon", getStatusIcon(f.getFinInputStatus().getStatus(), lang));
				jsonObject.element("year", f.getYear());
				if(lang.equals("al"))
					jsonObject.element("financial_type", f.getFinancialType().getNameAl());
				else if(lang.equals("sr"))
					jsonObject.element("financial_type",f.getFinancialType().getNameSr());
				else
					jsonObject.element("financial_type",f.getFinancialType().getNameEn());
					
				jsonObject.element("municipality", getOganisationData(f.getOrganisation(), lang));//f.getOrganisation().getOrgaName()+"("+f.getOrganisation().getOperLevelVal()+")");
				jsonObject.element("monthKey", f.getMonth().getDOMKEY());
				if(lang.equals("al"))
					jsonObject.element("month", f.getMonth().getDOMTEXT());
				else if(lang.equals("sr"))
					jsonObject.element("month", f.getMonth().getDOMTEXT_SR());
				else
					jsonObject.element("month", f.getMonth().getDOMTEXT_EN());
				jsonObject.element("cumulative_value", f.getCumulativeValue());
				
				jsonObject.element("allocated", f.isAllocated());
				
				if(f.getAllocatedDate()!=null)
					jsonObject.element("allocated_date", DATE_FORMAT.format(f.getAllocatedDate()));
				
				if(f.getEmployee()!=null)
					jsonObject.element("created_by", f.getEmployee().getFirstName() + " " + f.getEmployee().getLastName());
				if(f.getCreatedTime()!=null)
					jsonObject.element("created_time", DATE_FORMAT.format(f.getCreatedTime()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.financialInput", e);
			throw new BusinessException("FinanceGridAction.financialInput", e);
		} finally {
			out.close();
		}
	}
	
	
	/**
	 * grid financialInput2 method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financialInput2() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			FinancialInputDAO dao = DAOFactory.getFactory().getFinancialInputDAO();
			String lang = getLocale().getLanguage().toLowerCase();
			Organisation org = getUser().getOrganisation();
			
			String countQuery = "select count(distinct i.*) from tfin_input i left join torganisation o on o.id=i.municipality_id left join tfin_type f on i.input_type_id=f.id " + 
										" left join tfin_input_status as fis on i.current_status=fis.id";
						
			String query="select distinct i.*,o.*,f.*,fis.* from tfin_input i left join torganisation o on o.id=i.municipality_id left join tfin_type f on i.input_type_id=f.id " +
					" left join tfin_input_status as fis on i.current_status=fis.id";
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				query+= " where " + condition;
				countQuery+= " where " + condition;
				
				if(org.getOperLevelVal()=='M') {
					query+= " and o.id = " + getUser().getOrganisationId();
					countQuery+= " and o.id = " + getUser().getOrganisationId();
				}else if(org.getOperLevelVal()=='R') {
					query+= " and o.parent_id = " + getUser().getOrganisationId();
					countQuery+= " and o.parent_id = " + getUser().getOrganisationId();
				}				
			}else {
				
				if(org.getOperLevelVal()=='M') {
					query+= " where o.id = " + getUser().getOrganisationId();
					countQuery+= " where o.id = " + getUser().getOrganisationId();
				}else if(org.getOperLevelVal()=='R') {
					query+= " where o.parent_id = " + getUser().getOrganisationId();
					countQuery+= " where o.parent_id = " + getUser().getOrganisationId();
				}
			}
				
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				if(getSidx().equalsIgnoreCase("firstname")) {
					query += " order by per.first_name " + getSord();
				}else if(getSidx().equalsIgnoreCase("lastname")) { 
					query += " order by per.last_name " + getSord();
				}else {
					query += " order by " + getSidx() + " " + getSord();
				}
			}else {
				query += " order by i.id" ;
				
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			query += " LIMIT " + limit + " offset " + start;
			List<FinancialInput> list = dao.executeSQLQuery(query);
			
			
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(FinancialInput f:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", f.getId());
				jsonObject.element("status", f.getFinInputStatus().getStatus().getDOMKEY());
				jsonObject.element("status_icon", getStatusIcon(f.getFinInputStatus().getStatus(), lang));
				jsonObject.element("year", f.getYear());
				if(lang.equals("al"))
					jsonObject.element("financial_type", f.getFinancialType().getNameAl());
				else if(lang.equals("sr"))
					jsonObject.element("financial_type",f.getFinancialType().getNameSr());
				else
					jsonObject.element("financial_type",f.getFinancialType().getNameEn());
					
				jsonObject.element("municipality", getOganisationData(f.getOrganisation(), lang));//f.getOrganisation().getOrgaName()+"("+f.getOrganisation().getOperLevelVal()+")");
				jsonObject.element("monthKey", f.getMonth().getDOMKEY());
				if(lang.equals("al"))
					jsonObject.element("month", f.getMonth().getDOMTEXT());
				else if(lang.equals("sr"))
					jsonObject.element("month", f.getMonth().getDOMTEXT_SR());
				else
					jsonObject.element("month", f.getMonth().getDOMTEXT_EN());
				jsonObject.element("cumulative_value", f.getCumulativeValue());
				
				jsonObject.element("allocated", f.isAllocated());
				
				if(f.getAllocatedDate()!=null)
					jsonObject.element("allocated_date", DATE_FORMAT.format(f.getAllocatedDate()));
				
				if(f.getEmployee()!=null)
					jsonObject.element("created_by", f.getEmployee().getFirstName() + " " + f.getEmployee().getLastName());
				if(f.getCreatedTime()!=null)
					jsonObject.element("created_time", DATE_FORMAT.format(f.getCreatedTime()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.financialInput2", e);
			throw new BusinessException("FinanceGridAction.financialInput2", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * grid financialOutput method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financialSalaryOutput() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			FinancialOutputDAO dao=DAOFactory.getFactory().getFinancialOutputDAO();
			String outputType = request.getParameter("outputType");
			String department= request.getParameter("department");
			String month= request.getParameter("month");
			String lang = getLocale().getLanguage().toLowerCase();
			
			String countQuery;
			String query;
			if(outputType.equals("C")){
				countQuery ="SELECT count(*) FROM tfin_output where output_type='C'";
				query="select * from tfin_output where output_type='C'";
				
			}else {
				countQuery ="SELECT count(*) FROM tfin_output where output_type='S'";
				query="select * from tfin_output where output_type='S'";
				
			}
			if(StringUtils.isNotEmpty(department)){
				countQuery+=" and department="+department;
				query+=" and department="+department;
			}
			if(StringUtils.isNotEmpty(month)){
				countQuery+=" and month='"+month+"'";
				query+=" and month='"+month+"'";
			}
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				query+= " and " + condition;
				countQuery+= " and " + condition;
			}	
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				query += " order by " + getSidx() + " " + getSord();
			}
			
			query += " LIMIT " + limit + " offset " + start;
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			List<FinancialOutput> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(FinancialOutput f:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", f.getId());
				jsonObject.element("uop_number", f.getUopNumber());
				jsonObject.element("free_balance", f.getFreeBalance());
				if(f.getDateOfCommitment()!=null) {
					jsonObject.element("date_of_commitment", DATE_FORMAT.format(f.getDateOfCommitment())); }
				if(f.getFinancialType()!=null)
					jsonObject.element("expenditure_type", f.getFinancialType().getNameAl());
				if(f.getOrganisation()!=null){
					jsonObject.element("department", f.getOrganisation().getOrgaName()+"("+f.getOrganisation().getOperLevelVal()+")");
					jsonObject.element("dep_id", f.getOrganisation().getId());
				}
				jsonObject.element("economic_code", f.getEconomicCode());
				jsonObject.element("description_of_economic_code", f.getDescriptionOfEconomicCode());
				jsonObject.element("value_in_euro", f.getValueInEuro());
				jsonObject.element("description_cpo", f.getDescriptionCpo());
				jsonObject.element("souce_fund", f.getSouceFund());
				jsonObject.element("beneficiary", f.getBeneficiary());
				jsonObject.element("nrb_code", f.getNrbCode());
				jsonObject.element("invoice_number", f.getInvoiceNumber());
				if(f.getPaymentDate()!=null) {
					jsonObject.element("payment_date", DATE_FORMAT.format(f.getPaymentDate())); 
					jsonObject.element("payment_status", "true");
				}else {
					jsonObject.element("payment_date", "");
					jsonObject.element("payment_status", "false");
				}
				
				if(f.getMonth()!=null){
					if(lang.equals("al"))
						jsonObject.element("month", f.getMonth().getDOMTEXT());
					else if(lang.equals("sr"))
						jsonObject.element("month", f.getMonth().getDOMTEXT_SR());
					else
						jsonObject.element("month", f.getMonth().getDOMTEXT_EN());
				}
				
				if(f.getEmployee()!=null)
					jsonObject.element("created_by", f.getEmployee().getFirstName() + " " + f.getEmployee().getLastName());
				if(f.getCreatedTime()!=null)
					jsonObject.element("created_time", DATE_FORMAT.format(f.getCreatedTime()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.financialSalaryOutput", e);
			throw new BusinessException("FinanceGridAction.financialSalaryOutput", e);
		} finally {
			out.close();
		}
	}

	/**
	 * grid financialInput method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financialType() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			FinancialTypeDAO dao = DAOFactory.getFactory().getFinancialTypeDAO();
			String type=request.getParameter("type");
			String lang = getLocale().getLanguage();
			String name=request.getParameter("name");
			String countQuery = "select count(*) from tfin_type as f";
			String query="select * from tfin_type as f";
			if(StringUtils.isNotEmpty(name)){
				query+=" where f.name ilike '"+name+"%' ";
				countQuery+=" where f.name ilike '%"+name+"%' ";
			}
			
			if(StringUtils.isNotEmpty(type)){
				countQuery+=" where type='"+type+"'";
				query+=" where type='"+type+"'";
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				query += " order by " + getSidx() + " " + getSord();
			}
			query += " LIMIT " + limit + " offset " + start;
			List<FinancialType> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(FinancialType t:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", t.getId());
				jsonObject.element("name", t.getNameAl());
				jsonObject.element("name_sr", t.getNameSr());
				jsonObject.element("name_en", t.getNameEn());
				jsonObject.element("type", "al".equals(lang)?t.getType().getDOMTEXT():"en".equals(lang)?t.getType().getDOMTEXT_EN():t.getType().getDOMTEXT_SR());
				jsonObject.element("code", t.getCode());

				
				jsonObject.element("for_mun_alloc", t.getAllocation());
				jsonObject.element("description", t.getNotes());
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.financialType", e);
			throw new BusinessException("FinanceGridAction.financialType", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * grid contractors method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void contractors() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			ContractorDAO dao = DAOFactory.getFactory().getContractorDAO();
//			String comopany_name=request.getParameter("comopany_name");
			String countQuery = "select count(*) from tfin_contractor as fc";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String query="select * from tfin_contractor as fc";
//			if(StringUtils.isNotEmpty(comopany_name)){
//				query+=" where fc.comopany_name ilike '"+comopany_name+"%' ";
//				countQuery+=" where fc.comopany_name ilike '%"+comopany_name+"%' ";
//			}
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				query+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				query += " order by " + getSidx() + " " + getSord();
			}
			query += " LIMIT " + limit + " offset " + start;
			List<Contractor> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(Contractor c:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", c.getId());
				jsonObject.element("comopany_name", c.getComopanyName());
				jsonObject.element("fiscal_number", c.getFiscalNumber());
				jsonObject.element("business_number", c.getBusinessNumber());
				jsonObject.element("address", c.getAddress());
				jsonObject.element("contact_person", c.getContactPerson());
				jsonObject.element("phone", c.getPhone());
				jsonObject.element("e_mail", c.getEMail());
				jsonObject.element("note", c.getNote());
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.contractors", e);
			throw new BusinessException("FinanceGridAction.contractors", e);
		} finally {
			out.close();
		}
	}
	
	
	public void employeesalary() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			EmployeeSalaryDAO dao = DAOFactory.getFactory().getEmployeeSalaryDAO();
			
			String countQuery = "select count(*) from thrm_employee_salary as i left join thrm_employee as e on i.employee_id = e.id left join tperson as per on e.id=per.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String query="select i.*, e.* from thrm_employee_salary as i left join thrm_employee as e on i.employee_id = e.id left join tperson as per on e.id=per.id";
			
			String condition = getCondition();
//			System.out.println(condition);
			if(StringUtils.isNotEmpty(condition)){
				query+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				if(getSidx().equalsIgnoreCase("firstname")) {
					query += " order by per.first_name " + getSord();
				}else if(getSidx().equalsIgnoreCase("lastname")) { 
					query += " order by per.last_name " + getSord();
				}else {
					query += " order by " + getSidx() + " " + getSord();
				}
			}
			
			query += " LIMIT " + limit + " offset " + start;
			List<EmployeeSalary> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(EmployeeSalary c:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", c.getId());
				jsonObject.element("employee.person.firstName", c.getEmployee().getFirstName());
				jsonObject.element("employee.person.lastName", c.getEmployee().getLastName());
				jsonObject.element("employee.person.birthdate", DATE_FORMAT.format(c.getEmployee().getBirthdate()));
				jsonObject.element("basicsalary", c.getBasicsalary());
				jsonObject.element("grosssalary", c.getGrosssalary());
				jsonObject.element("payperiod", c.getPayperiod());
				jsonObject.element("autopay", c.isAutopay());
				jsonObject.element("createdBy", c.getCreatedBy().getFirstName() + " " + c.getCreatedBy().getLastName());
				jsonObject.element("createdDate", DATE_FORMAT.format(c.getCreatedDate()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.employeesalary", e);
			throw new BusinessException("FinanceGridAction.employeesalary", e);
		} finally {
			out.close();
		}
	}
	
	public void salarytaxrate() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			EmployeeSalaryTaxRatesDAO dao = DAOFactory.getFactory().getEmployeeSalaryTaxRatesDAO();
			
			String taxNormName = request.getParameter("taxNormName");
			String countQuery = "select count(*) from thrm_employee_salary_tax_rates as i";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String query="select * from thrm_employee_salary_tax_rates as i";
			if(StringUtils.isNotEmpty(taxNormName)){
				query+=" where i.tax_norm_name ilike '"+taxNormName+"%' ";
				countQuery+=" where fc.tax_norm_name ilike '%"+taxNormName+"%' ";
			}
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				query += " order by " + getSidx() + " " + getSord();
			}
			query += " LIMIT " + limit + " offset " + start;
			List<EmployeeSalaryTaxRates> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(EmployeeSalaryTaxRates c:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", c.getId());
				jsonObject.element("taxNormName", c.getTaxNormName());
				jsonObject.element("percent", c.getPercentage());
				jsonObject.element("startAmount", c.getStartAmount());
				jsonObject.element("endAmount", c.getEndAmount());
				jsonObject.element("validDateFrom", DATE_FORMAT.format(c.getValidDateFrom()));
				jsonObject.element("validDateTo", DATE_FORMAT.format(c.getValidDateTo()));
				jsonObject.element("valid", c.isValid());
				jsonObject.element("endAmount", c.getEndAmount());
				jsonObject.element("createdBy", c.getCreatedBy().getFirstName() + " " + c.getCreatedBy().getLastName());
				jsonObject.element("createdDate", DATE_FORMAT.format(c.getCreatedDate()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			log.error("FinanceGridAction.salarytaxrate", e);
			throw new BusinessException("FinanceGridAction.salarytaxrate", e);
		} finally {
			out.close();
		}
	}
	
	public void employeepayroll() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			EmployeeSalaryPayrollDAO dao = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO();
			
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");

			String countQuery = "select count(*) from  thrm_employee_salary_payroll as p left join thrm_employee_salary as s on p.employee_id = s.employee_id left join thrm_employee as e on e.id = s.employee_id left join tperson as per on e.id=per.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String query="select p.*, s.*, e.* from  thrm_employee_salary_payroll as p left join thrm_employee_salary as s on p.employee_id = s.employee_id left join thrm_employee as e on e.id = s.employee_id left join tperson as per on e.id=per.id";
			
//			if(StringUtils.isNotEmpty(firstName) && StringUtils.isNotEmpty(lastName)){
//				query+=" where per.first_name ilike '"+firstName+"%' and per.last_name ilike '" +lastName+ "%' ";
//				countQuery+=" where per.first_name ilike '"+firstName+"%' and per.last_name ilike '" +lastName+ "%' ";
//			}
			
			String condition = getCondition();
//			System.out.println(condition);
			if(StringUtils.isNotEmpty(condition)){
				query+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				if(getSidx().equalsIgnoreCase("firstname")) {
					query += " order by per.first_name " + getSord();
				}else if(getSidx().equalsIgnoreCase("lastname")) { 
					query += " order by per.last_name " + getSord();
				}else {
					query += " order by " + getSidx() + " " + getSord();
				}
			}
			

			
			query += " LIMIT " + limit + " offset " + start;
			
//			System.out.println(query);
			List<EmployeeSalaryPayroll> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(EmployeeSalaryPayroll c:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", c.getId());
				jsonObject.element("salaryId", c.getEmployeeSalary().getId());
				jsonObject.element("firstName", c.getEmployee().getFirstName());
				jsonObject.element("lastName", c.getEmployee().getLastName());
				jsonObject.element("birthdate", DATE_FORMAT.format(c.getEmployee().getBirthdate()));
				jsonObject.element("basicsalary", c.getEmployeeSalary().getBasicsalary());
				jsonObject.element("grosssalary", c.getEmployeeSalary().getGrosssalary());				
				jsonObject.element("payperiod", c.getEmployeeSalary().getPayperiod());
				jsonObject.element("fiscal_year", c.getFiscalYear());
				jsonObject.element("pay_month", c.getPayMonth());
				jsonObject.element("payroll_date", DATE_FORMAT.format(c.getPayrollDate()));
				jsonObject.element("start_date", DATE_FORMAT.format(c.getStartDate()));
				jsonObject.element("end_date", DATE_FORMAT.format(c.getEndDate()));
				jsonObject.element("taxpay", c.getTaxpay());
				jsonObject.element("grosspay", c.getGrosspay());
				jsonObject.element("grosspay", c.getGrosspay());
				jsonObject.element("netpay", c.getNetpay());
				jsonObject.element("status", c.getStatus());
				jsonObject.element("salaryyear", c.getSalaryyear());
				jsonObject.element("salarymonth", c.getSalarymonth());
				jsonObject.element("hoursworked", c.getHoursworked());

				jsonObject.element("createdBy", c.getCreatedBy().getFirstName() + " " + c.getCreatedBy().getLastName());
				jsonObject.element("createdDate", DATE_FORMAT.format(c.getCreatedDate()));				
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
			
		} catch (Exception e) {
			log.error("FinanceGridAction.employeepayroll", e);
			throw new BusinessException("FinanceGridAction.employeepayroll", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * grid contract method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void contract() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			ContractDAO dao = DAOFactory.getFactory().getContractDAO();
			String contract_name=request.getParameter("contract_name");
			String countQuery = "select count(*) from tfin_contract as c";
			String query="select distinct c.*,o.*,cc.* from tfin_contract c left join torganisation o on o.id=c.organisation_id left join tfin_contractor cc on cc.id= c.contractor_id";
			if(StringUtils.isNotEmpty(contract_name)){
				query+=" where c.contract_name ilike '"+contract_name+"%' ";
				countQuery+=" where c.contract_name ilike '%"+contract_name+"%' ";
			}
			
			String language = getLocale().getLanguage();
			
			String contractorId = request.getParameter("contractorId");
			if(StringUtils.isNotEmpty(contractorId)){
				query+=" where contractor_id="+contractorId;
				countQuery+=" where contractor_id="+contractorId;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("organisation")){
					ob_field = ("al".equals(language)?"o.orga_name":"en".equals(language)?"o.orga_name_en":"o.orga_name_sr");
				}else if(ob_field.equals("contractors")){
					ob_field="cc.comopany_name";
				}
			
				query += " order by " + ob_field + " " + getSord();
			}else query+=" order by id";
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			
			query += " LIMIT " + limit + " offset " + start;
			List<Contract> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(Contract c:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", c.getId());
				jsonObject.element("contract_name", c.getContractName());
				jsonObject.element("contract_number", c.getContractNumber());
				jsonObject.element("organisation", c.getOrganisation().getOrgaName()+"("+c.getOrganisation().getOperLevelVal()+")");
				jsonObject.element("organisation_id", c.getOrganisation().getId());
				jsonObject.element("contractors", c.getContractor().getComopanyName()+"("+c.getContractor().getFiscalNumber()+")");
				jsonObject.element("contract_costs", c.getContractCosts());
				Double balance = c.getContractCosts();
				for(PaymentPeriod p:c.getPaymentPeriods()){
					if(p.getPaymentPeriod()!=null && (p.getPaymentRealized()!=null && p.getPaymentRealized()==true))
						balance-=p.getPaymentPeriod();
				}
				jsonObject.element("balance", balance);

				if(c.getApprovedDate()!=null)
					jsonObject.element("approved_date", DATE_FORMAT.format(c.getApprovedDate()));
				if(c.getDateDueForStart()!=null)
					jsonObject.element("date_due_for_start", DATE_FORMAT.format(c.getDateDueForStart()));
				if(c.getDateDueForCompletion()!=null)
					jsonObject.element("date_due_for_completion", DATE_FORMAT.format(c.getDateDueForCompletion()));
				if(c.getNotificationDate()!=null)
					jsonObject.element("notification_date", DATE_FORMAT.format(c.getNotificationDate()));
				if(c.getDateCompleted()!=null)
					jsonObject.element("date_completed", DATE_FORMAT.format(c.getDateCompleted()));
				if(c.getDelayed()!=null)
					jsonObject.element("delayed", c.getDelayed());
				else
					jsonObject.element("delayed", "false");
				if(c.getNotificationDate()!=null)
					jsonObject.element("notify", checkContract(c.getNotificationDate())&&(c.getDateCompleted()==null));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.contractors", e);
			throw new BusinessException("FinanceGridAction.contractors", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Check @param notify if is equal or greater smaller than current day.
	 *
	 * @param notify the notify
	 * @return 1 if notify is greater than today, 0 if they are equal or -1 if notify is smaller than today
	 * return true if notify>=today
	 */
	public boolean checkContract(Date notify){
		Date today=new Date();
		String notifyDate=DATE_FORMAT.format(notify);
		String todayDate=DATE_FORMAT.format(today);
		try {
			Calendar c1=Calendar.getInstance();
			c1.setTime(DATE_FORMAT.parse(notifyDate));
			Calendar c2=Calendar.getInstance();
			c2.setTime(DATE_FORMAT.parse(todayDate));
			int diff = c1.compareTo(c2);
			if(diff>=0){
				return true;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		
		return false;
	}
	
	/**
	 * grid allocation method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void allocation() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			AnnuBudgetAllocationDAO dao=DAOFactory.getFactory().getAnnuBudgetAllocationDAO();
			String countQuery = "select count(*) from tfin_annu_budget_alloc ";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String language = getLocale().getLanguage();
			String query="select distinct a.*,o.* from tfin_annu_budget_alloc a left join torganisation o on o.id=a.municipality_id";
						
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				query+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("municipality")){
					ob_field = ("al".equals(language)?"o.orga_name":"en".equals(language)?"o.orga_name_en":"o.orga_name_sr");
				}else if(ob_field.equals("department")){
					ob_field="o.parent_id";
				}
			
				query += " order by " + ob_field + " " + getSord();
			}
			query += " LIMIT " + limit + " offset " + start;
			List<AnnualBudgetAllocation> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(AnnualBudgetAllocation c:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", c.getId());
				jsonObject.element("wood_sales",  DECIMAL_FORMAT.format(c.getWoodSales()));
				jsonObject.element("other_income",  DECIMAL_FORMAT.format(c.getOtherIncome()));
				jsonObject.element("total", c.getTotal());
				jsonObject.element("year", c.getYear());
				jsonObject.element("allocation_36", DECIMAL_FORMAT.format(c.getAllocation36()));
				jsonObject.element("municipality_30_portion",  DECIMAL_FORMAT.format(c.getMunicipality30Portion()));
				jsonObject.element("municipality", getOganisationData(c.getOrganisation(), language));
				jsonObject.element("month", ("al".equals(language)?c.getMonth().getDOMTEXT():"en".equals(language)?c.getMonth().getDOMTEXT_EN():c.getMonth().getDOMTEXT_SR()));
				if(c.getOrganisation()!=null && c.getOrganisation().getParty()!=null){
					Long departmentId=c.getOrganisation().getParty().getId();
					Organisation department=DAOFactory.getFactory().getOrganisationDAO().get(departmentId);
					if(department!=null)
						jsonObject.element("department",department.getOrgaName());
				}
				jsonObject.element("kfa_remainder",  DECIMAL_FORMAT.format(c.getKfaRemainder()));
				if(c.getEmployee()!=null)
					jsonObject.element("created_by", c.getEmployee().getFirstName() + " " + c.getEmployee().getLastName());
				if(c.getCreatedTime()!=null)
					jsonObject.element("created_time", DATE_FORMAT.format(c.getCreatedTime()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.allocation", e);
			throw new BusinessException("FinanceGridAction.allocation", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * grid paymentPeriod method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void paymentPeriod() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String contractId=request.getParameter("contractId");
			
			PaymentPeriodDAO dao = DAOFactory.getFactory().getPaymentPeriodDAO();
			
			String countQuery = "select count(*) from tfin_payment_period";
			String query="select * from tfin_payment_period";
			
			if(StringUtils.isNotEmpty(contractId)){
				countQuery+= " where contract_id="+contractId;
				query+= " where contract_id="+contractId;
			}
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				query += " order by " + getSidx() + " " + getSord();
			}else query+= " order by id";
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			query += " LIMIT " + limit + " offset " + start;

			List<PaymentPeriod> list = dao.executeSQLQuery(query);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRecords());
			
			JSONArray rows = new JSONArray();
			for(PaymentPeriod p:list){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", p.getId());
				jsonObject.element("contract_id", p.getContract().getId());
				if(p.getStartDate()!=null)
					jsonObject.element("start_date", DATE_FORMAT.format(p.getStartDate()));
				if(p.getCompletionDate()!=null)
					jsonObject.element("completion_date", DATE_FORMAT.format(p.getCompletionDate()));
				jsonObject.element("payment_period", p.getPaymentPeriod());
				jsonObject.element("payment_balance", p.getPaymentBalance());
				jsonObject.element("payment_realized", p.getPaymentRealized());
				if(p.getCreatedTime()!=null)
					jsonObject.element("created_time", DATE_FORMAT.format(p.getCreatedTime()));
				if(p.getEmployee()!=null)
					jsonObject.element("created_by", p.getEmployee().getFirstName()+" "+p.getEmployee().getLastName());
				rows.add(jsonObject);
			}
				
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("FinanceGridAction.paymentPeriod", e);
			throw new BusinessException("FinanceGridAction.paymentPeriod", e);
		} finally {
			out.close();
		}
	}
	
		/**
		 * grid budgetMainntenance method.
		 *
		 * @throws IOException Signals that an I/O exception has occurred.
		 * @throws BusinessException the business exception
		 */
		public void budgetMainntenance() throws IOException, BusinessException {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();

			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			try {
				BudgetMainntenanceDAO dao = DAOFactory.getFactory().getBudgetMainntenanceDAO();
//				String fin_type=request.getParameter("fin_type");
				String lang = getLocale().getLanguage();
				String countQuery = "SELECT COUNT(*) FROM tfin_budget_mainntenance as b left join tfin_type t on t.id=b.fin_type_id";
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				String query="SELECT b.*,t.* FROM tfin_budget_mainntenance b left join tfin_type t on t.id=b.fin_type_id";
				/*
				if(StringUtils.isNotEmpty(fin_type)){
					query+=" where t.name ilike  '"+fin_type+"%' ";
					countQuery+=" where t.name ilike  '%"+fin_type+"%' ";
				}
				*/
				
				String condition = getCondition();
				if(StringUtils.isNotEmpty(condition)){
					query+= " where " + condition;
					countQuery+= " where " + condition;
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("fin_type")){
						ob_field = ("al".equals(lang)?"t.name":"en".equals(lang)?"t.name_en":"t.name_sr");
					}
					query += " order by " + ob_field + " " + getSord();
				}
				query+=" LIMIT " + limit + " offset " + start;
				List<BudgetMainntenance> list = dao.executeSQLQuery(query);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRecords());
				
				JSONArray rows = new JSONArray();
				for(BudgetMainntenance b:list){
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", b.getId());
					if(b.getEmployee()!=null)
						jsonObject.element("created_by", b.getEmployee().getFirstName()+" "+b.getEmployee().getLastName());
					jsonObject.element("fin_type", "al".equals(lang)?b.getFinancialType().getNameAl():"en".equals(lang)?b.getFinancialType().getNameEn():b.getFinancialType().getNameSr());
					jsonObject.element("fin_type_id", b.getFinancialType().getId());
					jsonObject.element("budget_code", b.getBudgetCode());
					jsonObject.element("budget_year", b.getBudgetYear());
					jsonObject.element("initial_annual_budget", b.getInitialAnnualBudget());
					jsonObject.element("annual_allocation", b.getAnnualAllocation());
					jsonObject.element("current_expenditure", b.getCurrentExpenditure());
					jsonObject.element("commitment", b.getCommitment());
					jsonObject.element("available_balance", b.getAvailableBalance());
					jsonObject.element("buget_utilization_in_percent", b.getBugetUtilizationInPercent()+" %");
					if(b.getCreatedDate()!=null)
						jsonObject.element("created_date", DATE_FORMAT.format(b.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			} catch (Exception e) {
				log.error("FinanceGridAction.budgetMainntenance", e);
				throw new BusinessException("FinanceGridAction.budgetMainntenance", e);
			} finally {
				out.close();
			}
		}
		
		/**
		 * Contract documents.
		 *
		 * @throws IOException Signals that an I/O exception has occurred.
		 * @throws BusinessException the business exception
		 */
		public void contractDocuments() throws IOException,BusinessException{
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			HttpServletRequest request=ServletActionContext.getRequest();
			try {
				
				ContractDocDAO dao=DAOFactory.getFactory().getContractDocDAO();
				String countQuery="select count(*) from tfin_contract_doc doc";
				String sqlQuery="select * from tfin_contract_doc doc";
				String contract_id=request.getParameter("contract_id");
				if(StringUtils.isNotEmpty(contract_id)){
					countQuery+=" where doc.contract_id="+contract_id;
					sqlQuery+=" where doc.contract_id="+contract_id;
				}
				
				Integer count=dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<ContractDoc> list=dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRecords());
				
				JSONArray rows=new JSONArray();
				for(ContractDoc d:list){
					JSONObject jo=new JSONObject();
					jo.element("id", d.getId());
					jo.element("contract_id", d.getContract().getId());
					jo.element("doc_name", d.getDocName());
					jo.element("created_by", d.getEmployee().getFirstName()+" "+d.getEmployee().getLastName());
					if(d.getCreatedDate()!=null)
						jo.element("created_date", DATE_FORMAT.format(d.getCreatedDate()));
					rows.add(jo);
					
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			} catch (Exception e) {
				log.error("FinanceGridAction.contractDocuments",e);
				throw new BusinessException("FinanceGridAction.contractDocuments",e);
			}finally{
				out.close();
			}
		}
		
		/**
		 * grid financialInputStatus method.
		 *
		 * @throws IOException Signals that an I/O exception has occurred.
		 * @throws BusinessException the business exception
		 */
		public void financialInputStatus() throws IOException, BusinessException {
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpServletRequest request=ServletActionContext.getRequest();

			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			try {
				
				String finInput_id = request.getParameter("finInput_id");
				if(StringUtils.isNotEmpty(finInput_id)){
					String lang=getLocale().getLanguage();
					FinInputStatusDAO dao = DAOFactory.getFactory().getFinInputStatusDAO();
					String countQuery = "select count(*) from tfin_input_status where input_id="+finInput_id;
					Integer count = dao.countQuery(countQuery);
					calcPages(count);
					
					String query="select distinct s.* from tfin_input_status s where s.input_id="+finInput_id;
					
					if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
						String ob_field=getSidx();
						query += " order by " + ob_field + " " + getSord();
					}
					query += " LIMIT " + limit + " offset " + start;
					List<FinInputStatus> list = dao.executeSQLQuery(query);
					
					JSONObject data = new JSONObject();
					data.element("page", getPage());
					data.element("total", getTotal_pages());
					data.element("records", getRecords());
					
					JSONArray rows = new JSONArray();
					for(FinInputStatus f:list){
						JSONObject jo = new JSONObject();
						jo.element("id", f.getId());
						jo.element("status", "al".equals(lang)?f.getStatus().getDOMTEXT():"en".equals(lang)?f.getStatus().getDOMTEXT_EN():f.getStatus().getDOMTEXT_SR());
						jo.element("note", f.getNote());
						jo.element("doc_type", f.getDocType()!=null?f.getDocType():"");
						jo.element("doc_name", f.getDocName()!=null?f.getDocName():"");
						jo.element("created_by", getPersonData(f.getEmployee()));
						jo.element("create_date",fdate(f.getCreateDate()));
						
						rows.add(jo);
					}
					
					data.element("rows", rows);
					out.append(data.toString());
				}else setEmtpyContent(out);
				out.flush();
			} catch (Exception e) {
				log.error("FinanceGridAction.financialInputStatus", e);
				throw new BusinessException("FinanceGridAction.financialInputStatus", e);
			} finally {
				out.close();
			}
		}
}
