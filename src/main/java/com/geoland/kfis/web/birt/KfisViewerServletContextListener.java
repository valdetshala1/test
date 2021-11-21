package com.geoland.kfis.web.birt;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.eclipse.birt.report.listener.ViewerServletContextListener;

// TODO: Auto-generated Javadoc
/**
 * The listener interface for receiving kfisViewerServletContext events.
 * The class that is interested in processing a kfisViewerServletContext
 * event implements this interface, and the object created
 * with that class is registered with a component using the
 * component's <code>addKfisViewerServletContextListener<code> method. When
 * the kfisViewerServletContext event occurs, that object's appropriate
 * method is invoked.
 *
 * @see KfisViewerServletContextEvent
 */
public class KfisViewerServletContextListener extends
		ViewerServletContextListener {

	/* (non-Javadoc)
	 * @see org.eclipse.birt.report.listener.ViewerServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
	 */
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		super.contextInitialized(sce);
		ServletContext servletContext = sce.getServletContext();
		System.out.println(servletContext);
	}
}
