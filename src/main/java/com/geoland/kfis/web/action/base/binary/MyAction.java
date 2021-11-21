package com.geoland.kfis.web.action.base.binary;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.opensymphony.xwork2.ActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class MyAction.
 */
public class MyAction extends ActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee id. */
	private Long employeeId;
	
	/** The my photo. */
	private byte[] myPhoto;
	
	/** The my content type. */
	private String myContentType;
	
	/** The my content disposition. */
	private String myContentDisposition;
	
	/** The my content length. */
	private int myContentLength;
	
	/** The my buffer size. */
	private int myBufferSize;
    
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Person emp = DAOFactory.getFactory().getPersonDAO().get(employeeId);
    	myPhoto = emp.getPhoto();
		
		setMyContentType("image/jpeg");
		setMyContentDisposition("inline; filename=test.jpg");
		setMyContentLength(myPhoto!=null?myPhoto.length:0); 
		
	    return "myImageResult";
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

	/**
	 * Gets the my photo.
	 *
	 * @return the my photo
	 */
	public byte[] getMyPhoto() {
		return myPhoto;
	}

	/**
	 * Sets the my photo.
	 *
	 * @param myPhoto the new my photo
	 */
	public void setMyPhoto(byte[] myPhoto) {
		this.myPhoto = myPhoto;
	}

	/**
	 * Gets the my content type.
	 *
	 * @return the my content type
	 */
	public String getMyContentType() {
		return myContentType;
	}

	/**
	 * Sets the my content type.
	 *
	 * @param myContentType the new my content type
	 */
	public void setMyContentType(String myContentType) {
		this.myContentType = myContentType;
	}

	/**
	 * Gets the my content disposition.
	 *
	 * @return the my content disposition
	 */
	public String getMyContentDisposition() {
		return myContentDisposition;
	}

	/**
	 * Sets the my content disposition.
	 *
	 * @param myContentDisposition the new my content disposition
	 */
	public void setMyContentDisposition(String myContentDisposition) {
		this.myContentDisposition = myContentDisposition;
	}

	/**
	 * Gets the my content length.
	 *
	 * @return the my content length
	 */
	public int getMyContentLength() {
		return myContentLength;
	}

	/**
	 * Sets the my content length.
	 *
	 * @param myContentLength the new my content length
	 */
	public void setMyContentLength(int myContentLength) {
		this.myContentLength = myContentLength;
	}

	/**
	 * Gets the my buffer size.
	 *
	 * @return the my buffer size
	 */
	public int getMyBufferSize() {
		return myBufferSize;
	}

	/**
	 * Sets the my buffer size.
	 *
	 * @param myBufferSize the new my buffer size
	 */
	public void setMyBufferSize(int myBufferSize) {
		this.myBufferSize = myBufferSize;
	}

	

}

