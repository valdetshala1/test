package com.geoland.kfis.web.birt;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.EnumMap;
import java.util.Hashtable;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

// TODO: Auto-generated Javadoc
/**
 * The Class QRCode.
 */
public class QRCode {

	/**
	 * Creates the qr code.
	 *
	 * @param content the content
	 * @param qrCodeSize the qr code size
	 * @return the buffered image
	 * @throws WriterException the writer exception
	 */
	public  BufferedImage createQrCode(String content, int qrCodeSize) throws WriterException        {
	       
	           // Create the ByteMatrix for the QR-Code that encodes the given String.
	           Map<EncodeHintType, Object> hintMap = new EnumMap<EncodeHintType, Object>(EncodeHintType.class);
	           hintMap.put(EncodeHintType.MARGIN, 1);
	           hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
	          

	           QRCodeWriter qrCodeWriter = new QRCodeWriter();
	           BitMatrix byteMatrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, qrCodeSize, qrCodeSize, hintMap);
	           // Make the BufferedImage that are to hold the QRCode
	           int matrixWidth = byteMatrix.getWidth();

	           BufferedImage image = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
	           image.createGraphics();

	           Graphics2D graphics = (Graphics2D) image.getGraphics();
	           graphics.setColor(Color.WHITE);
	           graphics.fillRect(0, 0, matrixWidth, matrixWidth);

	           // Paint and save the image using the ByteMatrix

	           graphics.setColor(Color.BLACK);

	           for (int i = 0; i < matrixWidth; i++)
	           {
	               for (int j = 0; j < matrixWidth; j++)
	               {
	                   if (byteMatrix.get(i, j) == true)
	                   {
	                       graphics.fillRect(i, j, 1, 1);
	                   }
	               }
	           }
	           return image;
	  
	   }

}
