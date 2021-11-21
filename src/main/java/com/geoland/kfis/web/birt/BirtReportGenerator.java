package com.geoland.kfis.web.birt;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Scanner;

import javax.persistence.Table;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.engine.api.EngineConfig;
import org.eclipse.birt.report.engine.api.HTMLRenderOption;
import org.eclipse.birt.report.engine.api.IReportEngine;
import org.eclipse.birt.report.engine.api.IReportEngineFactory;
import org.eclipse.birt.report.engine.api.IReportRunnable;
import org.eclipse.birt.report.engine.api.IRunAndRenderTask;
import org.eclipse.birt.report.engine.api.RenderOption;
import org.joda.time.DateTime;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.KfisGenDocuments;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.KfisGenDocumentsDAO;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class BirtReportGenerator.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created Dec 1, 2015 , 4:10:21 PM
 */
public class BirtReportGenerator extends BaseActionSupport   {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The parameters. */
	HashMap PARAMETERS = new HashMap();
	
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
    
    /** The doc name. */
    private String doc_name;
    
    /** The barcodeurl. */
    private String barcodeurl;
    
    /** The qr code content url. */
    private String qrCodeContentUrl;
    
    /** The to save in alfresco. */
    private boolean toSaveInAlfresco;
    
    /** The gen qr code. */
    private boolean genQrCode=false;
    
