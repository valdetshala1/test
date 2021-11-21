package com.geoland.kfis.web.action.gendoc;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.KfisGenDocuments;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.KfisGenDocumentsDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class GeneratedDocumentsSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Jan 9, 2018 , 12:57:58 PM
 */
public class GeneratedDocumentsSaveAction extends GeneratedDocumentsBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The report name. */
	private String reportName;
	
	/** The chartogenerateuid. */
	private char[] chartogenerateuid=new char[]{'1','2','3','4','5','6','7','8','9',
			'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','z'};
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		saveGenDocs();
		return NONE;
	}
	
	/**
	 * Save gen docs.
	 *
	 * @return the string
	 */
	public String saveGenDocs(){
		KfisGenDocumentsDAO dao=DAOFactory.getFactory().getKfisGenDocumentsDAO();
		String uidGen=RandomStringUtils.random(6,chartogenerateuid);
		KfisGenDocuments kgd=new KfisGenDocuments();
		kgd.setUid(uidGen);
		//kgd.setPerson(getUser().getPerson());
		kgd.setGeneratedDate(new Date());
		HttpServletRequest request = ServletActionContext.getRequest();
		String url=(String) request.getSession().getAttribute("kfis_api_docs_url");
		kgd.setUrl(url+"/u.do?uid="+kgd.getUid()+"&name="+reportName);
		dao.save(kgd);
		return kgd.getUrl();
		
	}
	
	/**
	 * Gets the report name.
	 *
	 * @return the report name
	 */
	public String getReportName() {
		return reportName;
	}
	
	/**
	 * Sets the report name.
	 *
	 * @param reportName the new report name
	 */
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	
	
}
