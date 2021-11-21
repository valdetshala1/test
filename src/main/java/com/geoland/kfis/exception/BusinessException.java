package com.geoland.kfis.exception;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.spi.SQLExceptionConverter;
import org.hibernate.exception.spi.SQLExceptionConverterFactory;

// TODO: Auto-generated Javadoc
/**
 * This exception is used to mark business rule violations.
 * 
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created November 14, 2013 12:47:49 AM
 * @Version 1.0
 *
 */
public class BusinessException	extends RuntimeException {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The Constant ERROR_MSG. */
	public static final String ERROR_MSG = "business_error_msg";
	
	/** The log. */
	private static Logger log = Logger.getLogger(BusinessException.class);
	
	/** The message. */
	private String message;
	
	/**
	 * Instantiates a new business exception.
	 */
	public BusinessException() {}

	/**
	 * Instantiates a new business exception.
	 *
	 * @param message the message
	 */
	public BusinessException(String message) {
		super(message);
	}

	/**
	 * Instantiates a new business exception.
	 *
	 * @param message the message
	 * @param cause the cause
	 */
	public BusinessException(String message, Throwable cause) {
		super(message, cause);
		message = errorPrint(cause);
		log.error(message, cause);
		log.error(message);			
	}

	/**
	 * Instantiates a new business exception.
	 *
	 * @param cause the cause
	 */
	public BusinessException(Throwable cause) {
		super(cause);
		message = errorPrint(cause);
		log.error(message, cause);
		log.error(message);		
	}
	
	
	/**
	 * Error print.
	 *
	 * @param e the e
	 * @return the string
	 */
	static String errorPrint(Throwable e) {
		SQLExceptionConverter conv = SQLExceptionConverterFactory.buildMinimalSQLExceptionConverter();
		StringBuffer buf = new StringBuffer();
		
		if(e instanceof ConstraintViolationException ){
			buf.append(SQLExceptionPrint(((ConstraintViolationException)e).getSQLException()));
		}
		
	    if (e instanceof SQLException){ 
	        buf.append(SQLExceptionPrint((SQLException)e));
	    }else{
	        System.out.println("A non-SQL error: " + e.toString());
	        buf.append("A non-SQL error: " + e.toString());
	    }
	    System.out.println(buf.toString());
	    return buf.toString();
	}
	
	/**
	 * SQL exception print.
	 *
	 * @param sqle the sqle
	 * @return the string
	 */
	static String SQLExceptionPrint(SQLException sqle) {
		StringBuffer buf = new StringBuffer();
	    while (sqle != null) {
	        System.out.println("\n---SQLException Caught---\n");
	        System.out.println("SQLState:   " + (sqle).getSQLState());
	        System.out.println("Severity: " + (sqle).getErrorCode());
	        System.out.println("Message:  " + (sqle).getMessage());
	        buf.append("\n---SQLException Caught---\n");
	        buf.append("SQLState:   " + (sqle).getSQLState());
	        buf.append("Severity: " + (sqle).getErrorCode());
	        buf.append("Message:  " + (sqle).getMessage());
	        sqle.printStackTrace();  
	        sqle = sqle.getNextException();
	    }
	    return buf.toString();
	}		
}
