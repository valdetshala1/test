/**
 * 
 */
package com.geoland.kfis.web.action.dem.export;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.geotools.data.DataUtilities;
import org.geotools.feature.SchemaException;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 15, 2016, 10:37:51 AM
 */
public class ExportBaseAction extends BaseActionSupport {

	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Creates the simple feature type.
	 *
	 * @param list the list
	 * @return the simple feature type
	 */
	public SimpleFeatureType createSimpleFeatureType(String[][] list){
		String typeSpec="";
		for(String s[]:list){
			if(s[0].equals(list[list.length-1][0]))//last element
				typeSpec+=s[0]+":"+s[1];//attribute_name:attribute_type
			else
				typeSpec+=s[0]+":"+s[1]+",";//attribute_name:attribute_type
		}
		try {
			final SimpleFeatureType sft=DataUtilities.createType("ExportFeature",typeSpec);
			return sft;
		} catch (SchemaException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Gets the multipolygon val.
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
	 * Adds the to zip file.
	 *
	 * @param fileName the file name
	 * @param zos the zos
	 * @throws FileNotFoundException the file not found exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void addToZipFile(String fileName[], ZipOutputStream zos) throws FileNotFoundException, IOException {
		File file = new File(fileName[0]);
		FileInputStream fis = new FileInputStream(file);
		ZipEntry zipEntry = new ZipEntry(fileName[1]);
		zos.putNextEntry(zipEntry);

		byte[] bytes = new byte[1024];
		int length;
		while ((length = fis.read(bytes)) >= 0) {
			zos.write(bytes, 0, length);
		}

		zos.closeEntry();
		fis.close();
	}
	
	/**
	 * Creates the zip byte array.
	 *
	 * @param files the files
	 * @return the byte[]
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public byte[] createZipByteArray(String[][] files) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream);
        try {
            for (String[] f : files) {
            	addToZipFile(f,zipOutputStream);
            }
        } finally {
            zipOutputStream.close();
        }
        return byteArrayOutputStream.toByteArray();
    }

	/**
	 * Path.
	 *
	 * @param f the f
	 * @return the string
	 */
	public String path(File f) {
		if(f!=null){
			int sep = f.getPath().lastIndexOf("\\");
			return f.getPath().substring(0, sep);
		}
		return null;
	}
	
	/**
	 * File name.
	 *
	 * @param name the name
	 * @return the string
	 */
	public String fileName(String name) {
		if(name!=null){
			int sep = name.lastIndexOf(".");
			return name.substring(0, sep);
		}
		return null;
	}
}
