/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.stand;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.geotools.data.FileDataStore;
import org.geotools.feature.FeatureCollection;
import org.geotools.feature.FeatureIterator;
import org.opengis.feature.Property;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.ShapeStand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.importshape.ImportShapeBaseAction;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.Polygon;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class ImportStandBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 16, 2015, 2:16:56 PM
 */
public class ImportStandBaseAction extends ImportShapeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6445229811824742343L;

	/**
	 * Gets the shape table fields.
	 *
	 * @return the shape table fields
	 */
	public String[][] getShapeTableFields(){
		String result[][]={{"the_geom", "Polygon"},{"Stand_Id", "String"},{"FMR", "String"},{"Munici", "String"},{"MU", "String"},{"Comp", "String"},{"Stand", "String"},
				{"StandArea", "Double"},{"MC", "Integer"},{"No_plots", "Integer"},{"Access", "Integer"},{"MineHazard", "String"},{"Layers", "Integer"},{"CrownCover", "Double"},
				{"Slope", "Double"},{"LitterCov", "Double"},{"Age", "Double"},{"Origin", "Integer"},{"DomSpC", "Integer"},{"ConSI", "Double"},{"DomSpB", "Integer"},{"BroSI", "Double"},
				{"Trees", "Double"},{"Treatm", "Integer"},{"TreatmArea", "Double"},{"M3ConHa", "Double"},
				{ "M3BroHa", "Double"}, { "M3_0_30", "Double"}, { "M3_30_50", "Double"}, { "M3_50_70", "Double"},{ "M3_70_", "Double"}, { "M3Tot_Ha", "Double"},
				{ "M3Stand", "Double"}, { "RelError", "Double"}, { "ConPerc", "Double"}, { "BroPerc", "Double"}, { "M3ILCutCon", "Double"}, { "M3ILCutBro", "Double"},
				{ "IncrConHa", "Double"}, { "IncrBroHa", "Double"}, { "IncrTot_Ha", "Double"}, { "IncrStand", "Double"}, { "M3_M_Con", "Double"}, { "M3_M_Bro", "Double"},
				{ "M3_M_Tot", "Double"}, { "M3_M_Stand", "Double"}, { "M2_Ha", "Double"}, { "Ds_Con", "Double"}, { "Ds_Bro", "Double"}, { "Cl1_Con", "Double"},
				{ "Cl2_Con", "Double"}, { "Cl3_Con", "Double"}, { "Cl4_Con", "Double"}, { "Cl1_Bro", "Double"}, { "Cl2_Bro", "Double"}, { "Cl3_Bro", "Double"},
				{ "Cl4_Bro", "Double"}, { "DamagePerc", "Double"}, { "M3Est", "Double"}, { "StemsHa", "Integer"}, { "HeightMean", "Integer"}, { "YoungTree1", "Integer"},
				{ "YoungTree2", "Integer"}, { "YoungTree3", "Integer"}, { "survey_dat", "Date"}
				};
		return result;
	}
	
	/**
	 * Check all attributes from shape file.
	 *
	 * @param ft the ft
	 * @param tableFields the table fields
	 */
	public void checkStandAttributes(SimpleFeature ft,String tableFields[][]) {
		Collection<Property> props = ft.getProperties();
//		props.
//		String tableFields[][]=getShapeTableFields();
		for(int i=0;i<tableFields.length;i++){
			String name=tableFields[i][0];
			String type=tableFields[i][1];
			Property p = getFieldProperty(props,name);
			if(p==null)
				addFieldError(name,  MessageFormat.format(getMessage("field.missing"),name));//field from table is missing
			else if("the_geom".equals(name))
				featureGeomType(p,name,type);
			else
				featureNameType(p,name,type);
		}
	}
	
	/**
	 * Check for missing attribute name and mismatching attribute type, add
	 * custom field errors if necessary.
	 *
	 * @param p the p
	 * @param name the name
	 * @param type the type
	 */
	public void featureGeomType(Property p,String name,String type) {
		if(p!=null){
			String featureType = getTypeOfFeature(p.getType().toString());
			if(!(featureType.equalsIgnoreCase("MultiPolygon") || featureType.equalsIgnoreCase("Polygon"))){
				Object[] o={name,featureType,type};
				addFieldError(name, MessageFormat.format(getMessage("feature.attribute.not.matching"), o));
			}
			else{
				Geometry geom = getGeometryVal(p.getValue());
				if(geom.getNumGeometries()>1){
					Object[] o={name,featureType,type};
					addFieldError(name, MessageFormat.format(getMessage("feature.attribute.not.matching"), o));
				}
			}
		}
	}
	
   /**
    * Get Geometry value from the given object.
    *
    * @param s the s
    * @return the geometry val
    */
	public Geometry getGeometryVal(Object s) {
		if (s != null) {
			Geometry geom = null;
			try {
				WKTReader reader = new WKTReader(new GeometryFactory(
						new PrecisionModel(), 900916));
				geom = reader.read(s.toString());
				geom.getNumGeometries();
				geom.setSRID(900916);
				return geom;
			} catch (com.vividsolutions.jts.io.ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * Get values from the FileDataStore and save into DB.
	 *
	 * @param fds the fds
	 */
	public void saveShapeStand(FileDataStore fds) {
		FeatureCollection<SimpleFeatureType, SimpleFeature> collection = getFeatureCollection(
				fds, 0);
		try (FeatureIterator<SimpleFeature> features = collection.features()) {
			List<ShapeStand> shapeList = new ArrayList<ShapeStand>();
			while (features.hasNext()) {
				SimpleFeature feature = features.next();
				ShapeStand sh = new ShapeStand();

				Property p = getFieldProperty(feature.getProperties(),"the_geom");
				Geometry geom = getGeometryVal(p.getValue());
				if(geom.getNumGeometries()>=1)
					sh.setWkbGeometry((Polygon)(geom.getGeometryN(0)));// geometry

				p = getFieldProperty(feature.getProperties(),"Stand_Id");
				sh.setStandId(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"FMR");
				sh.setFmr(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Munici");
				sh.setMunici(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"MU");
				sh.setMu(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Comp");
				sh.setComp(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Stand");
				sh.setStand(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"StandArea");
				sh.setStandarea(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"MC");
				sh.setMc(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"No_plots");
				sh.setNoPlots(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Access");
				sh.setAccess(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"MineHazard");
				sh.setMinehazard(getStringVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Layers");
				sh.setLayers(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"CrownCover");
				sh.setCrowncover(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Slope");
				sh.setSlope(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"LitterCov");
				sh.setLittercov(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Age");
				sh.setAge(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Origin");
				sh.setOrigin(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"DomSpC");
				sh.setDomspc(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"ConSI");
				sh.setConsi(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"DomSpB");
				sh.setDomspb(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"BroSI");
				sh.setBrosi(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Trees");
				sh.setTrees(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Treatm");
				sh.setTreatm(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"TreatmArea");
				sh.setTreatmarea(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3ConHa");
				sh.setM3conha(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3BroHa");
				sh.setM3broha(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_0_30");
				sh.setM3030(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_30_50");
				sh.setM33050(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_50_70");
				sh.setM35070(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_70_");
				sh.setM370(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3Tot_Ha");
				sh.setM3totHa(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3Stand");
				sh.setM3stand(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"RelError");
				sh.setRelerror(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"ConPerc");
				sh.setConperc(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"BroPerc");
				sh.setBroperc(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3ILCutCon");
				sh.setM3ilcutcon(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3ILCutBro");
				sh.setM3ilcutbro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"IncrConHa");
				sh.setIncrconha(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"IncrBroHa");
				sh.setIncrbroha(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"IncrTot_Ha");
				sh.setIncrtotHa(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"IncrStand");
				sh.setIncrstand(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_M_Con");
				sh.setM3MCon(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_M_Bro");
				sh.setM3MBro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_M_Tot");
				sh.setM3MTot(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3_M_Stand");
				sh.setM3MStand(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M2_Ha");
				sh.setM2Ha(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Ds_Con");
				sh.setDsCon(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Ds_Bro");
				sh.setDsBro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl1_Con");
				sh.setCl1Con(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl2_Con");
				sh.setCl2Con(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl3_Con");
				sh.setCl3Con(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl4_Con");
				sh.setCl4Con(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl1_Bro");
				sh.setCl1Bro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl2_Bro");
				sh.setCl2Bro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl3_Bro");
				sh.setCl3Bro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"Cl4_Bro");
				sh.setCl4Bro(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"DamagePerc");
				sh.setDamageperc(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"M3Est");
				sh.setM3est(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"StemsHa");
				sh.setStemsha(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"HeightMean");
				sh.setHeightmean(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"YoungTree1");
				sh.setYoungtree1(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"YoungTree2");
				sh.setYoungtree2(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"YoungTree3");
				sh.setYoungtree3(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"survey_dat");
				sh.setSurveyDat(getDateVal(p.getValue()));

				shapeList.add(sh);
			}
			for (ShapeStand sh : shapeList) {
				DAOFactory.getFactory().getShapeStandDAO().save(sh);
			}
		}
	}
	
}
