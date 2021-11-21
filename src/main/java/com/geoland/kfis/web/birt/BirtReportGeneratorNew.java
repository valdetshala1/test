package com.geoland.kfis.web.birt;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.persistence.Table;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.engine.api.EngineConfig;
import org.eclipse.birt.report.engine.api.HTMLRenderOption;
import org.eclipse.birt.report.engine.api.IReportEngine;
import org.eclipse.birt.report.engine.api.IReportEngineFactory;
import org.eclipse.birt.report.engine.api.IReportRunnable;
import org.eclipse.birt.report.engine.api.IRunAndRenderTask;
import org.eclipse.birt.report.engine.api.RenderOption;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.KfisGenDocuments;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.KfisGenDocumentsDAO;
import com.geoland.kfis.web.action.base.BaseActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class BirtReportGeneratorNew extends BaseActionSupport   {
	
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
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() throws Exception {
    	HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Long tkfisGenDocumentId=null;
        ServletContext sc = request.getSession().getServletContext();
        String path=sc.getRealPath("/report");
        String jsonParam=request.getParameter("jsonObj");
        
        String report_path=request.getParameter("report_path");
        String  doc_name=request.getParameter("doc_name");
        String doc_format=request.getParameter("doc_format");
        JSONArray array= (JSONArray) JSONSerializer.toJSON(jsonParam);
        if(array.size()>0){
        	for(Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
        		JSONObject obj=iterator.next();
        		String parma_name="";
        		String parma_val="";
        		if(obj.get("param_name")!=null  && StringUtils.isNotEmpty(obj.get("param_name").toString())){
    				parma_name= obj.get("param_name").toString();
        		}
    			if(obj.get("param_val")!=null  && StringUtils.isNotEmpty(obj.get("param_val").toString())){
    				 parma_val= obj.get("param_val").toString();
        	}
    		PARAMETERS.put(parma_name,parma_val);		
          }
        }
    	PARAMETERS.put("p_user",getUser().getUser().getFirstName()+" "+getUser().getUser().getLastName());	
        
   
        IReportEngine engine = null;
        EngineConfig config = null;
        try {
        	KfisGenDocuments kgd=null;
//            if(genQrCode){
            	kgd=saveGenDocs(doc_name+"."+doc_format);
            	String kfis_host=getSettings().getString("kfis_api_docs_url");
            	String qrCodeUrlGen=kfis_host+"/kfisQrCodeGen/BarcodeServlet?DATA="+kgd.getUrl()+"&TYPE=QRcode";
            	PARAMETERS.put("p_qrcode_content_url",qrCodeUrlGen);
            	toSaveInAlfresco=true;
            	tkfisGenDocumentId=kgd.getId();
//            }

            config = new EngineConfig();          
            Platform.startup(config);
            final IReportEngineFactory FACTORY = (IReportEngineFactory) Platform
                .createFactoryObject(IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY);
            engine = FACTORY.createReportEngine(config);       
            IReportRunnable design = null;
            design = engine.openReportDesign(path+report_path); 
            IRunAndRenderTask task = engine.createRunAndRenderTask(design);        
            RenderOption options = new RenderOption();
            if(doc_format.equalsIgnoreCase("pdf")){
            	options.setOutputFormat(RenderOption.OUTPUT_FORMAT_PDF);	
            }else if(doc_format.equalsIgnoreCase("xls")){
            	options = new HTMLRenderOption();
            	options.setOutputFormat("xls");
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
            byte[] outbytes = outs.toByteArray();
            setName(doc_name);
            setDescription("application/"+doc_format);
    		setContentType("application/"+doc_format);
    		setContentDisposition("attachment; filename="+doc_name+"."+doc_format);
            setInputStream(generateAttachment(outbytes, doc_name, "."+doc_format));
            engine.destroy();
            
//            File wf = new File("C:\\Daten\\Development\\Projects\\kfis\\" + doc_name + "."+doc_format);
//            writeToFile(wf, outbytes);
            
//            if(toSaveInAlfresco){
                File file = generateFile(outbytes, doc_name,"."+doc_format);
            	Class<?> c = KfisGenDocuments.class;
    			Table table = c.getAnnotation(Table.class);
    			String tableName = table.name();
    			String doc_uid=uploadDocInAlfresco(tableName,tkfisGenDocumentId, file, doc_name, doc_name,doc_format);
    			if(kgd!=null){
    				kgd.setAUid(doc_uid);
    				DAOFactory.getFactory().getKfisGenDocumentsDAO().save(kgd);
    			}
//            }
        } catch(final Exception EX) {
            EX.printStackTrace();
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
 	
    	
    	
    
    
    
    

