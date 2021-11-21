package com.geoland.kfis.logic.hr.leave;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Leave;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.LeaveDAO;
// TODO: Auto-generated Javadoc

/**
 * The Class BoLeave.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created April 18, 2014 7:15:43 PM
 * @Version 1.0
 */
public class BoLeave extends BoBase<Leave> {
	
	/** The status save. */
	private boolean statusSave;
	
	/**
	 * Instantiates a new bo leave.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoLeave(Leave persistence, Locale locale) {
		super(persistence, locale);
	}
	
	/**
	 * Instantiates a new bo leave.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 * @param statsuSave the statsu save
	 */
	public BoLeave(Leave persistence, Locale locale,boolean statsuSave) {
		super(persistence, locale);
		this.statusSave=statsuSave;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.IBoBase#delete()
	 */
	@Override
	public void delete() throws BusinessException {
		getDao().delete(getPersistence());
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.IBoBase#validate()
	 */
	@Override
	public Map<String, String> validate() throws ValidationException {
		if(getPersistence().getEmployee().getId()==null)
			addFieldError("leave.employee.id","leave.employee.id.empty");
		if(getPersistence().getLeaveType()==null)
			addFieldError("leave.leaveType","leave.leave.type.empty");
		if(getPersistence().getFromDate()==null)
			addFieldError("leave.fromDate", "leave.from.date.empty");
		if(getPersistence().getToDate()==null)
			addFieldError("leave.toDate", "leave.to.date.empty");
		if(getPersistence().getDaysRequested()==null)
			addFieldError("leave.daysRequested", "leave.days.requested.empty");
		
		if( getPersistence().getEmployee().getId()!=null && getPersistence().getLeaveType()!=null && getPersistence().getDaysRequested()!=null && statusSave==false){
			checkForDays();
		}

		return getFieldErrors();
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.BoBase#getDao()
	 */
	@Override
	public LeaveDAO getDao() {
		return DAOFactory.getFactory().getLeaveDAO();
	}

	/**
	 * Check for days.
	 */
	public void checkForDays(){
		List<LeaveEntitlement> entitlement=DAOFactory.getFactory().getLeaveEntitlementDAO().executeSQLQuery("select * from thrm_leave_entitlement where employee_id="+getPersistence().getEmployee().getId()+ " and leave_type_id="+getPersistence().getLeaveType().getId());
		if(entitlement.size()<=0)
			addFieldError("leave.employee.no.entitlement","leave.employee.no.entitlement");
		else{
			Double sum=0.0;
			for(LeaveEntitlement le:entitlement){
				sum+=le.getNoOfDays();
			}
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			String sumOfLeavesWithSameType="select sum(days_requested) as sum from thrm_leave where leave_type_id="+getPersistence().getLeaveType().getId()+" and employee_id="+getPersistence().getEmployee().getId();
			if(getPersistence().getId()!=null)
				sumOfLeavesWithSameType+=" and id!="+getPersistence().getId();
			
			SQLQuery query=s.createSQLQuery(sumOfLeavesWithSameType);
			query.addScalar("sum");
			Object existingDays=query.uniqueResult();
			if(existingDays!=null){
				Double exDays=(Double)existingDays;
				sum-=exDays;
			}
			if(sum<getPersistence().getDaysRequested() || sum<=0)
				addFieldError("leave.daysRequested.less", "leave.days.less");
		}
	}

	/**
	 * Checks if is status save.
	 *
	 * @return the statusSave
	 */
	public boolean isStatusSave() {
		return statusSave;
	}

	/**
	 * Sets the status save.
	 *
	 * @param statusSave the statusSave to set
	 */
	public void setStatusSave(boolean statusSave) {
		this.statusSave = statusSave;
	}
}
