package com.geoland.kfis.logic.ads.legalsector;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.logic.base.BoBase;
import com.geoland.kfis.model.LawSuit;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.LawSuitDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class BoLawSuit.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 30, 2014 2:51:45 PM
 * @Version 1.0
 */
public class BoLawSuit extends BoBase<LawSuit> {

	/**
	 * Instantiates a new bo law suit.
	 *
	 * @param persistence the persistence
	 * @param locale the locale
	 */
	public BoLawSuit(LawSuit persistence, Locale locale) {
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
		if(getPersistence().getOrganisation().getId()==null)
			addFieldError("lawsuit.organisation.id", "lawsuit.organisation.empty");
		if(StringUtils.isEmpty(getPersistence().getLawsuitNo()))
			addFieldError("lawsuit.lawsuitNo", "lawsuit.lawsuit.no.empty");
		if(getPersistence().getSuitType()==null || StringUtils.isEmpty(getPersistence().getSuitType().toString()))
			addFieldError("lawsuit.suitType", "lawsuit.suit.type.empty");	
		if(getPersistence().getOrigin()==null || StringUtils.isEmpty(getPersistence().getOrigin().toString()))
			addFieldError("lawsuit.origin", "lawsuit.origin.empty");
		if(getPersistence().getDamageType()==null || StringUtils.isEmpty(getPersistence().getDamageType().toString()))
			addFieldError("lawsuit.damageType", "lawsuit.damage.type.empty");	
		if(StringUtils.isEmpty(getPersistence().getName()))
			addFieldError("lawsuit.name", "lawsuit.name.empty");
		if(StringUtils.isEmpty(getPersistence().getLastName()))
			addFieldError("lawsuit.lastName", "lawsuit.name.empty");
		if(getPersistence().getDate()==null)
			addFieldError("lawsuit.date", "lawsuit.date.empty");
		if(getPersistence().getEmployee().getId()==null)
			addFieldError("lawsuit.employee.id", "lawsuit.employee.empty");
		
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
		
		return getFieldErrors();
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.framework.logic.base.BoBase#getDao()
	 */
	@Override
	public LawSuitDAO getDao() {
		return DAOFactory.getFactory().getLawSuitDAO();
	}

}
