package com.geoland.kfis.web.action.dem.importshape.biodiv;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.geotools.feature.FeatureCollection;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.ImportStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class ImportBiodivSaveAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created Oct 16, 2015 , 4:20:55 PM
 */
public class ImportBiodivSaveAction  extends ImportBiodivBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(employee!=null){
			addActionError("");
		}
		if(checkImportStatus("B")){
			addFieldError("import.status", getMessage("import.is.in.proccess"));
		}else {
			if(regionId == null)
				addFieldError("regionName", getMessage("dem.fiskos.import.regionName.empty"));
			
			if(managementUnitId == null)
				addFieldError("managementUnitName", getMessage("compartment.management.unit.id.empty"));
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
				if(fileDataStore!=null){
					FeatureCollection<SimpleFeatureType, SimpleFeature> collection=getFeatureCollection(fileDataStore, 1); 
					List<SimpleFeature> attributes = getShapeAttributes(collection);
					SimpleFeature ft=attributes.get(0);
						if(!(hasFieldErrors() || hasActionErrors())){
							checkAttributes(ft,getShapeTableFields());
							if(!hasFieldErrors()){
								saveShapeBiodiv(fileDataStore);
							}
						}
						
						
				}
				
				
			}
			
			
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
		// TODO Auto-generated method stub
		ImportStatus is=new ImportStatus();
		is.setEmployeeByStartUser(employee);
		is.setIsActive(true);
		is.setStartDate(new Date());
		is.setImportType('B');
		is.setStatus("Ongoing");
		
		DAOFactory.getFactory().getImportStatusDAO().save(is);
		
		return SUCCESS;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	

}
