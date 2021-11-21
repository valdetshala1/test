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
import com.geoland.kfis.model.LineTemp;

// TODO: Auto-generated Javadoc
/**
 * The Class LineTempDAO.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Oct 18, 2017 , 9:38:21 AM
 */
public class LineTempDAO extends GenericDAO<LineTemp, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(LineTempDAO.class);

	/**
	 * Gets the json feature.
	 *
	 * @param linetempId the linetemp id
	 * @return the json feature
	 */
	public String getJsonFeature(Long linetempId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(linetempId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(v.the_geom)\\:\\:json As geometry, row_to_json((id, id)) "
		    			+ " As properties FROM tlinetemp As v where v.id ="+linetempId;
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
