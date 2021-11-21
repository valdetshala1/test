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
import com.geoland.kfis.model.FirePolygon;
// TODO: Auto-generated Javadoc

/**
 * The Class FirePolygonDAO.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 28, 2017 , 11:26:31 AM
 */
public class FirePolygonDAO extends GenericDAO<FirePolygon, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(FirePolygonDAO.class);
	
	/**
	 * Gets the json feature fire polygon.
	 *
	 * @param firePolygonId the fire polygon id
	 * @return the json feature fire polygon
	 */
	public String getJsonFeatureFirePolygon(Long  firePolygonId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(firePolygonId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(p.polygon)\\:\\:json As geometry, row_to_json((p.id, p.id)) As properties FROM  tfrm_fire_polygon p   where p.id =" + firePolygonId;
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
