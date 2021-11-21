/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

// TODO: Auto-generated Javadoc
/**
 * The Class QRCodeGenerator.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 5, 2016, 2:10:27 PM
 */
public class QRCodeGenerator extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8673432415711290939L;
	
	/** The qr code. */
	private String qrCode;
	
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
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(StringUtils.isEmpty(qrCode))
			addFieldError("qrCode.empty", getMessage("qr.code.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
        setName("qr - code");
		setDescription("image/png");
		setContentType("image/png");
		setContentDisposition("inline; filename=qr-code");
		
		File f=createQRCode(qrCode, 150, 150);
		setInputStream(generateAttachment(getFileBytes(f),"qr code", "png"));
		return SUCCESS;
	}
	
	/**
	 * Creates the QR code.
	 *
	 * @param qrCodeData the qr code data
	 * @param charset the charset
	 * @param hintMap the hint map
	 * @param qrCodeheight the qr codeheight
	 * @param qrCodewidth the qr codewidth
	 * @return the file
	 * @throws WriterException the writer exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public static File createQRCode(String qrCodeData, String charset, Map<EncodeHintType, ErrorCorrectionLevel> hintMap, int qrCodeheight, int qrCodewidth)
			throws WriterException, IOException {
		
		BitMatrix matrix = new MultiFormatWriter().encode(new String(qrCodeData.getBytes(charset), charset), BarcodeFormat.QR_CODE, qrCodewidth, qrCodeheight, hintMap);
		File f = File.createTempFile("qr-code", "png");
		MatrixToImageWriter.writeToFile(matrix, "png", f);
		return f;
	}
	
	/**
	 * Gets the qr code.
	 *
	 * @return the qrCode
	 */
	public String getQrCode() {
		return qrCode;
	}

	/**
	 * Sets the qr code.
	 *
	 * @param qrCode the qrCode to set
	 */
	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
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
	
}
