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
import com.geoland.kfis.model.FirePoint;

// TODO: Auto-generated Javadoc
/**
 * The Class FirePointDAO.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 28, 2017 , 11:26:37 AM
 */
public class FirePointDAO extends GenericDAO<FirePoint, Long>{

	/** The log. */
	private static Log log = LogFactory.getLog(FirePointDAO.class);
	
	/**
	 * Gets the json feature fire point.
	 *
	 * @param firePointId the fire point id
	 * @return the json feature fire point
	 */
	public String getJsonFeatureFirePoint(Long  firePointId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(firePointId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(p.point)\\:\\:json As geometry, row_to_json((p.id, p.id)) As properties FROM  tfrm_fire_point p   where p.id =" + firePointId;
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
