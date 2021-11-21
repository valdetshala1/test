package com.geoland.kfis.web.action.dem.importshape.biodiv;

import java.util.ArrayList;
import java.util.List;

import org.geotools.data.FileDataStore;
import org.geotools.feature.FeatureCollection;
import org.geotools.feature.FeatureIterator;
import org.opengis.feature.Property;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.ShapeBiodiversity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.importshape.ImportShapeBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class ImportBiodivBaseAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created Oct 16, 2015 , 3:43:19 PM
 */
public class ImportBiodivBaseAction extends ImportShapeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6445229811824742343L;
	
	/** The reg code. */
	protected String regCode;
	
	/** The munit code. */
	protected String  munitCode;

	/**
	 * Gets the shape table fields.
	 *
	 * @return the shape table fields
	 */
	public String[][] getShapeTableFields(){
		String result[][]={{"the_geom", "Point"},{"Biocode", "Double"},{"Remarks", "String"},{"Comp_nr", "Double"},
							{"Stand_nr", "String"},{"Biodiversi", "Double"},{"Timeform", "String"},{"Taksator", "String"}
				};
		return result;
	}
	
	/**
	 * Save shape biodiv.
	 *
	 * @param fds the fds
	 */
	protected  void saveShapeBiodiv(FileDataStore fds){
	
		FeatureCollection<SimpleFeatureType, SimpleFeature> coll=getFeatureCollection(fds, 0);
		
		try (FeatureIterator<SimpleFeature> features = coll.features()) {	
			List<ShapeBiodiversity> shapeBiodivList=new ArrayList<ShapeBiodiversity>();
			while(features.hasNext()){
				SimpleFeature feature=features.next();
				ShapeBiodiversity biodiv=new ShapeBiodiversity();
				
				Property p=getFieldProperty(feature.getProperties(), "the_geom");
				biodiv.setWkbGeometry(getMultipolygonVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Biocode");
				biodiv.setBiocode(getBigDecimalVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Remarks");
				biodiv.setRemarks(getStringVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Comp_nr");	
				biodiv.setCompNr(getBigDecimalVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Stand_nr");	
				biodiv.setStandNr(getStringVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Biodiversi");
				biodiv.setBiodiversi(getBigDecimalVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Timeform");
				biodiv.setTimeform(getStringVal(p.getValue()));
				
				p=getFieldProperty(feature.getProperties(), "Taksator");
				biodiv.setTaksator(getStringVal(p.getValue()));
				
				shapeBiodivList.add(biodiv);
				
			}
			for(ShapeBiodiversity shb:shapeBiodivList){
				DAOFactory.getFactory().getShapeBiodiversityDAO().save(shb);
			}
			
		} 
		
	}

	/**
	 * Gets the reg code.
	 *
	 * @return the reg code
	 */
	public String getRegCode() {
		return regCode;
	}

	/**
	 * Sets the reg code.
	 *
	 * @param regCode the new reg code
	 */
	public void setRegCode(String regCode) {
		this.regCode = regCode;
	}

	/**
	 * Gets the munit code.
	 *
	 * @return the munit code
	 */
	public String getMunitCode() {
		return munitCode;
	}

	/**
	 * Sets the munit code.
	 *
	 * @param munitCode the new munit code
	 */
	public void setMunitCode(String munitCode) {
		this.munitCode = munitCode;
	}




	
}
