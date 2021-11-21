package com.geoland.kfis.web.action.pub;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
// TODO: Auto-generated Javadoc

/**
 * The Class PublishSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created May 5, 2015 , 4:00:31 PM
 */
public class PublishSaveAction extends PublishBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	    
    	/** The file. */
    	private File file;
	    
    	/** The filename. */
    	private String filename;
	
	 /** The person. */
 	private Person person; 
		
		/* (non-Javadoc)
		 * @see com.opensymphony.xwork2.ActionSupport#validate()
		 */
		@Override
		public void validate() {
			person=getUser().getPerson();
			if(publishing!=null && (StringUtils.isEmpty(publishing.getHtmlCode()) || StringUtils.isBlank(publishing.getHtmlCode())))
				addFieldError("publishing.htmlCode", getMessage("pub.publishing.htmlCode.empty"));
			if(publishing!=null && StringUtils.isEmpty(publishing.getTitle()))
				addFieldError("publishing.title", getMessage("pub.publishing.title.empty"));
			if(publishing!=null && publishing.getPublishedDate()==null)
				addFieldError("publishing.publishedDate", getMessage("pub.publishing.publishedDate.empty"));
			if (hasActionErrors() || hasFieldErrors()) {
					HttpServletResponse response = ServletActionContext.getResponse();
					response.addHeader(Constants.ERRORS_EXITS, "true");
				}
			}
	
		/* (non-Javadoc)
		 * @see com.opensymphony.xwork2.ActionSupport#execute()
		 */
		@Override
		public String execute() throws Exception {
			   if(publishing.getId()==null){
				   publishing.setCreatedDate(new Date());
				   publishing.setPerson(person);
			   }
			   
				if(file!=null){
					publishing.setPhoto(getFileBytes(file));
				}else if(publishing.getId()!=null){
					Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
					SQLQuery sqlQuery= session.createSQLQuery("select p.photo from tpublishing as p  where p.id="+publishing.getId());
					sqlQuery.addScalar("photo");
					Object ob1 = sqlQuery.uniqueResult();
					publishing.setPhoto((byte[])ob1);
				}
				
			User user = getUser().getUser();
			publishing.setCurrentUser(user);	
			DAOFactory.getFactory().getPublishingDAO().save(publishing);
			return SUCCESS;
		}

		/**
		 * Gets the file.
		 *
		 * @return the file
		 */
		public File getFile() {
			return file;
		}

		/**
		 * Sets the file.
		 *
		 * @param file the new file
		 */
		public void setFile(File file) {
			this.file = file;
		}

		/**
		 * Gets the filename.
		 *
		 * @return the filename
		 */
		public String getFilename() {
			return filename;
		}

		/**
		 * Sets the filename.
		 *
		 * @param filename the new filename
		 */
		public void setFilename(String filename) {
			this.filename = filename;
		}
		
		
		

}
