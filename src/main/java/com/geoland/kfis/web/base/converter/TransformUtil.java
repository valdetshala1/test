package com.geoland.kfis.web.base.converter;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class TransformUtil.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 29, 2015, 10:26:48 AM
 * v2.0
 */
public class TransformUtil {

	/**
	 * Round scale 2.
	 *
	 * @param d the d
	 * @return the double
	 */
	public static double roundScale2( double d )   {     
		return Math.rint( d * 100.0 ) / 100.0;   
	} 
	
	/**
	 * Round.
	 *
	 * @param value the value
	 * @param places the places
	 * @return the double
	 */
	public static double round(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    BigDecimal bd = new BigDecimal(value);
	    bd = bd.setScale(places, RoundingMode.HALF_UP);
	    return bd.doubleValue();
	}	
	
	/**
	 * Transformto 4326.
	 *
	 * @param source the source
	 * @return the geometry
	 * @throws BusinessException the business exception
	 */
	public static synchronized Geometry transformto4326(Geometry source) throws BusinessException{
		Geometry target = null;
		String wktPolygon = source.getEnvelope().toString();
		String trans = "SELECT ST_AsText(st_transform(ST_GeomFromText('" + wktPolygon + "'),  4326))";
		List<String> result = null;
		try {
			result =  DAOFactory.getFactory().getStandDAO().transform(trans);
		} catch (BusinessException be) {
			throw new BusinessException(be);
		}
		if(result!=null){
			wktPolygon = result.iterator().next();
		    try{
		    	WKTReader fromText = new WKTReader();
		    	target = fromText.read(wktPolygon);
		    } catch (ParseException e){
		    		throw new BusinessException(e);
		    }			
		}
	    return target;
	}
	
}
