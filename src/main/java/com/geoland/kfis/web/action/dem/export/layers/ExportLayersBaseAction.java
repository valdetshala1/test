package com.geoland.kfis.web.action.dem.export.layers;

import java.util.List;

import javax.xml.bind.DatatypeConverter;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang.StringUtils;

import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportLayersBaseAction.
 */
public class ExportLayersBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The layer names. */
	protected List<String> layerNames;
	
	/** The layer name. */
	protected String layerName;
	
	/** The layer format. */
	protected String layerFormat;
	
	/** The layer format name. */
	protected String layerFormatName;

	
	/**
	 * Download layers.
	 *
	 * @param cqlFltName the cql flt name
	 * @param cqlFltValue the cql flt value
	 * @return the byte[]
	 */
	protected byte[]  downloadLayers(String cqlFltName,String cqlFltValue){
	       HttpClient client = new HttpClient();
	       String apiurl=getSettings().getString("geoserver_url")+"?"
	       				+ "service=WFS&version=1.1.0"
	       					+ "&request=GetFeature&typeName=kfis_gis:"+layerName+"&maxFeatures=50";
	       					
	       if(!StringUtils.isEmpty(cqlFltName) && !StringUtils.isEmpty(cqlFltValue) ) {
	    	   apiurl+= "&CQL_FILTER="+cqlFltName+"="+cqlFltValue;
	       }
	       apiurl+= "&outputFormat=";
	       if(layerFormatName.equalsIgnoreCase("KML")){
	    	   apiurl +="application%2Fvnd.google-earth.kml%2Bxml";
	       }else if(layerFormatName.equalsIgnoreCase("GML2")){
	    	   apiurl +="text%2Fxml%3B%20subtype%3Dgml%2F2.1.2";
	       }else if(layerFormatName.equalsIgnoreCase("GML3.1")){
	    	   apiurl +="gml3";
	       }else if(layerFormatName.equalsIgnoreCase("GML3.2")){
	    	   apiurl +="application%2Fgml%2Bxml%3B%20version%3D3.2";
	       }else if(layerFormatName.equalsIgnoreCase("GeoJSON")){
	    	   apiurl +="application%2Fjson";
	       }else if(layerFormatName.equalsIgnoreCase("Shapefile")){
	    	   apiurl +="SHAPE-ZIP";
	       }
	       
	       GetMethod get = new GetMethod(apiurl);
	       String encoding =DatatypeConverter.printBase64Binary("admin:!GEOserver".getBytes());
	       byte[] downloadedFile=null;
	       try {
		          get.setDoAuthentication(true);
		          Header header=new Header("Authorization", "Basic " + encoding);
			      get.setRequestHeader(header);
		          int status = client.executeMethod(get);
		          if (status != HttpStatus.SC_OK) {
		             System.err.println("Method failed: " + get.getStatusLine());
		          }
		          downloadedFile = get.getResponseBody();
		       } catch (Exception e) {
		          e.printStackTrace();
		       } finally {
		          get.releaseConnection();
		       }
	       return downloadedFile;
	}

	/**
	 * Gets the layer names.
	 *
	 * @return the layer names
	 */
	public List<String> getLayerNames() {
		return layerNames;
	}
	
	/**
	 * Sets the layer names.
	 *
	 * @param layerNames the new layer names
	 */
	public void setLayerNames(List<String> layerNames) {
		this.layerNames = layerNames;
	}
	
	/**
	 * Gets the layer name.
	 *
	 * @return the layer name
	 */
	public String getLayerName() {
		return layerName;
	}
	
	/**
	 * Sets the layer name.
	 *
	 * @param layerName the new layer name
	 */
	public void setLayerName(String layerName) {
		this.layerName = layerName;
	}
	
	/**
	 * Gets the layer format.
	 *
	 * @return the layer format
	 */
	public String getLayerFormat() {
		return layerFormat;
	}
	
	/**
	 * Sets the layer format.
	 *
	 * @param layerFormat the new layer format
	 */
	public void setLayerFormat(String layerFormat) {
		this.layerFormat = layerFormat;
	}
	
	/**
	 * Gets the layer format name.
	 *
	 * @return the layer format name
	 */
	public String getLayerFormatName() {
		return layerFormatName;
	}

	/**
	 * Sets the layer format name.
	 *
	 * @param layerFormatName the new layer format name
	 */
	public void setLayerFormatName(String layerFormatName) {
		this.layerFormatName = layerFormatName;
	}


}
