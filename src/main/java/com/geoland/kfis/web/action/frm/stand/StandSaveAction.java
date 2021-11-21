/**
 * 
 */
package com.geoland.kfis.web.action.frm.stand;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.spatial.GeometryType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.operation.valid.IsValidOp;

// TODO: Auto-generated Javadoc
/**
 * The Class StandSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:32:36 PM, Oct 13, 2014
 */
public class StandSaveAction extends StandBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2146715291078172405L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
		stand.setCompartment(DAOFactory.getFactory().getCompartmentDAO().get(stand.getCompartment().getId()));
		if(stand!=null && stand.getCompartment().getId()==null)
			addFieldError("stand.compartment.id", getMessage("stand.compartment.id.empty"));
		
		String standNrError="";
		if(stand!=null && stand.getCompartment().getId()!=null && stand.getStandType()!=null && StringUtils.isEmpty(stand.getStandNr())){
			String sql = "select * from gen_stand_nr("+stand.getStandType().getDOMKEY()+","+stand.getCompartment().getId()+",1)";
			SQLQuery query = session.createSQLQuery(sql);
			Object object = query.uniqueResult();
			if(object!=null){
				String standNr= (String) object;
				stand.setStandNr(standNr);
			}else{
				standNrError += getMessage("frm.stand.standNr.busy");
				addActionError("");
			}
		}
		
		if(stand!=null && StringUtils.isEmpty(stand.getStandId())){
			if(StringUtils.isNotEmpty(stand.getStandNr()) && stand.getCompartment().getId()!=null){
				Compartment c = DAOFactory.getFactory().getCompartmentDAO().get(stand.getCompartment().getId());
				String standId=""+c.getCadastralMunicipality().getRegion().getCode()+c.getManagementUnit().getMuCode()+c.getCompNr()+stand.getStandNr();
				stand.setStandId(standId);
			}
		}
			
		if(stand!=null && stand.getMngmClass()==null)
			addFieldError("stand.mngmClass", getMessage("stand.stand.mngmClass.empty"));
		
		if(stand!=null && stand.getAccessType()==null)
			addFieldError("stand.accessType", getMessage("stand.access.type.empty"));
		
		if(stand!=null && stand.getStandType()==null)
			addFieldError("stand.standType", getMessage("stand.stand.type.empty"));
		
		if(stand!=null && stand.getBasalArea()==null)
			addFieldError("stand.basalArea", getMessage("stand.basal.area.empty"));
		if(treeSpeciesByTree1Id!=null) {
			TreeSpecies ts=DAOFactory.getFactory().getTreeSpeciesDAO().get(treeSpeciesByTree1Id);
			stand.setTreeSpeciesByTree1(ts);
		}
		     
		
	
		if(treeSpeciesByTree2Id!=null) {
			TreeSpecies ts=DAOFactory.getFactory().getTreeSpeciesDAO().get(treeSpeciesByTree2Id);
		     stand.setTreeSpeciesByTree2(ts);

		}
		
		if(treeSpeciesByTree3Id!=null) {
			TreeSpecies ts=DAOFactory.getFactory().getTreeSpeciesDAO().get(treeSpeciesByTree3Id);
		    stand.setTreeSpeciesByTree3(ts);

		}
		
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
			    stand.setTheGeom(geo);	
			    if(stand!=null && stand.getId() != null && stand.getCompartment()!=null){
			    	String sql="select st_union((st_difference((select the_geom from tgis_compartment where id="+stand.getCompartment().getId()+")," +
			    			"(select the_geom from tgis_stand where id="+stand.getId()+" and (status is null or status  not ilike 'DEL') ))),st_setsrid(st_geomfromtext('"+getGeometry()+"'),900916)) as geomComp," +
			    			"st_union((st_difference((select the_geom from tgis_mu_period where id="+ mupId+")," +
			    			"(select the_geom from tgis_stand where id="+stand.getId()+" and (status is null or status  not ilike 'DEL') ) )),st_setsrid(st_geomfromtext('"+getGeometry()+"'),900916)) as geomMup";
			    	SQLQuery sqlQuery = session.createSQLQuery(sql);
			    	sqlQuery.addScalar("geomComp", GeometryType.INSTANCE);
			    	sqlQuery.addScalar("geomMup", GeometryType.INSTANCE);
			    	List geomObj = sqlQuery.list();
			    	Object obj[] =(Object[])geomObj.get(0);
			    	Geometry geomComp =  (Geometry) obj[0];
			    	Geometry geomMup =  (Geometry) obj[1];
			    	stand.getCompartment().setTheGeom(geomComp);
			    	stand.getCompartment().getManagementUnitPeriod().setTheGeom(geomMup);
			    }else{
			    	
			    	Geometry gc = stand.getCompartment().getTheGeom();
			    	if(gc!=null){
			    		gc = gc.union(stand.getTheGeom());
			    	}else{
			    		gc = stand.getTheGeom();
			    	}
			    	gc.setSRID(900916);
			    	stand.getCompartment().setTheGeom(gc);
			    	
			    	Geometry gm = stand.getCompartment().getManagementUnitPeriod().getTheGeom();
			    	if(gm!=null){
			    		gm = gm.union(stand.getTheGeom());
			    	}else{
			    		gm = stand.getTheGeom();
			    	}
			    	gm.setSRID(900916);
			    	stand.getCompartment().getManagementUnitPeriod().setTheGeom(gm);
			    }
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}	
		
		if(hasFieldErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
		if(hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("nrError", standNrError);
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		stand.setCurrentUser(user);
		stand.getCompartment().setCurrentUser(user);
		stand.getCompartment().getManagementUnitPeriod().setCurrentUser(user);
		TreeSpecies ts=null;

		DAOFactory.getFactory().getStandDAO().save(stand);
		DAOFactory.getFactory().getCompartmentDAO().save(stand.getCompartment());
		DAOFactory.getFactory().getManagementUnitPeriodDAO().save(stand.getCompartment().getManagementUnitPeriod());
		return SUCCESS;
	}
}
