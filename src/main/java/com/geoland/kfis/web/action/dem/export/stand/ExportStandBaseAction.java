/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.stand;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.geotools.data.DefaultTransaction;
import org.geotools.data.Transaction;
import org.geotools.data.collection.ListFeatureCollection;
import org.geotools.data.shapefile.ShapefileDataStore;
import org.geotools.data.shapefile.ShapefileDataStoreFactory;
import org.geotools.data.simple.SimpleFeatureSource;
import org.geotools.data.simple.SimpleFeatureStore;
import org.geotools.feature.FeatureCollection;
import org.geotools.feature.simple.SimpleFeatureBuilder;
import org.geotools.referencing.crs.DefaultGeographicCRS;
import org.hibernate.Session;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.export.ExportBaseAction;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
// TODO: Auto-generated Javadoc

/**
 * The Class ExportStandBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 8, 2016, 3:52:01 PM
 */
public class ExportStandBaseAction extends ExportBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -314681603633206011L;
	
	/** The region id. */
	protected Long regionId;
	
	/** The region name. */
	protected String regionName;
	
	/** The mu id. */
	protected Long muId;
	
	/** The management unit name. */
	protected String managementUnitName;
	
	/**
	 * Gets the stand table fields.
	 *
	 * @return the stand table fields
	 */
