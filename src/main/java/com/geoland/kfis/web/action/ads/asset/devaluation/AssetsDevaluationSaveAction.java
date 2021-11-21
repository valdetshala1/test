/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset.devaluation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Assets;
import com.geoland.kfis.model.AssetsDevaluation;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsDevaluationSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 22, 2014 1:28:56 PM
 * @Version 1.0
 */
public class AssetsDevaluationSaveAction extends AssetsDevaluationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8042861783288257171L;
	
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
		if(getAssetsDevaluation().getYearOfDeval()==null)
			addFieldError("assetsDevaluation.yearOfDeval", getMessage("assets.devaluation.year.of.deval.empty"));
		
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
		List<AssetsDevaluation> assetsDeval = new ArrayList<AssetsDevaluation>();
		StringTokenizer st = new StringTokenizer(assetsList, ",");
		List<String> assetsString=new ArrayList<String>();
		while(st.hasMoreTokens()){
			assetsString.add(st.nextToken());
		}
		if(assetsString.size()>0){
			String assetsSQLQuery=getAssetsSQLQuery(assetsString);
			List<Assets> assets=DAOFactory.getFactory().getAssetsDAO().executeSQLQuery(assetsSQLQuery);
			
			if(assets.size()>0){
				for(Assets as:assets){
					AssetsDevaluation ad=new AssetsDevaluation();
					ad.setAssets(as);
					ad.setCreatedDate(new Date());
					ad.setEmployee(employee);
					ad.setYearOfDeval(getAssetsDevaluation().getYearOfDeval());
					ad.setNetAfterDevalYear(as.getNetAfterDevalYear()-as.getNetAfterDevalYear()*as.getAmortizationGrade());
					
					assetsDeval.add(ad);
				}
				String assetsDevaluationSQLQuery=getExistingAssetsDevaluation(assetsDeval);
				if(assetsDeval!=null){
					existing=DAOFactory.getFactory().getAssetsDevaluationDAO().executeSQLQuery(assetsDevaluationSQLQuery);
				}
				for(AssetsDevaluation ad:assetsDeval){
					if(existing.size()>0){
						if(!checkExistinAssetsDevaluation(existing, ad.getAssets(), ad.getYearOfDeval())){
							DAOFactory.getFactory().getAssetsDevaluationDAO().save(ad);
							ad.getAssets().setNetAfterDevalYear(ad.getNetAfterDevalYear());
							ad.getAssets().setCurrentUser(currentUser);
							DAOFactory.getFactory().getAssetsDAO().save(ad.getAssets());
						}
					}else {
						ad.setCurrentUser(currentUser);
						DAOFactory.getFactory().getAssetsDevaluationDAO().save(ad);
						ad.getAssets().setNetAfterDevalYear(ad.getNetAfterDevalYear());
						ad.getAssets().setCurrentUser(currentUser);
						DAOFactory.getFactory().getAssetsDAO().save(ad.getAssets());
					}
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
