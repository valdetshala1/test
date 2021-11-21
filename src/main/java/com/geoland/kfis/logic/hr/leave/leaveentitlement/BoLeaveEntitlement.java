package com.geoland.kfis.logic.hr.leave.leaveentitlement;

import java.util.Locale;
import java.util.Map;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.LeaveEntitlementDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoLeaveEntitlement.
 */
public class BoLeaveEntitlement extends BoBase<LeaveEntitlement> {

	/**
	 * Instantiates a new bo leave entitlement.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoLeaveEntitlement(LeaveEntitlement persistence, Locale locale) {
		super(persistence, locale);
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
		if(getPersistence().getEmployee()==null)
			addFieldError("leaveEntitlement.employee", "leaveEntitlement.employee.empty");
		if(getPersistence().getLeaveType()==null)
			addFieldError("leaveEntitlement.leaveType", "leaveEntitlement.leaveType.empty");
		if(getPersistence().getNoOfDays()==null)
			addFieldError("leaveEntitlement.noOfDays", "leaveEntitlement.noOfDays.empty");
		if(getPersistence().getFromDate()==null)
			addFieldError("leaveEntitlement.fromDate", "leaveEntitlement.fromDate.empty");
		if(getPersistence().getToDate()==null)
			addFieldError("leaveEntitlement.toDate", "leaveEntitlement.toDate.empty");
		
		
		
		return getFieldErrors();
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.BoBase#getDao()
	 */
	@Override
	public LeaveEntitlementDAO getDao() {
		return DAOFactory.getFactory().getLeaveEntitlementDAO();
	}
}
