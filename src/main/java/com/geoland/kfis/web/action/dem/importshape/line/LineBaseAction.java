package com.geoland.kfis.web.action.dem.importshape.line;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.geotools.data.FileDataStore;
import org.geotools.feature.FeatureCollection;
import org.geotools.feature.FeatureIterator;
import org.opengis.feature.Property;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.LineTemp;
import com.geoland.kfis.model.Road;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Linetempstatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Roadtype;
import com.geoland.kfis.web.action.dem.importshape.ImportShapeBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class LineBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0s
 * @created Oct 18, 2017 , 10:43:14 AM
 */
public class LineBaseAction extends ImportShapeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The line temp id. */
	protected Long lineTempId;
	
	/** The linetemp. */
	protected LineTemp linetemp;
	
	/** The road type list. */
	private Roadtype[] roadTypeList=Roadtype.values();
	
	/** The road type name. */
	protected Roadtype roadTypeName;
	
	/** The road. */
	protected Road road;
	
	/** The geometry. */
	protected String geometry;
	
	/**
	 * Save line temp.
	 *
	 * @param fds the fds
	 * @param lineNote the line note
	 * @throws ParseException the parse exception
	 */
	protected  void saveLineTemp(FileDataStore fds, String lineNote) throws ParseException{
		FeatureCollection<SimpleFeatureType, SimpleFeature> coll=getFeatureCollection(fds, 0);
		try (FeatureIterator<SimpleFeature> features = coll.features()) {	
			List<LineTemp> lineTempivList=new ArrayList<LineTemp>();
			while(features.hasNext()){
				SimpleFeature feature=features.next();
				LineTemp linetemp=new LineTemp();
				
				Property p=getFieldProperty(feature.getProperties(), "the_geom");
				linetemp.setTheGeom(getMultipolygonVal(p.getValue()));
				
				Property p0=getFieldProperty(feature.getProperties(), "LTHEME");
				Property p1=getFieldProperty(feature.getProperties(), "LTHEME1");
				Property p2=getFieldProperty(feature.getProperties(), "LTHEME2");
				
				
				if(!getStringVal(p0.getValue()).isEmpty() && !getStringVal(p0.getValue()).equals("0")){
					linetemp.setLtheme12(getStringVal(p0.getValue()));
				}else if(!getStringVal(p1.getValue()).isEmpty() && !getStringVal(p1.getValue()).equals("0")){
					linetemp.setLtheme12(getStringVal(p1.getValue()));
				}else if(!getStringVal(p2.getValue()).isEmpty() && !getStringVal(p2.getValue()).equals("0")){
					linetemp.setLtheme12(getStringVal(p2.getValue()));
				}else{
					linetemp.setLtheme12(getStringVal(p0.getValue()));
				}
				
//				p=getFieldProperty(feature.getProperties(), "DATE_");
//				linetemp.setDate(DATE_FORMAT1.parse(getStringVal(p.getValue())));
//				
				p=getFieldProperty(feature.getProperties(), "QUALITY_CL");
				linetemp.setQualityCl(getStringVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "MAINTENANC");
				linetemp.setMaintenanc(getStringVal(p.getValue()));
				linetemp.setCreatedDate(new Date());
				linetemp.setPersonByCreatedBy(getUser().getPerson());
				linetemp.setComment(lineNote);
				lineTempivList.add(linetemp);
				
				
			}
			for(LineTemp l:lineTempivList){
				l.setStatus(Linetempstatus.IMPORTED);
				DAOFactory.getFactory().getLineTempDAO().save(l);
			}
			
		} 
	}


	/**
	 * Gets the road type list.
	 *
	 * @return the road type list
	 */
	public Roadtype[] getRoadTypeList() {
		return roadTypeList;
	}

	/**
	 * Sets the road type list.
	 *
	 * @param roadTypeList the new road type list
	 */
	public void setRoadTypeList(Roadtype[] roadTypeList) {
		this.roadTypeList = roadTypeList;
	}


	/**
	 * Gets the road type name.
	 *
	 * @return the road type name
	 */
	public Roadtype getRoadTypeName() {
		return roadTypeName;
	}


	/**
	 * Sets the road type name.
	 *
	 * @param roadTypeName the new road type name
	 */
	public void setRoadTypeName(Roadtype roadTypeName) {
		this.roadTypeName = roadTypeName;
	}


	/**
	 * Gets the line temp id.
	 *
	 * @return the line temp id
	 */
	public Long getLineTempId() {
		return lineTempId;
	}
	
	/**
	 * Sets the line temp id.
	 *
	 * @param lineTempId the new line temp id
	 */
	public void setLineTempId(Long lineTempId) {
		this.lineTempId = lineTempId;
	}
	
	/**
	 * Gets the linetemp.
	 *
	 * @return the linetemp
	 */
	public LineTemp getLinetemp() {
		return linetemp;
	}
	
	/**
	 * Sets the linetemp.
	 *
	 * @param linetemp the new linetemp
	 */
	public void setLinetemp(LineTemp linetemp) {
		this.linetemp = linetemp;
	}

	/**
	 * Gets the road.
	 *
	 * @return the road
	 */
	public Road getRoad() {
		return road;
	}

	/**
	 * Sets the road.
	 *
	 * @param road the new road
	 */
	public void setRoad(Road road) {
		this.road = road;
	}

	/**
	 * Gets the geometry.
	 *
	 * @return the geometry
	 */
	public String getGeometry() {
		return geometry;
	}

	/**
	 * Sets the geometry.
	 *
	 * @param geometry the new geometry
	 */
	public void setGeometry(String geometry) {
		this.geometry = geometry;
	}
	
	
}
