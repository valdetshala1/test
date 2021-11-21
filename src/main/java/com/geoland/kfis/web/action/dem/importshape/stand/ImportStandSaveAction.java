/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.stand;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.geotools.feature.FeatureCollection;
import org.opengis.feature.Property;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.ImportStatus;
import com.geoland.kfis.model.ManagementUnit;
import com.geoland.kfis.persistence.dao.DAOFactory;



// TODO: Auto-generated Javadoc
/**
 * The Class ImportStandSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 2, 2015, 4:01:29 PM
 */
public class ImportStandSaveAction extends ImportStandBaseAction {

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
		
		if(checkImportStatus("C"))
			addFieldError("import.status", getMessage("import.is.in.proccess"));
		else {
			if(regionId == null)
				addFieldError("regionName", getMessage("dem.fiskos.import.regionName.empty"));
			
			if(managementUnitId == null)
				addFieldError("managementUnitName", getMessage("compartment.management.unit.id.empty"));
			
			if(StringUtils.isEmpty(getDatefrom()))
				addFieldError("datefrom", getMessage("leave.from.date.empty"));
			
			if(StringUtils.isEmpty(getDateto()))
				addFieldError("dateto", getMessage("leave.to.date.empty"));
			
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
			
			if(!(hasFieldErrors() || hasActionErrors())){
				deleteTempFiles(path(shapeFile),"shape");
				fileDataStore=getFileDataStoreFromShape( shapeFile, dbfFile, shxFile,shapeFileName);
				if(fileDataStore!=null){
					FeatureCollection<SimpleFeatureType, SimpleFeature> collection = getFeatureCollection(fileDataStore, 1);
					
					List<SimpleFeature> attributes = getShapeAttributes(collection);
					if(attributes!=null && attributes.size()>0){
						SimpleFeature ft = attributes.get(0);//get only one row to control name,type.
						
						Property p = getFieldProperty(ft.getProperties(),"MU");
						if(p!=null){
							String mu_code = p.getValue().toString();
							List<ManagementUnit> mgm_unit = DAOFactory.getFactory().getManagementUnitDAO().executeSQLQuery("select mu.* from tgis_management_unit mu where mu.mu_code='"+mu_code+"' and mu.region_id="+regionId);
							if(mgm_unit!=null && mgm_unit.size()>0){
								if(!managementUnitId.equals(mgm_unit.get(0).getId()))
									addFieldError("managementUnitName", getMessage("management.unit.id.dont.match"));//Management Unit chosen by client is different from Management Unit in shapefile 
								if(!(hasFieldErrors() || hasActionErrors())){
									checkStandAttributes(ft,getShapeTableFields());
									if(!hasFieldErrors()){
										saveShapeStand(fileDataStore);
									}
								}
							}else addFieldError("managementUnitName", getMessage("management.unit.empty.in.shapefile"));
						}else addFieldError("managementUnitName", getMessage("management.unit.empty.in.shapefile"));
					}else addFieldError("shapefile", getMessage("shapefile.is.empty"));
				}else addFieldError("shapefile", getMessage("shapefile.is.empty"));
				deleteTempFiles(path(shapeFile),"shape");
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
		is.setImportType('C');
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
