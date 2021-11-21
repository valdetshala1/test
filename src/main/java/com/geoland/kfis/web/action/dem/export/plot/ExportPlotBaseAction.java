/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.plot;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
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
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.Plot;
import com.geoland.kfis.model.PlotTree;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.export.ExportBaseAction;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;

import nl.knaw.dans.common.dbflib.CorruptedTableException;
import nl.knaw.dans.common.dbflib.DbfLibException;
import nl.knaw.dans.common.dbflib.Field;
import nl.knaw.dans.common.dbflib.IfNonExistent;
import nl.knaw.dans.common.dbflib.InvalidFieldLengthException;
import nl.knaw.dans.common.dbflib.InvalidFieldTypeException;
import nl.knaw.dans.common.dbflib.Table;
import nl.knaw.dans.common.dbflib.Type;
import nl.knaw.dans.common.dbflib.Version;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportPlotBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 18, 2016, 3:28:51 PM
 */
public class ExportPlotBaseAction extends ExportBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4615927415118048084L;
	
	/** The region id. */
	protected Long regionId;
	
	/** The region name. */
	protected String regionName;
	
	/** The mu id. */
	protected Long muId;
	
	/** The management unit name. */
	protected String managementUnitName;
	
	
	/**
	 * Gets the p lots table fields.
	 *
	 * @return the p lots table fields
	 */
	public String[][] getPLotsTableFields(){
		String result[][]={{"the_geom", "Point"},{"PLOT_NR", "Integer"},{"COMP_NR", "Integer"},{"STAND_NR", "String"},{"VISITED", "Integer"},{"PLOTTYPE", "Integer"},{"SLOPE", "Integer"},
				{"LITTERCOV", "Integer"},{"AGE", "Integer"},{"CROWNCOV", "Integer"},{"C_STEMS1", "Integer"},{"C_STEMS2", "Integer"},{"C_DAMAGE", "Integer"},{"C_SUPRESS", "Integer"},
				{"C_DISTRIB", "Integer"},{"B_STEMS1", "Integer"},{"B_STEMS2", "Integer"},{"B_DAMAGE", "Integer"},
				{"B_SUPRESS", "Integer"},{"B_DISTRIB", "Integer"},/*{"X", "Double"},{"Y", "Double"},*/{"TIME_", "String"},
				{ "DATE_", "Date"}, { "taksator", "String"}
				};
		return result;
	}
	
	/**
	 * Creates the simple feature.
	 *
	 * @param s the s
	 * @param plotList the plot list
	 * @return the list
	 */
	public List<SimpleFeature> createSimpleFeature(SimpleFeatureBuilder s,List<Plot> plotList){
		List<SimpleFeature> collection=new ArrayList<SimpleFeature>();
		for(Plot p:plotList){
//			GeometryFactory geometryFactory = JTSFactoryFinder.getGeometryFactory(null);
			GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 900916);
			s.add(p.getGeom()!=null?geometryFactory.createGeometry((getMultipolygonVal(p.getGeom().toString()))):"");//the_geom
			s.add(p.getPlotNr());//PLOT_NR
			s.add(p.getStand().getCompartment().getCompNr());//COMP_NR
			s.add(p.getStand().getStandNr());//STAND_NR
			s.add(p.getVisited());//VISITED
			s.add(p.getPlottype());//PLOTTYPE
			s.add(p.getSlope());//SLOPE
			s.add(p.getCDistrib());//C_DISTRIB
			s.add(p.getAge());//AGE
			s.add(p.getCrowncov());//CROWNCOV
			s.add(p.getCStems1());//C_STEMS1
			s.add(p.getCStems2());//C_STEMS2
			s.add(p.getCDamage());//C_DAMAGE
			s.add(p.getCSupress());//C_SUPRESS
			s.add(p.getCDistrib());//C_DISTRIB
			s.add(p.getBStems1());//B_STEMS1
			s.add(p.getBStems2());//B_STEMS2
			s.add(p.getBDamage());//B_DAMAGE
			s.add(p.getTime());//TIME_
			s.add(p.getDate());//DATE_
			s.add(p.getTaksator());//taksator
			
			SimpleFeature feature = s.buildFeature(null);
	        collection.add(feature);
		}
		return collection;
	}
	
	/**
	 * Export plot data to shapefile.
	 *
	 * @param regionId the region id
	 * @param muId the mu id
	 * @return the file
	 */
	public File exportPlotDataToShapefile(Long regionId, Long muId){
	        File newFile=null;
	        try {
		        final SimpleFeatureType type = createSimpleFeatureType(getPLotsTableFields());
		       
		        
		        SimpleFeatureBuilder featureBuilder = new SimpleFeatureBuilder(type);
	
		        String query = "select pl.* from tgis_plots pl " +
		        		" left join tgis_stand as st on st.id=pl.stand_id " +
						" left join tgis_compartment as co on co.id = st.compartment_id " +
						" left join tgis_mu_period as mup on co.mup_id = mup.id " +
						" left join tgis_management_unit as mu on mu.id = mup.mu_id " +
						" left join tgis_cadastral_municipality as cm on cm.id=co.mun_id where mup.isactive='Y'";
		        if(regionId!=null)
		        	query+=" and mu.region_id = "+regionId;
		        if(muId!=null)
		        	query+=" and mu.id = "+muId;
		        
		        List<Plot> plotList = DAOFactory.getFactory().getPlotDAO().executeSQLQuery(query);	

		        List<SimpleFeature> collection = createSimpleFeature(featureBuilder, plotList);
				newFile = File.createTempFile("plot_to_shape_export", ".shp");
				
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
	 * Gets the plots tree table fields.
	 *
	 * @return the plots tree table fields
	 */
	public String[][] getPlotsTreeTableFields(){
		String result[][]={{"PLOTID", "NUMBER"},{"TREEID", "NUMBER"},{"HEALTH", "NUMBER"},{"NAME", "CHARACTER"},{"INCOMPLETE", "FLOAT"},{"HEIGHT", "NUMBER"},
				{"INCREMENT", "FLOAT"},{"DIAMETER", "FLOAT"},{"TESTMARK", "FLOAT"},{"PLOTTREEID", "CHARACTER"},{"SPECCODE", "NUMBER"},{"TECHCODE", "NUMBER"}
				};
		return result;
	}
	
	/**
	 * Adds the records.
	 *
	 * @param pt the pt
	 * @return the object[]
	 */
	public Object[] addRecords(PlotTree pt){
		Object[] o=new Object[12];
		System.out.println(pt.getPlotNr());
		o[0]=pt.getPlotNr();
		System.out.println(o[0]);
		o[1]=pt.getTreeid();
		o[2]=pt.getHealth();
		o[3]=pt.getName();
		o[4]=pt.getIncomplete();
		o[5]=pt.getHeight();
		o[6]=pt.getIncrement();
		o[7]=pt.getDiameter();
		o[8]=pt.getTestmark();
		o[9]=pt.getPlottreeid();
		o[10]=pt.getSpeccode();
		o[11]=pt.getTechcode();
		
		return o;
	}
	
	/**
	 * Gets the table fields.
	 *
	 * @return the table fields
	 */
	public List<Field> getTableFields(){
		final List<Field> fields = new ArrayList<Field>();
		fields.add(new Field("PLOTID", Type.NUMBER,18,0));
        fields.add(new Field("TREEID", Type.NUMBER,18,0));
        fields.add(new Field("HEALTH", Type.NUMBER,18,0));
        fields.add(new Field("NAME", Type.CHARACTER,28));
        fields.add(new Field("INCOMPLETE", Type.NUMBER,18,2));
        fields.add(new Field("HEIGHT", Type.NUMBER,18,0));
        fields.add(new Field("INCREMENT", Type.NUMBER,18,2));
        fields.add(new Field("DIAMETER", Type.NUMBER,18,2));
        fields.add(new Field("TESTMARK", Type.NUMBER,18,2));
        fields.add(new Field("PLOTTREEID", Type.CHARACTER,18,0));
        fields.add(new Field("SPECCODE", Type.NUMBER,18,0));
        fields.add(new Field("TECHCODE", Type.NUMBER,18,0));
		
		return fields;
	}
	
	/**
	 * Adds the record test.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws DbfLibException the dbf lib exception
	 */
	public void addRecordTest()
            throws IOException, DbfLibException
{
final File outputDir = new File("target/");
outputDir.mkdirs();

final File tableFile = new File(outputDir, "ADDRECORDS.DBF");

final List<Field> fields = new ArrayList<Field>();
fields.add(new Field("INT", Type.NUMBER, 5, 0));
fields.add(new Field("DEC", Type.NUMBER, 5, 2));
fields.add(new Field("CHAR", Type.CHARACTER, 10));
fields.add(new Field("LOGICAL", Type.LOGICAL, 1));
fields.add(new Field("FLOAT", Type.FLOAT, 8, 2));

final Table table = new Table(tableFile, Version.DBASE_4, fields);

table.open(IfNonExistent.CREATE);

try
{
 table.addRecord(12345);
 table.addRecord(0, 12.34);
 table.addRecord(0, 99.99, "TEST", true, 777.77);
}
finally
{
 table.close();
}
}
	
	/**
	 * Export plot tree data to shapfefile.
	 *
	 * @param f the f
	 * @param regionId the region id
	 * @param muId the mu id
	 * @return the file
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public File exportPlotTreeDataToShapfefile(File f,Long regionId, Long muId) throws IOException{
		File file=null;
		Table table=null;
		try
		{	
			final File outputDir = f.getParentFile();
			outputDir.mkdirs();
			Date ts = new Date();
			String name=ts.toString().replaceAll(" ","").replaceAll(":","_");
			file=new File(outputDir, name+".dbf");//new File(outputDir,"export_pltree.DBF");
			List<Field> fields = getTableFields();
			table = new Table(file,Version.DBASE_4,fields);
		    table.open(IfNonExistent.CREATE);
		    String query = "select plt.* from tgis_plot_tree plt" +
		    		" left join tgis_plots pl on pl.id=plt.plot_id " +
	        		" left join tgis_stand as st on st.id=pl.stand_id " +
					" left join tgis_compartment as co on co.id = st.compartment_id " +
					" left join tgis_mu_period as mup on co.mup_id = mup.id " +
					" left join tgis_management_unit as mu on mu.id = mup.mu_id " +
					" left join tgis_cadastral_municipality as cm on cm.id=co.mun_id where mup.isactive='Y'";
	        if(regionId!=null)
	        	query+=" and mu.region_id = "+regionId;
	        if(muId!=null)
	        	query+=" and mu.id = "+muId;

	        List<PlotTree> ptList = DAOFactory.getFactory().getPlotTreeDAO().executeSQLQuery(query);
	        for(PlotTree pt:ptList){
//	        	 Object[] rec = addRecords(pt);
	        	try {
	        		table.addRecord(pt.getPlotNr().intValue(),pt.getTreeid().intValue(),pt.getHealth(),pt.getName(),pt.getIncomplete(),pt.getHeight(),pt.getIncrement(),pt.getDiameter(),pt.getTestmark(),
	        				pt.getPlottreeid(),pt.getSpeccode(),pt.getTechcode());
				} catch (DbfLibException e) {
					e.printStackTrace();
				}
	        }

		} 
		 catch (IOException ex2) {
            ex2.printStackTrace();
        }catch (CorruptedTableException e) {
			e.printStackTrace();
		} catch (InvalidFieldTypeException e1) {
			e1.printStackTrace();
		} catch (InvalidFieldLengthException e1) {
			e1.printStackTrace();
		} catch (DbfLibException e1) {
			e1.printStackTrace();
		}
		finally
		{
		    try {
				table.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return file;
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
