package com.geoland.kfis.web.action.affref;

import java.io.File;
import java.util.Date;
import java.util.StringTokenizer;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.AffRefProjects;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AffRefProjectsSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 29, 2017 , 11:54:13 AM
 */
public class AffRefProjectsSaveAction extends AffRefProjectsBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The file. */
	private File file[];
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(affRefProjects !=null && StringUtils.isEmpty(affRefProjects.getName()))
			addFieldError("affRefProjects.name", getMessage("affRefProjects.name.empty"));
		
		if (hasActionErrors() || hasFieldErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(parentId==null){
			affRefProjects.setAffRefProjects(null);
		}
		if(affRefProjects!=null && affRefProjects.getId()==null){
			affRefProjects.setCreatedTime(new Date());
			affRefProjects.setPerson(getUser().getPerson());
		}
		DAOFactory.getFactory().getAffRefProjectsDAO().save(affRefProjects);
		Class<?> c = AffRefProjects.class;
		Table table = c.getAnnotation(Table.class);
		String tableName = table.name();
		if(file!=null && file.length>0){
			StringTokenizer st=new StringTokenizer(docNames,";");
			int length = st.countTokens();
			String names[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					names[i]=a;
			}
			st=new StringTokenizer(docExts, ";");
			length=st.countTokens();
			String exts[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					exts[i]=a;
			}
			for(int i=0;i<file.length;i++){
				if(file[i]!=null){
					uploadDocInAlfresco(tableName,affRefProjects.getId(), file[i], names[i], names[i], exts[i]);

				}
			}
		}
		return SUCCESS;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File[] getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File[] file) {
		this.file = file;
	}
	

}
