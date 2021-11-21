package com.geoland.kfis.web.action.base.binary;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.opensymphony.xwork2.ActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ShowImageAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 8, 2014 1:58:30 AM
 * @Version 1.0
 */
public class ShowImageAction extends ActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
    
    /** The image stream. */
    private InputStream imageStream;
	
	/** The employee id. */
	private Long employeeId;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Employee emp = DAOFactory.getFactory().getEmployeeDAO().get(employeeId);
    	byte[] photo = emp.getPhoto();
    	//File createTempFile = File.createTempFile("test", ".jpg");
    	//FileOutputStream fos = new FileOutputStream("C:\\test.gif"); 
    	
//    	FileOutputStream fos = new FileOutputStream(createTempFile);
//    	fos.write(photo);
//        fos.close();

//        ByteArrayInputStream in = new ByteArrayInputStream(photo);
//        this.inputStream = in;
    	
    	// convert byte array back to BufferedImage
    	imageStream = new ByteArrayInputStream(photo);
    	BufferedImage image = ImageIO.read(imageStream);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		/*
		JPEGImageEncoder jpg = null;
		jpg = JPEGCodec.createJPEGEncoder(bos);
		jpg.encode(image);
		*/
		ImageIO.write(image, "jpg", bos);
		
		imageStream = new ByteArrayInputStream(bos.toByteArray());

		
    	File fileToCreate = new File("D:\\Development\\geo\\kfis", "pic_tmp.jpg");
        FileOutputStream out = new FileOutputStream(fileToCreate);
        IOUtils.copy(imageStream, out);
		

		
        //IOUtils.closeQuietly(in);
        IOUtils.closeQuietly(out);
        
//		BufferedImage bImageFromConvert = ImageIO.read(in);
//		ImageIO.write(bImageFromConvert, "jpg", fileToCreate);
		
//        
//        File fr = new File("D:\\Development\\geo\\kfis\\pic.jpg");
//        FileInputStream fis = new FileInputStream(createTempFile);
//        this.inputStream = fis;
       
		
		return SUCCESS;
	}

	

	/**
	 * Gets the image stream.
	 *
	 * @return the image stream
	 */
	public InputStream getImageStream() {
		return imageStream;
	}

	/**
	 * Sets the image stream.
	 *
	 * @param imageStream the new image stream
	 */
	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
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
