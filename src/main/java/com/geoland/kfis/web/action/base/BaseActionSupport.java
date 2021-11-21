package com.geoland.kfis.web.action.base;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Key;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.TimeZone;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.IntegerType;
import org.json.JSONException;
import org.json.JSONObject;

import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.logic.security.BoUserSecurity;
import com.geoland.kfis.model.Stand;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;

// TODO: Auto-generated Javadoc
/**
 * The Class BaseActionSupport.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 19, 2014 12:18:07 PM
 * @Version 1.0
 */
public class BaseActionSupport extends ActionSupport implements SessionAware, ApplicationAware {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 28289617688794075L;
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The date format1. */
	protected static SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd/MM/yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");	
	
	/** The session. */
	private Map<String, Object> session;
	
	/** The application. */
	private Map<String, Object> application;	
	
	/** The messages. */
	private static ResourceBundle messages;
	
	/** The settings. */
	protected static ResourceBundle settings;
	
	/** The locale. */
	private Locale locale;
	
	/** The ticket. */
	protected String ticket;
	
	/** The key aes as string. */
	protected String keyAesAsString="Bar12345Bar12345";
	
	/** The Constant UNICODE_FORMAT. */
	protected static final String UNICODE_FORMAT  = "UTF8";
	
	/** The secret key. */
	protected SecretKey secretKey;
	
	/** The Constant locales. */
	public static final Map<String, String> locales = new HashMap<String, String>();
	
	/** The doc name alf. */
	protected String docNameAlf;
	
	/** The doc description alf. */
	protected String docDescriptionAlf;
	
	/** The doc type alf. */
	protected String docTypeAlf;
	
	/** The grid lang script. */
	protected String gridLangScript="js/libs/i18n/grid.locale-al.js";
	
	static {
		locales.put("en_US", "English");
		locales.put("al_AL", "Albanien");
		locales.put("sr_SR", "Serbien");
		
		messages = ResourceBundle.getBundle("globalMessages_al"); 
		settings = ResourceBundle.getBundle("kfis");
	} 	
	
	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.ApplicationAware#setApplication(java.util.Map)
	 */
	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;		
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#getLocale()
	 */
	@Override
	public Locale getLocale() {
		this.locale = (Locale) this.session.get("locale");
    	if(this.locale==null){
    		locale = new Locale("al", "AL");
    	}
		return this.locale;
	}
	

	/**
	 * Put object in to user/client session.
	 *
	 * @param key of object
	 * @param obj Object
	 */
	public void addObjToSession(String key, Object obj){
		session.put(key, obj);
	}
	
	/**
	 * Please think about object casting.
	 *
	 * @param key of object
	 * @return Object
	 */
	public Object getSessionObj(String key){
		return session.get(key);
	}
	
	/**
	 * remove the user object from client session.
	 *
	 * @param key of use object
	 */
	public void removeSessionObj(String key){
		session.remove(key);
	}
	
	/**
	 * Sets the locale.
	 *
	 * @param locale the new locale
	 */
	public void setLocale(Locale locale) {
		this.session.put("locale", locale);
		this.locale = locale;
	}
	
	/**
	 * Adds the validation errors.
	 *
	 * @param validations the validations
	 */
	public void addValidationErrors(Map<String, String> validations){
		for (Entry<String, String>  entry: validations.entrySet()) {
			addFieldError(entry.getKey(), entry.getValue());
		} 		
	}
	
	/**
	 * Gets the messages.
	 *
	 * @return the resourceBundle
	 */
	protected ResourceBundle getMessages() {
		if("al".equals(getLocale().getLanguage())){
			messages = ResourceBundle.getBundle("globalMessages_al");
		}else if("en".equals(getLocale().getLanguage())){
			messages = ResourceBundle.getBundle("globalMessages_en");
		}else if("sr".equals(getLocale().getLanguage())){
			messages = ResourceBundle.getBundle("globalMessages_sr");
		}else{
			messages = ResourceBundle.getBundle("globalMessages");
		}	
		return messages;
	}
	
	/**
	 * Gets the message.
	 *
	 * @param key the key
	 * @return Message
	 */
	public String getMessage(String key){
		try{
			return getMessages().getString(key);
		}catch (MissingResourceException mre){
			return key;
		}
	}	
	
