/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.geotools.data.FileDataStore;
import org.geotools.data.FileDataStoreFinder;
import org.geotools.data.Query;
import org.geotools.data.simple.SimpleFeatureSource;
import org.geotools.feature.FeatureCollection;
import org.geotools.feature.FeatureIterator;
import org.opengis.feature.Property;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.ImportStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class ImportShapeBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 2, 2015, 4:00:15 PM
 */
public class ImportShapeBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6687324981751948322L;

	/** The shape file. */
	protected File shapeFile;
	
	/** The shape file name. */
	protected String shapeFileName;
	
	/** The shape file ext. */
	protected String shapeFileExt;
	
	/** The dbf file. */
	protected File dbfFile;
	
	/** The dbf file name. */
	protected String dbfFileName;
	
	/** The dbf file ext. */
	protected String dbfFileExt;
	
	/** The shx file. */
	protected File shxFile;
	
	/** The shx file name. */
	protected String shxFileName;
	
	/** The shx file ext. */
	protected String shxFileExt;
	
	/** The file data store. */
	protected FileDataStore fileDataStore;
	
	/** The region id. */
	protected Long regionId;
	
	/** The management unit id. */
	protected Long managementUnitId;
	
	/** The region name. */
	protected String regionName;
	
	/** The management unit name. */
	protected String managementUnitName;
	
	/** The note. */
	protected String note;
	
	/** The datefrom. */
	protected String datefrom;
	
	/** The dateto. */
	protected String dateto;
	
	/** The shpf. */
	protected File shpf;
	
	/** The shxf. */
	protected File shxf;
	
	/** The dbff. */
	protected File dbff;
	
	/** The import type. */
	protected String import_type;
	
	/** The region code. */
	protected String regionCode;
	
	/** The mu code. */
	protected String muCode;
	
	/**
	 * Get the path of File without filename.
	 *
	 * @param f the f
	 * @return path of file
	 */
	public String path(File f) {
		if(f!=null){
			int sep = f.getPath().lastIndexOf("\\");
			return f.getPath().substring(0, sep);
		}
		return null;
	}

	/**
	 * Get datastore from uploaded files.
	 *
	 * @param shapeFile the shape file
	 * @param dbfFile the dbf file
	 * @param shxFile the shx file
	 * @param filename the filename
	 * @return datastore
	 */
	public FileDataStore getFileDataStoreFromShape(File shapeFile,
			File dbfFile, File shxFile,String filename) {
		FileDataStore shpData = null;
		deleteTempFiles(path(shapeFile),filename);
		// create shape files with proper extensions
		shpf = new File(path(shapeFile) + "\\"+filename+".shp");
		dbff = new File(path(shapeFile) + "\\"+filename+".dbf");
		shxf = new File(path(shapeFile) + "\\"+filename+".shx");
		// rename uploaded files with new ones
		shapeFile.renameTo(shpf);
		dbfFile.renameTo(dbff);
		shxFile.renameTo(shxf);

		try {
			shpData = FileDataStoreFinder.getDataStore(shpf);
			if (shpData != null) {
				return shpData;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Get Feature Collection from given parameters.
	 *
	 * @param fds            , FileDataStore
	 * @param maxFeatures            , number of features to get; If maxFeatures is 0 get all
	 *            features
	 * @return collection
	 */
	public FeatureCollection<SimpleFeatureType, SimpleFeature> getFeatureCollection(
			FileDataStore fds, int maxFeatures) {
		try {
			SimpleFeatureSource source = fds.getFeatureSource();
			SimpleFeatureType schema = source.getSchema();

			Query query = new Query(schema.getTypeName());
			if (maxFeatures == 0)
				query.setMaxFeatures(query.getMaxFeatures());
			else
				query.setMaxFeatures(maxFeatures);

			FeatureCollection<SimpleFeatureType, SimpleFeature> collection = source
					.getFeatures(query);
			return collection;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Get all attributes of the collection.
	 *
	 * @param collection the collection
	 * @return the shape attributes
	 */
	public List<SimpleFeature> getShapeAttributes(
			FeatureCollection<SimpleFeatureType, SimpleFeature> collection) {
		List<SimpleFeature> attrs = new ArrayList<SimpleFeature>();
		try (FeatureIterator<SimpleFeature> features = collection.features()) {
			while (features.hasNext()) {
				SimpleFeature feature = features.next();
				attrs.add(feature);
			}
		}
		return attrs;
	}

	/**
	 * Get Name of attributes of shape from a given collection.
	 *
	 * @param collection the collection
	 * @return list of names
	 */
	public List<String> getShapeAttrNames(
			FeatureCollection<SimpleFeatureType, SimpleFeature> collection) {
		List<String> attrs = new ArrayList<String>();
		try (FeatureIterator<SimpleFeature> features = collection.features()) {
			while (features.hasNext()) {
				SimpleFeature feature = features.next();
				for (Property attribute : feature.getProperties()) {
					attrs.add(attribute.getName().getLocalPart());
				}
			}
		}
		return attrs;
	}

	/**
	 * Get Type of attributes from a given collection.
	 *
	 * @param collection the collection
	 * @return list of types
	 */
	public List<String> getShapeAttrTypes(
			FeatureCollection<SimpleFeatureType, SimpleFeature> collection) {
		List<String> attrs = new ArrayList<String>();
		try (FeatureIterator<SimpleFeature> features = collection.features()) {
			while (features.hasNext()) {
				SimpleFeature feature = features.next();
				for (Property attribute : feature.getProperties()) {
					String st = attribute.getType().toString();
					int start = st.indexOf("<");
					int end = st.indexOf(">");
					attrs.add(st.substring(start + 1, end));
				}
			}
		}
		return attrs;
	}

	/**
	 * Get Value of attributes from a given collection.
	 *
	 * @param collection the collection
	 * @return list of values
	 */
	public List<String> getShapeAttrValues(
			FeatureCollection<SimpleFeatureType, SimpleFeature> collection) {
		List<String> attrs = new ArrayList<String>();
		try (FeatureIterator<SimpleFeature> features = collection.features()) {
			while (features.hasNext()) {
				SimpleFeature feature = features.next();
				for (Property attribute : feature.getProperties()) {
					attrs.add(attribute.getValue().toString());
				}
			}
		}
		return attrs;
	}

	/**
	 * Get type of attribute to use in java.
	 *
	 * @param st the st
	 * @return type
	 */
	public String getTypeOfFeature(String st) {
		int start = st.indexOf("<");
		int end = st.indexOf(">");
		if (start == -1 && end == -1)
			return st;
		return st.substring(start + 1, end);

	}

	/**
	 * Check for missing attribute name and mismatching attribute type, add
	 * custom field errors if necessary.
	 *
	 * @param p the p
	 * @param name the name
	 * @param type the type
	 */
	public void featureNameType(Property p, String name, String type) {
		String featureType = getTypeOfFeature(p.getType().toString());
		if (!(type.equals(featureType) || type.equalsIgnoreCase("BigDecimal") || type.equalsIgnoreCase("Double") || type.equalsIgnoreCase("Integer") || type.equalsIgnoreCase("Numeric"))){
			Object[] o={name,featureType,type};
			addFieldError(name, MessageFormat.format(getMessage("feature.attribute.not.matching"), o));
		}
	}
	
	
	/**
	 * Gets the field property.
	 *
	 * @param props the props
	 * @param name the name
	 * @return the field property
	 */
	public Property getFieldProperty(Collection<Property> props,String name){
		for(Property p:props){
			if(name.equalsIgnoreCase(p.getName().toString()))
				return p;
		}
		return null;
	}
	
	/**
	 * Check all attributes from shape file.
	 *
	 * @param ft the ft
	 * @param tableFields the table fields
	 */
	public void checkAttributes(SimpleFeature ft,String tableFields[][]) {
		Collection<Property> props = ft.getProperties();
		for(int i=0;i<tableFields.length;i++){
			String name=tableFields[i][0];
			String type=tableFields[i][1];
			Property p = getFieldProperty(props,name);
			if(p==null)
				addFieldError(name, MessageFormat.format(getMessage("field.missing"),name));//field from table is missing
			else featureNameType(p,name,type);
		}
	}

	/**
	 * Get value of a given attribute in the feature.
	 *
	 * @param ft the ft
	 * @param name the name
	 * @return value, or null
	 */
	public String getAttrVal(SimpleFeature ft, String name) {
		Property prop = ft.getProperty(name);
		if (prop != null)
			return prop.getValue().toString();
		return null;
	}

	/**
	 * Get String value from the given object.
	 *
	 * @param s the s
	 * @return the string val
	 */
	public String getStringVal(Object s) {
		if (s != null) {
			return s.toString();
		}
		return null;
	}

	/**
	 * Get Double value from the given object.
	 *
	 * @param s the s
	 * @return the double val
	 */
	public Double getDoubleVal(Object s) {
		if (s != null) {
			return new Double(s.toString());
		}
		return null;
	}

	/**
	 * Get Integer value from the given object.
	 *
	 * @param s the s
	 * @return the integer val
	 */
	public Integer getIntegerVal(Object s) {
		if (s != null) {
			return new Integer(s.toString());
		}
		return null;
	}

	/**
	 * Get BigDecimal value from the given object.
	 *
	 * @param s the s
	 * @return the big decimal val
	 */
	public BigDecimal getBigDecimalVal(Object s) {
		if (s != null) {
			return new BigDecimal(s.toString());
		}
		return null;
	}

	/**
	 * Get Date value from the given object.
	 *
	 * @param s the s
	 * @return the date val
	 */
	protected Date getDateVal(Object s) {
		if (s != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat(
						"E MMM dd HH:mm:ss Z yyyy");
				return (Date) sdf.parse(s.toString());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * Get Geometry value from the given object.
	 *
	 * @param s the s
	 * @return the multipolygon val
	 */
	public Geometry getMultipolygonVal(Object s) {
		if (s != null) {
			Geometry geom = null;
			try {
				WKTReader reader = new WKTReader(new GeometryFactory(
						new PrecisionModel(), 900916));
				geom = reader.read(s.toString());
				geom.setSRID(900916);
				return geom;
			} catch (com.vividsolutions.jts.io.ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	
	
	/**
	 * Delete temp files.
	 *
	 * @param path the path
	 * @param filename the filename
	 */
	public void deleteTempFiles(String path,String filename){
		if(path!=null){
			File shp=new File(path+"\\"+filename+".shp");
			File shx=new File(path+"\\"+filename+".shx");
			File dbf=new File(path+"\\"+filename+".dbf");
			if(shp!=null && shp.isFile())
				shp.delete();
			if(dbf!=null && dbf.isFile())
				dbf.delete();
			if(shx!=null && shx.isFile())
				shx.delete();
		}
	}
	
	/**
	 * Check import status.
	 *
	 * @param type the type
	 * @return true, if successful
	 */
	public boolean checkImportStatus(String type){
		String query="select * from timport_status where is_active=true and import_type='"+type+"'";
		List<ImportStatus> list = DAOFactory.getFactory().getImportStatusDAO().executeSQLQuery(query);
		if(list!=null && list.size()>0)
			return true;
		return false;
	}
	
	
	/**
	 * Gets the shape file.
	 *
	 * @return the shapeFile
	 */
	public File getShapeFile() {
		return shapeFile;
	}

	/**
	 * Sets the shape file.
	 *
	 * @param shapeFile            the shapeFile to set
	 */
	public void setShapeFile(File shapeFile) {
		this.shapeFile = shapeFile;
	}

	/**
	 * Gets the shape file name.
	 *
	 * @return the shapeFileName
	 */
	public String getShapeFileName() {
		return shapeFileName;
	}

	/**
	 * Sets the shape file name.
	 *
	 * @param shapeFileName            the shapeFileName to set
	 */
	public void setShapeFileName(String shapeFileName) {
		this.shapeFileName = shapeFileName;
	}

	/**
	 * Gets the shape file ext.
	 *
	 * @return the shapeFileExt
	 */
	public String getShapeFileExt() {
		return shapeFileExt;
	}

	/**
	 * Sets the shape file ext.
	 *
	 * @param shapeFileExt            the shapeFileExt to set
	 */
	public void setShapeFileExt(String shapeFileExt) {
		this.shapeFileExt = shapeFileExt;
	}

	/**
	 * Gets the dbf file.
	 *
	 * @return the dbfFile
	 */
	public File getDbfFile() {
		return dbfFile;
	}

	/**
	 * Sets the dbf file.
	 *
	 * @param dbfFile            the dbfFile to set
	 */
	public void setDbfFile(File dbfFile) {
		this.dbfFile = dbfFile;
	}

	/**
	 * Gets the dbf file name.
	 *
	 * @return the dbfFileName
	 */
	public String getDbfFileName() {
		return dbfFileName;
	}

	/**
	 * Sets the dbf file name.
	 *
	 * @param dbfFileName            the dbfFileName to set
	 */
	public void setDbfFileName(String dbfFileName) {
		this.dbfFileName = dbfFileName;
	}

	/**
	 * Gets the dbf file ext.
	 *
	 * @return the dbfFileExt
	 */
	public String getDbfFileExt() {
		return dbfFileExt;
	}

	/**
	 * Sets the dbf file ext.
	 *
	 * @param dbfFileExt            the dbfFileExt to set
	 */
	public void setDbfFileExt(String dbfFileExt) {
		this.dbfFileExt = dbfFileExt;
	}

	/**
	 * Gets the shx file.
	 *
	 * @return the shxFile
	 */
	public File getShxFile() {
		return shxFile;
	}

	/**
	 * Sets the shx file.
	 *
	 * @param shxFile            the shxFile to set
	 */
	public void setShxFile(File shxFile) {
		this.shxFile = shxFile;
	}

	/**
	 * Gets the shx file name.
	 *
	 * @return the shxFileName
	 */
	public String getShxFileName() {
		return shxFileName;
	}

	/**
	 * Sets the shx file name.
	 *
	 * @param shxFileName            the shxFileName to set
	 */
	public void setShxFileName(String shxFileName) {
		this.shxFileName = shxFileName;
	}

	/**
	 * Gets the shx file ext.
	 *
	 * @return the shxFileExt
	 */
	public String getShxFileExt() {
		return shxFileExt;
	}

	/**
	 * Sets the shx file ext.
	 *
	 * @param shxFileExt            the shxFileExt to set
	 */
	public void setShxFileExt(String shxFileExt) {
		this.shxFileExt = shxFileExt;
	}

	/**
	 * Gets the file data store.
	 *
	 * @return the fileDataStore
	 */
	public FileDataStore getFileDataStore() {
		return fileDataStore;
	}

	/**
	 * Sets the file data store.
	 *
	 * @param fileDataStore            the fileDataStore to set
	 */
	public void setFileDataStore(FileDataStore fileDataStore) {
		this.fileDataStore = fileDataStore;
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
	 * @param regionId            the regionId to set
	 */
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}

	/**
	 * Gets the management unit id.
	 *
	 * @return the managementUnitId
	 */
	public Long getManagementUnitId() {
		return managementUnitId;
	}

	/**
	 * Sets the management unit id.
	 *
	 * @param managementUnitId            the managementUnitId to set
	 */
	public void setManagementUnitId(Long managementUnitId) {
		this.managementUnitId = managementUnitId;
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
	 * @param regionName            the regionName to set
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
	 * @param managementUnitName            the managementUnitName to set
	 */
	public void setManagementUnitName(String managementUnitName) {
		this.managementUnitName = managementUnitName;
	}

	/**
	 * Gets the note.
	 *
	 * @return the note
	 */
	public String getNote() {
		return note;
	}

	/**
	 * Sets the note.
	 *
	 * @param note            the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}

	/**
	 * Gets the datefrom.
	 *
	 * @return the datefrom
	 */
	public String getDatefrom() {
		return datefrom;
	}

	/**
	 * Sets the datefrom.
	 *
	 * @param datefrom            the datefrom to set
	 */
	public void setDatefrom(String datefrom) {
		this.datefrom = datefrom;
	}

	/**
	 * Gets the dateto.
	 *
	 * @return the dateto
	 */
	public String getDateto() {
		return dateto;
	}

	/**
	 * Sets the dateto.
	 *
	 * @param dateto            the dateto to set
	 */
	public void setDateto(String dateto) {
		this.dateto = dateto;
	};
	
	/**
	 * Gets the shpf.
	 *
	 * @return the shpf
	 */
	public File getShpf() {
		return shpf;
	}

	/**
	 * Sets the shpf.
	 *
	 * @param shpf the shpf to set
	 */
	public void setShpf(File shpf) {
		this.shpf = shpf;
	}

	/**
	 * Gets the shxf.
	 *
	 * @return the shxf
	 */
	public File getShxf() {
		return shxf;
	}

	/**
	 * Sets the shxf.
	 *
	 * @param shxf the shxf to set
	 */
	public void setShxf(File shxf) {
		this.shxf = shxf;
	}

	/**
	 * Gets the dbff.
	 *
	 * @return the dbff
	 */
	public File getDbff() {
		return dbff;
	}

	/**
	 * Sets the dbff.
	 *
	 * @param dbff the dbff to set
	 */
	public void setDbff(File dbff) {
		this.dbff = dbff;
	}

	/**
	 * Gets the import type.
	 *
	 * @return the import_type
	 */
	public String getImport_type() {
		return import_type;
	}

	/**
	 * Sets the import type.
	 *
	 * @param import_type the import_type to set
	 */
	public void setImport_type(String import_type) {
		this.import_type = import_type;
	}

	/**
	 * Gets the region code.
	 *
	 * @return the regionCode
	 */
	public String getRegionCode() {
		return regionCode;
	}

	/**
	 * Sets the region code.
	 *
	 * @param regionCode the regionCode to set
	 */
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	/**
	 * Gets the mu code.
	 *
	 * @return the muCode
	 */
	public String getMuCode() {
		return muCode;
	}

	/**
	 * Sets the mu code.
	 *
	 * @param muCode the muCode to set
	 */
	public void setMuCode(String muCode) {
		this.muCode = muCode;
	}
}
