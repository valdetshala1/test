package com.geoland.kfis.web.action.dem.importshape.validations;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.jdbc.Work;
import org.hibernate.spatial.GeometryType;
import org.hibernate.type.BigDecimalType;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.ImportStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.export.ExportBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class ShapeValidationsBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 26, 2016, 9:21:19 AM
 */
public class ShapeValidationsBaseAction extends ExportBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3662049914654937754L;

	/** The region code. */
	protected String regionCode;
	
	/** The mu code. */
	protected String muCode;
	
	/**
	 * Gets the region code.
	 *
	 * @return the region code
	 */
	public String getRegionCode() {
		return regionCode;
	}
	
	/**
	 * Sets the region code.
	 *
	 * @param regionCode the new region code
	 */
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	
	/**
	 * Gets the mu code.
	 *
	 * @return the mu code
	 */
	public String getMuCode() {
		return muCode;
	}
	
	/**
	 * Sets the mu code.
	 *
	 * @param muCode the new mu code
	 */
	public void setMuCode(String muCode) {
		this.muCode = muCode;
	}
	
	/**
	 * On fail import status.
	 *
	 * @param import_type the import type
	 * @return the string
	 */
	public String onFailImportStatus(String import_type){
		String query="select * from timport_status where is_active=true and import_type='"+import_type+"'";
		List<ImportStatus> isList = DAOFactory.getFactory().getImportStatusDAO().executeSQLQuery(query);
		if(isList!=null && isList.size()>0){
			ImportStatus is=isList.get(0);
			is.setEmployeeByEndUser(getUser().getEmployee());
			is.setEndDate(new Date());
			is.setIsActive(false);
			is.setStatus("Failure");
			
			DAOFactory.getFactory().getImportStatusDAO().save(is);
		}
//		Session currentSession = HibSessionFactory.getSessionFactory().getCurrentSession();
//		currentSession.doWork(new Work() {
//			 @Override
//            public void execute(Connection conn) throws SQLException {
//				String delete = "delete from shape_stand";
//				CallableStatement pc2 = conn.prepareCall(delete);
//				pc2.execute();
//			 }
//		});
		DAOFactory.getFactory().getShapeStandDAO().executeSQLQuery("delete from shape_stand");
		return "import_fail";
	}
	
	/**
	 * Gets the shape out state fields.
	 *
	 * @return the shape out state fields
	 */
	public String[][] getShapeOutStateFields(){
		String result[][]={
			{"stand_id", "String"},
			{"area_out", "Double"},
			{"geom_out", "Polygon:srid=4326"}
		};
		return result;
	}
	
	/**
	 * Gets the shape overlap stand.
	 *
	 * @return the shape overlap stand
	 */
	public String[][] getShapeOverlapStand(){
		String result[][]={
			{"fmr", "String"},
			{"mu", "String"},
			{"comp", "String"},
			{"stand", "String"},
			{"stand_id", "String"},
			{"comp_b", "String"},
			{"stand_b", "String"},
			{"stand_id_b", "String"},
			{"count_part", "Integer"},
			{"area", "Double"},
			{"the_geom", "Polygon:srid=4326"}
		};
		return result;
	}
	
	/**
	 * Gets the shape overlap stand GIS.
	 *
	 * @return the shape overlap stand GIS
	 */
	public String[][] getShapeOverlapStandGIS(){
		String result[][]={
			{"fmr", "String"},
			{"mu", "String"},
			{"comp", "String"},
			{"stand", "String"},
			{"stand_id", "String"},
			{"fmr_b", "String"},
			{"mu_b", "String"},
			{"comp_b", "String"},
			{"stand_b", "String"},
			{"stand_id_b", "String"},
			{"count_part", "Integer"},
			{"area", "Double"},
			{"perimeter", "Double"},
			{"the_geom", "Polygon:srid=4326"}
		};
		return result;
	}
	
	/**
	 * Gets the shape biodiv out stand.
	 *
	 * @return the shape biodiv out stand
	 */
	public String[][] getShapeBiodivOutStand(){
		String result[][]={
			{"biodiversi", "String"},
			{"comp_nr", "String"},
			{"stand_nr", "String"},
			{"area_out", "Double"},
			{"geom_out", "Polygon:srid=4326"}
		};
		return result;
	}
	
	/**
	 * Gets the shape plots out stand.
	 *
	 * @return the shape plots out stand
	 */
	public String[][] getshapePlotsOutStand(){
		String result[][]={
			{"plot_nr", "String"},
			{"comp_nr", "String"},
			{"stand_nr", "String"},
			{"area_out", "Double"},
			{"geom_out", "Polygon:srid=4326"}
		};
		return result;
	}
	
	/**
	 * Creates the simple feature out state.
	 *
	 * @param sfb the sfb
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeatureOutState(SimpleFeatureBuilder sfb){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		String query = "select stand_id,area_out,geom_out from get_shape_out_state()";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		
		sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("stand_id",StringType.INSTANCE);
		sqlQuery.addScalar("area_out",DoubleType.INSTANCE);
		sqlQuery.addScalar("geom_out",GeometryType.INSTANCE);
		
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				String stand_id = obj[0].toString();
				String area_out = obj[1].toString();
				String geom_out = obj[2].toString();
				sfb.add(stand_id);
				sfb.add(area_out);
				sfb.add(geom_out);
//				sfb.add(s.getTheGeom()!=null?geometryFactory.createGeometry((getMultipolygonVal(s.getTheGeom().toString()))):"");//the_geom
				
				SimpleFeature feature = sfb.buildFeature(null);
		        collection.add(feature);
			}
		}
		return collection;
	}
	
	/**
	 * Creates the simple feature overlap stand.
	 *
	 * @param sfb the sfb
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeatureOverlapStand(SimpleFeatureBuilder sfb){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		String query = "select fmr,mu,comp,stand,stand_id,comp_b,stand_b,stand_id_b,count_part,area from get_overlap_shape_stand()";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		
		sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("fmr",StringType.INSTANCE);
		sqlQuery.addScalar("mu",StringType.INSTANCE);
		sqlQuery.addScalar("comp",StringType.INSTANCE);
		sqlQuery.addScalar("stand",StringType.INSTANCE);
		sqlQuery.addScalar("stand_id",StringType.INSTANCE);
		sqlQuery.addScalar("comp_b",StringType.INSTANCE);
		sqlQuery.addScalar("stand_b",StringType.INSTANCE);
		sqlQuery.addScalar("stand_id_b",StringType.INSTANCE);
		sqlQuery.addScalar("count_part",IntegerType.INSTANCE);
		sqlQuery.addScalar("area",DoubleType.INSTANCE);
		sqlQuery.addScalar("the_geom",GeometryType.INSTANCE);
		
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				sfb.add(obj[0].toString());//fmr
				sfb.add(obj[1].toString());//mu
				sfb.add(obj[2].toString());//comp
				sfb.add(obj[3].toString());//stand
				sfb.add(obj[4].toString());//stand_id
				sfb.add(obj[5].toString());//comp_b
				sfb.add(obj[6].toString());//stand_b
				sfb.add(obj[7].toString());//stand_id_b
				sfb.add(obj[8].toString());//count_part
				sfb.add(obj[9].toString());//area
				sfb.add(obj[10].toString());//the_geom
				
				SimpleFeature feature = sfb.buildFeature(null);
		        collection.add(feature);
			}
		}
		return collection;
	}
	
	/**
	 * Creates the simple feature overlap stand GIS.
	 *
	 * @param sfb the sfb
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeatureOverlapStandGIS(SimpleFeatureBuilder sfb){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		String query = "select fmr,mu,comp,stand,stand_id,fmr_b,mu_b,comp_b,stand_b,stand_id_b,count_part,area,perimeter from get_overlap_shape_gis()";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		
		sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("fmr",StringType.INSTANCE);
		sqlQuery.addScalar("mu",StringType.INSTANCE);
		sqlQuery.addScalar("comp",StringType.INSTANCE);
		sqlQuery.addScalar("stand",StringType.INSTANCE);
		sqlQuery.addScalar("stand_id",StringType.INSTANCE);
		sqlQuery.addScalar("fmr_b",StringType.INSTANCE);
		sqlQuery.addScalar("mu_b",StringType.INSTANCE);
		sqlQuery.addScalar("comp_b",StringType.INSTANCE);
		sqlQuery.addScalar("stand_b",StringType.INSTANCE);
		sqlQuery.addScalar("stand_id_b",StringType.INSTANCE);
		sqlQuery.addScalar("count_part",IntegerType.INSTANCE);
		sqlQuery.addScalar("area",DoubleType.INSTANCE);
		sqlQuery.addScalar("perimeter",DoubleType.INSTANCE);
		sqlQuery.addScalar("the_geom",GeometryType.INSTANCE);
		
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				sfb.add(obj[0].toString());//fmr
				sfb.add(obj[1].toString());//mu
				sfb.add(obj[2].toString());//comp
				sfb.add(obj[3].toString());//stand
				sfb.add(obj[4].toString());//stand_id
				sfb.add(obj[5].toString());//fmr_b
				sfb.add(obj[6].toString());//mu_b
				sfb.add(obj[7].toString());//comp_b
				sfb.add(obj[8].toString());//stand_b
				sfb.add(obj[9].toString());//stand_id_b
				sfb.add(obj[10].toString());//count_part
				sfb.add(obj[11].toString());//area
				sfb.add(obj[12].toString());//the_geom
				
				SimpleFeature feature = sfb.buildFeature(null);
		        collection.add(feature);
			}
		}
		return collection;
	}
	
	/**
	 * Creates the simple feature shape biodiv out stand.
	 *
	 * @param sfb the sfb
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeatureShapeBiodivOutStand(SimpleFeatureBuilder sfb){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		String query = "select biodiversi,comp_nr,stand_nr,area_out from get_biodiv_out_stand('"+regionCode+"','"+muCode+"')";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		
		
		sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("biodiversi",StringType.INSTANCE);
		sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
		sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
		sqlQuery.addScalar("area_out",BigDecimalType.INSTANCE);
		sqlQuery.addScalar("geom_out",GeometryType.INSTANCE);
		
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				sfb.add(obj[0].toString());//biodiversi
				sfb.add(obj[1].toString());//comp_nr
				sfb.add(obj[2].toString());//stand_nr
				sfb.add(obj[3].toString());//area_out
				sfb.add(obj[4].toString());//geom_out
				
				SimpleFeature feature = sfb.buildFeature(null);
		        collection.add(feature);
			}
		}
		return collection;
	}
	
	/**
	 * Creates the simple feature shape plots out stand.
	 *
	 * @param sfb the sfb
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeatureShapePlotsOutStand(SimpleFeatureBuilder sfb){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		String query = "select plot_nr,comp_nr,stand_nr,area_out from get_plot_out_stand('"+regionCode+"','"+muCode+"')";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		
		
		sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("plot_nr",StringType.INSTANCE);
		sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
		sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
		sqlQuery.addScalar("area_out",BigDecimalType.INSTANCE);
		sqlQuery.addScalar("geom_out",GeometryType.INSTANCE);
		
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			for(int i=0; i<list.size();i++){
				Object obj[] =(Object[])list.get(i);
				sfb.add(obj[0].toString());//plot_nr
				sfb.add(obj[1].toString());//comp_nr
				sfb.add(obj[2].toString());//stand_nr
				sfb.add(obj[3].toString());//area_out
				sfb.add(obj[4].toString());//geom_out
				
				SimpleFeature feature = sfb.buildFeature(null);
		        collection.add(feature);
			}
		}
		return collection;
	}
	
	/**
	 * Export data to shapefile.
	 *
	 * @param type the type
	 * @param collection the collection
	 * @return the file
	 */
	public File exportDataToShapefile(SimpleFeatureType type,List<SimpleFeature> collection){
	        File newFile=null;
	        try {
				newFile = File.createTempFile("to_shape_validations", ".shp");
				
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
}
