/**
 * 
 */
package com.geoland.kfis.logic.adm.address;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.kfis.model.Address;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AddressDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoAddress.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 30, 2014 11:28:45 AM
 * @Version 1.0
 */
public class BoAddress extends BoBase<Address>{

	/**
	 * Instantiates a new bo address.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoAddress(Address persistence, Locale locale) {
		super(persistence, locale);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.IBoBase#delete()
	 */
	@Override
	public void delete() throws BusinessException {
		getDao().delete(getPersistence());
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.IBoBase#validate()
	 */
	@Override
	public Map<String, String> validate() throws ValidationException {
		// TODO Auto-generated method stub
		if(StringUtils.isEmpty(getPersistence().getStreet()))
			addFieldError("address.street", "address.street.empty");
		if(StringUtils.isEmpty(getPersistence().getHomeNr()))
			addFieldError("address.homeNr", "address.homeNr.empty");
		if(StringUtils.isEmpty(getPersistence().getZipCode()))
			addFieldError("address.zipCode", "address.zipCode.empty");
		else if(getPersistence().getZipCode().length()>9)
			addFieldError("address.zipCode", "address.zipCode.less.than.9");
		if(StringUtils.isEmpty(getPersistence().getPlace()))
			addFieldError("address.place", "address.place.empty");
		
//		if (!getFieldErrors().isEmpty()) {
//			HttpServletResponse response = ServletActionContext.getResponse();
//			response.addHeader("errors_exits", "true");
//		}
		
		return getFieldErrors();
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.logic.base.BoBase#getDao()
	 */
	@Override
	public AddressDAO getDao() {
		return DAOFactory.getFactory().getAddressDAO();
	}

}
