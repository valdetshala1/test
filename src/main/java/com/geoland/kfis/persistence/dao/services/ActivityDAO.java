package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.Activity;

// TODO: Auto-generated Javadoc
/**
 * The Class ActivityDAO.
 *
 * @author GEO&LAND
 * @created October 10, 2014 11:19:01 PM
 * @Version 1.0
 */
public class ActivityDAO extends GenericDAO<Activity, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(StandHarvestActivityDAO.class);

	/**
	 * Infopoint.
	 *
	 * @param query the query
	 * @return the list
	 * @throws BusinessException the business exception
	 */
	@SuppressWarnings("unchecked")
	public List<Long> infopoint(String query) throws BusinessException {
    	List<Long> result = null;
		Session session = getCurrentSession();
	    try{
			SQLQuery q = session.createSQLQuery(query);
			q.addScalar("ID", LongType.INSTANCE);
			result = q.list();	    	  
    	} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);    		
		} catch (HibernateException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);
		}    	
		return result;
    }
	


}
