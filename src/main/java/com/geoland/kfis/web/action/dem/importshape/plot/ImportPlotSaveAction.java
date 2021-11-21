/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.plot;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import nl.knaw.dans.common.dbflib.Field;
import nl.knaw.dans.common.dbflib.Table;

import org.apache.struts2.ServletActionContext;
import org.geotools.feature.FeatureCollection;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.ImportStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;



// TODO: Auto-generated Javadoc
/**
 * The Class ImportPlotSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 19, 2015, 10:15:52 AM
 */
public class ImportPlotSaveAction extends ImportPlotBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4246361637450614930L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(checkImportStatus("P"))
			addFieldError("import.status", getMessage("import.is.in.proccess"));
		else {
			if(regionId == null)
				addFieldError("regionName", getMessage("dem.fiskos.import.regionName.empty"));
			
			if(managementUnitId == null)
				addFieldError("managementUnitName", getMessage("compartment.management.unit.id.empty"));
			
			if(shapeFile==null)
				addFieldError("shapeFile", getMessage("import.shape.file.empty"));
			if(!"shp".equals(shapeFileExt))
				addFieldError("shapeFileExt", getMessage("import.shape.file.ext.different"));
				
			
			
			if(shxFile==null)
				addFieldError("shxFile", getMessage("import.shx.file.empty"));
			if(!"shx".equals(shxFileExt))
				addFieldError("shxFileExt", getMessage("import.shx.file.ext.different"));
			
			if(dbfFile==null)
				addFieldError("dbfFile", getMessage("import.dbf.file.empty"));
			if(!"dbf".equals(dbfFileExt))
				addFieldError("dbfFileExt", getMessage("import.dbf.file.ext.different"));
			
			if(dbfTreeFile==null)
				addFieldError("dbfTreeFile", getMessage("import.dbf.tree.file.empty"));
			if(!"dbf".equals(dbfTreeExt))
				addFieldError("dbfTreeExt", getMessage("import.dbf.tree.file.ext.different"));
			
			if(!(hasFieldErrors() || hasActionErrors())){
				Table table=new Table(dbfTreeFile);
				List<Field> dbfTreeFields = getDBFFields(table);
				if(dbfTreeFields!=null && dbfTreeFields.size()>0){
					checkDBFAttributes(dbfTreeFields,getPlotsTreeTableFields());
					if(!(hasFieldErrors() || hasActionErrors())){
						savePlotTrees(dbfTreeFile);
					}
				}else addFieldError("dbfTreeFile", getMessage("import.dbf.tree.file.without.content"));
				
				deleteTempFiles(path(shapeFile),"plot");
				fileDataStore=getFileDataStoreFromShape( shapeFile, dbfFile, shxFile,"plot");
				if(fileDataStore!=null){
					FeatureCollection<SimpleFeatureType, SimpleFeature> collection = getFeatureCollection(fileDataStore, 1);
					
					List<SimpleFeature> attributes = getShapeAttributes(collection);
					SimpleFeature ft = attributes.get(0);//get only one row to control name,type.

					checkAttributes(ft,getPLotsTableFields());
					if(!hasFieldErrors())
						savePlots(fileDataStore);
					
				}else addFieldError("shapefile", getMessage("shapefile.is.empty"));
				
				deleteTempFiles(path(shapeFile),"plot");
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
		ImportStatus is=new ImportStatus();
		is.setEmployeeByStartUser(employee);
		is.setIsActive(true);
		is.setStartDate(new Date());
		is.setImportType('P');
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
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	
}
