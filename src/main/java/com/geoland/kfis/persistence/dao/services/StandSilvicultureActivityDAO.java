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
import com.geoland.kfis.model.StandSilvicultureActivity;
// TODO: Auto-generated Javadoc

/**
 * The Class StandSilvicultureActivityDAO.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 20, 2014 , 11:19:36 AM
 */
public class StandSilvicultureActivityDAO extends GenericDAO<StandSilvicultureActivity, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(StandHarvestActivityDAO.class);
	
	/**
	 * Gets the json feature.
	 *
	 * @param slvId the slv id
	 * @return the json feature
	 */
	public String getJsonFeature(Long slvId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(slvId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(a.planed_geom)\\:\\:json As geometry, row_to_json((h.id, h.id)) As properties FROM tfrm_stand_silviculture_activity as h LEFT JOIN tfrm_activity as a on a.id=h.activity_id where h.id = " + slvId;
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
	 * Gets the im json feature.
	 *
	 * @param slvId the slv id
	 * @return the im json feature
	 */
	public String getImJsonFeature(Long slvId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(slvId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(a.implemented_geom)\\:\\:json As geometry, row_to_json((h.id, h.id)) As properties FROM tfrm_stand_silviculture_activity As h LEFT JOIN tfrm_activity AS a on a.id=h.activity_id where h.id = " + slvId;
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
