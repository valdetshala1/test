package com.geoland.kfis.web.action.base.binary;


import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.struts2.convention.annotation.Result;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.opensymphony.xwork2.ActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class Stream.
 */
@Result(type = "stream", params = {
	    "contentType", "${contentType}",
	    "contentLength", "${contentLength}",
	    "contentDisposition", "${contentDisposition}",
	    "inputStream", "${inputName}",
	    "bufferSize", "${bufferSize}",
	    "allowCaching", "${allowCaching}"
	})
public class Stream extends ActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The content type. */
	private String contentType = "text/plain";
    
    /** The content length. */
    private int contentLength = 0;
    
    /** The content disposition. */
    private String contentDisposition = "inline";
    
    /** The input stream. */
    private InputStream inputStream;
    
    /** The input name. */
    public String inputName = "inputStream";//This should not be required
    
    /** The buffer size. */
    private Integer bufferSize = 1024;
    
    /** The allow caching. */
    private String allowCaching = "true";
    
    /** The employee id. */
    private Long employeeId = null;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Employee emp = DAOFactory.getFactory().getEmployeeDAO().get(employeeId);
		byte[] photo = emp.getPhoto();
    	this.contentType = "image/jpg";
        System.out.println("Content Type: " + contentType);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(photo);
        File fileToCreate = new File("D:\\Development\\geo\\kfis", "picxx.jpg");
        File fr = new File("D:\\Development\\geo\\kfis\\pic.jpg");
        //IOUtils.copy(byteArrayInputStream, new FileOutputStream(fileToCreate));
        
        FileOutputStream fos = new FileOutputStream(fileToCreate);
        fos.write(photo);
        fos.close();
        
        FileInputStream fis = new FileInputStream(fr);
        
        this.contentLength = photo.length;
        this.contentLength = (int) fr.length();
        System.out.println("Content Length: " + contentLength);
        this.inputStream = byteArrayInputStream;
        this.inputStream = fis;
        return SUCCESS;
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
	 * Gets the content length.
	 *
	 * @return the content length
	 */
	public int getContentLength() {
		return contentLength;
	}

	/**
	 * Sets the content length.
	 *
	 * @param contentLength the new content length
	 */
	public void setContentLength(int contentLength) {
		this.contentLength = contentLength;
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
	 * Gets the input name.
	 *
	 * @return the input name
	 */
	public String getInputName() {
		return inputName;
	}

	/**
	 * Sets the input name.
	 *
	 * @param inputName the new input name
	 */
	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	/**
	 * Gets the buffer size.
	 *
	 * @return the buffer size
	 */
	public Integer getBufferSize() {
		return bufferSize;
	}

	/**
	 * Sets the buffer size.
	 *
	 * @param bufferSize the new buffer size
	 */
	public void setBufferSize(Integer bufferSize) {
		this.bufferSize = bufferSize;
	}

	/**
	 * Gets the allow caching.
	 *
	 * @return the allow caching
	 */
	public String getAllowCaching() {
		return allowCaching;
	}

	/**
	 * Sets the allow caching.
	 *
	 * @param allowCaching the new allow caching
	 */
	public void setAllowCaching(String allowCaching) {
		this.allowCaching = allowCaching;
	}

	/**
	 * Gets the employee id.
	 *
	 * @return the employee id
	 */
	public Long getEmployeeId() {
		return employeeId;
	}

	/**
	 * Sets the employee id.
	 *
	 * @param employeeId the new employee id
	 */
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	
	

}
