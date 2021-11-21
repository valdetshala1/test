/**
 * 
 */
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
import com.geoland.kfis.model.Road;

// TODO: Auto-generated Javadoc
/**
 * The Class RoadDAO.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 11:42:47 AM, Oct 28, 2014
 */
public class RoadDAO extends GenericDAO<Road, Long> {
	
	/** The log. */
	private static Log log = LogFactory.getLog(RoadDAO.class);

	/**
	 * Gets the json feature.
	 *
	 * @param roadId the road id
	 * @return the json feature
	 */
	public String getJsonFeature(Long roadId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(roadId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(v.the_geom)\\:\\:json As geometry, row_to_json((id, id)) "
		    			+ " As properties FROM tgis_road As v where v.id ="+roadId;
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
