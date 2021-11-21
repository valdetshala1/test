package com.geoland.kfis.web.action.hrm.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.crypto.spec.SecretKeySpec;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.AttendanceRecord;
import com.geoland.kfis.model.Decision;
import com.geoland.kfis.model.DecisionDoc;
import com.geoland.kfis.model.DecisionStatus;
import com.geoland.kfis.model.DecisionType;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.HrmAnnualPlan;
import com.geoland.kfis.model.HrmAnnualPlanDoc;
import com.geoland.kfis.model.HrmAnnualPlanStatus;
import com.geoland.kfis.model.Leave;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.model.OfficalTravel;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AttendanceRecordDAO;
import com.geoland.kfis.persistence.dao.services.DecisionDAO;
import com.geoland.kfis.persistence.dao.services.DecisionDocDAO;
import com.geoland.kfis.persistence.dao.services.DecisionStatusDAO;
import com.geoland.kfis.persistence.dao.services.DecisionTypeDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeDAO;
import com.geoland.kfis.persistence.dao.services.HrmAnnualPlanDAO;
import com.geoland.kfis.persistence.dao.services.HrmAnnualPlanDocDAO;
import com.geoland.kfis.persistence.dao.services.HrmAnnualPlanStatusDAO;
import com.geoland.kfis.persistence.dao.services.LeaveDAO;
import com.geoland.kfis.persistence.dao.services.LeaveEntitlementDAO;
import com.geoland.kfis.persistence.dao.services.LeaveTypeDAO;
import com.geoland.kfis.persistence.dao.services.OfficialTravelDAO;
import com.geoland.kfis.persistence.dao.services.PersonDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmannplanstatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmdecisionstatus;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

// TODO: Auto-generated Javadoc
/**
 * Human Resource Management Grid Action Class Provides data in JSON format.
 *
 * @author GEO&LAND
 * @created April 21, 2014 3:44:20 PM
 * @Version 1.0
 */
