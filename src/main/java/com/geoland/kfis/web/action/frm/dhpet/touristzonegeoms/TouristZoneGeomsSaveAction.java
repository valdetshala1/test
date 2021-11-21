package com.geoland.kfis.web.action.frm.dhpet.touristzonegeoms;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
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
 * The Class TouristZoneGeomsSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 28, 2016, 3:35:08 PM
 * v2.0
 */
public class TouristZoneGeomsSaveAction extends TouristZoneGeomsBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(touristZoneGeoms!=null && touristZoneGeoms.getArea()==null)
			addFieldError("touristZoneGeoms.area", getMessage("dhpet.animal.capacity.area.empty"));
		
		if(touristZoneGeoms!=null && (touristZoneGeoms.getDhpetLocation()==null || touristZoneGeoms.getDhpetLocation().getId()==null))
			addFieldError("touristZoneGeoms.dhpetLocation", getMessage("dhpet.animal.capacity.location.empty"));
		
		if(touristZoneGeoms!=null && touristZoneGeoms.getZoneType()==null)
			addFieldError("touristZoneGeoms.zoneType", getMessage("dhpet.tourist.zone.zoneType.empty"));
		
		if(StringUtils.isNotEmpty(getGeometry())){
		    WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo;
			try {
				geo = wktReader.read(getGeometry());
			    if ((!"MultiPolygon".equalsIgnoreCase(geo.getGeometryType()) 
			    		&& !"Polygon".equalsIgnoreCase(geo.getGeometryType())) || !IsValidOp.isValid(geo)){
			    	addFieldError("touristZoneGeoms.theGeom", "Geometry is not MultiPolygon");
				}				
			    geo.setSRID(900916);
			    touristZoneGeoms.setTheGeom(geo);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
//		else
//			addFieldError("leaseRequest.area", getMessage("fal.request.geometry.empty"));
		
		
		if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		if(touristZoneGeoms.getId()==null){
			Employee emp = getUser().getEmployee();
			touristZoneGeoms.setEmployee(emp);
			touristZoneGeoms.setCreatedDate(new Date());
		}
		User user = getUser().getUser();
		touristZoneGeoms.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetTouristZoneGeomsDAO().save(touristZoneGeoms);
		return SUCCESS;
	}
}
