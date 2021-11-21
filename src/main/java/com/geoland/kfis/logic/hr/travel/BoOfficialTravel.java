/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 11:04:59 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.logic.hr.travel;

import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.kfis.model.OfficalTravel;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.OfficialTravelDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoOfficialTravel.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 21, 2014 11:04:59 AM
 * @Version 1.0
 */
public class BoOfficialTravel extends BoBase<OfficalTravel>{

	/**
	 * Instantiates a new bo official travel.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoOfficialTravel(OfficalTravel persistence, Locale locale) {
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
		
		if(getPersistence().getEmployee().getId()==null)
			addFieldError("officialTravel.employee.id","officialTravel.employee.empty");
		if(getPersistence().getTravelType()==null)
			addFieldError("officialTravel.travelType", "officialTravel.travelType.empty");
		if(getPersistence().getFromDate()==null)
			addFieldError("officialTravel.fromDate", "officialTravel.fromDate.empty");
		if(getPersistence().getToDate()==null)
			addFieldError("officialTravel.toDate", "officialTravel.toDate.empty");
		if(StringUtils.isEmpty(getPersistence().getFromDestination()))
			addFieldError("officialTravel.fromDestination", "officialTravel.fromDestination.empty");
		if(StringUtils.isEmpty(getPersistence().getToDestination()))
			addFieldError("officialTravel.toDestination", "officialTravel.toDestination.empty");
		if(getPersistence().getDaysRequested()==null)
			addFieldError("officialTravel.daysRequested", "officialTravel.daysRequested.empty");
		
		return getFieldErrors();
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.BoBase#getDao()
	 */
	@Override
	public OfficialTravelDAO getDao() {
		return DAOFactory.getFactory().getOfficialTravelDAO();
	}

}
