package com.geoland.kfis.web.action.frm.dhpet.location;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.DhpetLocationLandType;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.operation.valid.IsValidOp;

// TODO: Auto-generated Javadoc
/**
 * The Class LocationSaveAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 3, 2014 11:29:33 AM
 * @Version 1.0
 */
public class LocationSaveAction extends LocationBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3590483848984441613L;
	
	/** The employee. */
	private Employee employee;
	
	/** The json location land type. */
	private String jsonLocationLandType;
	
	/** The dhpet location land types. */
	private List<DhpetLocationLandType> dhpetLocationLandTypes;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate(){
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(dhpetLocation!=null && StringUtils.isEmpty(dhpetLocation.getHabitatLocation().trim()))
			addFieldError("dhpetLocation.habitatLocation",getMessage("dhpet.location.habitat.location.empty"));
		
		if(dhpetLocation!=null && dhpetLocation.getCadastralMunicipality().getId()==null)
			addFieldError("dhpetLocation.cadastralMunicipality.id", getMessage("dhpet.location.cadastral.municipality.empty"));
		
		if(dhpetLocation!=null && dhpetLocation.getPerson().getId()==null)
			addFieldError("dhpetLocation.person.id", getMessage("dhpet.location.person.empty"));
		
		if(dhpetLocation!=null && dhpetLocation.getHuntingAreaType()==null)
			addFieldError("dhpetLocation.huntingAreaType", getMessage("dhpet.location.huntingAreaType.empty"));
		
		
		if(StringUtils.isNotEmpty(getGeometry())){
		    WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo;
			try {
				geo = wktReader.read(getGeometry());
			    if ((!"MultiPolygon".equalsIgnoreCase(geo.getGeometryType()) 
			    		&& !"Polygon".equalsIgnoreCase(geo.getGeometryType())) || !IsValidOp.isValid(geo)){
			    	addFieldError("vineyard.theGeom", "Geometry is not MultiPolygon");
				}				
			    geo.setSRID(900916);
			    dhpetLocation.setTheGeom(geo);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}else{
			if(dhpetLocation.getArea()==null){
			addFieldError("dhpetLocation.area", getMessage("dhpet.location.area.empty.validate"));
			}
		}
		if(dhpetLocation!=null && !StringUtils.isEmpty(jsonLocationLandType)){
			dhpetLocationLandTypes=addLocationLandType(jsonLocationLandType, dhpetLocation);
			if(dhpetLocation.getArea()!=null && privatePublicLandArea>dhpetLocation.getArea()){
				addFieldError("dhpetLocation.area", getMessage("dhpet.location.private.public.area.is.bigger.than.geom.area"));	
			}
		}
		if(isHuntingOwnerUser()){
		huntingOwner=getUser().getPerson();	
		}
		
		if(hasFieldErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute(){
		if(dhpetLocation.getId()==null){
			dhpetLocation.setEmployee(employee);
			dhpetLocation.setCreatedDate(new Date());
		}
		User user = getUser().getUser();
		getDhpetLocation().setCurrentUser(user);
		DAOFactory.getFactory().getDhpetLocationDAO().save(getDhpetLocation());

		for(DhpetLocationLandType l:dhpetLocationLandTypes){
			l.setEmployee(employee);
			l.setCreatedDate(new Date());
			l.setDhpetLocation(dhpetLocation);
			l.setCurrentUser(user);
			DAOFactory.getFactory().getDhpetLocationLandTypeDAO().save(l);
		}
		
		
		
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

	/**
	 * Gets the json location land type.
	 *
	 * @return the json location land type
	 */
	public String getJsonLocationLandType() {
		return jsonLocationLandType;
	}

	/**
	 * Sets the json location land type.
	 *
	 * @param jsonLocationLandType the new json location land type
	 */
	public void setJsonLocationLandType(String jsonLocationLandType) {
		this.jsonLocationLandType = jsonLocationLandType;
	}

	
	
	
}
