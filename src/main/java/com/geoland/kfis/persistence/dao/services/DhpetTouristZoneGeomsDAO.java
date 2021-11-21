/**
 * 
 */
package com.geoland.kfis.persistence.dao.services;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.DhpetTouristZoneGeoms;

// TODO: Auto-generated Javadoc
/**
 * The Class DhpetTouristZoneGeomsDAO.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 25, 2016, 1:34:19 PM
 */
public class DhpetTouristZoneGeomsDAO extends GenericDAO<DhpetTouristZoneGeoms, Long> {
	
	/** The log. */
	private static Log log = LogFactory.getLog(DhpetTouristZoneGeomsDAO.class);
	
	/**
	 * Gets the json feature tourist zone geoms.
	 *
	 * @param touristZoneGeomsId the tourist zone geoms id
	 * @return the json feature tourist zone geoms
	 */
	public String getJsonFeatureTouristZoneGeoms(String  touristZoneGeomsId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(!StringUtils.isEmpty(touristZoneGeomsId)){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(p.the_geom)\\:\\:json As geometry, row_to_json((p.id, p.id)) As properties FROM  tdhpet_tourist_zone_geoms p   where p.id = " + touristZoneGeomsId;
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
