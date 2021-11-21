package com.geoland.kfis.web.action.frm.stand;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.IntegerType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.base.converter.TransformUtil;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.io.ParseException;

// TODO: Auto-generated Javadoc
/**
 * The Class StandUnionSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 4, 2015, 3:07:14 PM
 * v2.0
 */
public class StandUnionSaveAction extends StandBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The polygon. */
	private String polygon;
	
	/** The selected sids. */
	private String selectedSids;
	
	/** The old stands. */
	private List<Stand> oldStands; 
	
	/** The geo. */
	private  Geometry geo; 
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		HttpServletResponse response = ServletActionContext.getResponse();
		
		if(getStandId()==null){
			addActionError("stand.id.empty.validate");
			response.addHeader("stand.id", getMessage("stand.id.empty.validate"));
		}	
		
		if(StringUtils.isEmpty(selectedSids)){
			addActionError(getMessage("stand.union.selected.stands.list.empty"));
			response.addHeader("selectedSids", getMessage("stand.union.selected.stands.list.empty"));
		}
		
		
		if(getFieldErrors().isEmpty() && getActionErrors().isEmpty()){
			String[] standSize = selectedSids.split(";");
			String replaceAll = selectedSids.replaceAll(";", ",");
			
			if(standSize.length > 0){
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				String standSql = "Select count(distinct(compartment_id)) from tgis_stand where id in ("+ replaceAll +")";
				SQLQuery sqlQuery = session.createSQLQuery(standSql);
				sqlQuery.addScalar("count", IntegerType.INSTANCE);
				Integer count = (Integer) sqlQuery.uniqueResult();
				if(count>1){
					addActionError("stand.compartment.different.validate");
					response.addHeader("stand.compartment.different.validate", getMessage("stand.compartment.different.validate"));
				}
			}
			oldStands = new ArrayList<Stand>();
			for(String s:standSize){
				Long id = Long.valueOf(s);
				Stand oldStand = DAOFactory.getFactory().getStandDAO().get(id);
				oldStands.add(oldStand);
			}
		}
		if(StringUtils.isEmpty(polygon)){
			addActionError(getMessage("stand.union.polygon.empty"));
			response.addHeader("polygon", getMessage("stand.union.polygon.empty"));
		}else{
			WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
			try {
				geo = wktReader.read(polygon);
			    if (!"MultiPolygon".equalsIgnoreCase(geo.getGeometryType()) 
			    		&& !"Polygon".equalsIgnoreCase(geo.getGeometryType())){
			    	addFieldError("vineyard.theGeom", "Geometry is not MultiPolygon");
				}				
			    geo.setSRID(900916);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
			response.addHeader("errors_exits", "true");					
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		
		Stand newStand = new Stand();
		Stand oldStand = new Stand();
		for(Stand s : oldStands){
			if(s.getId().equals(standId))
				oldStand = s;
			s.setStatus("DEL");
			s.setCurrentUser(user);
			DAOFactory.getFactory().getStandDAO().save(s);
		}
		
		
		Compartment c = DAOFactory.getFactory().getCompartmentDAO().get(oldStand.getCompartment().getId());
		newStand.setStandNr(oldStand.getStandNr());
		newStand.setCompartment(oldStand.getCompartment());
		newStand.setCompartment(c);
		newStand.setStandId(oldStand.getStandId());
		newStand.setMngmClass(oldStand.getMngmClass());
		newStand.setNoPlots(oldStand.getNoPlots());
		newStand.setLayers(oldStand.getLayers());
		newStand.setAccessType(oldStand.getAccessType());
		newStand.setStandType(oldStand.getStandType());
		newStand.setCrowncover(oldStand.getCrowncover());
		newStand.setSlope(oldStand.getSlope());
		newStand.setLittercov(oldStand.getLittercov());
		newStand.setAge(oldStand.getAge());
		newStand.setOrigin(oldStand.getOrigin());
		newStand.setTreeSpeciesByConifer(oldStand.getTreeSpeciesByConifer());
		newStand.setConiferBon(oldStand.getConiferBon());
		newStand.setTreeSpeciesByDecidouse(oldStand.getTreeSpeciesByDecidouse());
		newStand.setDecidouseBon(oldStand.getDecidouseBon());
		newStand.setTrees(oldStand.getTrees());
		newStand.setVolumeM3ha(oldStand.getVolumeM3ha());
		newStand.setConiferPerc(oldStand.getConiferPerc());
		newStand.setDecidousePerc(oldStand.getDecidousePerc());
		newStand.setPerc030(oldStand.getPerc030());
		newStand.setPerc3050(oldStand.getPerc3050());
		newStand.setPerc5070(oldStand.getPerc5070());
		newStand.setPerc70100(oldStand.getPerc70100());
		newStand.setIncrPerc(oldStand.getIncrPerc());
		newStand.setM2Ha(oldStand.getM2Ha());
		newStand.setDsCon(oldStand.getDsCon());
		newStand.setDsBro(oldStand.getDsBro());
		newStand.setCl1PercCon(oldStand.getCl1PercCon());
		newStand.setCl2PercCon(oldStand.getCl2PercCon());
		newStand.setCl3PercCon(oldStand.getCl3PercCon());
		newStand.setCl4PercCon(oldStand.getCl4PercCon());
		newStand.setCl1PercDec(oldStand.getCl1PercDec());
		newStand.setCl2PercDec(oldStand.getCl2PercDec());
		newStand.setCl3PercDec(oldStand.getCl3PercDec());
		newStand.setCl4PercDec(oldStand.getCl4PercDec());
		newStand.setDamagePerc(oldStand.getDamagePerc());
		newStand.setEstimateVolume(oldStand.getEstimateVolume());
		newStand.setEstimateTreesPerHa(oldStand.getEstimateTreesPerHa());
		newStand.setHeightMean(oldStand.getHeightMean());
		newStand.setTreeSpeciesByTree1(oldStand.getTreeSpeciesByTree1());
		newStand.setTreeSpeciesByTree2(oldStand.getTreeSpeciesByTree2());
		newStand.setTreeSpeciesByTree3(oldStand.getTreeSpeciesByTree3());
		newStand.setSurveyDate(oldStand.getSurveyDate());
		newStand.setRemarks(oldStand.getRemarks());
		newStand.setStatus("UCH");
		newStand.setMinehazard(oldStand.getMinehazard());
		newStand.setBasalArea(TransformUtil.round(geo.getArea()/10000, 4));
		newStand.setTheGeom(geo);
		newStand.setCurrentUser(user);
		DAOFactory.getFactory().getStandDAO().save(newStand);
		
		return SUCCESS;
	}

	/**
	 * Gets the polygon.
	 *
	 * @return the polygon
	 */
	public String getPolygon() {
		return polygon;
	}

	/**
	 * Sets the polygon.
	 *
	 * @param polygon the new polygon
	 */
	public void setPolygon(String polygon) {
		this.polygon = polygon;
	}

	/**
	 * Gets the selected sids.
	 *
	 * @return the selected sids
	 */
	public String getSelectedSids() {
		return selectedSids;
	}

	/**
	 * Sets the selected sids.
	 *
	 * @param selectedSids the new selected sids
	 */
	public void setSelectedSids(String selectedSids) {
		this.selectedSids = selectedSids;
	}
	
}
