package com.geoland.kfis.web.birt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.birt.report.engine.api.EngineConstants;
import org.eclipse.birt.report.engine.api.HTMLRenderOption;
import org.eclipse.birt.report.engine.api.IReportRunnable;
import org.eclipse.birt.report.engine.api.IRunAndRenderTask;
import org.eclipse.birt.report.engine.api.IReportEngine;
import org.eclipse.birt.report.model.api.CellHandle;
import org.eclipse.birt.report.model.api.DataItemHandle;
import org.eclipse.birt.report.model.api.ElementFactory;
import org.eclipse.birt.report.model.api.LabelHandle;
import org.eclipse.birt.report.model.api.OdaDataSetHandle;
import org.eclipse.birt.report.model.api.OdaDataSourceHandle;
import org.eclipse.birt.report.model.api.PropertyHandle;
import org.eclipse.birt.report.model.api.ReportDesignHandle;
import org.eclipse.birt.report.model.api.RowHandle;
import org.eclipse.birt.report.model.api.StructureFactory;
import org.eclipse.birt.report.model.api.TableHandle;
import org.eclipse.birt.report.model.api.activity.SemanticException;
import org.eclipse.birt.report.model.api.elements.structures.ComputedColumn; 
import org.eclipse.birt.report.engine.api.HTMLServerImageHandler;


// TODO: Auto-generated Javadoc
/**
 * The Class DynamicReport.
 */
public class DynamicReport extends HttpServlet {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	private IReportEngine birtReportEngine = null;
	
	/** The logger. */
	protected static Logger logger = Logger.getLogger( "org.eclipse.birt" );
	
	/**
	 * Instantiates a new dynamic report.
	 */
	public DynamicReport() {
		super();
	}

	/**
	 * Destruction of the servlet. 
	 */
	public void destroy() {
		super.destroy(); 
		BirtEngine.destroyBirtEngine();
	}


	/**
	 * The doGet method of the servlet. 
	 *
	 * @param req the req
	 * @param resp the resp
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
 	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		//get report name and launch the engine
		resp.setContentType("text/html");
		//resp.setContentType( "application/pdf" ); 
		//resp.setHeader ("Content-Disposition","inline; filename=test.pdf");		
		String reportName = req.getParameter("ReportName");
		String[] cols = (String[])req.getParameterMap().get("dyna1");
		ServletContext sc = req.getSession().getServletContext();
		this.birtReportEngine = BirtEngine.getBirtEngine(sc);
				 		
		IReportRunnable design;
		try
		{
			//Open report design
			design = birtReportEngine.openReportDesign( sc.getRealPath("/Reports")+"/"+reportName );
 			ReportDesignHandle report = (ReportDesignHandle) design.getDesignHandle( ); 
			buildReport( cols,  report );

			//create task to run and render report
			IRunAndRenderTask task = birtReportEngine.createRunAndRenderTask( design );		
			//task.setAppContext( contextMap );
			
			//set output options
                       HTMLRenderOption options = new HTMLRenderOption();
                       options.setImageHandler( new HTMLServerImageHandler() );
                       options.setImageDirectory( sc.getRealPath("/images"));
                       options.setBaseImageURL( req.getContextPath() + "/images" );
			options.setOutputFormat(HTMLRenderOption.OUTPUT_FORMAT_HTML);
 			//options.setOutputFormat(HTMLRenderOption.OUTPUT_FORMAT_PDF);
			options.setOutputStream(resp.getOutputStream());
			task.setRenderOption(options);
			
			//run report
			task.run();
			task.close();
		}catch (Exception e){
			
 			e.printStackTrace();
 			throw new ServletException( e );
		}
	}
	
	/**
	 * Builds the report.
	 *
	 * @param cols the cols
	 * @param designHandle the design handle
	 */
	public void buildReport(String[]  cols, ReportDesignHandle designHandle){

 		
		try{
		ElementFactory designFactory = designHandle.getElementFactory( );

		buildDataSource(designFactory, designHandle);
		
		
		//ArrayList cols = new ArrayList();
		//cols.add("OFFICECODE");
		//cols.add("CITY");
		//cols.add("COUNTRY");

		buildDataSet(cols, "From Offices", designFactory, designHandle);

		TableHandle table = designFactory.newTableItem( "table", cols.length );
		table.setWidth( "100%" );
		table.setDataSet( designHandle.findDataSet( "ds" ) );


		PropertyHandle computedSet = table.getColumnBindings( ); 
		ComputedColumn  cs1 = null;

		for( int i=0; i < cols.length; i++){
 			cs1 = StructureFactory.createComputedColumn();
			cs1.setName((String)cols[i]);
			cs1.setExpression("dataSetRow[\"" + (String)cols[i] + "\"]");
			computedSet.addItem(cs1);
		}


		// table header
		RowHandle tableheader = (RowHandle) table.getHeader( ).get( 0 );


		for( int i=0; i < cols.length; i++){
			LabelHandle label1 = designFactory.newLabel( (String)cols[i] );	
			label1.setText((String)cols[i]);
			CellHandle cell = (CellHandle) tableheader.getCells( ).get( i );
			cell.getContent( ).add( label1 );
		}							

		// table detail
		RowHandle tabledetail = (RowHandle) table.getDetail( ).get( 0 );
		for( int i=0; i < cols.length; i++){
			CellHandle cell = (CellHandle) tabledetail.getCells( ).get( i );
			DataItemHandle data = designFactory.newDataItem( "data_"+(String)cols[i] );
			data.setResultSetColumn( (String)cols[i]);
			cell.getContent( ).add( data );
		}


 
		designHandle.getBody( ).add( table );
		}catch(Exception e){
			e.printStackTrace();
		}
 
	}