//	 :srid=4326
	public String[][] getStandTableFields(){
		String result[][]={{"the_geom", "Polygon:srid=4326"},{"Stand_Id", "String"},{"FMR", "String"},{"Munici", "String"},{"MU", "String"},{"Comp", "String"},{"Stand", "String"},
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
	 * Creates the simple feature.
	 *
	 * @param sfb the sfb
	 * @param standList the stand list
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeature(SimpleFeatureBuilder sfb,List<Stand> standList){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		for(Stand s:standList){
//			GeometryFactory geometryFactory = JTSFactoryFinder.getGeometryFactory(null);
			GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 900916);
			sfb.add(s.getTheGeom()!=null?geometryFactory.createGeometry((getMultipolygonVal(s.getTheGeom().toString()))):"");//the_geom
			sfb.add(s.getStandId()!=null?s.getStandId():"");//Stand_Id
			sfb.add(s.getCompartment()!=null?s.getCompartment().getManagementUnit().getRegion().getCode():"");//FMR
			sfb.add(s.getCompartment()!=null?s.getCompartment().getCadastralMunicipality().getCode():"");//Munici
			sfb.add(s.getCompartment()!=null?s.getCompartment().getManagementUnit().getMuCode():"");//MU
			sfb.add(s.getCompartment()!=null?s.getCompartment().getCompNr():"");//Comp
			sfb.add(s.getStandNr()!=null?s.getStandNr():"");//Stand
			sfb.add(s.getBasalArea()!=null?s.getBasalArea():"");//StandArea
			sfb.add(s.getMngmClass()!=null?s.getMngmClass().getDOMKEY():"");//MC
			sfb.add(s.getNoPlots()!=null?s.getNoPlots():"");//No_plots
			sfb.add(s.getAccessType()!=null?s.getAccessType().getDOMKEY():"");//Access
			sfb.add(s.getMinehazard()!=null?s.getMinehazard().getDOMKEY():"");//MineHazard
			sfb.add(s.getLayers()!=null?s.getLayers():"");//Layers
			sfb.add(s.getCrowncover()!=null?s.getCrowncover():"");//CrownCover
			sfb.add(s.getSlope()!=null?s.getSlope():"");//Slope
			sfb.add(s.getLittercov()!=null?s.getLittercov():"");//LitterCov
			sfb.add(s.getAge()!=null?s.getAge():"");//Age
			sfb.add(s.getOrigin()!=null?s.getOrigin().getDOMKEY():"");//Origin
			sfb.add(s.getTreeSpeciesByConifer()!=null?s.getTreeSpeciesByConifer().getCode():"");//DomSpC
			sfb.add(s.getConiferBon()!=null?s.getConiferBon():"");//ConSI
			sfb.add(s.getTreeSpeciesByDecidouse()!=null?s.getTreeSpeciesByDecidouse().getCode():"");//DomSpB
			sfb.add(s.getDecidouseBon()!=null?s.getDecidouseBon():"");//BroSI
			sfb.add(s.getTrees()!=null?s.getTrees():"");//Trees
			sfb.add("");//Treatm
			sfb.add("");//TreatmArea
			Double volumeM3ha = 0.0;
			if(s.getVolumeM3ha()!=null)
				volumeM3ha = s.getVolumeM3ha();
			double m3ConHa = 0.0;
			if(s.getConiferPerc()!=null)
				m3ConHa = (s.getConiferPerc()*volumeM3ha)/100;//Volume for Coniferous/ha
			double m3BroHa = 0.0;
			if(s.getDecidousePerc()!=null)
				m3BroHa = (s.getDecidousePerc()*volumeM3ha)/100;//Volume for Decidouse/ha
			sfb.add(m3ConHa);//M3ConHa
			sfb.add(m3BroHa);//M3BroHa
			sfb.add(s.getPerc030()!=null?s.getPerc030():"");//M3_0_30
			sfb.add(s.getPerc3050()!=null?s.getPerc3050():"");//M3_30_50
			sfb.add(s.getPerc5070()!=null?s.getPerc5070():"");//M3_50_70
			sfb.add(s.getPerc70100()!=null?s.getPerc70100():"");//M3_70_
			sfb.add(volumeM3ha);//M3Tot_Ha
			sfb.add("");//M3Stand
			sfb.add("");//RelError
			sfb.add(s.getConiferPerc()!=null?s.getConiferPerc():"");//ConPerc
			sfb.add(s.getDecidousePerc()!=null?s.getDecidousePerc():"");//BroPerc
			sfb.add("");//M3ILCutCon
			sfb.add("");//M3ILCutBro
			Double incrPerc = 0.0;
			if(s.getIncrPerc()!=null)
				incrPerc=s.getIncrPerc();
			sfb.add((incrPerc*m3ConHa)/100);//IncrConHa
			sfb.add((incrPerc*m3BroHa)/100);//IncrBroHa
			sfb.add((incrPerc*volumeM3ha)/100);//IncrTot_Ha
			sfb.add("");//IncrStand
			sfb.add("");//M3_M_Con 
			sfb.add("");//M3_M_Bro
			sfb.add("");//M3_M_Tot
			sfb.add("");//M3_M_Stand
			sfb.add(s.getM2Ha()!=null?s.getM2Ha():"");//M2_Ha
			sfb.add(s.getDsCon()!=null?s.getDsCon():"");//Ds_Con
			sfb.add(s.getDsBro()!=null?s.getDsBro():"");//Ds_Bro
			sfb.add(s.getCl1PercCon()!=null?s.getCl1PercCon():"");//Cl1_Con
			sfb.add(s.getCl2PercCon()!=null?s.getCl2PercCon():"");//Cl2_Con
			sfb.add(s.getCl3PercCon()!=null?s.getCl3PercCon():"");//Cl3_Con
			sfb.add(s.getCl4PercCon()!=null?s.getCl4PercCon():"");//Cl4_Con
			sfb.add(s.getCl1PercDec()!=null?s.getCl1PercDec():"");//Cl1_Bro
			sfb.add(s.getCl2PercDec()!=null?s.getCl2PercDec():"");//Cl2_Bro
			sfb.add(s.getCl3PercDec()!=null?s.getCl3PercDec():"");//Cl3_Bro
			sfb.add(s.getCl4PercDec()!=null?s.getCl4PercDec():"");//Cl4_Bro
			sfb.add(s.getDamagePerc()!=null?s.getDamagePerc():"");//DamagePerc
			sfb.add(s.getEstimateVolume()!=null?s.getEstimateVolume().getCode():"");//M3Est
			sfb.add(s.getEstimateTreesPerHa()!=null?s.getEstimateTreesPerHa().getDOMKEY():"");//StemsHa
			sfb.add(s.getHeightMean()!=null?s.getHeightMean():"");//HeightMean
			sfb.add(s.getTreeSpeciesByTree1()!=null?s.getTreeSpeciesByTree1().getCode():"");//YoungTree1
			sfb.add(s.getTreeSpeciesByTree2()!=null?s.getTreeSpeciesByTree2().getCode():"");//YoungTree2
			sfb.add(s.getTreeSpeciesByTree3()!=null?s.getTreeSpeciesByTree3().getCode():"");//YoungTree3
			sfb.add(s.getSurveyDate()!=null?s.getSurveyDate():"");
			
			SimpleFeature feature = sfb.buildFeature(null);
	        collection.add(feature);
		}
		return collection;
	}
	
	/**
	 * Export data to shapefile.
	 *
	 * @param session the session
	 * @param regionId the region id
	 * @param muId the mu id
	 * @return the file
	 */
	public File exportDataToShapefile(Session session, Long regionId, Long muId){
	        File newFile=null;
	        try {
		        final SimpleFeatureType type = createSimpleFeatureType(getStandTableFields());
		       
		        
		        SimpleFeatureBuilder featureBuilder = new SimpleFeatureBuilder(type);
	
		        String query = "select st.* from tgis_stand as st " +
						" left join tgis_compartment as co on co.id = st.compartment_id " +
						" left join tgis_mu_period as mup on co.mup_id = mup.id " +
						" left join tgis_management_unit as mu on mu.id = mup.mu_id " +
						" left join tgis_cadastral_municipality as cm on cm.id=co.mun_id where mup.isactive='Y'";
		        if(regionId!=null)
		        	query+=" and mu.region_id = "+regionId;
		        if(muId!=null)
		        	query+=" and mu.id = "+muId;
		        
		        List<Stand> standList = DAOFactory.getFactory().getStandDAO().executeSQLQuery(query);	

		        List<SimpleFeature> collection = createSimpleFeature(featureBuilder, standList);
				newFile = File.createTempFile("to_shape_export", ".shp");
				
		        ShapefileDataStoreFactory dataStoreFactory = new ShapefileDataStoreFactory();
	
		        Map<String, Serializable> params = new HashMap<String, Serializable>();
		        params.put("url", newFile.toURI().toURL());
		        params.put("create spatial index", Boolean.TRUE);
	
		        ShapefileDataStore newDataStore = (ShapefileDataStore) dataStoreFactory.createNewDataStore(params);
		        newDataStore.createSchema(type);
		        newDataStore.forceSchemaCRS(DefaultGeographicCRS.WGS84);
		        
		        
		        Transaction transaction = new DefaultTransaction("create");
	
		        String typeName = newDataStore.getTypeNames()[0];
		        SimpleFeatureSource featureSource = newDataStore.getFeatureSource(typeName);
	
		        if (featureSource instanceof SimpleFeatureStore) {
		            SimpleFeatureStore featureStore = (SimpleFeatureStore) featureSource;
	
		            featureStore.setTransaction(transaction);
		            try {
		            	FeatureCollection<SimpleFeatureType, SimpleFeature> features = new ListFeatureCollection(type, collection);
		            	featureStore.addFeatures(features);
		                transaction.commit();
	
		            } catch (Exception problem) {
		                problem.printStackTrace();
		                transaction.rollback();
	
		            } finally {
		                transaction.close();
		            }
		        } else {
		            System.out.println(typeName + " does not support read/write access");
		        }
	        } catch (IOException e) {
				e.printStackTrace();
			}
		return newFile;
	}
	
	
	/**
	 * Gets the region id.
	 *
	 * @return the regionId
	 */
	public Long getRegionId() {
		return regionId;
	}

	/**
	 * Sets the region id.
	 *
	 * @param regionId the regionId to set
	 */
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}

	/**
	 * Gets the mu id.
	 *
	 * @return the muId
	 */
	public Long getMuId() {
		return muId;
	}

	/**
	 * Sets the mu id.
	 *
	 * @param muId the muId to set
	 */
	public void setMuId(Long muId) {
		this.muId = muId;
	}


	/**
	 * Gets the region name.
	 *
	 * @return the regionName
	 */
	public String getRegionName() {
		return regionName;
	}


	/**
	 * Sets the region name.
	 *
	 * @param regionName the regionName to set
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	/**
	 * Gets the management unit name.
	 *
	 * @return the managementUnitName
	 */
	public String getManagementUnitName() {
		return managementUnitName;
	}

	/**
	 * Sets the management unit name.
	 *
	 * @param managementUnitName the managementUnitName to set
	 */
	public void setManagementUnitName(String managementUnitName) {
		this.managementUnitName = managementUnitName;
	}
	
}
