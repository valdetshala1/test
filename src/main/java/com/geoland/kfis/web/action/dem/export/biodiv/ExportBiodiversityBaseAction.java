/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.biodiv;

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
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.Biodiversity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.export.ExportBaseAction;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportBiodiversityBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 21, 2016, 11:26:23 AM
 */
public class ExportBiodiversityBaseAction extends ExportBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7949867875876352158L;

	/** The region id. */
	protected Long regionId;
	
	/** The region name. */
	protected String regionName;
	
	/** The mu id. */
	protected Long muId;
	
	/** The management unit name. */
	protected String managementUnitName;
	
	/**
	 * Gets the biodiv table fields.
	 *
	 * @return the biodiv table fields
	 */
	public String[][] getBiodivTableFields(){
		String result[][]={{"the_geom", "Point"},{"Biocode", "Double"},{"Remarks", "String"},{"Comp_nr", "Double"},
							{"Stand_nr", "String"},{"Biodiversi", "Double"},{"Timeform", "String"},{"Taksator", "String"}
				};
		return result;
	}
	
	/**
	 * Creates the simple feature.
	 *
	 * @param s the s
	 * @param biodivList the biodiv list
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeature(SimpleFeatureBuilder s,List<Biodiversity> biodivList){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		for(Biodiversity b:biodivList){
			GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 900916);
			s.add(b.getTheGeom()!=null?geometryFactory.createGeometry((getMultipolygonVal(b.getTheGeom().toString()))):"");//the_geom
			s.add(b.getBiodiversityName()!=null?b.getBiodiversityName().getCode():"");//Biocode
			s.add(b.getRemarks());//Remarks
			s.add(b.getStand()!=null?b.getStand().getCompartment().getCompNr():"");//Comp_nr
			s.add(b.getStand()!=null?b.getStand().getStandNr():"");//Stand_nr
			s.add("");//Biodiversi
			s.add(b.getTimeform());//Timeform
			s.add(b.getTaksator());//Taksator

			SimpleFeature feature = s.buildFeature(null);
	        collection.add(feature);
		}
		return collection;
	}
	
	/**
	 * Export biodiv data to shapefile.
	 *
	 * @param regionId the region id
	 * @param muId the mu id
	 * @return the file
	 */
	public File exportBiodivDataToShapefile(Long regionId, Long muId){
	        File newFile=null;
	        try {
		        final SimpleFeatureType type = createSimpleFeatureType(getBiodivTableFields());
		       
		        
		        SimpleFeatureBuilder featureBuilder = new SimpleFeatureBuilder(type);
	
		        String query = "select b.* from tgis_biodiv b " +
		        		" left join tgis_stand as st on st.id=b.stand_id " +
						" left join tgis_compartment as co on co.id = st.compartment_id " +
						" left join tgis_mu_period as mup on co.mup_id = mup.id " +
						" left join tgis_management_unit as mu on mu.id = mup.mu_id " +
						" left join tgis_cadastral_municipality as cm on cm.id=co.mun_id where mup.isactive='Y'";
		        if(regionId!=null)
		        	query+=" and mu.region_id = "+regionId;
		        if(muId!=null)
		        	query+=" and mu.id = "+muId;
		        
		        List<Biodiversity> biodivList = DAOFactory.getFactory().getBiodiversityDAO().executeSQLQuery(query);	

		        List<SimpleFeature> collection = createSimpleFeature(featureBuilder, biodivList);
				newFile = File.createTempFile("biodiv_to_shape_export", ".shp");
				
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
