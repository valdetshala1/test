/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.validations;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import org.geotools.feature.simple.SimpleFeatureBuilder;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;


// TODO: Auto-generated Javadoc
/**
 * The Class ShapeValidationsSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 26, 2016, 9:20:53 AM
 */
public class ShapeValidationsSaveAction extends ShapeValidationsBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1281660145539717808L;

	/** The name. */
	private String name; //holds name of downloaded file
    
    /** The input stream. */
    private InputStream inputStream; //holds stream of downloaded file
    
    /** The description. */
    private String description; //holds the content type of the downloaded file
    
    /** The content disposition. */
    private String contentDisposition;
	
	/** The content type. */
	private String contentType;
	
	/** The validation type. */
	private String validationType;
	
	/** The validation number. */
	private int validationNumber;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		SimpleFeatureType type = null;
		SimpleFeatureBuilder featureBuilder = null;
		List<SimpleFeature> collection = null;
		if(validationType.equals("C")){
			if(validationNumber==2){//shape out state
				type = createSimpleFeatureType(getShapeOutStateFields());
				featureBuilder = new SimpleFeatureBuilder(type);
				collection = createSimpleFeatureOutState(featureBuilder);
			}else if(validationNumber==3){//shape overlap stand
				type = createSimpleFeatureType(getShapeOverlapStand());
				featureBuilder = new SimpleFeatureBuilder(type);
				collection = createSimpleFeatureOverlapStand(featureBuilder);
			}else if(validationNumber==4){//shape overlap stand GIS
				type = createSimpleFeatureType(getShapeOverlapStandGIS());
				featureBuilder = new SimpleFeatureBuilder(type);
				collection = createSimpleFeatureOverlapStandGIS(featureBuilder);
			}
		} else if(validationType.equals("B")){//shape biodiv out stand
			type = createSimpleFeatureType(getShapeBiodivOutStand());
			featureBuilder = new SimpleFeatureBuilder(type);
			collection = createSimpleFeatureShapeBiodivOutStand(featureBuilder);
		} else if(validationType.equals("P")){//shape out out stand
			type = createSimpleFeatureType(getshapePlotsOutStand());
			featureBuilder = new SimpleFeatureBuilder(type);
			collection = createSimpleFeatureShapePlotsOutStand(featureBuilder);
		}
		onFailImportStatus(validationType);
		
		File file = exportDataToShapefile(type, collection);
		String path = path(file);
		String fName = path+"//"+fileName(file.getName());
		String files[][] = {{fName+".shp","validations.shp"},{fName+".shx","validations.shx"},{fName+".dbf","validations.dbf"},{fName+".shx","validations.fix"},{fName+".dbf","validations.prj"}};
		byte bytes[]=createZipByteArray(files);
		
		setName(fName);
		setDescription("application/zip");
		setContentType("application/zip");
		setContentDisposition("inline; filename=validations.zip");
		setInputStream(generateAttachment(bytes, fileName(file.getName()), "zip"));
		
		
		return SUCCESS;
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
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the input stream.
	 *
	 * @return the inputStream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * Sets the input stream.
	 *
	 * @param inputStream the inputStream to set
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
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
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the content disposition.
	 *
	 * @return the contentDisposition
	 */
	public String getContentDisposition() {
		return contentDisposition;
	}

	/**
	 * Sets the content disposition.
	 *
	 * @param contentDisposition the contentDisposition to set
	 */
	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	/**
	 * Gets the content type.
	 *
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * Sets the content type.
	 *
	 * @param contentType the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * Gets the validation type.
	 *
	 * @return the validationType
	 */
	public String getValidationType() {
		return validationType;
	}

	/**
	 * Sets the validation type.
	 *
	 * @param validationType the validationType to set
	 */
	public void setValidationType(String validationType) {
		this.validationType = validationType;
	}

	/**
	 * Gets the validation number.
	 *
	 * @return the validationNumber
	 */
	public int getValidationNumber() {
		return validationNumber;
	}

	/**
	 * Sets the validation number.
	 *
	 * @param validationNumber the validationNumber to set
	 */
	public void setValidationNumber(int validationNumber) {
		this.validationNumber = validationNumber;
	}
	
}
