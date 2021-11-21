package com.geoland.kfis.web.action.ads.finance.print;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import java.util.ResourceBundle;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;


// TODO: Auto-generated Javadoc
/**
 * The Class PrintAction.
 */
public class PrintAction extends ActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4969519745207581797L;
	
	/** The log. */
	Logger log = Logger.getLogger(PrintAction.class);

	/** The reporttype. */
	private String reporttype;
	
	/** The content disposition. */
	private String contentDisposition;
	
	/** The content type. */
	private String contentType;
    
    /** The bais. */
    private ByteArrayInputStream bais;
    
    /** The name. */
    private String name; 
 /** holds name of downloaded file. */
    private InputStream inputStream; 
 /** holds stream of downloaded file. */
    private String description; 
 /** holds the content type of the downloaded file. */
    private long size;
    
    
	/** The month. */
	private String month;
	
	/** The year. */
	private String year;
	
	/** The month 2. */
	private String month2;
	
	/**
	 * Decision.
	 *
	 * @return the string
	 * @throws Exception the exception
	 */
	public String decision() throws Exception {
		File file = null;
		try{
			
			ResourceBundle appSettings = ResourceBundle.getBundle("kfis");
			PrintDecision print = new PrintDecision(appSettings);
//			if(wRequestStatus != null && wRequestStatus.getStatus() == Requeststatus.NEW){
			if(StringUtils.isEmpty(month)){
				file= print.allocationYear(year);
			}
			else{
				file = print.allocation(month,year,month2);
			}
				
//			}else if(wRequestStatus != null && wRequestStatus.getStatus() == Requeststatus.CONTROL_REJECTED){
//				file = print.CONTROL_REJECTED(wRequest);					
//			}else if(wRequestStatus != null && wRequestStatus.getStatus() == Requeststatus.LAB_ANALYSIS_DONE){
//				file = print.LAB_ANALYSIS_DONE(wRequest,analysis);					
//			}else if(wRequestStatus != null && wRequestStatus.getStatus() == Requeststatus.LAB_REJECTED){
//				file = print.LAB_REJECTED(wRequest,analysis);					
//			}else if(StringUtils.isNotEmpty(packingId.toString())){
//				WRequestPacking requestPack= DAOFactory.getFactory().getWRequestPackingDAO().get(packingId);
//				file = print.printStick(requestPack);
//			}
			
			
			if(file!=null){
				ByteArrayInputStream bais = new ByteArrayInputStream(FileUtils.readFileToByteArray(file));
				setName(file.getName());
				if(file.getAbsolutePath().endsWith("docx")){
					setDescription("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
					setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
				}else{
					setDescription("application/pdf");
					setContentType("application/pdf");
				}
				setContentDisposition("inline; filename=" + file.getName());
				setInputStream(bais);
				setSize(file.length());
				
				return SUCCESS;
			}else{
				return ERROR;
			}			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}

	/**
	 * Gets the reporttype.
	 *
	 * @return the reporttype
	 */
	public String getReporttype() {
		return reporttype;
	}

	/**
	 * Sets the reporttype.
	 *
	 * @param reporttype the new reporttype
	 */
	public void setReporttype(String reporttype) {
		this.reporttype = reporttype;
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
	 * Gets the size.
	 *
	 * @return the size
	 */
	public long getSize() {
		return size;
	}

	/**
	 * Sets the size.
	 *
	 * @param size the new size
	 */
	public void setSize(long size) {
		this.size = size;
	}

	/**
	 * Gets the month.
	 *
	 * @return the month
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * Sets the month.
	 *
	 * @param month the new month
	 */
	public void setMonth(String month) {
		this.month = month;
	}

	/**
	 * Gets the year.
	 *
	 * @return the year
	 */
	public String getYear() {
		return year;
	}

	/**
	 * Sets the year.
	 *
	 * @param year the new year
	 */
	public void setYear(String year) {
		this.year = year;
	}

	/**
	 * Gets the month 2.
	 *
	 * @return the month 2
	 */
	public String getMonth2() {
		return month2;
	}

	/**
	 * Sets the month 2.
	 *
	 * @param month2 the new month 2
	 */
	public void setMonth2(String month2) {
		this.month2 = month2;
	}

	/**
	 * Gets the bais.
	 *
	 * @return the bais
	 */
	public ByteArrayInputStream getBais() {
		return bais;
	}

	/**
	 * Sets the bais.
	 *
	 * @param bais the new bais
	 */
	public void setBais(ByteArrayInputStream bais) {
		this.bais = bais;
	}
	
}
