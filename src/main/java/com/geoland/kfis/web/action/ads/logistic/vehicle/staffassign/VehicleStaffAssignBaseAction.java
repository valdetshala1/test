package com.geoland.kfis.web.action.ads.logistic.vehicle.staffassign;

import java.util.List;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.model.VehicleStaffAssign;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleStaffAssignBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:39 PM
 * @Version 1.0
 */
public class VehicleStaffAssignBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4526701332443529806L;
	
	/** The vehicle staff assign id. */
	protected Long vehicleStaffAssignId;
	
	/** The vehicle staff assign. */
	protected VehicleStaffAssign vehicleStaffAssign;
	
	/** The organisation. */
	protected String organisation;
	
	/** The employee list. */
	protected List<Employee> employeeList;
	
	/** The existing. */
	protected List<VehicleStaffAssign> existing;
	
	/** The vsa. */
	protected List<VehicleStaffAssign> vsa;
	
	/**
	 * Gets the existing vehicle staff.
	 *
	 * @param vsa the vsa
	 * @return the existing vehicle staff
	 */
	protected String getExistingVehicleStaff(List<VehicleStaffAssign> vsa){
		String vsaSQL="";
		if(vsa!=null){
			 vsaSQL="SELECT vsa.* FROM tvehicles_staff_assign as vsa where (";
			 for (int i=0;i < vsa.size();i++){
					if(i<vsa.size()-1){
						vsaSQL=vsaSQL+"(vehicles_id="+vsa.get(i).getVehicle().getId()+" and employee_id="
								   +vsa.get(i).getEmployeeByEmployeeId().getId()+") or ";
					}else {
						vsaSQL=vsaSQL+"(vehicles_id="+vsa.get(i).getVehicle().getId()+" and employee_id="
								   +vsa.get(i).getEmployeeByEmployeeId().getId()+")) order by employee_id asc";
					}
				}
		}
		return vsaSQL;
	}
	
	/**
	 * Check vehicle employee.
	 *
	 * @param l the l
	 * @param employee the employee
	 * @param lv the lv
	 * @return true, if successful
	 */
	public boolean checkVehicleEmployee(VehicleStaffAssign l,Employee employee,Vehicle lv){
		boolean a=false;
			if(l.getEmployeeByEmployeeId().getId().equals(employee.getId()) && l.getVehicle().getId().equals(lv.getId())){
				a=true;
			}
		return a;
	}
	
	/**
	 * Gets the vehicle staff assign id.
	 *
	 * @return the vehicle staff assign id
	 */
	public Long getVehicleStaffAssignId() {
		return vehicleStaffAssignId;
	}
	
	/**
	 * Sets the vehicle staff assign id.
	 *
	 * @param vehicleStaffAssignId the new vehicle staff assign id
	 */
	public void setVehicleStaffAssignId(Long vehicleStaffAssignId) {
		this.vehicleStaffAssignId = vehicleStaffAssignId;
	}
	
	/**
	 * Gets the vehicle staff assign.
	 *
	 * @return the vehicle staff assign
	 */
	public VehicleStaffAssign getVehicleStaffAssign() {
		return vehicleStaffAssign;
	}
	
	/**
	 * Sets the vehicle staff assign.
	 *
	 * @param vehicleStaffAssign the new vehicle staff assign
	 */
	public void setVehicleStaffAssign(VehicleStaffAssign vehicleStaffAssign) {
		this.vehicleStaffAssign = vehicleStaffAssign;
	}
	
	/**
	 * Gets the organisation.
	 *
	 * @return the organisation
	 */
	public String getOrganisation() {
		return organisation;
	}
	
	/**
	 * Sets the organisation.
	 *
	 * @param organisation the new organisation
	 */
	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}
	
	/**
	 * Gets the employee list.
	 *
	 * @return the employee list
	 */
	public List<Employee> getEmployeeList() {
		return employeeList;
	}
	
	/**
	 * Sets the employee list.
	 *
	 * @param employeeList the new employee list
	 */
	public void setEmployeeList(List<Employee> employeeList) {
		this.employeeList = employeeList;
	}
	
	/**
	 * Gets the existing.
	 *
	 * @return the existing
	 */
	public List<VehicleStaffAssign> getExisting() {
		return existing;
	}
	
	/**
	 * Sets the existing.
	 *
	 * @param existing the new existing
	 */
	public void setExisting(List<VehicleStaffAssign> existing) {
		this.existing = existing;
	}
	
	/**
	 * Gets the vsa.
	 *
	 * @return the vsa
	 */
	public List<VehicleStaffAssign> getVsa() {
		return vsa;
	}
	
	/**
	 * Sets the vsa.
	 *
	 * @param vsa the new vsa
	 */
	public void setVsa(List<VehicleStaffAssign> vsa) {
		this.vsa = vsa;
	}
	
}
