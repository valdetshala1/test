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
import com.geoland.kfis.model.StandPlantingActivity;

// TODO: Auto-generated Javadoc
/**
 * The Class StandPlantingActivityDAO.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 11:22:56 AM, Oct 20, 2014
 */
public class StandPlantingActivityDAO extends GenericDAO<StandPlantingActivity, Long> {
	
	/** The log. */
	private static Log log = LogFactory.getLog(StandPlantingActivityDAO.class);
	
	/**
	 * Gets the plan json feature.
	 *
	 * @param plantId the plant id
	 * @return the plan json feature
	 */
	public String getPlanJsonFeature(Long plantId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(plantId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(a.planed_geom)\\:\\:json As geometry, row_to_json((p.id, p.id)) As properties FROM tfrm_stand_planting_activity As p LEFT JOIN tfrm_activity AS a on a.id=p.activity_id where p.id = " + plantId;
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
	
	/**
	 * Gets the implement json feature.
	 *
	 * @param imId the im id
	 * @return the implement json feature
	 */
	public String getImplementJsonFeature(Long imId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(imId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(a.im_geom)\\:\\:json As geometry, row_to_json((a.id, a.id)) As properties FROM tfrm_stand_planting_impl_declare As a where a.id = " + imId;
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
