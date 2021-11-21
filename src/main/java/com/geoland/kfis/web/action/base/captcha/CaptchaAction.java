package com.geoland.kfis.web.action.base.captcha;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.font.TextAttribute;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.geoland.kfis.web.action.base.Constants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


// TODO: Auto-generated Javadoc
/**
 * The Class CaptchaAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 6, 2014 9:52:37 AM
 * @Version 1.0
 */
public class CaptchaAction extends ActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The logger. */
	Logger logger = Logger.getLogger(CaptchaAction.class);

	/** The image stream. */
	private InputStream imageStream;
	
	/** The height. */
	private int height = 50;
	
	/** The width. */
	private int width = 200;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		width = 120;
		height = 30;

		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics2D = image.createGraphics();
		Hashtable<TextAttribute, Object> map = new Hashtable<TextAttribute, Object>();
		Random r = new Random();
		String token = Long.toString(Math.abs(r.nextLong()), 36);
		String ch = token.substring(0, 6);
		Color c = new Color(0.6662f, 0.4569f, 0.3232f);
		// GradientPaint gp = new GradientPaint(30, 30, c, 15, 25, Color.white,
		// true);
		GradientPaint gp = new GradientPaint(30, 30, c, 15, 25, Color.black,
				true);
		graphics2D.setPaint(gp);
		Font font = new Font("Verdana", Font.CENTER_BASELINE, 26);
		graphics2D.setFont(font);
		// graphics2D.setColor(new Color(237, 237, 237));
		graphics2D.setBackground(new Color(237, 237, 237));
		graphics2D.clearRect(0, 0, width, height);
		// ededed
		graphics2D.drawString(ch, 2, 20);
		graphics2D.dispose();

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", bos);
		
		/*
		JPEGImageEncoder jpg = null;
		jpg = JPEGCodec.createJPEGEncoder(bos);
		jpg.encode(image);
		*/
		this.imageStream = new ByteArrayInputStream(bos.toByteArray());

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext()
				.get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		HttpSession session = request.getSession(true);
		session.setAttribute(Constants.CAPTCHA_KEY, ch);

		logger.info("Session Id: " + session.getId() + " with captcha:" + ch);
		return SUCCESS;
	}

	/**
	 * Just test.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void justTest() throws IOException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext()
				.get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		Boolean isResponseCorrect = Boolean.FALSE;
		javax.servlet.http.HttpSession session = request.getSession();

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte imageBuffer[] = null;
		
		
		/*
		 * ImageIO.write(image, "jpg", bos);
		JPEGImageEncoder jpg = null;
		BufferedImage image = draw("343243");
		jpg = JPEGCodec.createJPEGEncoder(bos);
		jpg.encode(image);
		*/
		
		imageBuffer = bos.toByteArray();
		this.imageStream = new ByteArrayInputStream(bos.toByteArray());
	}

	/**
	 * Draw.
	 *
	 * @param number the number
	 * @return the buffered image
	 */
	public BufferedImage draw(String number) {

		double width = 200;
		double height = 180;

		// Create a buffered image in which to draw
		BufferedImage bufferedImage = new BufferedImage((int) width,
				(int) height, BufferedImage.TYPE_INT_RGB);
		GradientPaint gradient = new GradientPaint(0, 0, Color.red, 175, 175,
				Color.yellow, true); // true means to repeat pattern

		// Create a graphics contents on the buffered image
		Graphics2D g2d = bufferedImage.createGraphics();
		g2d.setPaint(gradient);
		g2d.setBackground(Color.white);
		g2d.setColor(Color.green);
		g2d.setStroke(new BasicStroke(5)); // 5-pixel wide pen
		g2d.setPaint(Color.white);
		g2d.drawString(number, 25, 25);
		g2d.dispose();

		return bufferedImage;
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

}
