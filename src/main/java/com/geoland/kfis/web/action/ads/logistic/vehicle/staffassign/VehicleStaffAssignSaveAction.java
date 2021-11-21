package com.geoland.kfis.web.action.ads.logistic.vehicle.staffassign;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.VehicleStaffAssign;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleStaffAssignSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleStaffAssignSaveAction extends VehicleStaffAssignBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8391346974336062351L;

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
		if(StringUtils.isNotEmpty(organisation)){
			StringTokenizer st = new StringTokenizer(organisation, ",");
			organisation = st.nextToken();
			organisation = StringUtils.deleteWhitespace(organisation);
			if (!organisation.isEmpty()) {
				employeeList = DAOFactory
						.getFactory()
						.getEmployeeDAO()
						.executeSQLQuery(
								"select e.*, p.*, y.* from thrm_employee as e left join tperson as p on e.id = p.id left join tparty as y on p.id = y.id where e.organisation_id='"
										+ organisation + "'");
			}
		}
		if (getVehicleStaffAssign().getVehicle().getId() == null)
			addFieldError("vehicleStaffAssign.vehicle.id",
					getMessage("vehicleStaffAssign.vehicle.id"));
		if (StringUtils.isEmpty(organisation)
				&& getVehicleStaffAssign().getEmployeeByEmployeeId().getId() == null)
			addFieldError("vehicleStaffAssign.employeeByEmployeeId.id",
					getMessage("employee.name.placeholder"));
		if (getVehicleStaffAssign().getDateOfAutorization() == null)
			addFieldError("vehicleStaffAssign.dateOfAutorization",
					getMessage("vehicleStaffAssign.dateOfAutorization"));

		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		List<VehicleStaffAssign> vsa = new ArrayList<VehicleStaffAssign>();
		if (employeeList == null) {
			existing = DAOFactory
					.getFactory()
					.getVehicleStaffAssignDAO()
					.executeSQLQuery(
							"select vsa.* from tvehicles_staff_assign as vsa where vsa.vehicles_id="
									+ getVehicleStaffAssign().getVehicle()
											.getId()
									+ " and vsa.employee_id="
									+ getVehicleStaffAssign()
											.getEmployeeByEmployeeId().getId());
			if (existing != null) {
				for (VehicleStaffAssign ex : existing) {
					if (checkVehicleEmployee(ex, getVehicleStaffAssign()
							.getEmployeeByEmployeeId(),
							getVehicleStaffAssign().getVehicle())) {
						boolean autorization = getVehicleStaffAssign()
								.isAutorization();
						Date date = getVehicleStaffAssign()
								.getDateOfAutorization();
						setVehicleStaffAssign(ex);
						getVehicleStaffAssign().setAutorization(autorization);
						getVehicleStaffAssign().setDateOfAutorization(date);
					}
				}
			}
			getVehicleStaffAssign().setEmployeeByCreatedBy(employee);
			getVehicleStaffAssign().setCreatedTime(new Date());
			DAOFactory.getFactory().getVehicleStaffAssignDAO()
					.save(getVehicleStaffAssign());
		} else {
			if (employeeList.size() > 0) {
				for (Employee emp : employeeList) {
					VehicleStaffAssign v = new VehicleStaffAssign();
					v.setAutorization(getVehicleStaffAssign().isAutorization());
					v.setDateOfAutorization(getVehicleStaffAssign()
							.getDateOfAutorization());
					v.setEmployeeByEmployeeId(emp);
					v.setVehicle(getVehicleStaffAssign().getVehicle());
					vsa.add(v);
				}
				String SQLquery = getExistingVehicleStaff(vsa);
				if (SQLquery != null) {
					existing = DAOFactory.getFactory()
							.getVehicleStaffAssignDAO()
							.executeSQLQuery(SQLquery);
				}
				for (VehicleStaffAssign v : vsa) {
					if (existing.size() > 0) {
						for (VehicleStaffAssign ex : existing) {
							if (checkVehicleEmployee(ex,
									v.getEmployeeByEmployeeId(),
									v.getVehicle())) {
								boolean autorization = getVehicleStaffAssign()
										.isAutorization();
								Date date = getVehicleStaffAssign()
										.getDateOfAutorization();
								setVehicleStaffAssign(ex);
								v = getVehicleStaffAssign();
								v.setAutorization(autorization);
								v.setDateOfAutorization(date);

							}
						}
					}
					v.setCreatedTime(new Date());
					v.setEmployeeByCreatedBy(employee);
					DAOFactory.getFactory().getVehicleStaffAssignDAO().save(v);

				}

			}
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
