package com.geoland.kfis.web.birt;

import java.io.InputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;

import org.eclipse.birt.report.engine.api.EngineConfig;
import org.eclipse.birt.report.engine.api.EngineConstants;
import org.eclipse.birt.report.engine.api.IReportEngine;
import javax.servlet.*;
import org.eclipse.birt.core.framework.PlatformServletContext;
import org.eclipse.birt.core.framework.IPlatformContext;
import  org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.core.exception.BirtException;
import org.eclipse.birt.report.engine.api.IReportEngineFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class BirtEngine.
 */
public class BirtEngine {

/** The birt engine. */
private static IReportEngine birtEngine = null;

/** The config props. */
private static Properties configProps = new Properties();

/** The Constant configFile. */
private final static String configFile = "BirtConfig.properties";

/**
 * Inits the birt config.
 */
public static synchronized void initBirtConfig() {
 loadEngineProps();
}

/**
 * Gets the birt engine.
 *
 * @param sc the sc
 * @return the birt engine
 */
public static synchronized IReportEngine getBirtEngine(ServletContext sc) {
 if (birtEngine == null) 
 {
  EngineConfig config = new EngineConfig();
  if( configProps != null){
   String logLevel = configProps.getProperty("logLevel");
   Level level = Level.OFF;
   if ("SEVERE".equalsIgnoreCase(logLevel)) 
   {
    level = Level.SEVERE;
   } else if ("WARNING".equalsIgnoreCase(logLevel))
   {
    level = Level.WARNING;
   } else if ("INFO".equalsIgnoreCase(logLevel)) 
   {
    level = Level.INFO;
   } else if ("CONFIG".equalsIgnoreCase(logLevel))
   {
    level = Level.CONFIG;
   } else if ("FINE".equalsIgnoreCase(logLevel)) 
   {
    level = Level.FINE;
   } else if ("FINER".equalsIgnoreCase(logLevel)) 
   {
    level = Level.FINER;
   } else if ("FINEST".equalsIgnoreCase(logLevel)) 
   {
    level = Level.FINEST;
   } else if ("OFF".equalsIgnoreCase(logLevel)) 
   {
    level = Level.OFF;
   }

   config.setLogConfig(configProps.getProperty("logDirectory"), level);
  }

  config.getAppContext().put(EngineConstants.APPCONTEXT_CLASSLOADER_KEY, Thread.currentThread().getContextClassLoader()); 
  //if you are using 3.7 POJO Runtime no need to setEngineHome
  config.setEngineHome("");
  IPlatformContext context = new PlatformServletContext( sc );
  config.setPlatformContext( context );


  try
  {
   Platform.startup( config );
  }
  catch ( BirtException e )
  {
   e.printStackTrace( );
  }

  IReportEngineFactory factory = (IReportEngineFactory) Platform
  .createFactoryObject( IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY );
  birtEngine = factory.createReportEngine( config );


 }
 return birtEngine;
}

/**
 * Destroy birt engine.
 */
public static synchronized void destroyBirtEngine() {
 if (birtEngine == null) {
  return;
 }  
 birtEngine.shutdown();
 Platform.shutdown();
 birtEngine = null;
}

/* (non-Javadoc)
 * @see java.lang.Object#clone()
 */
public Object clone() throws CloneNotSupportedException {
 throw new CloneNotSupportedException();
}

/**
 * Load engine props.
 */
private static void loadEngineProps() {
 try {
  //Config File must be in classpath
  ClassLoader cl = Thread.currentThread ().getContextClassLoader();
  InputStream in = null;
  in = cl.getResourceAsStream (configFile);
  configProps.load(in);
  in.close();


 } catch (IOException e) {
  e.printStackTrace();
 }

}

}