    /** The chartogenerateuid. */
    private char[] chartogenerateuid=new char[]{'1','2','3','4','5','6','7','8','9',
			'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','z'};
	
    
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
	public String execute() throws Exception {
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

    	// String pattern = "EEEEE dd MMMMM yyyy HH:mm:ss";
    	String pattern = "MM/dd/yyyy HH:mm:ss";
    	SimpleDateFormat simpleDateFormat =
    	        new SimpleDateFormat(pattern, new Locale("sq", "AL"));

    	String myformatteddate = simpleDateFormat.format(new Date());
        PARAMETERS.put("myformatteddate", myformatteddate);
        
   
        IReportEngine engine = null;
        EngineConfig config = null;
        try {
        	KfisGenDocuments kgd=null;
//            if(genQrCode){
            	kgd=saveGenDocs(doc_name+"."+doc_format);
            	String kfis_host=getSettings().getString("kfis_api_docs_url");
            	String qrCodeUrlGen=kfis_host+"/kfisQrCodeGen/BarcodeServlet?DATA="+kgd.getUrl()+"&TYPE=QRcode";
            	PARAMETERS.put("p_qrcode_content_url", qrCodeUrlGen);
            	PARAMETERS.put("logo1", kfis_host+ "/img/apk-3.png");
            	
            	PARAMETERS.put("logo2", kfis_host + "/img/rks_logo_trans-3.png");
            	
            	PARAMETERS.put("logo3", kfis_host+ "/img/apk-4.png");
            	
            	PARAMETERS.put("logo4", kfis_host + "/img/rks_logo_trans-4.png");
            	
            	// Fix bug : qr code not showing in exported excel file
            	// Solution: save qr code by user into a file on tomcat server
            	if(doc_format.equalsIgnoreCase("xls"))
            	{
	            	URL myurl = new URL(qrCodeUrlGen);
	            	InputStream in = new BufferedInputStream(myurl.openStream());
	            	ByteArrayOutputStream out = new ByteArrayOutputStream();
	            	byte[] buf = new byte[1024];
	            	int n = 0;
	            	while (-1!=(n=in.read(buf)))
	            	{
	            	   out.write(buf, 0, n);
	            	}
	            	out.close();
	            	in.close();
	            	byte[] response = out.toByteArray();
	            	
	            	FileOutputStream fos = new FileOutputStream(this.getClass().getClassLoader().getResource("").getPath() + "../../img/test-" + getUser().getUser().getId() + ".jpg");
	            	fos.write(response);
	            	fos.close();
	            	
	            
	                PARAMETERS.put("p_qrcode_content_url", kfis_host+ "/img/test-" + getUser().getUser().getId()+ ".jpg");
	                PARAMETERS.put("logo1", kfis_host+ "/img/apk-2.png");
	            	
	            	PARAMETERS.put("logo2", kfis_host + "/img/rks_logo_trans-2.png");
	            	
	            	PARAMETERS.put("logo3", kfis_host+ "/img/apk-42.png");
	            	
	            	PARAMETERS.put("logo4", kfis_host + "/img/rks_logo_trans-42.png");
            	}
            	tkfisGenDocumentId=kgd.getId();
//            }

            	
            config = new EngineConfig();          
            Platform.startup(config);
            final IReportEngineFactory FACTORY = (IReportEngineFactory) Platform.createFactoryObject(IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY);
            engine = FACTORY.createReportEngine(config);       
            
            IReportRunnable design = null;
            design = engine.openReportDesign(path+report_path); 
            IRunAndRenderTask task = engine.createRunAndRenderTask(design);        
            RenderOption options = new RenderOption();
            
            if(doc_format.equalsIgnoreCase("pdf")){
            	options.setOutputFormat(RenderOption.OUTPUT_FORMAT_PDF);	
            }else if(doc_format.equalsIgnoreCase("xls")){
            	options = new HTMLRenderOption();
            	// Fix : logo not showing in excel
            	options.setOption("ExcelEmitter.StructuredHeader ", true);
            	options.setOption("ExcelEmitter.ExtractMode", true);
            	options.setOption("ExcelEmitter.AutoColWidthsIncludeTableHeader", false);
            	options.setOutputFormat("xlsx");
            }else if(doc_format.equalsIgnoreCase("doc")){
            	options = new HTMLRenderOption();
            	options.setOutputFormat("doc");
            }
            
            ByteArrayOutputStream outs = new ByteArrayOutputStream();
            options.setOutputStream(outs);
            task.setRenderOption(options);
            task.setParameterValues(PARAMETERS);
            task.run();
            task.close();

            /*
            String pathName = "C:\\Daten\\Development\\Projects\\kfis\\BIRT\\text.pdf";
            File wf = new File(pathName);
            byte[] outbytes = Files.readAllBytes(wf.toPath());
            writeToFile(wf, outbytes);
            */
            byte[] outbytes = outs.toByteArray();

            setName(doc_name);
            setDescription("application/"+doc_format);
    		setContentType("application/"+doc_format);
    		setContentDisposition("attachment; filename="+doc_name+"."+doc_format);
            setInputStream(generateAttachment(outbytes, doc_name, "."+doc_format));
            
            engine.destroy();
            
            //if(toSaveInAlfresco){
                File file=generateFile(outbytes, doc_name, "."+doc_format);
            	Class<?> c = KfisGenDocuments.class;
    			Table table = c.getAnnotation(Table.class);
    			String tableName = table.name();
    			String doc_uid = uploadDocInAlfresco(tableName,tkfisGenDocumentId, file, doc_name, doc_name,doc_format);
    			if(kgd!=null){
    				kgd.setAUid(doc_uid);
    				DAOFactory.getFactory().getKfisGenDocumentsDAO().save(kgd);
    			}
            //}
        } catch(Exception ex) {
        	System.out.println(ex.getMessage());
        	System.err.println(ex);
        	ex.printStackTrace();
        } finally {  
           Platform.shutdown();
        }
        return SUCCESS; 
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
	 * Gets the doc name.
	 *
	 * @return the doc name
	 */
	public String getDoc_name() {
		return doc_name;
	}

	/**
	 * Sets the doc name.
	 *
	 * @param doc_name the new doc name
	 */
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	/**
	 * Gets the barcodeurl.
	 *
	 * @return the barcodeurl
	 */
	public String getBarcodeurl() {
		return barcodeurl;
	}

	/**
	 * Sets the barcodeurl.
	 *
	 * @param barcodeurl the new barcodeurl
	 */
	public void setBarcodeurl(String barcodeurl) {
		this.barcodeurl = barcodeurl;
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
	 * Checks if is gen qr code.
	 *
	 * @return true, if is gen qr code
	 */
	public boolean isGenQrCode() {
		return genQrCode;
	}

	/**
	 * Sets the gen qr code.
	 *
	 * @param genQrCode the new gen qr code
	 */
	public void setGenQrCode(boolean genQrCode) {
		this.genQrCode = genQrCode;
	}

	

}
 	
    	
    	
    
    
    
    

