package com.geoland.kfis.web.birt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.eclipse.birt.report.servlet.ViewerServlet;

// TODO: Auto-generated Javadoc
/**
 * The Class KfisViewerServlet.
 */
public class KfisViewerServlet extends ViewerServlet {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see org.eclipse.birt.report.servlet.BirtSoapMessageDispatcherServlet#service(javax.servlet.ServletRequest, javax.servlet.ServletResponse)
	 */
	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		super.service(req, res);
	}

}