public class HrmGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * GIRD JSON - leave method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void leave() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			LeaveDAO dao = DAOFactory.getFactory().getLeaveDAO();
			String countQuery = "select distinct count(*) from thrm_leave l left join tperson p on l.employee_id=p.id left join thrm_leave_type t on l.leave_type_id=t.id ";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String language = getLocale().getLanguage().toLowerCase();
			String sqlQuery = "select distinct l.*,p.*,t.* from thrm_leave as l left join tperson p on l.employee_id=p.id left join thrm_leave_type t on l.leave_type_id=t.id ";

			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("employee")){
					ob_field = "p.first_name";
				}else if(ob_field.equals("leave_type")){
					ob_field = ("al".equals(language)?"t.name":"en".equals(language)?"t.name_en":"t.name_sr");
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<Leave> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (Leave o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("employee", o.getEmployee().getFirstName()
						+ " " + o.getEmployee().getLastName());
				
				jsonObject.element("first_name",  o.getEmployee().getFirstName());
				jsonObject.element("last_name", o.getEmployee().getLastName());
				
				if("al".equals(language)) {
					jsonObject.element("leave_type", o.getLeaveType().getName());
					jsonObject.element("status", o.getStatus().getDOMTEXT().toUpperCase());
				}
				else if("en".equals(language)) {
					jsonObject.element("leave_type", o.getLeaveType().getNameEn());
					jsonObject.element("status", o.getStatus().getDOMTEXT_EN().toUpperCase());
				}
				else if("sr".equals(language)) {
					jsonObject.element("leave_type", o.getLeaveType().getNameSr());
					jsonObject.element("status", o.getStatus().getDOMTEXT_SR().toUpperCase());
				}
				jsonObject.element("from_date",
						DATE_FORMAT.format(o.getFromDate()));
				jsonObject
						.element("to_date", DATE_FORMAT.format(o.getToDate()));
				jsonObject.element("days_requested", o.getDaysRequested());
//				jsonObject.element("status", o.getStatus());
				if(o.getDoc()!=null)
					jsonObject.element("doc", "true");
				else jsonObject.element("doc", "false");
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.leave", e);
			throw new BusinessException("HrmGridAction.leave", e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - employee method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void employee() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			EmployeeDAO dao = DAOFactory.getFactory().getEmployeeDAO();

			
			String countQuery = "select distinct count(*) from thrm_employee as e left join tperson as p on e.id = p.id left join tparty as y on p.id = y.id";
			String sqlQuery = "select distinct o.orga_name,e.*, p.*, y.* from thrm_employee as e left join tperson as p on e.id = p.id left join tparty as y on p.id = y.id left join torganisation o on o.id=e.organisation_id ";
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}

			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("first_name")){
					ob_field = "p.first_name";
				}else if(ob_field.equals("last_name")){
					ob_field = "p.last_name";
				}else if(ob_field.equals("birthdate")){
					ob_field="p.birthdate";
				}else if(ob_field.equals("personal_id")){
					ob_field="p.personal_id";
				}else if(ob_field.equals("ssn_num")){
					ob_field="e.emp_ssn_num";
				}else if(ob_field.equals("location")){
					ob_field="o.orga_name";
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<Employee> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());


			// picture, name, title, Hier date, work email, work phone, contract
			// type / Employment status
			JSONArray rows = new JSONArray();
			for (Employee o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("first_name", o.getFirstName());
				jsonObject.element("last_name", o.getLastName());
				jsonObject.element("supervisor", o.getPerson().getFirstName()+" "+o.getPerson().getLastName());
				if(o.getBirthdate()!=null)
				jsonObject.element("birthdate",
						DATE_FORMAT.format(o.getBirthdate()));
				jsonObject.element("gender", o.getGender());
				jsonObject.element("personal_id", o.getPersonalId());
				jsonObject.element("location", getOganisationData(o.getOrganisation(),lang));
				if(lang.equals("al"))
					jsonObject.element("job_title", o.getJobTitle().getDOMTEXT());
				else if(lang.equals("sr"))
					jsonObject.element("job_title", o.getJobTitle().getDOMTEXT_SR());
				else
					jsonObject.element("job_title", o.getJobTitle().getDOMTEXT_EN());
				
				
				if(lang.equals("al"))
					jsonObject.element("ethnicity", o.getEthnicity().getDOMTEXT());
				else if(lang.equals("sr"))
					jsonObject.element("ethnicity", o.getEthnicity().getDOMTEXT_SR());
				else
					jsonObject.element("ethnicity", o.getEthnicity().getDOMTEXT_EN());
				
				jsonObject.element("functional_title", o.getFunctionalTitle());
				if(lang.equals("al"))
					jsonObject.element("conctract_type", o.getConctractType().getDOMTEXT());
				else if(lang.equals("sr"))
					jsonObject.element("conctract_type", o.getConctractType().getDOMTEXT_SR());
				else
					jsonObject.element("conctract_type", o.getConctractType().getDOMTEXT_EN());
				if(o.getDateFrom()!=null)
				jsonObject.element("from_date",	DATE_FORMAT.format(o.getDateFrom()));
				else 
					jsonObject.element("from_date",	"");	
				
				if(o.getDateTo()!=null)
				jsonObject.element("date_to",DATE_FORMAT.format(o.getDateTo()));
				else 
					jsonObject.element("date_to","");
				jsonObject.element("ssn_num", o.getEmpSsnNum());
				jsonObject.element("note", o.getNotes());
				jsonObject.element("active", o.getActive());
				jsonObject.element("persWithLmtAbilities", o.isPersWithLmtAbilities());
				jsonObject.element("created_by", o.getPerson().getFirstName()+" "+o.getPerson().getLastName());
				jsonObject.element("created_date",DATE_FORMAT.format(o.getCreatedDate()));
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.employee", e);
			throw new BusinessException("HrmGridAction.employee", e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - persons method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void persons() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String role = request.getParameter("role");
			if (StringUtils.isNotEmpty(role)) {
				PersonDAO dao = DAOFactory.getFactory().getPersonDAO();

				String countQuery = "select count(*) from tperson as p left join tnatpers as n on p.id=n.id left join tperson_role as pr on p.id = pr.person_id where pr.role_code = '"
						+ role + "'";
				String sqlQuery = "select p.*,n.* from tperson as p left join tnatpers as n on p.id=n.id left join tperson_role as pr on p.id = pr.person_id where pr.role_code = '"
						+ role + "'";
				
				String condition = getCondition();
				if(StringUtils.isNotEmpty(condition)){
					sqlQuery+= " and " + condition;
					countQuery+= " and " + condition;
				}
				
//				if (StringUtils.isNotEmpty(filter)) {
//					countQuery += " " + filter;
//				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<Person> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (Person o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("firstName", o.getFirstName());
					jsonObject.element("lastName", o.getLastName());
					jsonObject.element("birthdate",
							DATE_FORMAT.format(o.getBirthdate()));
					jsonObject.element("gender", o.getGender());
					jsonObject.element("personalId", o.getPersonalId());
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			} else {
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("HrmGridAction.persons", e);
			throw new BusinessException("HrmGridAction.persons", e);
		} finally {
			out.close();
		}
	}

	/**
	 * GIRD JSON - officialTravel method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void officialTravel() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();

		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			OfficialTravelDAO dao = DAOFactory.getFactory().getOfficialTravelDAO();
			String countQuery = "select count(*) from thrm_offical_travel as ot left join tperson p on ot.employee_id=p.id";
			String sqlQuery = "select ot.* from thrm_offical_travel as ot left join tperson p on ot.employee_id=p.id";
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("employee_id")){
					ob_field = "p.first_name";
				}else if(ob_field.equals("date")){
					ob_field = "ot.from_date";
				}else if(ob_field.equals("from_to")){
					ob_field = "ot.from_destination";
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			if (StringUtils.isNotEmpty(filter)) {
				countQuery += " " + filter;
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			List<OfficalTravel> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (OfficalTravel ot : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", ot.getId());
				jsonObject.element("employee_id", ot.getEmployee()
						.getFirstName() + " " + ot.getEmployee().getLastName());
				
				jsonObject.element("first_name", ot.getEmployee().getFirstName());
				jsonObject.element("last_name", ot.getEmployee().getLastName());
				
				if(lang.equals("al"))
					jsonObject.element("travel_type", ot.getTravelType().getDOMTEXT());
				else if(lang.equals("sr"))
					jsonObject.element("travel_type", ot.getTravelType().getDOMTEXT_SR());
				else
					jsonObject.element("travel_type", ot.getTravelType().getDOMTEXT_EN());
				jsonObject.element("reimbursement_expenses",
						ot.isReimbursementExpenses());
				jsonObject.element("date", DATE_FORMAT.format(ot.getFromDate())
						+ "-" + DATE_FORMAT.format(ot.getToDate()));
				jsonObject.element("from_to", ot.getFromDestination() + "-"
						+ ot.getToDestination());
				jsonObject.element("reason", ot.getReason());
				jsonObject.element("days_requested", ot.getDaysRequested());
				jsonObject.element("status", ot.getStatus());
				jsonObject.element("requested_user_id",
						ot.getPartyByRequestedUserId().getId());
				jsonObject.element("requested_date",
						DATE_FORMAT.format(ot.getRequestedDate()));
				jsonObject.element("requested_comments",
						ot.getRequestedComments());
				jsonObject.element("days_approved", ot.getDaysApproved());
				if (ot.getPartyByApprovedUserId() != null) {
					jsonObject.element("approved_user_id", ot
							.getPartyByApprovedUserId().getId());
				} else {
					jsonObject.element("approved_user_id", "");
				}
				if (ot.getApprovedDate() != null) {
					jsonObject.element("approved_date",
							DATE_FORMAT.format(ot.getApprovedDate()) + "");
				} else {
					jsonObject.element("approved_date", "");
				}
				jsonObject.element("approved_comments",
						ot.getApprovedComments());
				if (ot.getReturnDate() != null) {
					jsonObject.element("return_date",
							DATE_FORMAT.format(ot.getReturnDate()) + "");
				} else {
					jsonObject.element("return_date", "");
				}
				jsonObject.element("days_spent", ot.getDaysSpent());
				jsonObject.element("attachment_name", ot.getDocName());
				jsonObject.element("attachment", ot.getDocType());
				if(ot.getDoc()!=null)
					jsonObject.element("doc", "true");
				else jsonObject.element("doc", "false");
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.officialTravel", e);
			throw new BusinessException("HrmGridAction.officialTravel", e);
		} finally {
			out.close();
		}
	}

	/**
	 * GIRD JSON - leaveType method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void leaveType() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			LeaveTypeDAO dao = DAOFactory.getFactory().getLeaveTypeDAO();
			String countQuery = "select count(*) from thrm_leave_type";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select * from thrm_leave_type";
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<LeaveType> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			// picture, name, title, Hier date, work email, work phone, contract
			// type / Employment status
			JSONArray rows = new JSONArray();
			for (LeaveType o : list) {
				if(o.getDeleted()==0){
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("nameEn", o.getNameEn());
				jsonObject.element("nameSr", o.getNameSr());
				jsonObject.element("code", o.getCode());
				jsonObject.element("bgColor", o.getBgColor());
				jsonObject.element("ispaid", o.getIspaid());
				jsonObject.element("isawol", o.getIsawol());
				jsonObject.element("isannual", o.getIsannual());
//				jsonObject.element("deleted", o.getDeleted());
				jsonObject.element("excludeInReportsIfNoEntitlement",
						o.getExcludeInReportsIfNoEntitlement());
				jsonObject.element("operationalCountryId",
						o.getOperationalCountryId());

				rows.add(jsonObject);
				}
			}

			data.element("rows", rows);

			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("GridAction.leaveType", e);
			throw new BusinessException("GridAction.leaveType", e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - attendanceRecord method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void attendanceRecord() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			AttendanceRecordDAO dao = DAOFactory.getFactory()
					.getAttendanceRecordDAO();
//			Long p= getUser().getUser().getId();
			String lang = getLocale().getLanguage();
			Person supervisor = getUser().getPerson();
//			String countQuery = "select count(*) from thrm_attendance_record a left join tparty_user p on a.employee_id=p.party_id where p.user_id="+p;
			String countQuery = "select count(a.*) from thrm_attendance_record a left join  thrm_employee e on e.id=a.employee_id " +
					" where e.person_id =any (get_all_children_employee("+supervisor.getId()+")) or e.id="+supervisor.getId();
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String sqlQuery = "select distinct a.*,p.first_name from thrm_attendance_record a left join  thrm_employee e on e.id=a.employee_id "+
					" left join tperson p on p.id=e.id "+
					" where (e.person_id =any (get_all_children_employee("+supervisor.getId()+")) or e.id="+supervisor.getId()+")";
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " and " + condition;
				countQuery+= " and " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("supervisor_user_id")){
					ob_field = "p.first_name";
				}else if(ob_field.equals("supervisor_id")){
					ob_field = "p.first_name";
				}else if(ob_field.equals("employee_id")){
					ob_field = "p.first_name";
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<AttendanceRecord> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			// picture, name, title, Hier date, work email, work phone, contract
			// type / Employment status
			JSONArray rows = new JSONArray();
			for (AttendanceRecord o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("employee_id", o.getEmployee()
						.getFirstName()+" "+o.getEmployee().getLastName());

				jsonObject.element("first_name", o.getEmployee().getFirstName());
				jsonObject.element("last_name", o.getEmployee().getLastName());
				
				jsonObject.element("supervisor_id", o.getEmployee().getPerson().getId());
				if (o.getPunchInUtcTime() != null) {
					jsonObject.element("punch_in_utc_time",
							TIMESTAMP_FORMAT.format(o.getPunchInUtcTime()));
				} else {
					jsonObject.element("punch_in_utc_time", "");
				}
				if (o.getPunchInUserTime() != null) {
					jsonObject.element("punch_in_user_time",
							TIMESTAMP_FORMAT.format(o.getPunchInUserTime()));
				} else {
					jsonObject.element("punch_in_user_time", "");
				}
				jsonObject.element("punch_in_note", removeLineBreak(o.getPunchInNote()));
				if (o.getPunchOutUtcTime() != null) {
					jsonObject.element("punch_out_utc_time",
							TIMESTAMP_FORMAT.format(o.getPunchOutUtcTime()));
				} else {
					jsonObject.element("punch_out_utc_time", "");
				}
				jsonObject.element("punch_out_note", removeLineBreak(o.getPunchOutNote()));
				if (o.getPunchOutUserTime() != null) {
					jsonObject.element("punch_out_user_time",
							TIMESTAMP_FORMAT.format(o.getPunchOutUserTime()));
				} else {
					jsonObject.element("punch_out_user_time", "");
				}
				jsonObject.element("status", "en".equals(lang)?o.getStatus().getDOMTEXT_EN():"sr".equals(lang)?o.getStatus().getDOMTEXT_SR():o.getStatus().getDOMTEXT());
				if (o.getSupervisorDate() != null) {
					jsonObject.element("supervisor_date",
							TIMESTAMP_FORMAT.format(o.getSupervisorDate()));
				} else {
					jsonObject.element("supervisor_date", "");
				}
				if (o.getEmployee()!=null && o.getEmployee().getPerson() != null) {
					jsonObject.element("supervisor_user_id", o.getEmployee().getPerson().getFirstName()+" "+o.getEmployee().getPerson().getLastName());
				} else {
					jsonObject.element("supervisor_user_id", "");
				}
				jsonObject.element("note", removeLineBreak(o.getNote()));
				rows.add(jsonObject);
			}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.attendanceRecord", e);
			throw new BusinessException("HrmGridAction.attendanceRecord", e);
		} finally {
			out.close();
		}

	}
	
	/**
	 * GIRD JSON - officialTravel method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void leaveEntitlement() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		String lang = getLocale().getLanguage().toLowerCase();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			LeaveEntitlementDAO dao = DAOFactory.getFactory().getLeaveEntitlementDAO();
			String countQuery = "select distinct count(l.*) from thrm_leave_entitlement l left join tperson p on l.employee_id=p.id left join thrm_leave_type t on l.leave_type_id=t.id ";
			String sqlQuery = "select distinct l.*,p.*,t.* from thrm_leave_entitlement l left join tperson p on l.employee_id=p.id left join thrm_leave_type t on l.leave_type_id=t.id ";
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("employee_id")){
					ob_field = "p.first_name";
				}else if(ob_field.equals("leave_type_id")){
					ob_field = ("al".equals(lang)?"t.name":"en".equals(lang)?"t.name_en":"t.name_sr");
				}
			
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<LeaveEntitlement> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (LeaveEntitlement ot : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", ot.getId());
				jsonObject.element("employee_id", ot.getEmployee()
						.getFirstName() + " " + ot.getEmployee().getLastName());
				jsonObject.element("first_name",  ot.getEmployee().getFirstName());
				jsonObject.element("last_name", ot.getEmployee().getLastName());	
				
				if(lang.equals("al"))
					jsonObject.element("leave_type_id", ot.getLeaveType().getName());
				else if(lang.equals("sr"))
					jsonObject.element("leave_type_id", ot.getLeaveType().getNameSr());
				else
					jsonObject.element("leave_type_id", ot.getLeaveType().getNameEn());
				jsonObject.element("no_of_days",
						ot.getNoOfDays());
				jsonObject.element("days_used", ot.getDaysUsed());
				jsonObject.element("date", ot.getFromDate()+"/"+ot.getToDate());
				jsonObject.element("note", ot.getNote());

				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.leaveEntitlement", e);
			throw new BusinessException("HrmGridAction.leaveEntitlement", e);
		} finally {
			out.close();
		}
	}
	
	
	
	/**
	 * GIRD JSON - annualPlan method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualPlan() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			HrmAnnualPlanDAO dao = DAOFactory.getFactory().getHrmAnnualPlanDAO();
			String countQuery = "select distinct count(a.*) from thrm_annual_plan a left join thrm_annual_plan_status s on a.current_status=s.id ";
			String sqlQuery = "select distinct a.*,s.* from thrm_annual_plan a left join thrm_annual_plan_status s on a.current_status=s.id"; 
	
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("current_status")){
					ob_field = "s.status";
				}
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<HrmAnnualPlan> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (HrmAnnualPlan a : list) {
				JSONObject jo = new JSONObject();
				jo.element("id", a.getId());
				jo.element("annual_plan_al", a.getAnnualPlanAl());
				jo.element("annual_plan_en", a.getAnnualPlanEn());
				jo.element("annual_plan_sr", a.getAnnualPlanSr());
				jo.element("submission_date", fdate(a.getSubmissionDate()));
				String pl_status = "";
				if(a.getHrmAnnualPlanStatus()!=null && a.getHrmAnnualPlanStatus().getId()!=null){
					Hrmannplanstatus st = a.getHrmAnnualPlanStatus().getStatus();
					pl_status=("al".equals(lang)?st.getDOMTEXT():"en".equals(lang)?st.getDOMTEXT():st.getDOMTEXT_SR());
				}
				jo.element("current_status", pl_status);
				jo.element("comment", a.getComment());
				
				rows.add(jo);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.annualPlan", e);
			throw new BusinessException("HrmGridAction.annualPlan", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * GIRD JSON - annualPlan method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualPlanStatus() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			
			HttpServletRequest request = ServletActionContext.getRequest();
			String plan_id = request.getParameter("plan_id");
			if(StringUtils.isNotEmpty(plan_id) && StringUtils.isNumeric(plan_id)){
				HrmAnnualPlanStatusDAO dao = DAOFactory.getFactory().getHrmAnnualPlanStatusDAO();
				String countQuery = "select count(s.*) from thrm_annual_plan_status s where s.annual_plan_id="+plan_id;
				String sqlQuery = "select distinct s.* from thrm_annual_plan_status s where s.annual_plan_id="+plan_id;
	
				String condition = getCondition();
				if(StringUtils.isNotEmpty(condition)){
					sqlQuery+= " and " + condition;
					countQuery+= " and " + condition;
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<HrmAnnualPlanStatus> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (HrmAnnualPlanStatus a : list) {
					JSONObject jo = new JSONObject();
					jo.element("id", a.getId());
					jo.element("annual_plan_id", a.getHrmAnnualPlan().getId());
					jo.element("status", "al".equals(lang)?a.getStatus().getDOMTEXT():"en".equals(lang)?a.getStatus().getDOMTEXT_EN():a.getStatus().getDOMTEXT_SR());
					jo.element("note", a.getNote());
					jo.element("create_by", getPersonData(a.getEmployee()));
					jo.element("create_date", fdate(a.getCreateDate()));
					
					rows.add(jo);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.annualPlanStatus", e);
			throw new BusinessException("HrmGridAction.annualPlanStatus", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * GIRD JSON - annualPlan method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void annualPlanDoc() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			
			HttpServletRequest request = ServletActionContext.getRequest();
			String plan_id = request.getParameter("plan_id");
			if(StringUtils.isNotEmpty(plan_id) && StringUtils.isNumeric(plan_id)){
				HrmAnnualPlanDocDAO dao = DAOFactory.getFactory().getHrmAnnualPlanDocDAO();
				String countQuery = "select count(s.*) from thrm_annual_plan_doc s where s.annual_plan_id="+plan_id;
				String sqlQuery = "select distinct s.* from thrm_annual_plan_doc s where s.annual_plan_id="+plan_id;
				
				String condition = getCondition();
				if(StringUtils.isNotEmpty(condition)){
					sqlQuery+= " and " + condition;
					countQuery+= " and " + condition;
				}
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();

					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<HrmAnnualPlanDoc> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (HrmAnnualPlanDoc a : list) {
					JSONObject jo = new JSONObject();
					jo.element("id", a.getId());
					jo.element("annual_plan_id", a.getHrmAnnualPlan().getId());
					jo.element("status_name", "al".equals(lang)?a.getStatusName().getDOMTEXT():"en".equals(lang)?a.getStatusName().getDOMTEXT_EN():a.getStatusName().getDOMTEXT_SR());
					jo.element("doc_type", a.getDocType());
					jo.element("doc_name", a.getDocName());
					jo.element("doc_size", a.getDocSize());
					jo.element("note", a.getNote());
					jo.element("created_by", getPersonData(a.getEmployee()));
					jo.element("created_date", fdate(a.getCreatedDate()));
					
					rows.add(jo);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.annualPlanDoc", e);
			throw new BusinessException("HrmGridAction.annualPlanDoc", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * GIRD JSON - decisionType method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void decisionType() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();

		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
				DecisionTypeDAO dao = DAOFactory.getFactory().getDecisionTypeDAO();

				String countQuery = "select count(*) from THRM_DECISION_TYPE as p ";
				if (StringUtils.isNotEmpty(filter)) {
					countQuery += " " + filter;
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select p.* from THRM_DECISION_TYPE p";
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DecisionType> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (DecisionType o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name_al", o.getNameAl());
					jsonObject.element("name_en", o.getNameEn());
					jsonObject.element("name_sr", o.getNameSr());
					jsonObject.element("note", o.getNote());
					jsonObject.element("created_date", DATE_FORMAT.format(o.getCreatedDate()));
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.decisionType", e);
			throw new BusinessException("HrmGridAction.decisionType", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * GIRD JSON - decision method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	
	public void decision() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			DecisionDAO dao = DAOFactory.getFactory().getDecisionDAO();
//			HttpServletRequest request = ServletActionContext.getRequest();
			String countQuery = "select distinct count(a.*) from THRM_DECISION a left join THRM_DECISION_STATUS s on a.current_status=s.id ";
			if (StringUtils.isNotEmpty(filter)) {
				countQuery += " " + filter;
			}
			
			String sqlQuery = "select distinct a.*,s.* from THRM_DECISION a left join THRM_DECISION_STATUS s on a.current_status=s.id"; 
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("current_status")){
					ob_field = "s.status";
				}
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<Decision> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (Decision a : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", a.getId());
				String d_status = "";
				if(a.getDecisionStatus()!=null && a.getDecisionStatus().getId()!=null){
					Hrmdecisionstatus st = a.getDecisionStatus().getStatus();
					d_status=("al".equals(lang)?st.getDOMTEXT():"en".equals(lang)?st.getDOMTEXT_EN():st.getDOMTEXT_SR());
				}
				jsonObject.element("status_key",  a.getDecisionStatus().getStatus().getDOMKEY());
				jsonObject.element("current_status", d_status);
				if(lang.equals("al"))
					jsonObject.element("decision_type", a.getDecisionType().getNameAl());
				else if(lang.equals("sr"))
					jsonObject.element("decision_type", a.getDecisionType().getNameSr());
				else
					jsonObject.element("decision_type", a.getDecisionType().getNameEn());
				jsonObject.element("date_of_request", DATE_FORMAT.format(a.getDateOfRequest()));
				jsonObject.element("note", a.getNote());
				
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.annualPlan", e);
			throw new BusinessException("HrmGridAction.annualPlan", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * GIRD JSON - annualPlan method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void decisionStatus() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			
			HttpServletRequest request = ServletActionContext.getRequest();
			String decisionId = request.getParameter("decisionId");
			if(StringUtils.isNotEmpty(decisionId) && StringUtils.isNumeric(decisionId)){
				DecisionStatusDAO dao = DAOFactory.getFactory().getDecisionStatusDAO();
				String countQuery = "select count(s.*) from THRM_DECISION_STATUS s where s.decision_id="+decisionId;
				if (StringUtils.isNotEmpty(filter)) {
					countQuery += " " + filter;
				}
				
				String sqlQuery = "select distinct s.* from THRM_DECISION_STATUS s where s.decision_id="+decisionId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DecisionStatus> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				Class<?> c = DecisionStatus.class;
				Table table = c.getAnnotation(Table.class);
				String tableName = table.name();
				Key aesKey = new SecretKeySpec(keyAesAsString.getBytes(), "AES");

				String encryptedText= encrypt(tableName,aesKey);
				 
		            
				JSONArray rows = new JSONArray();
				for (DecisionStatus a : list) {
					JSONObject jo = new JSONObject();
					jo.element("id", a.getId());
					jo.element("decision_id", a.getDecision().getId());
					jo.element("status", "al".equals(lang)?a.getStatus().getDOMTEXT():"en".equals(lang)?a.getStatus().getDOMTEXT_EN():a.getStatus().getDOMTEXT_SR());
					jo.element("note", a.getNote());
					jo.element("create_by", getPersonData(a.getEmployee()));
					jo.element("create_date", fdate(a.getCreateDate()));
					jo.element("encryptedText", encryptedText);
					
					rows.add(jo);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.decisionStatus", e);
			throw new BusinessException("HrmGridAction.decisionStatus", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * GIRD JSON - annualPlan method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void decisionDoc() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lang = getLocale().getLanguage().toLowerCase();
			
			HttpServletRequest request = ServletActionContext.getRequest();
			String decisionId = request.getParameter("decisionId");
			if(StringUtils.isNotEmpty(decisionId) && StringUtils.isNumeric(decisionId)){
				DecisionDocDAO dao = DAOFactory.getFactory().getDecisionDocDAO();
				String countQuery = "select count(s.*) from THRM_DECISION_DOC s where s.decision_id="+decisionId;
				if (StringUtils.isNotEmpty(filter)) {
					countQuery += " " + filter;
				}
				
				String sqlQuery = "select distinct s.* from THRM_DECISION_DOC s where s.decision_id="+decisionId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<DecisionDoc> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (DecisionDoc a : list) {
					JSONObject jo = new JSONObject();
					jo.element("id", a.getId());
					jo.element("decision_id", a.getDecision().getId());
					if(a.getStatusName()!=null)
						jo.element("status_name", "al".equals(lang)?a.getStatusName().getDOMTEXT():"en".equals(lang)?a.getStatusName().getDOMTEXT_EN():a.getStatusName().getDOMTEXT_SR());
					else
						jo.element("status_name", "");
					jo.element("doc_type", a.getDocType());
					jo.element("doc_name", a.getDocName());
					jo.element("doc_size", a.getDocSize());
					jo.element("created_by", getPersonData(a.getEmployee()));
					jo.element("created_date", fdate(a.getCreatedDate()));
					
					rows.add(jo);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
			}else{
				setEmtpyContent(out);
			}
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.decisionDoc", e);
			throw new BusinessException("HrmGridAction.decisionDoc", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Kfis docs.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void kfisDocs() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
//			String lang = getLocale().getLanguage().toLowerCase();
			String tableName = request.getParameter("tableName");
			String entityId=request.getParameter("entityId");
			if(StringUtils.isNotEmpty(tableName) && StringUtils.isNumeric(entityId)){
				
//				setEmtpyContent(out);
			}
			out.flush();

		} catch (Exception e) {
			log.error("HrmGridAction.decisionDoc", e);
			throw new BusinessException("HrmGridAction.decisionDoc", e);
		} finally {
			out.close();
		}
	}
	

}

