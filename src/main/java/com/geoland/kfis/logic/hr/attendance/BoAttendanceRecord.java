package com.geoland.kfis.logic.hr.attendance;

import java.util.Locale;
import java.util.Map;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.kfis.model.AttendanceRecord;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AttendanceRecordDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoAttendanceRecord.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Jul 7, 2014 10:33:32 PM
 * @Version 1.0
 */
public class BoAttendanceRecord extends BoBase<AttendanceRecord> {

	/**
	 * Instantiates a new bo attendance record.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoAttendanceRecord(AttendanceRecord persistence, Locale locale) {
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
		// TODO Auto-generated method stub
//		if(getPersistence().getEmployee()!=null && getPersistence().getEmployee().getId()==null)
//			addFieldError("attendanceRecord.employee.id", "attendanceRecord.employee.empty");
//		if(StringUtils.isEmpty(getPersistence().getStatus()))
//			addFieldError("attendanceRecord.status", "attendanceRecord.status.empty");
		return getFieldErrors();
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.BoBase#getDao()
	 */
	@Override
	public AttendanceRecordDAO getDao() {
		return DAOFactory.getFactory().getAttendanceRecordDAO();
	}
}
