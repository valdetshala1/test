package com.geoland.kfis.web.action.adm.monitor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.geoland.kfis.web.action.base.BaseActionSupport;

public class AdminMonitor extends BaseActionSupport {
	protected Logger log = Logger.getLogger(AdminMonitor.class);
	private static final long serialVersionUID = 1L;
	protected String jndiDataSourceName = "jdbc/kfis";
	private boolean jndiConnected = false;
	private int count = 0;
	
	public String page(){
		jndiLookup();
		if(count>0) {
			jndiConnected = true;
		}
		
		return "page";
	}
	
	
	protected void jndiLookup() {
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			DataSource ds = (DataSource) envContext.lookup(jndiDataSourceName);
			Connection conn = ds.getConnection();
			
	        Statement statement = conn.createStatement();
	        String sql = "select count(*) as count from tuser";
	        ResultSet rs = statement.executeQuery(sql);
	        rs.next();
	        count = rs.getInt("count");
	        	
	            
		} catch (NamingException ex) {
            System.err.println(ex);
            System.out.println(ex.getMessage());
            log.error(ex.getMessage());
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println(ex.getMessage());
            log.error(ex.getMessage());
        }
		
	}

	
	public boolean isJndiConnected() {
		return jndiConnected;
	}
	
	public int getCount() {
		return count;
	}

}