	/**
	 * Log exception.
	 *
	 * @param e the e
	 * @param log the log
	 */
	protected void logException(Exception e, Logger log){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.addHeader("errors_exits", "true");
		addActionError(e.getMessage());
		System.err.println(e);
		log.error(e.getMessage(), e);	
	}	
	

	/**
	 * Prints the.
	 *
	 * @param request the request
	 */
	@SuppressWarnings("rawtypes")
	protected void print(HttpServletRequest request){
		System.out.println("-----------START---------");
		Enumeration en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			System.out.println(paramName + " = "
					+ request.getParameter(paramName) + "<br/>");
		}		
		System.out.println("-----------END---------");
		System.out.println("\n");
	}	
	
	
	@SuppressWarnings("rawtypes")
	protected void printHttpServletRequest(){
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("-----------START---------");
		System.out.println("URI:\t" + request.getRequestURI());
		System.out.println("URL:\t" + request.getRequestURL().toString());
		System.out.println("\n");
		Enumeration en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			System.out.println(paramName + " = "
					+ request.getParameter(paramName) + "<br/>");
		}		
		System.out.println("-----------END---------");
		System.out.println("\n");
	}		
	
	
	
	
    /**
     * <p>Provide reference to User object for authenticated user.</p>
     *
     * @return User object for authenticated user.
     */
    public BoUserSecurity getUser() {
    	if(session != null && session.get(Constants.USER_KEY) != null){
    		return (BoUserSecurity) session.get(Constants.USER_KEY);
    	}
    	
    	return null;
    }

    /**
     * setUser Method.
     *
     * @param user the new user
     */
	public void setUser(BoUserSecurity user) {
		if(session !=null && user!=null && user.getUser() != null){
			session.put(Constants.USER_KEY, user);
			session.put("AUTHENTICATED", new Boolean(true));
			HttpSession httpSession = ServletActionContext.getRequest().getSession();
			httpSession.setAttribute(Constants.USER_KEY, user);
		}
	}
	
	/**
	 * Gets the application.
	 *
	 * @return the application
	 */
	public Map<String, Object> getApplication() {
		return application;
	}
	
	/**
	 * Gets the settings.
	 *
	 * @return the settings
	 */
	public static ResourceBundle getSettings() {
		return settings;
	}
	
	/**
	 * Generate attachment based on params.
	 *
	 * @param doc the doc
	 * @param docName the doc name
	 * @param docType the doc type
	 * @return the byte array input stream
	 */
	public ByteArrayInputStream generateAttachment(byte[] doc, String docName, String docType){
		ByteArrayInputStream bais=null;
		try {
			File f = File.createTempFile(docName, docType);
			FileOutputStream outputStream = new FileOutputStream (f); 
	        outputStream.write(doc);
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        baos.writeTo(outputStream);
	        bais = new ByteArrayInputStream(FileUtils.readFileToByteArray(f));
	        outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return bais;
	}
	
	/**
	 * Gets bytes from file.
	 *
	 * @param file the file
	 * @return bFile
	 */
	public byte[] getFileBytes(File file){
		byte[] bFile=new byte[(int) file.length()];
		
		try {
			FileInputStream fileInputStream = new FileInputStream(file);
			fileInputStream.read(bFile);
			fileInputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bFile;
	}
	
	/**
	 * Calculate year difference.
	 *
	 * @param d the d
	 * @return given year difference with current year
	 */
	public long calculateYearDifference(Date d){
		Date now=new Date();
		double timeDifference = now.getTime()- d.getTime();
		double daysInBetween = timeDifference / (24*60*60*1000);
		double years=(daysInBetween/365);
		
		return (long)years;
	}
	
	/**
	 * Compares two dates.
	 *
	 * @param d1 the d 1
	 * @param d2 the d 2
	 * @return true if d2 is bigger than d1
	 */
	public boolean compareDates(Date d1, Date d2){
		if(d1!=null && d2!=null && d1.compareTo(d2)==1)
			return true;
		return false;
	}
	
	/**
	 * User is forest owner.
	 *
	 * @return true, if successful
	 */
	public boolean userIsForestOwner(){
		Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery roleQueryCount=s.createSQLQuery("select count(r.*) from  trbac_user_role as ur  left join trbac_role as r  on ur.role_id=r.id where r.code='foc'  and ur.user_id="+getUser().getUser().getId());
		roleQueryCount.addScalar("count",IntegerType.INSTANCE);
		Integer rez = (Integer) roleQueryCount.uniqueResult();
		if(rez!=null && rez.longValue()!=0){
			return true;
		}
		return false;
		
	}
	
	/**
	 *  check if stand has estimated volume. If so return true, else return false
	 *
	 * @param stand the stand
	 * @return true, if successful
	 */
	public boolean hasEstimatedVolume(Stand stand){
		if(stand.getEstimateVolume()!=null && !stand.getEstimateVolume().getCode().equals(new Long("0")))
			return true;
		
		return false;
	}
	
	/**
	 * check if stand has measured volume. If so return true, else return false
	 *
	 * @param stand the stand
	 * @return true, if successful
	 */
	public boolean hasMeasuredVolume(Stand stand){
		if(stand.getVolumeM3ha()!=null && !stand.getVolumeM3ha().equals(new Long("0")))
			return true;
		
		return false;
	}
	
	/**
	 * check if stand has no volume. If so return true, else return false
	 *
	 * @param stand the stand
	 * @return true, if successful
	 */
	public boolean hasNoVolume(Stand stand){
		if(!hasMeasuredVolume(stand) && !hasEstimatedVolume(stand))
			return true;
		
		return false;
	}
	
	/**
	 *  check if this stand has annual growth for given year.
	 *
	 * @param stand the stand
	 * @param year the year
	 * @return true, if successful
	 */
	public boolean hasAnnualGrowth(Stand stand,String year){
		String query="select count(*) from tgis_stand_growth where year="+year + " and stand_id="+stand.getId();
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sql=session.createSQLQuery(query);
		Object count=sql.uniqueResult();
		if(new Integer(count.toString()).intValue()>0)
			return true;
		
		return false;
	}
	
	/**
	 * Checks if is forest institute user.
	 *
	 * @return true, if is forest institute user
	 */
	public boolean isForestInstituteUser(){
		String query="select count(u.*) from tuser u " +
				" left join trbac_user_role rb on rb.user_id=u.id " +
				" left join trbac_role r on rb.role_id=r.id" +
				" where r.code='frins' and u.id="+getUser().getUser().getId();
		Integer count=DAOFactoryRbac.getFactory().getUserDAO().countQuery(query);
		if(count.intValue()>0)
			return true;
		
		return false;
	}
	
	/**
	 * Generate file.
	 *
	 * @param doc the doc
	 * @param docName the doc name
	 * @param docType the doc type
	 * @return the file
	 */
	public File generateFile(byte[] doc, String docName, String docType){
		File f=null;
		try {
			f = File.createTempFile(docName, docType);
			FileOutputStream outputStream = new FileOutputStream (f); 
	        outputStream.write(doc);
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        baos.writeTo(outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public void writeToFile(File file, byte[] data){
		try {
			FileOutputStream outputStream = new FileOutputStream (file); 
	        outputStream.write(data);
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        baos.writeTo(outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Creates the QR code.
	 *
	 * @param qrCodeData the qr code data
	 * @param qrCodeheight the qr codeheight
	 * @param qrCodewidth the qr codewidth
	 * @return the file
	 * @throws WriterException the writer exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public static File createQRCode(String qrCodeData, int qrCodeheight, int qrCodewidth)
			throws WriterException, IOException {
		String charset = "UTF-8"; // or "ISO-8859-1"
		Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		BitMatrix matrix = new MultiFormatWriter().encode(new String(qrCodeData.getBytes(charset), charset), BarcodeFormat.QR_CODE, qrCodewidth, qrCodeheight, hintMap);
		File f = File.createTempFile("qr-code", "png");
		MatrixToImageWriter.writeToFile(matrix, "png", f);
		return f;
	}
	
	 /**
 	 * Gets the ticket.
 	 *
 	 * @return the ticket
 	 */
 	public String getTicket() {
	       HttpClient client = new HttpClient();
	       String apiurl =settings.getString("alfresco_api_url")+"/api/login";
	       PostMethod post = new PostMethod(apiurl);
	       try {
	          JSONObject login = new JSONObject();
	          login.put("username", settings.getString("alfresco_username"));
	          login.put("password", settings.getString("alfresco_password"));

	          post.setDoAuthentication(true);
	          post.setRequestHeader("Content-Type", "application/json");
	          post.setRequestEntity(new StringRequestEntity(login.toString(),
	                "application/json", "UTF-8"));

	          int status = client.executeMethod(post);
	          if (status != HttpStatus.SC_OK) {
	             System.err.println("Method failed: " + post.getStatusLine());
	          }
	          String responseData = IOUtils.toString(post.getResponseBodyAsStream(), "UTF-8");
	          JSONObject response = new JSONObject(responseData);
	          ticket = response.getJSONObject("data").getString("ticket");
	       } catch (Exception e) {
	          e.printStackTrace();
	       } finally {
	          post.releaseConnection();
	       }
	       return ticket;
	    }
	  
  	/**
  	 * Creates the folder.
  	 *
  	 * @param uiHierarchy the ui hierarchy
  	 * @param ticket the ticket
  	 * @throws IOException Signals that an I/O exception has occurred.
  	 * @throws JSONException the JSON exception
  	 */
  	public  void createFolder(String uiHierarchy,String ticket) throws IOException, JSONException
	   { if (ticket!=null)
	      {
	    	 String  URL=  settings.getString("alfresco_api_url")+"/slingshot/doclib2/mkdir?alf_ticket="+ticket;
	         HttpClient client = new HttpClient();
	         PostMethod post = null;
	         String jsonStr=" { \"destination\" : \"workspace://SpacesStore/"+settings.getString("alfresco_base_nodeRef")+"\",  \"paths\": [  \""+uiHierarchy+"\" ]}";
	         post = new PostMethod(URL);
	         post.setRequestBody(jsonStr);
	         post.setRequestHeader("Content-Type", "application/json");
	         int status = client.executeMethod(post);
	         if (status != HttpStatus.SC_OK) {
	        	 System.err.println("Method failed: " + post.getStatusLine());
		     }
	         System.err.println("createFolder: " + post.getStatusLine());
		     post.releaseConnection();
	      }
	   else
	      { 
		   	System.out.println("Not able to connect with alfresco");
	      
	      }
	   }
	
	/**
	 * Upload doc in alfresco.
	 *
	 * @param tableName the table name
	 * @param entityId the entity id
	 * @param file the file
	 * @param description the description
	 * @param filename the filename
	 * @param filetype the filetype
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws JSONException the JSON exception
	 */
	public String uploadDocInAlfresco(String tableName,Long entityId, File file, String description, String fileName, String fileType) throws IOException, JSONException{
		String ticket=getTicket();
		String doc_uid="";
		if (ticket != null) {
			String path = tableName + "/" + entityId;
			createFolder(path, ticket);
			String URL = settings.getString("alfresco_api_url") + "/api/upload?alf_ticket=" + ticket;
			HttpClient client = new HttpClient();
			fileName = FilenameUtils.getName(file.getAbsolutePath());
			PostMethod post = new PostMethod(URL);
			Part[] parts = { new FilePart("filedata", fileName, file, fileType, null),
					new StringPart("filename", fileName), new StringPart("Description", "description"),
					new StringPart("destination", description), new StringPart("uploaddirectory", "/" + path),
					new StringPart("siteid", "kfis"), new StringPart("containerId", "documentLibrary"),
					new StringPart("tagScope", "kfis"), new StringPart("cm:taggable", "kfis") };
			post.setRequestEntity(new MultipartRequestEntity(parts, post.getParams()));
			int status = client.executeMethod(post);
			if (status != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + post.getStatusLine());
			}
			System.err.println("uploadDocInAlfresco: " + post.getStatusLine());
			String response = IOUtils.toString(post.getResponseBodyAsStream(), "UTF-8");
			JSONObject obj = new JSONObject(response);
			String nodeRef = obj.getString("nodeRef");
			doc_uid = nodeRef.substring(nodeRef.lastIndexOf('/') + 1);
			post.releaseConnection();
		} else {
			System.out.println("Not able to connect");
		}
		return doc_uid;
	}
	
    /**
     * Gets the content from alfresco.
     *
     * @param uid the uid
     * @param ticket the ticket
     * @return the content from alfresco
     */
    public byte[] getContentFromAlfresco(String uid, String ticket){
    		getTicket();
	       HttpClient client = new HttpClient();
//	       String ticket=getTicket();	
	       byte[] downloadedFile=null;
	       if (ticket!=null){
	       String apiurl = settings.getString("alfresco_api_url")+"/api/node/content;cm:content/workspace/SpacesStore/"+ uid + "?alf_ticket="+ticket;
	       GetMethod get = new GetMethod(apiurl);
	       try {
	          get.setDoAuthentication(true);
	          get.setRequestHeader("Content-Type", "application/json");
	          int status = client.executeMethod(get);
	          if (status != HttpStatus.SC_OK) {
	             System.err.println("Method failed: " + get.getStatusLine());
	          }
	          downloadedFile = get.getResponseBody();
	       } catch (Exception e) {
	          e.printStackTrace();
	       } finally {
	          get.releaseConnection();
	       }
	       }else
		      {System.out.println("Not able to connect with alfresco");}
		return downloadedFile;
		}
    
    /**
     * Read content from alfresco.
     *
     * @param tableName the table name
     * @param entityId the entity id
     * @return the JSON array
     */
    public JSONArray readContentFromAlfresco(String tableName,String entityId){
    	ticket=getTicket();
    	JSONArray docs_rez = new JSONArray();
    	HttpClient client = new HttpClient();
	    String apiurl =settings.getString("alfresco_api_url_1")+"/api/-default-/public/cmis/versions/1.1/browser/root/Sites/Kfis/documentLibrary/"+tableName+"/"+entityId+"??cmisselector=children&succinct=true&alf_ticket="+ticket;
	    GetMethod get = new GetMethod(apiurl);
	       try {
		          get.setDoAuthentication(true);
		          get.setRequestHeader("Content-Type", "application/json");
		          int status = client.executeMethod(get);
		          if (status != HttpStatus.SC_OK) {
		             System.err.println("Method failed: " + get.getStatusLine());
		          }
		          String jsonString=get.getResponseBodyAsString();
		          if(!jsonString.contains("\"exception\":\"objectNotFound\"")){
			          org.json.JSONObject json = new JSONObject(jsonString);
			          org.json.JSONArray objects = json.getJSONArray("objects");
			          Integer numItems = json.getInt("numItems");
			          
			          for(int i=0;i<numItems.intValue();i++){ 
				          org.json.JSONObject objectItems = objects.getJSONObject(i);
				          org.json.JSONObject object = objectItems.getJSONObject("object");
				          org.json.JSONObject succinctProperties = object.getJSONObject("succinctProperties");
				          net.sf.json.JSONObject jsonObject = new net.sf.json.JSONObject();
				          jsonObject.element("nodeRef", succinctProperties.getString("alfcmis:nodeRef"));
				          jsonObject.element("objectTypeId", succinctProperties.getString("cmis:objectTypeId"));
				          jsonObject.element("description", succinctProperties.getString("cmis:description"));
				          String creationDate=createDateFromEpoch(new Long(succinctProperties.getString("cmis:creationDate")));
				          jsonObject.element("creationDate", creationDate);
				          if(succinctProperties.has("cmis:contentStreamMimeType")){
				          jsonObject.element("contentStreamMimeType", succinctProperties.getString("cmis:contentStreamMimeType"));
				          }else{
					          jsonObject.element("contentStreamMimeType","");
				          }
				          jsonObject.element("name", succinctProperties.getString("cmis:name"));
				          String lastModificationDate=createDateFromEpoch(new Long(succinctProperties.getString("cmis:lastModificationDate")));
				          jsonObject.element("lastModificationDate", lastModificationDate);
				          if(succinctProperties.has("cmis:contentStreamLength")) {
				        	 double length=succinctProperties.getInt("cmis:contentStreamLength");
				        	 String lengthString=length+" bytes";
				        	 if(length>1024){
				        		 DecimalFormat df=new DecimalFormat("0.00");
				        		 length=length/1024.00;
				        		 lengthString=df.format(length);
				        		 lengthString=lengthString+" KB";
				        	 }
				          jsonObject.element("contentStreamLength", lengthString);
				          }else{
					          jsonObject.element("contentStreamLength",0);
				          }
				          String objectId=succinctProperties.getString("cmis:objectId").split(";")[0].trim();
				          jsonObject.element("objectId", objectId);
				          jsonObject.element("createdBy", succinctProperties.getString("cmis:createdBy"));
				          docs_rez.add(jsonObject);
	
			          }
		          }
		       } catch (Exception e) {
		          e.printStackTrace();
		       } finally {
		          get.releaseConnection();
		       } 
	       
	    
    	return docs_rez;
    }
    
    /**
     * Creates the date from epoch.
     *
     * @param epoch the epoch
     * @return the string
     */
    public String createDateFromEpoch(Long epoch){
    	Date date= new Date(epoch);
        DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        format.setTimeZone(TimeZone.getTimeZone("Etc/UTC"));
        String formatted = format.format(date);
    	return formatted;
    }
    
    /**
     * Encrypt.
     *
     * @param plainText the plain text
     * @param secretKey the secret key
     * @return the string
     * @throws Exception the exception
     */
    protected static String encrypt(String plainText, Key secretKey)
            throws Exception {
    	Cipher cipher=  Cipher.getInstance("AES");
        byte[] plainTextByte = plainText.getBytes(UNICODE_FORMAT);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedByte = cipher.doFinal(plainTextByte);
//        Base64.Encoder encoder = Base64.getEncoder();
//        String encryptedText = encoder.encodeToString(encryptedByte);
        String encryptedText = DatatypeConverter.printBase64Binary(encryptedByte);
        return encryptedText;
    }

    /**
     * Decrypt.
     *
     * @param encryptedText the encrypted text
     * @param secretKey the secret key
     * @return the string
     * @throws Exception the exception
     */
    protected static String decrypt(String encryptedText, Key secretKey)
            throws Exception {
    	Cipher cipher=  Cipher.getInstance("AES");
//        Base64.Decoder decoder = Base64.getDecoder();
//        byte[] encryptedTextByte = decoder.decode(encryptedText);
    	encryptedText=encryptedText.replace(" ", "+");
        byte[] encryptedTextByte = DatatypeConverter.parseBase64Binary(encryptedText);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] decryptedByte = cipher.doFinal(encryptedTextByte);
        String decryptedText = new String(decryptedByte);
        return decryptedText;
    }
    
	/**
	 * Checks if is hunting owner user.
	 *
	 * @return true, if is hunting owner user
	 */
	public boolean isHuntingOwnerUser(){
		String query="select count(u.*) from tuser u " +
				" left join trbac_user_role rb on rb.user_id=u.id " +
				" left join trbac_role r on rb.role_id=r.id" +
				" where r.code='hlo' and u.id="+getUser().getUser().getId();
		Integer count=DAOFactoryRbac.getFactory().getUserDAO().countQuery(query);
		if(count.intValue()>0)
			return true;
		
		return false;
	}

	
	/**
	 * Grid lang.
	 *
	 * @param language the language
	 */
	public void gridLang(String language) {
		gridLangScript= "js/libs/i18n/grid.locale-"+language+".js";
		
	}
	
	/**
	 * Gets the doc name alf.
	 *
	 * @return the doc name alf
	 */
	public String getDocNameAlf() {
		return docNameAlf;
	}

	/**
	 * Sets the doc name alf.
	 *
	 * @param docNameAlf the new doc name alf
	 */
	public void setDocNameAlf(String docNameAlf) {
		this.docNameAlf = docNameAlf;
	}

	/**
	 * Gets the doc description alf.
	 *
	 * @return the doc description alf
	 */
	public String getDocDescriptionAlf() {
		return docDescriptionAlf;
	}

	/**
	 * Sets the doc description alf.
	 *
	 * @param docDescriptionAlf the new doc description alf
	 */
	public void setDocDescriptionAlf(String docDescriptionAlf) {
		this.docDescriptionAlf = docDescriptionAlf;
	}

	/**
	 * Gets the doc type alf.
	 *
	 * @return the doc type alf
	 */
	public String getDocTypeAlf() {
		return docTypeAlf;
	}

	/**
	 * Sets the doc type alf.
	 *
	 * @param docTypeAlf the new doc type alf
	 */
	public void setDocTypeAlf(String docTypeAlf) {
		this.docTypeAlf = docTypeAlf;
	}

	/**
	 * Gets the grid lang script.
	 *
	 * @return the grid lang script
	 */
	public String getGridLangScript() {
		return gridLangScript;
	}

	/**
	 * Sets the grid lang script.
	 *
	 * @param gridLangScript the new grid lang script
	 */
	public void setGridLangScript(String gridLangScript) {
		this.gridLangScript = gridLangScript;
	} 
   
    
}
