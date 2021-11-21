package com.geoland.kfis.web.action.dem.importshape.line;

import java.text.ParseException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;

// TODO: Auto-generated Javadoc
/**
 * The Class LineSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Oct 18, 2017 , 3:47:06 PM
 */
public class LineSaveAction extends LineBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The line note. */
	private String lineNote;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(employee!=null){
			addActionError("");
		}
		if(shapeFile==null)
			addFieldError("shapeFile", getMessage("import.shape.file.empty"));
		if(!"shp".equals(shapeFileExt))
			addFieldError("shapeFileExt", getMessage("import.shape.file.ext.different"));
		else deleteTempFiles(path(shpf),shapeFileName);
		
		if(shxFile==null)
			addFieldError("shxFile", getMessage("import.shx.file.empty"));
		if(!"shx".equals(shxFileExt))
			addFieldError("shxFileExt", getMessage("import.shx.file.ext.different"));
		
		if(dbfFile==null)
			addFieldError("dbfFile", getMessage("import.dbf.file.empty"));
		if(!"dbf".equals(dbfFileExt))
			addFieldError("dbfFileExt", getMessage("import.dbf.file.ext.different"));
		if(!(hasFieldErrors()|| hasActionErrors())){
			fileDataStore=getFileDataStoreFromShape(shapeFile, dbfFile, shxFile, shapeFileName);
//			if(fileDataStore!=null){
//				FeatureCollection<SimpleFeatureType, SimpleFeature> collection=getFeatureCollection(fileDataStore, 1); 
//				List<SimpleFeature> attributes = getShapeAttributes(collection);
//				SimpleFeature ft=attributes.get(0);
					
					
//			}
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");	
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		try {
			saveLineTemp(fileDataStore,lineNote);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	
	/**
	 * Gets the line note.
	 *
	 * @return the line note
	 */
	public String getLineNote() {
		return lineNote;
	}
	
	/**
	 * Sets the line note.
	 *
	 * @param lineNote the new line note
	 */
	public void setLineNote(String lineNote) {
		this.lineNote = lineNote;
	}
	
	
	
}
