package com.geoland.kfis.web.action.print;

import java.io.InputStream;

import javax.xml.bind.DatatypeConverter;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang.StringUtils;

import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PrintKfisMap.
 *
 * @author agashi
 */
public class PrintKfisMap extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The extent. */
	private String extent;
	
	/** The scale. */
	private String scale;
	
	/** The template. */
	private String template;
	
	/** The tittle name. */
	private String tittle_name;
	
	/** The kfis user. */
	private String kfis_user;
	
	/** The layers. */
	private String layers;
	
	/** The input stream. */
	protected InputStream inputStream;
	
	/** The name. */
	private String name; //holds name of downloaded file
    
    /** The description. */
    private String description; //holds the content type of the downloaded file
    
    /** The content disposition. */
    private String contentDisposition;
	
	/** The content type. */
	private String contentType;
	
	/** The doc content. */
	protected byte[] docContent;
	
	/** The doc type. */
	private String docType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		super.validate();
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		setDescription("application/pdf");
		setContentType("application/pdf");
		setContentDisposition("attachment; filename="+tittle_name+".pdf");
		docContent=downloadMap();
		setInputStream( generateAttachment(docContent,tittle_name, ".pdf"));
		return SUCCESS;
	}
	
	/**
	 * Download map.
	 *
	 * @return the byte[]
	 */
	protected byte[]  downloadMap(){
	       HttpClient client = new HttpClient();
	       double scaleNumber=new Double(scale).doubleValue();
	       double grid_interval_x=scaleNumber*0.1;
	       double grid_interval_y=scaleNumber*0.1;
	       String apiurl=getSettings().getString("map_print_url")+"?SERVICE=WMS&VERSION=1.3&"
	       		+ "REQUEST=GetPrint&FORMAT=pdf&EXCEPTIONS=application/vnd.ogc.se_inimage"
	       		+ "&TRANSPARENT=true&SRS=EPSG:900916&DPI=96&TEMPLATE="+template
	       		+ "&map0:extent="+extent+"&map0:rotation=0&map0:scale="+scale+"&map0:grid_interval_x="
	       		+ grid_interval_x+ "&map0:grid_interval_y="+grid_interval_y
	       		+"&LAYERS="+layers+"&tittle_name="+tittle_name+"&kfis_user="+getUser().getUser().getFirstName()+"%20"+getUser().getUser().getLastName()+"&OPACITIES"
	       		+ "=255%2C255%2C255%2C255%2C255";
	       GetMethod get = new GetMethod(apiurl);
	    //   String encoding =DatatypeConverter.printBase64Binary("admin:!GEOserver".getBytes());
	       byte[] downloadedFile=null;
	       try {
		          get.setDoAuthentication(true);
		        //  Header header=new Header("Authorization", "Basic " + encoding);
			   //   get.setRequestHeader(header);
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
	 * Gets the extent.
	 *
	 * @return the extent
	 */
	public String getExtent() {
		return extent;
	}

	/**
	 * Sets the extent.
	 *
	 * @param extent the new extent
	 */
	public void setExtent(String extent) {
		this.extent = extent;
	}

	/**
	 * Gets the scale.
	 *
	 * @return the scale
	 */
	public String getScale() {
		return scale;
	}

	/**
	 * Sets the scale.
	 *
	 * @param scale the new scale
	 */
	public void setScale(String scale) {
		this.scale = scale;
	}

	/**
	 * Gets the template.
	 *
	 * @return the template
	 */
	public String getTemplate() {
		return template;
	}

	/**
	 * Sets the template.
	 *
	 * @param template the new template
	 */
	public void setTemplate(String template) {
		this.template = template;
	}

	/**
	 * Gets the tittle name.
	 *
	 * @return the tittle name
	 */
	public String getTittle_name() {
		return tittle_name;
	}

	/**
	 * Sets the tittle name.
	 *
	 * @param tittle_name the new tittle name
	 */
	public void setTittle_name(String tittle_name) {
		this.tittle_name = tittle_name;
	}

	/**
	 * Gets the kfis user.
	 *
	 * @return the kfis user
	 */
	public String getKfis_user() {
		return kfis_user;
	}

	/**
	 * Sets the kfis user.
	 *
	 * @param kfis_user the new kfis user
	 */
	public void setKfis_user(String kfis_user) {
		this.kfis_user = kfis_user;
	}

	/**
	 * Gets the layers.
	 *
	 * @return the layers
	 */
	public String getLayers() {
		return layers;
	}

	/**
	 * Sets the layers.
	 *
	 * @param layers the new layers
	 */
	public void setLayers(String layers) {
		this.layers = layers;
	}

	/**
	 * Gets the input stream.
	 *
	 * @return the input stream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * Sets the input stream.
	 *
	 * @param inputStream the new input stream
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Sets the description.
	 *
	 * @param description the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the content disposition.
	 *
	 * @return the content disposition
	 */
	public String getContentDisposition() {
		return contentDisposition;
	}

	/**
	 * Sets the content disposition.
	 *
	 * @param contentDisposition the new content disposition
	 */
	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	/**
	 * Gets the content type.
	 *
	 * @return the content type
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * Sets the content type.
	 *
	 * @param contentType the new content type
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * Gets the doc content.
	 *
	 * @return the doc content
	 */
	public byte[] getDocContent() {
		return docContent;
	}

	/**
	 * Sets the doc content.
	 *
	 * @param docContent the new doc content
	 */
	public void setDocContent(byte[] docContent) {
		this.docContent = docContent;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	public String getDocType() {
		return docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}




	
	
}
