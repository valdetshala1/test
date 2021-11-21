/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.plot;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import nl.knaw.dans.common.dbflib.CorruptedTableException;
import nl.knaw.dans.common.dbflib.Field;
import nl.knaw.dans.common.dbflib.IfNonExistent;
import nl.knaw.dans.common.dbflib.Record;
import nl.knaw.dans.common.dbflib.Table;

import org.geotools.data.FileDataStore;
import org.geotools.feature.FeatureCollection;
import org.geotools.feature.FeatureIterator;
import org.opengis.feature.Property;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.ShapePlotTrees;
import com.geoland.kfis.model.ShapePlots;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.dem.importshape.ImportShapeBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class ImportPlotBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 19, 2015, 10:15:47 AM
 */
public class ImportPlotBaseAction extends ImportShapeBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6445229811824742343L;
	
	/** The dbf tree file. */
	protected File dbfTreeFile;
	
	/** The dbf tree name. */
	protected String dbfTreeName;
	
	/** The dbf tree ext. */
	protected String dbfTreeExt;
	
	
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
	 * Get values from the FileDataStore and save into DB.
	 *
	 * @param fds the fds
	 */
	public void savePlots(FileDataStore fds) {
		FeatureCollection<SimpleFeatureType, SimpleFeature> collection = getFeatureCollection(
				fds, 0);
		try (FeatureIterator<SimpleFeature> features = collection.features()) {
			List<ShapePlots> plotList = new ArrayList<ShapePlots>();
			while (features.hasNext()) {
				SimpleFeature feature = features.next();
				ShapePlots plot = new ShapePlots();

				Property p = getFieldProperty(feature.getProperties(),"the_geom");
				plot.setWkbGeometry(getMultipolygonVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"PLOT_NR");
				plot.setPlotNr(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"COMP_NR");
				plot.setCompNr(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"STAND_NR");
				plot.setStandNr(getStringVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"VISITED");
				
				p = getFieldProperty(feature.getProperties(),"PLOTTYPE");
				plot.setPlottype(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"SLOPE");
				plot.setSlope(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"LITTERCOV");
				plot.setLittercov(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"AGE");
				plot.setAge(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"CROWNCOV");
				plot.setCrowncov(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"C_STEMS1");
				plot.setCStems1(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"C_STEMS2");
				plot.setCStems2(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"C_DAMAGE");
				plot.setCDamage(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"C_SUPRESS");
				plot.setCSupress(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"C_DISTRIB");
				plot.setCDistrib(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"B_STEMS1");
				plot.setBStems1(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"B_STEMS2");
				plot.setBStems2(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"B_DAMAGE");
				plot.setBDamage(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"B_SUPRESS");
				plot.setBSupress(getBigDecimalVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"B_DISTRIB");
				plot.setBDistrib(getBigDecimalVal(p.getValue()));

//				p = getFieldProperty(feature.getProperties(),"X");
//				plot.setX(getBigDecimalVal(p.getValue()));
//
//				p = getFieldProperty(feature.getProperties(),"Y");
//				plot.setY(getBigDecimalVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"TIME_");
				plot.setTime(getStringVal(p.getValue()));
				
				p = getFieldProperty(feature.getProperties(),"DATE_");
				plot.setDate(getDateVal(p.getValue()));

				p = getFieldProperty(feature.getProperties(),"taksator");
				plot.setTaksator(getStringVal(p.getValue()));

				plotList.add(plot);
			}
			for (ShapePlots sp : plotList) {
				DAOFactory.getFactory().getShapePlotsDAO().save(sp);
			}
		}
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
	 * Gets the DBF fields.
	 *
	 * @param table the table
	 * @return the DBF fields
	 */
	public List<Field> getDBFFields(Table table){
		List<Field> fields=null;
		try {
			table.open(IfNonExistent.ERROR);
			fields = table.getFields();
		} catch (CorruptedTableException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{	
			try {
				table.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fields;
	}
	
	/**
	 * Gets the DBF field.
	 *
	 * @param fields the fields
	 * @param name the name
	 * @return the DBF field
	 */
	public Field getDBFField(List<Field> fields,String name){
		for(Field f:fields){
			if(name.equalsIgnoreCase(f.getName().toString()))
				return f;
		}
		return null;
	}
	
	/**
	 * Dbf field type.
	 *
	 * @param f the f
	 * @param name the name
	 * @param type the type
	 */
	public void dbfFieldType(Field f, String name, String type) {
		String featureType = f.getType().toString();
		if (!(type.equals(featureType) || type.equalsIgnoreCase("FLOAT") || type.equalsIgnoreCase("NUMBER"))){
			Object[] o={name,featureType,type};
			addFieldError(name, MessageFormat.format(getMessage("feature.attribute.not.matching"), o));
		}
	}
	
	/**
	 * Check DBF attributes.
	 *
	 * @param fields the fields
	 * @param tableFields the table fields
	 */
	public void checkDBFAttributes(List<Field> fields,String tableFields[][]) {
		for(int i=0;i<tableFields.length;i++){
			String name=tableFields[i][0];
			String type=tableFields[i][1];
			Field f = getDBFField(fields,name);
			if(f==null)
				addFieldError(name, MessageFormat.format(getMessage("field.missing"),name));//field from table is missing
			else dbfFieldType(f,name,type);
		}
	}
	
	/**
	 * Gets the DBF field string value.
	 *
	 * @param record the record
	 * @param field the field
	 * @return the DBF field string value
	 */
	public String getDBFFieldStringValue(Record record,String field){
		String result = record.getStringValue(field);
		return result;
	}
	
	/**
	 * Gets the DBF field number value.
	 *
	 * @param record the record
	 * @param field the field
	 * @return the DBF field number value
	 */
	public String getDBFFieldNumberValue(Record record,String field){
		String result = record.getNumberValue(field).toString();
		return result;
	}
	
	/**
	 * Save plot trees.
	 *
	 * @param dbfTreeFile the dbf tree file
	 */
	public void savePlotTrees(File dbfTreeFile){
		Table table = new Table(dbfTreeFile);
		try {
			
			table.open(IfNonExistent.ERROR);
			
			List<ShapePlotTrees> sptList= new ArrayList<ShapePlotTrees>();
			
			Iterator<Record> iterator = table.recordIterator();
			while (iterator.hasNext())
			{
			    Record record = iterator.next();
			    ShapePlotTrees pt=new ShapePlotTrees();
			    String n =null;//number
			    String s =null;//character
			    
			    n = getDBFFieldNumberValue(record,"PLOTID");
			    pt.setPlotid(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"TREEID");
			    pt.setTreeid(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"HEALTH");
			    pt.setHealth(new BigDecimal(n));
			    
			    s = getDBFFieldStringValue(record, "NAME");
			    pt.setName(s);
			    
			    s = getDBFFieldStringValue(record, "PLOTTREEID");
			    pt.setPlottreeid(s);
			    
			    n = getDBFFieldNumberValue(record,"INCOMPLETE");
			    pt.setIncomplete(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"HEIGHT");
			    pt.setHeight(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"INCREMENT");
			    pt.setIncrement(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"DIAMETER");
			    pt.setDiameter(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"TESTMARK");
			    pt.setTestmark(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"SPECCODE");
			    pt.setSpeccode(new BigDecimal(n));
			    
			    n = getDBFFieldNumberValue(record,"TECHCODE");
			    pt.setTechcode(new BigDecimal(n));
			    
			    sptList.add(pt);
			}
			
			for(ShapePlotTrees t:sptList)
				DAOFactory.getFactory().getShapePlotTreesDAO().save(t);
			
		}catch (CorruptedTableException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			addFieldError("", getMessage("Error reading dbf file"));
			e.printStackTrace();
		} finally {
			try {
				table.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * Gets the dbf tree file.
	 *
	 * @return the dbfTreeFile
	 */
	public File getDbfTreeFile() {
		return dbfTreeFile;
	}

	/**
	 * Sets the dbf tree file.
	 *
	 * @param dbfTreeFile the dbfTreeFile to set
	 */
	public void setDbfTreeFile(File dbfTreeFile) {
		this.dbfTreeFile = dbfTreeFile;
	}

	/**
	 * Gets the dbf tree ext.
	 *
	 * @return the dbfTreeExt
	 */
	public String getDbfTreeExt() {
		return dbfTreeExt;
	}

	/**
	 * Sets the dbf tree ext.
	 *
	 * @param dbfTreeExt the dbfTreeExt to set
	 */
	public void setDbfTreeExt(String dbfTreeExt) {
		this.dbfTreeExt = dbfTreeExt;
	}


	/**
	 * Gets the dbf tree name.
	 *
	 * @return the dbfTreeName
	 */
	public String getDbfTreeName() {
		return dbfTreeName;
	}


	/**
	 * Sets the dbf tree name.
	 *
	 * @param dbfTreeName the dbfTreeName to set
	 */
	public void setDbfTreeName(String dbfTreeName) {
		this.dbfTreeName = dbfTreeName;
	}
	
}
