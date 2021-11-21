package com.geoland.kfis.web.base.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.StaleObjectStateException;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;


// TODO: Auto-generated Javadoc
/**
 * Filter that manages a Hibernate Session for a request.
 * <p>
 * This filter should be used if your <tt>hibernate.current_session_context_class</tt>
 * configuration is set to <tt>thread</tt> and you are not using JTA or CMT.
 * <p>
 * With JTA you'd replace transaction demarcation with calls to the <tt>UserTransaction</tt> API.
 * With CMT you would remove transaction demarcation code from this filter.
 * <p>
 * An alternative, more flexible solution is <tt>SessionTransactionInterceptor</tt>
 * that can be applied to any pointcut with JBoss AOP.
 * <p>
 * Note that you should not use this interceptor out-of-the-box with enabled optimistic
 * concurrency control. Apply your own compensation logic for failed conversations, this
 * is totally dependent on your applications design.
 *
 * @author Christian Bauer
 * @see auction.persistence.SessionTransactionInterceptor
 */
public class HibernateSessionRequestFilter implements javax.servlet.Filter {

    /** The log. */
    //private static Log log = LogFactory.getLog(HibernateSessionRequestFilter.class);
    private static Logger log = Logger.getLogger(HibernateSessionRequestFilter.class);

    /** The sf. */
    private SessionFactory sf;


    /* (non-Javadoc)
     * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
     */
    public void init(FilterConfig filterConfig) throws ServletException {
        log.debug("Initializing filter...");
        log.debug("Obtaining SessionFactory from KFISSessionFactory");
        sf = HibSessionFactory.getSessionFactory();
    }

    /* (non-Javadoc)
     * @see javax.servlet.Filter#destroy()
     */
    public void destroy() {}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(javax.servlet.ServletRequest request,
			ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
        try {
        	long startTime = System.currentTimeMillis();
        	if(log.isDebugEnabled()){
            log.debug("Starting a database transaction");
        	}
        	
            sf.getCurrentSession().beginTransaction();
            
            // Call the next filter (continue request processing)
            chain.doFilter(request, response);
            
	      	if(log.isDebugEnabled()){
	      		long stopTime = System.currentTimeMillis();
	      		long elapsedTime = stopTime - startTime;
	            log.debug("Committing the database transaction - Duration (ms): " + elapsedTime);	      		
	      	}            
           
            sf.getCurrentSession().getTransaction().commit();
                         
            //fullTextSession.close();

        } catch (StaleObjectStateException staleEx) {
            log.error("This interceptor does not implement optimistic concurrency control!");
            log.error("Your application will not work until you add compensation actions!");
            // Rollback, close everything, possibly compensate for any permanent changes
            // during the conversation, and finally restart business conversation. Maybe
            // give the user of the application a chance to merge some of his work with
            // fresh data... what you do here depends on your applications design.
            HttpServletResponse hsr = (HttpServletResponse) response;
            hsr.addHeader("errors_exits", "true");
            
            throw new BusinessException(staleEx);
        } catch (Throwable ex) {
            HttpServletResponse hsr = (HttpServletResponse) response;
            hsr.addHeader("errors_exits", "true");        
            
            // Rollback only
            ex.printStackTrace();
            try {
                if (sf.getCurrentSession().getTransaction().isActive()) {
                    log.error("Trying to rollback database transaction after exception");
                    sf.getCurrentSession().getTransaction().rollback();
                }
            } catch (Throwable rbEx) {
                log.error("Could not rollback transaction after exception!", rbEx);
            }

            // Let others handle it... maybe another interceptor for exceptions?
            throw new ServletException(ex);
        }
		
	}

}