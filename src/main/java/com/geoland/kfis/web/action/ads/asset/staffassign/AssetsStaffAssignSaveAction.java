/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset.staffassign;

import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.AssetsStaffAssign;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsStaffAssignSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 4:20:16 PM
 * @Version 1.0
 */
public class AssetsStaffAssignSaveAction extends AssetsStaffAssignBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5729462111247041724L;
	

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
		
		if(StringUtils.isEmpty(organisation) && getAssetStaffAssign().getEmployeeByEmployeeId().getId()==null)
			addFieldError("assetStaffAssign.employeeByEmployeeId.id", getMessage("asset.staff.assign.employee.by.employee.id.empty"));
		if(getAssetStaffAssign().getAssets().getId()==null)
			addFieldError("assetStaffAssign.assets.id", getMessage("asset.ataff.assign.assets.empty"));
		if(getAssetStaffAssign().getDateOfAutorization()==null)
			addFieldError("assetStaffAssign.dateOfAutorization", getMessage("asset.staff.assign.date.of.autorization.empty"));
		
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

		User currentUser = getUser().getUser();
		if(employeeList==null){
			existing=DAOFactory.getFactory().getAssetsStaffAssignDAO().executeSQLQuery("select asa.* from tassets_staff_assign as asa where asa.assets_id="+getAssetStaffAssign().getAssets().getId()+" and asa.employee_id="+getAssetStaffAssign().getEmployeeByEmployeeId().getId());
			if(existing!=null){
				for(AssetsStaffAssign ex:existing){
					if(checkAssetsEmployee(ex, getAssetStaffAssign().getEmployeeByEmployeeId(), getAssetStaffAssign().getAssets())){
						ex.setDateOfAutorization(getAssetStaffAssign().getDateOfAutorization());
						setAssetStaffAssign(ex);
					}
				}
			}
			getAssetStaffAssign().setEmployeeByCreatedBy(employee);
			getAssetStaffAssign().setCreatedTime(new Date());
			getAssetStaffAssign().setCurrentUser(currentUser);
			DAOFactory.getFactory().getAssetsStaffAssignDAO().save(getAssetStaffAssign());
		} else {
			if(employeeList.size()>0){
				asa=new ArrayList<AssetsStaffAssign>();
				for(Employee emp:employeeList){
					AssetsStaffAssign a=new AssetsStaffAssign();
					a.setAssets(getAssetStaffAssign().getAssets());
					a.setDateOfAutorization(getAssetStaffAssign().getDateOfAutorization());
					a.setEmployeeByEmployeeId(emp);
					
					asa.add(a);
				}
				String SQLquery = getExistingAssetsStaff(asa);
				if (SQLquery != null) {
					existing = DAOFactory.getFactory().getAssetsStaffAssignDAO().executeSQLQuery(SQLquery);
				}
				for(AssetsStaffAssign a:asa){
					if(existing.size()>0){
						for(AssetsStaffAssign ex:existing){
							if(checkAssetsEmployee(ex, a.getEmployeeByEmployeeId(), a.getAssets())){
								ex.setDateOfAutorization(a.getDateOfAutorization());
								a=ex;
							}
						}
					}
					a.setCreatedTime(new Date());
					a.setEmployeeByCreatedBy(employee);
					a.setCurrentUser(currentUser);
					DAOFactory.getFactory().getAssetsStaffAssignDAO().save(a);
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
