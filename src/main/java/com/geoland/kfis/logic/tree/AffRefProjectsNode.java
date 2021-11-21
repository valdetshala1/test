package com.geoland.kfis.logic.tree;

import java.security.Key;
import java.text.SimpleDateFormat;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.persistence.Table;
import javax.xml.bind.DatatypeConverter;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.AffRefProjects;

import net.sf.json.JSONObject;

// TODO: Auto-generated Javadoc
/**
 * The Class AffRefProjectsNode.
 */
public class AffRefProjectsNode extends Node<AffRefProjects>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/** The language. */
	protected String language="";
	
	/** The key aes as string. */
	protected String keyAesAsString="Bar12345Bar12345";
	
	/** The Constant UNICODE_FORMAT. */
	protected static final String UNICODE_FORMAT  = "UTF8";

	/**
	 * Instantiates a new aff ref projects node.
	 *
	 * @param language the language
	 */
	public AffRefProjectsNode(String language){
		super();
		this.language=language;
	}
	
	/**
	 * Instantiates a new aff ref projects node.
	 */
	public AffRefProjectsNode(){
		super();
	}
	
	/**
	 * Gets the JSON object.
	 *
	 * @return the JSON object
	 */
	public JSONObject getJSONObject(){
		JSONObject jo = new JSONObject();
		jo.element("id", "\"" + getData().getId() + "\"");
		
//		
		if(getData().getAffRefProjects() != null){
			jo.element("parent_id", getData().getAffRefProjects().getId());
		}else{
			jo.element("parent_id", "");
		}
		
		jo.element("data_from", getData().getDataFrom());
		jo.element("name", getData().getName());

		
		if(getData().getCreatedTime()!=null)
			jo.element("created_date",DATE_FORMAT.format(getData().getCreatedTime()));	
		else 
			jo.element("created_time","");
		jo.element("created_by",getData().getPerson().getFirstName()+" "+getData().getPerson().getLastName());
		jo.element("remarks", getData().getRemarks());
		if(getData().getAffRefProjects() != null){
			jo.element("parent", "\"" + getData().getAffRefProjects().getId() + "\"");
		}else{
			jo.element("parent", "");
		}
		jo.element("level", getLevel());	
		
		if(getChildCount() <= 0){
			jo.element("isLeaf", true);
		}
		else {
			jo.element("isLeaf", false);
		}		
		jo.element("expanded", true);
		jo.element("loaded", true);
		
		Class<?> c = AffRefProjects.class;
		Table table = c.getAnnotation(Table.class);
		String tableName = table.name();
		Key aesKey = new SecretKeySpec(keyAesAsString.getBytes(), "AES");

		try {
			String encryptedText= encrypt(tableName,aesKey);
			jo.element("encryptedText", encryptedText);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jo;
	}
    
    /**
     * Encrypt.
     *
     * @param plainText the plain text
     * @param secretKey the secret key
     * @return the string
     * @throws Exception the exception
     */
    private static String encrypt(String plainText, Key secretKey)
            throws Exception {
    	Cipher cipher=  Cipher.getInstance("AES");
        byte[] plainTextByte = plainText.getBytes(UNICODE_FORMAT);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedByte = cipher.doFinal(plainTextByte);
        String encryptedText = DatatypeConverter.printBase64Binary(encryptedByte);
        return encryptedText;
    }
}
