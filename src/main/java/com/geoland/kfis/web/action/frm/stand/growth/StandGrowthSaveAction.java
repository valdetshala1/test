/**
 * 
 */
package com.geoland.kfis.web.action.frm.stand.growth;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.StandGrowth;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class StandGrowthSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:43:44 PM, Jan 28, 2015
 */
public class StandGrowthSaveAction extends StandGrowthBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The message. */
	private String message;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee == null)
			addFieldError("", "");

		Long year =new Long(Calendar.getInstance().get(Calendar.YEAR)+1);
		if(StringUtils.isNotEmpty(standIdsList)){
			String standSQLQuery="select * from tgis_stand where id in("+standIdsList+")";
			List<Stand> stands = DAOFactory.getFactory().getStandDAO().executeSQLQuery(standSQLQuery);
			
			if(stands!=null && stands.size()>0){
				String standGrowthSQLQuery = "select s.* from tgis_stand s left join tgis_stand_growth g on g.stand_id=s.id where g.stand_id in("+standIdsList+") and g.year="+year;
				List<Stand> growths = DAOFactory.getFactory().getStandDAO().executeSQLQuery(standGrowthSQLQuery);
				standGrowth(stands, growths);
			}
		}else if(StringUtils.isNotEmpty(compIdsList)){
			String standSQLQuery="select s.* from tgis_stand s where s.compartment_id in ("+compIdsList+")";
			List<Stand> stands = DAOFactory.getFactory().getStandDAO().executeSQLQuery(standSQLQuery);
			
			if(stands!=null && stands.size()>0){
				String standGrowthSQLQuery = "select s.* from tgis_stand s left join tgis_stand_growth g on g.stand_id=s.id where g.stand_id in(select s.id from tgis_stand s where s.compartment_id in ("+compIdsList+")) and g.year="+year;
				List<Stand> growths = DAOFactory.getFactory().getStandDAO().executeSQLQuery(standGrowthSQLQuery);
				standGrowth=new ArrayList<StandGrowth>();
				standGrowth(stands, growths);
			}
		}
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.addHeader("meesage", message);
		
		if(hasFieldErrors() || hasActionErrors()){
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		for(StandGrowth sg:standGrowth){
			
			sg.setEmployee(employee);
			sg.setCreatedDate(new Date());
			
			User user = getUser().getUser();
			sg.setCurrentUser(user);
			sg.getStand().setCurrentUser(user);
			DAOFactory.getFactory().getStandGrowthDAO().save(sg);
			DAOFactory.getFactory().getStandDAO().save(sg.getStand());
		}

		return NONE;
	}

	/**
	 * Stand growth.
	 *
	 * @param stands the stands
	 * @param growths the growths
	 */
	public void standGrowth(List<Stand> stands, List<Stand> growths){
		message="";
		standGrowth=new ArrayList<StandGrowth>();
		Long year =new Long(Calendar.getInstance().get(Calendar.YEAR)+1);
		for(Stand s:stands){
			
			if(!growths.contains(s)){
				if(hasMeasuredVolume(s)){//Check if this stand has measured volume 
					if(s.getIncrPerc()!=null){//check if this stand has an increment percentage
						Double old = s.getVolumeM3ha();
						StandGrowth sg=new StandGrowth();
						sg.setYear(year);
						sg.setOldVolume(old);
						Double newVolume=old+old*(s.getIncrPerc()/100);
						sg.setNewVolume(newVolume);
						s.setVolumeM3ha(newVolume);
						sg.setStand(s);
						standGrowth.add(sg);
//						message+="("+sg.getStand().getCompartment().getCompId()+"-"+sg.getStand().getStandId()+"),";
						message+="("+sg.getStand().getStandId()+"),";
					}
				}
			}
		}
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
