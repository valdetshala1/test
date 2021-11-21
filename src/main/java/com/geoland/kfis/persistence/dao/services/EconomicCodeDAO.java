package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StandardBasicTypes;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EconomicCode;

/**
 * The Class EconomicCodeDAO.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 12:17:08 PM
 * @Version 1.0
 */
public class EconomicCodeDAO extends GenericDAO<EconomicCode, Long> {

	private static Logger log = Logger.getLogger(EconomicCodeDAO.class);
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getEonomicCodeTreeView(String query)
			throws BusinessException {
		List<Object[]> result = null;
		try{
			Session session = getCurrentSession();
			SQLQuery sqlQuery = session.createSQLQuery(query);
			//id, parent_id, object_name, code, path, depth
			sqlQuery.addScalar("id", StandardBasicTypes.LONG);
			sqlQuery.addScalar("parent_id", StandardBasicTypes.LONG);
			sqlQuery.addScalar("name_al", StandardBasicTypes.STRING);
			sqlQuery.addScalar("name_en", StandardBasicTypes.STRING);
			sqlQuery.addScalar("name_sr", StandardBasicTypes.STRING);
			sqlQuery.addScalar("code", StandardBasicTypes.STRING);
			sqlQuery.addScalar("path", StandardBasicTypes.STRING);
			sqlQuery.addScalar("level", StandardBasicTypes.SHORT);
			result = sqlQuery.list();
			
    	} catch (ObjectNotFoundException e) {
		} catch (HibernateException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);
		}		
		return result;		
	}
}
