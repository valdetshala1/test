package com.geoland.kfis.persistence.dao.services;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.DhpetLocation;

// TODO: Auto-generated Javadoc
/**
 * The Class DhpetLocationDAO.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 2, 2014 2:40:08 PM
 * @Version 1.0
 */
public class DhpetLocationDAO extends GenericDAO<DhpetLocation, Long>{

/** The log. */
private static Log log = LogFactory.getLog(DhpetLocationDAO.class);
	
	/**
	 * Gets the json feature.
	 *
	 * @param locationId the location id
	 * @return the json feature
	 */
	public String getJsonFeature(Long locationId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(locationId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(v.the_geom)\\:\\:json As geometry, row_to_json((id, id)) As properties FROM tdhpet_location As v where v.id = " + locationId;
		    	String query = "SELECT row_to_json(fc) as json FROM ( SELECT 'FeatureCollection' As type, array_to_json(array_agg(f)) As features FROM (" + subselect + ") As f )  As fc;";
		    	
				SQLQuery q = session.createSQLQuery(query);
				q.addScalar("json", StringType.INSTANCE);
				jsonResult = (String) q.uniqueResult();	    
	    	}
    	} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);    		
		} catch (HibernateException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);
		}    	
		return jsonResult;		
	}
}
