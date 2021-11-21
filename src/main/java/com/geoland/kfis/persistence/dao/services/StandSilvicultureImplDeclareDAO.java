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
import com.geoland.kfis.model.StandSilvicultureImplDeclare;

// TODO: Auto-generated Javadoc
/**
 * The Class StandSilvicultureImplDeclareDAO.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Jul 6, 2015 , 2:12:24 PM
 */
public class StandSilvicultureImplDeclareDAO extends GenericDAO<StandSilvicultureImplDeclare, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(StandHarvestActivityDAO.class);
	
	/**
	 * Gets the im slv json feature.
	 *
	 * @param implSlv_Id the impl slv id
	 * @return the im slv json feature
	 */
	public String getImSlvJsonFeature(Long implSlv_Id){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(implSlv_Id!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(h.im_geom)\\:\\:json As geometry, row_to_json((h.id, h.id)) As properties FROM tfrm_stand_silviculture_impl_declare As h where h.id = " + implSlv_Id;
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
