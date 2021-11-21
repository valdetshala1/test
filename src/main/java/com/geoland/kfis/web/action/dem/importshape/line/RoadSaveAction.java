package com.geoland.kfis.web.action.dem.importshape.line;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Linetempstatus;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class RoadSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Oct 18, 2017 , 3:47:06 PM
 */
public class RoadSaveAction extends LineBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(road!=null && road.getCadastralMunicipality()!=null && road.getCadastralMunicipality().getId()==null){
			addFieldError("road.cadastralMunicipality.id", getMessage("forestFire.cadastralMunicipality.empty"));
		}
		
		if(linetemp!=null){
			road.setMaintenanc(linetemp.getMaintenanc());
			road.setQualityCl(linetemp.getQualityCl());
		}
		
		if(StringUtils.isNotEmpty(geometry)){
		    WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo;
		    try{
		    	geo = wktReader.read(geometry);
		    	geo.setSRID(900916);
			    road.setTheGeom(geo);
			  //  geometry=geometry.substring(0, geometry.length() - 2);
				String  query="SELECT ST_Length(ST_GeomFromText('"+geometry+"',900916));";
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery=session.createSQLQuery(query);
				sqlQuery.addScalar("st_Length",DoubleType.INSTANCE);
				List list = sqlQuery.list();
				if(list.size()>0){
					Double road_length=(Double)list.get(0);
					road.setRoadLength(road_length);
				}else{
					addFieldError("road_length", getMessage("road_length"));
				}
		    } catch (com.vividsolutions.jts.io.ParseException e) {
				e.printStackTrace();
			}
		}else{
			addFieldError("road.cadastralMunicipality.id", getMessage("line.temp.geometry.is.emty"));
		}

		
		if(hasFieldErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");	
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(linetemp.getId()!=null){
			linetemp=DAOFactory.getFactory().getLineTempDAO().get(linetemp.getId());
			linetemp.setStatus(Linetempstatus.USED);
			linetemp.setChangedDate(new Date());
			linetemp.setPersonByChangedBy(getUser().getPerson());
			DAOFactory.getFactory().getLineTempDAO().save(linetemp);
		}
		road.setCreatedDate(new Date());
		road.setPerson(getUser().getPerson());
		DAOFactory.getFactory().getRoadDAO().save(road);
		return SUCCESS;
	}
	
}
