/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset.staffassign;

import java.util.List;

import com.geoland.kfis.model.Assets;
import com.geoland.kfis.model.AssetsStaffAssign;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsStaffAssignBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 4:13:25 PM
 * @Version 1.0
 */
public class AssetsStaffAssignBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6305160032506161188L;
	
	/** The asset staff assign id. */
	protected Long assetStaffAssignId;
	
	/** The asset staff assign. */
	protected AssetsStaffAssign assetStaffAssign;
	
	/** The organisation. */
	protected String organisation;
	
	/** The employee list. */
	protected List<Employee> employeeList;
	
	/** The existing. */
	protected List<AssetsStaffAssign> existing;
	
	/** The asa. */
	protected List<AssetsStaffAssign> asa;
	
	/**
	 * Gets the existing assets staff.
	 *
	 * @param asa the asa
	 * @return the existing assets staff
	 */
	protected String getExistingAssetsStaff(List<AssetsStaffAssign> asa){
		String asaSQL="";
		if(asa!=null){
			 asaSQL="SELECT asa.* FROM tassets_staff_assign as asa where (";
			 for (int i=0;i < asa.size();i++){
					if(i<asa.size()-1){
						asaSQL=asaSQL+"(assets_id="+asa.get(i).getAssets().getId()+" and employee_id="
								   +asa.get(i).getEmployeeByEmployeeId().getId()+") or ";
					}else {
						asaSQL=asaSQL+"(assets_id="+asa.get(i).getAssets().getId()+" and employee_id="
								   +asa.get(i).getEmployeeByEmployeeId().getId()+")) order by employee_id asc";
					}
				}
		}
		return asaSQL;
	}
	
	/**
	 * Check assets employee.
	 *
	 * @param asa the asa
	 * @param employee the employee
	 * @param a the a
	 * @return true, if successful
	 */
	public boolean checkAssetsEmployee(AssetsStaffAssign asa,Employee employee,Assets a){
			if(asa.getEmployeeByEmployeeId().getId().equals(employee.getId()) && asa.getAssets().getId().equals(a.getId())){
				return true;
			}
		return false;
	}
	
	/**
	 * Gets the asset staff assign id.
	 *
	 * @return the assetStaffAssignId
	 */
	public Long getAssetStaffAssignId() {
		return assetStaffAssignId;
	}
	
	/**
	 * Sets the asset staff assign id.
	 *
	 * @param assetStaffAssignId the assetStaffAssignId to set
	 */
	public void setAssetStaffAssignId(Long assetStaffAssignId) {
		this.assetStaffAssignId = assetStaffAssignId;
	}
	
	/**
	 * Gets the asset staff assign.
	 *
	 * @return the assetStaffAssign
	 */
	public AssetsStaffAssign getAssetStaffAssign() {
		return assetStaffAssign;
	}
	
	/**
	 * Sets the asset staff assign.
	 *
	 * @param assetStaffAssign the assetStaffAssign to set
	 */
	public void setAssetStaffAssign(AssetsStaffAssign assetStaffAssign) {
		this.assetStaffAssign = assetStaffAssign;
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
	 * @param organisation the organisation to set
	 */
	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}
	
	/**
	 * Gets the employee list.
	 *
	 * @return the employeeList
	 */
	public List<Employee> getEmployeeList() {
		return employeeList;
	}
	
	/**
	 * Sets the employee list.
	 *
	 * @param employeeList the employeeList to set
	 */
	public void setEmployeeList(List<Employee> employeeList) {
		this.employeeList = employeeList;
	}
	
	/**
	 * Gets the existing.
	 *
	 * @return the existing
	 */
	public List<AssetsStaffAssign> getExisting() {
		return existing;
	}
	
	/**
	 * Sets the existing.
	 *
	 * @param existing the existing to set
	 */
	public void setExisting(List<AssetsStaffAssign> existing) {
		this.existing = existing;
	}
	
	/**
	 * Gets the asa.
	 *
	 * @return the asa
	 */
	public List<AssetsStaffAssign> getAsa() {
		return asa;
	}
	
	/**
	 * Sets the asa.
	 *
	 * @param asa the asa to set
	 */
	public void setAsa(List<AssetsStaffAssign> asa) {
		this.asa = asa;
	}
	
	

}
