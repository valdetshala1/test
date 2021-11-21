package com.geoland.kfis.web.action.hrm.decision.docgenerator;

import java.io.InputStream;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.DecisionDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.hrm.decision.DecisionBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionDocGenetarorAction.
 */
public class DecisionDocGenetarorAction extends DecisionBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The doc id. */
	private Long docId;
	
	/** The doc. */
	private DecisionDoc doc;
	
	/** The name. */
	private String name; //holds name of downloaded file
    
    /** The input stream. */
    private InputStream inputStream; //holds stream of downloaded file
    
    /** The description. */
    private String description; //holds the content type of the downloaded file
    
    /** The content disposition. */
    private String contentDisposition;
	
	/** The content type. */
	private String contentType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(docId!=null){
			doc=DAOFactory.getFactory().getDecisionDocDAO().get(docId);
			if(doc==null ||(doc!=null && doc.getDoc()==null) ){
				addFieldError("", "");
			}
		}else{
			addFieldError("", "");
		}
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		setName(doc.getDocName());
		StringTokenizer st=new StringTokenizer(doc.getDocType(),".");
		String s=st.nextToken();
		setDescription("application/"+s);
		setContentDisposition("inline; filename=" + doc.getDocName());
		setInputStream(generateAttachment(doc.getDoc(),doc.getDocName(), "."+doc.getDocType()));
		return SUCCESS;
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
	 * Gets the doc id.
	 *
	 * @return the doc id
	 */
	public Long getDocId() {
		return docId;
	}

	/**
	 * Sets the doc id.
	 *
	 * @param docId the new doc id
	 */
	public void setDocId(Long docId) {
		this.docId = docId;
	}

	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public DecisionDoc getDoc() {
		return doc;
	}

	/**
	 * Sets the doc.
	 *
	 * @param doc the new doc
	 */
	public void setDoc(DecisionDoc doc) {
		this.doc = doc;
	}
}
