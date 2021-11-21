package com.geoland.kfis.web.jasper;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.persistence.Table;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
//import org.apache.jasper.JasperException;
//import org.apache.jasper.compiler.Localizer;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.KfisGenDocuments;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.KfisGenDocumentsDAO;
import com.geoland.kfis.web.action.base.BaseActionSupport;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;

/**
 * 
 * Class JasperReportGenerator
 * @author BEKIM BAJRAKTARI
 * @created 08.06.2020 08:41:46
 * @Version 1.0
 */
public class JasperReportGenerator extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The parameters. */
	@SuppressWarnings("rawtypes")
	protected HashMap PARAMETERS = new HashMap();	
	
	/** The input stream. */
	protected InputStream inputStream;
	
	/** The name. */
	private String name; //holds name of downloaded file
    
    /** The description. */
    private String description; //holds the content type of the downloaded file
    
    /** The content disposition. */
    private String contentDisposition;
	
	/** The content type. */
	private String contentType;
	
	/** The report type. */
	private String report_type;
	
	/** The to save in alfresco. */
	private boolean toSaveInAlfresco;
	
	/** The doc gen. */
	private File doc_gen;
	
	/** The doc uid. */
	private String doc_uid;
	
	/** The entity name. */
	private String entityName;
	
	/** The entity id. */
	private Long entityId;
	
	/** The uuid. */
	private String uuid;
	
    /** The chartogenerateuid. */
    private char[] chartogenerateuid=new char[]{'1','2','3','4','5','6','7','8','9',
			'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','z'};

	
    @SuppressWarnings("rawtypes")
	private void printRequest(HttpServletRequest httpRequest) {
        System.out.println(" \n\n Headers");

		Enumeration headerNames = httpRequest.getHeaderNames();
        while(headerNames.hasMoreElements()) {
            String headerName = (String)headerNames.nextElement();
            System.out.println(headerName + " = " + httpRequest.getHeader(headerName));
        }

        System.out.println("\n\nParameters");

        Enumeration params = httpRequest.getParameterNames();
        while(params.hasMoreElements()){
            String paramName = (String)params.nextElement();
            System.out.println(paramName + " = " + httpRequest.getParameter(paramName));
        }

        //System.out.println("\n\n Row data");
        //System.out.println(extractPostRequestBody(httpRequest));
    }
    
    @SuppressWarnings("resource")
	static String extractPostRequestBody(HttpServletRequest request) {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            Scanner s = null;
            try {
                s = new Scanner(request.getInputStream(), "UTF-8").useDelimiter("\\A");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return s.hasNext() ? s.next() : "";
        }
        return "";
    }
    
    @SuppressWarnings("unchecked")
	protected void getBodyParameters(HttpServletRequest request) {
        String extractPostRequestBody = extractPostRequestBody(request);
        System.out.println(extractPostRequestBody);
        String bodyParams[] = extractPostRequestBody.split("&");
        for (String param : bodyParams) {
			String keyValue[] = param.split("=");
			if(keyValue!=null && keyValue.length>=2) {
				PARAMETERS.put(keyValue[0], keyValue[1]);
			}
		}
    }
    
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@SuppressWarnings({ "unchecked", "deprecation", "rawtypes" })
	@Override
	public String execute() throws Exception, JRException  {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	
    	printRequest(request);
    	
        Enumeration<String> params = request.getParameterNames();
        while(params.hasMoreElements()){
            String paramName = (String)params.nextElement();
            String paramValue = request.getParameter(paramName);
            
            System.out.println(paramName + " = " + paramValue);
            PARAMETERS.put(paramName, paramValue);	
        }    	
    	
        getBodyParameters(request);
        
        Long tkfisGenDocumentId=null;
        ServletContext sc = request.getSession().getServletContext();
        String path = sc.getRealPath("/report");
        
        String jsonParam = request.getParameter("jsonObj");
        if(jsonParam==null) jsonParam = (String) PARAMETERS.get("jsonObj");
        
        String report_path = request.getParameter("report_path");
        if(report_path==null) report_path = (String) PARAMETERS.get("report_path");
        
        String doc_name = request.getParameter("doc_name");
        if(doc_name==null) doc_name = (String) PARAMETERS.get("doc_name");
        
        String doc_format = request.getParameter("doc_format");
        if(doc_format==null) doc_format = (String) PARAMETERS.get("doc_format");
        
        String saveInAlfresco = request.getParameter("saveInAlfresco");
        if(saveInAlfresco==null) saveInAlfresco = (String) PARAMETERS.get("saveInAlfresco");
        
        if("true".equals(saveInAlfresco )) {
        	toSaveInAlfresco = true;
        }else {
        	toSaveInAlfresco = false;
        }
        
    	PARAMETERS.put("p_user",getUser().getUser().getFirstName()+" "+getUser().getUser().getLastName());	
    	PARAMETERS.put("ks_logo",sc.getRealPath("/img/kosova_logo_2.png"));
    	PARAMETERS.put("kfis_logo",sc.getRealPath("/img/apk.png"));
    	
    	String actualUser = getUser().getUser().getFirstName()+" "+getUser().getUser().getLastName();
    	PARAMETERS.put("p_actual_user",actualUser);
        
        Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
        SessionFactoryImplementor sfi = (SessionFactoryImplementor) session.getSessionFactory();
        ConnectionProvider cp = sfi.getConnectionProvider();
        Connection conn = cp.getConnection();
        path=path+report_path;
        
        try {
        	
        	KfisGenDocuments kgd = saveGenDocs(doc_name+"."+doc_format);
          	String kfis_host = getSettings().getString("kfis_api_docs_url");
          	String qrCodeUrlGen = kfis_host+"/kfisQrCodeGen/BarcodeServlet?DATA="+kgd.getUrl()+"&TYPE=QRcode";
          	PARAMETERS.put("p_qrcode_content_url", qrCodeUrlGen);
          	tkfisGenDocumentId = kgd.getId();
          	
          	System.out.println("Connection:" + conn);
          	
          	String mypath = sc.getRealPath("/report");
          	//ClassPathResource reportResource = new ClassPathResource(mypath + "\\ads\\finance\\output\\salary\\salary_report_year.jasper");
          	File f = new File(mypath + "/ads/finance/output/salary/salary_report_year.jasper");
          	FileInputStream fis = new FileInputStream(f);
          	ByteArrayResource exportReportToPDF = exportReportToPDF(fis, PARAMETERS, conn);
          	FileOutputStream fos = new FileOutputStream(new File("C:/Daten/test.pdf"));
          	fos.write(exportReportToPDF.getByteArray());
          	fos.flush();
          	fos.close();
          	
          	System.out.println("Report Generation started 1 ..");
		    JasperReport jasperReport = JasperCompileManager.compileReport(path);  
		    ByteArrayOutputStream  pdfReport = new ByteArrayOutputStream();
		    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, PARAMETERS, conn);
		    int pages = jasperPrint.getPages().size();
			if (pages != 0) {
				System.out.println("Report Generation started 2..");
				JasperExportManager.exportReportToPdfStream(jasperPrint, pdfReport);
				System.out.println("Report Generation Complete");
				
		        setName(doc_name);
		        setDescription("application/"+doc_format);
				setContentType("application/"+doc_format);
				setContentDisposition("attachment; filename="+name+"."+doc_format);
				setInputStream(generateAttachment(pdfReport.toByteArray(), doc_name, "."+doc_format));
				
			} else {
				System.out.println(" NO DATA FOUND TO EXPORT .....");
			}
			conn.close();
			
		    /*
		    JRExporter exporter=null;
		    switch (doc_format) {
		    	case "pdf":
			    	exporter = new JRPdfExporter();
	            break;
		    	case "doc":
			    	exporter = new JRDocxExporter();
	            break;
		    	case "xls":
			    	exporter = new JRXlsExporter();
			    break;
		    	default:
	    		    exporter = new JRPdfExporter();
	    		break;  
		    }
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRPdfExporterParameter.METADATA_AUTHOR, actualUser);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,pdfReport); // your output goes here
			exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UTF-8");
			exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
			exporter.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
			*/
			
			//exporter.exportReport();
	


		
	        if(toSaveInAlfresco){
	            File file=generateFile(pdfReport.toByteArray(), doc_name, "."+doc_format);
	        	Class<?> c = KfisGenDocuments.class;
				Table table = c.getAnnotation(Table.class);
				String tableName = table.name();
				String doc_uid = uploadDocInAlfresco(tableName,tkfisGenDocumentId, file, doc_name, doc_name,doc_format);
				if(kgd!=null){
					kgd.setAUid(doc_uid);
					DAOFactory.getFactory().getKfisGenDocumentsDAO().save(kgd);
				}
	        }		

	} catch (Exception e) {
		System.out.println("Error:> "+e.getMessage());
		System.out.println("Error:> "+e.getMessage());
			throw new RuntimeException(e.getMessage());
		
	}
	    
		return SUCCESS;
	}
	
	
	/**
	 * 
	 * @param targetStream
	 * @param parameters
	 * @param conn
	 * @return ByteArrayResource
	 */
	private ByteArrayResource exportReportToPDF(InputStream targetStream, HashMap<String, Object> parameters, Connection conn) {
		try {
			JasperPrint jasperPrint = JasperFillManager.fillReport(targetStream, parameters, conn);

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
			byte[] reportContent = outputStream.toByteArray();
			return new ByteArrayResource(reportContent);
		} catch (Exception e) {
			System.err.println("Exporting report to PDF error: {}" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * Save gen docs.
	 *
	 * @param reportName the report name
	 * @return the kfis gen documents
	 */
	public KfisGenDocuments saveGenDocs(String reportName){
		KfisGenDocumentsDAO dao=DAOFactory.getFactory().getKfisGenDocumentsDAO();
		String uidGen=RandomStringUtils.random(6,chartogenerateuid);
		KfisGenDocuments kgd=new KfisGenDocuments();
		kgd.setUid(uidGen);
		kgd.setPerson(getUser().getPerson());
		kgd.setGeneratedDate(new Date());

		kgd.setUrl(getSettings().getString("kfis_barcode_servlet_url")+"?uid="+kgd.getUid()+"&name="+reportName);
		dao.save(kgd);
		Class<?> c = ActivityStatus.class;
		Table table = c.getAnnotation(Table.class);
		String tableName = table.name();		
		return kgd;
		
	}	
	
	/**
	 * Update DB table.
	 *
	 * @param uid the uid
	 * @param entity_name the entity name
	 * @param entity_id the entity id
	 * @param doc_name the doc name
	 */
	public static void updateDBTable( String uid,String entity_name,Long entity_id, String doc_name){
		
	}
	
	/**
	 * Gets the input stream.
	 *
	 * @return the input stream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}
	
	/**
	 * Sets the input stream.
	 *
	 * @param inputStream the new input stream
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
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
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @param description the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * Gets the content disposition.
	 *
	 * @return the content disposition
	 */
	public String getContentDisposition() {
		return contentDisposition;
	}
	
	/**
	 * Sets the content disposition.
	 *
	 * @param contentDisposition the new content disposition
	 */
	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}
	
	/**
	 * Gets the content type.
	 *
	 * @return the content type
	 */
	public String getContentType() {
		return contentType;
	}
	
	/**
	 * Sets the content type.
	 *
	 * @param contentType the new content type
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * Gets the report type.
	 *
	 * @return the report type
	 */
	public String getReport_type() {
		return report_type;
	}

	/**
	 * Sets the report type.
	 *
	 * @param report_type the new report type
	 */
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	
	/**
	 * Gets the doc gen.
	 *
	 * @return the doc gen
	 */
	public File getDoc_gen() {
		return doc_gen;
	}
	
	/**
	 * Sets the doc gen.
	 *
	 * @param doc_gen the new doc gen
	 */
	public void setDoc_gen(File doc_gen) {
		this.doc_gen = doc_gen;
	}
	
	/**
	 * Gets the entity name.
	 *
	 * @return the entity name
	 */
	public String getEntityName() {
		return entityName;
	}
	
	/**
	 * Sets the entity name.
	 *
	 * @param entityName the new entity name
	 */
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	
	/**
	 * Gets the entity id.
	 *
	 * @return the entity id
	 */
	public Long getEntityId() {
		return entityId;
	}
	
	/**
	 * Sets the entity id.
	 *
	 * @param entityId the new entity id
	 */
	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

	/**
	 * Checks if is to save in alfresco.
	 *
	 * @return true, if is to save in alfresco
	 */
	public boolean isToSaveInAlfresco() {
		return toSaveInAlfresco;
	}


	/**
	 * Sets the to save in alfresco.
	 *
	 * @param toSaveInAlfresco the new to save in alfresco
	 */
	public void setToSaveInAlfresco(boolean toSaveInAlfresco) {
		this.toSaveInAlfresco = toSaveInAlfresco;
	}


	/**
	 * Gets the uuid.
	 *
	 * @return the uuid
	 */
	public String getUuid() {
		return uuid;
	}


	/**
	 * Sets the uuid.
	 *
	 * @param uuid the new uuid
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}



}