	/**
	 * Builds the data source.
	 *
	 * @param designFactory the design factory
	 * @param designHandle the design handle
	 * @throws SemanticException the semantic exception
	 */
	void buildDataSource( ElementFactory designFactory, ReportDesignHandle designHandle ) throws SemanticException
	{

		OdaDataSourceHandle dsHandle = designFactory.newOdaDataSource(
				"Data Source", "org.eclipse.birt.report.data.oda.jdbc" );
		dsHandle.setProperty( "odaDriverClass",
 		"org.eclipse.birt.report.data.oda.sampledb.Driver" );
		dsHandle.setProperty( "odaURL", "jdbc:classicmodels:sampledb" );
		dsHandle.setProperty( "odaUser", "ClassicModels" );
		dsHandle.setProperty( "odaPassword", "" );

		designHandle.getDataSources( ).add( dsHandle );

	}

	/**
	 * Builds the data set.
	 *
	 * @param cols the cols
	 * @param fromClause the from clause
	 * @param designFactory the design factory
	 * @param designHandle the design handle
	 * @throws SemanticException the semantic exception
	 */
	void buildDataSet(String[] cols, String fromClause, ElementFactory designFactory, ReportDesignHandle designHandle ) throws SemanticException
	{
  
		OdaDataSetHandle dsHandle = designFactory.newOdaDataSet( "ds",
		"org.eclipse.birt.report.data.oda.jdbc.JdbcSelectDataSet" );
		dsHandle.setDataSource( "Data Source" );
		String qry = "Select ";
		for( int i=0; i < cols.length; i++){
			qry += " " + cols[i];
			if( i != (cols.length -1) ){
				qry += ",";
			}

		}
		qry += " " + fromClause;

		dsHandle.setQueryText( qry );
 
 		designHandle.getDataSets( ).add( dsHandle );

 
	}	 
 	
	 /**
	  * The doPost method of the servlet. 
	  *
	  * @param request the request
	  * @param response the response
	  * @throws ServletException the servlet exception
	  * @throws IOException Signals that an I/O exception has occurred.
	  */
 	public void doPost(HttpServletRequest request, HttpServletResponse response)
 			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println(" Post Not Supported");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. 
	 *
	 * @throws ServletException if an error occure
	 */
 	public void init() throws ServletException {
		BirtEngine.initBirtConfig();
		
	}

}
