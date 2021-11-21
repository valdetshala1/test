package com.geoland.kfis.web.action.frm.stand;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.StandDAO;
import com.geoland.kfis.web.base.converter.TransformUtil;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class StandSplitSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 26, 2015, 2:23:55 PM
 * v2.0
 */
public class StandSplitSaveAction extends StandBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The polygons. */
	private String polygons;
	
	/** The new stands. */
	private List<Stand> newStands;
	
	/** The old stand. */
	private Stand oldStand;
	
	/** The generate SNR list. */
	private List<String> generateSNRList;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		String sids[]=null;
		if(standId==null){
			addActionError("stand.id.empty.validate");
		}else
			oldStand = DAOFactory.getFactory().getStandDAO().get(standId);
		
		if(StringUtils.isEmpty(polygons)){
			addActionError("stand.split.polygons.list.empty");
		}else if(oldStand != null){
			sids = polygons.split(";");
			generateSNRList = generateSNR(oldStand, sids.length-1);
		}
		
		String snrError = "";
		if(generateSNRList.size() != sids.length-1){
			addActionError("");
			snrError += getMessage("frm.stand.standNr.busy");
		}
		
		newStands = new ArrayList<Stand>();
		for(int index = 0; index < sids.length; index++){
			Stand newStand = new Stand();
		    WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo = null;
			try {
				geo = wktReader.read(sids[index]);
			    if (!"MultiPolygon".equalsIgnoreCase(geo.getGeometryType()) 
			    		&& !"Polygon".equalsIgnoreCase(geo.getGeometryType())){
			    	addFieldError("vineyard.theGeom", "Geometry is not MultiPolygon");
				}				
			    geo.setSRID(900916);
				    newStand.setTheGeom(geo);	
				    newStand.setBasalArea(TransformUtil.round((geo.getArea()/10000), 2));	
				    newStands.add(newStand);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");					
			response.addHeader("snrError", snrError);					
		}	
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		
		int index = -1;
		for(Stand st : newStands){
			Compartment c = DAOFactory.getFactory().getCompartmentDAO().get(oldStand.getCompartment().getId());
			if(index==-1){
				st.setStandNr(oldStand.getStandNr());
				st.setStandId(oldStand.getStandId());
			}else{
				String standNr = generateSNRList.get(index);
				st.setStandNr(standNr);
				String standId=""+c.getCadastralMunicipality().getRegion().getCode()+c.getManagementUnit().getMuCode()+c.getCompNr()+st.getStandNr();
				st.setStandId(standId);
			}
			index++;
			st.setCompartment(oldStand.getCompartment());
			st.setCompartment(c);
			st.setMngmClass(oldStand.getMngmClass());
			st.setNoPlots(oldStand.getNoPlots());
			st.setLayers(oldStand.getLayers());
			st.setAccessType(oldStand.getAccessType());
			st.setStandType(oldStand.getStandType());
			st.setCrowncover(oldStand.getCrowncover());
			st.setSlope(oldStand.getSlope());
			st.setLittercov(oldStand.getLittercov());
			st.setAge(oldStand.getAge());
			st.setOrigin(oldStand.getOrigin());
			st.setTreeSpeciesByConifer(oldStand.getTreeSpeciesByConifer());
			st.setConiferBon(oldStand.getConiferBon());
			st.setTreeSpeciesByDecidouse(oldStand.getTreeSpeciesByDecidouse());
			st.setDecidouseBon(oldStand.getDecidouseBon());
			st.setTrees(oldStand.getTrees());
			st.setVolumeM3ha(oldStand.getVolumeM3ha());
			st.setConiferPerc(oldStand.getConiferPerc());
			st.setDecidousePerc(oldStand.getDecidousePerc());
			st.setPerc030(oldStand.getPerc030());
			st.setPerc3050(oldStand.getPerc3050());
			st.setPerc5070(oldStand.getPerc5070());
			st.setPerc70100(oldStand.getPerc70100());
			st.setIncrPerc(oldStand.getIncrPerc());
			st.setM2Ha(oldStand.getM2Ha());
			st.setDsCon(oldStand.getDsCon());
			st.setDsBro(oldStand.getDsBro());
			st.setCl1PercCon(oldStand.getCl1PercCon());
			st.setCl2PercCon(oldStand.getCl2PercCon());
			st.setCl3PercCon(oldStand.getCl3PercCon());
			st.setCl4PercCon(oldStand.getCl4PercCon());
			st.setCl1PercDec(oldStand.getCl1PercDec());
			st.setCl2PercDec(oldStand.getCl2PercDec());
			st.setCl3PercDec(oldStand.getCl3PercDec());
			st.setCl4PercDec(oldStand.getCl4PercDec());
			st.setDamagePerc(oldStand.getDamagePerc());
			st.setEstimateVolume(oldStand.getEstimateVolume());
			st.setEstimateTreesPerHa(oldStand.getEstimateTreesPerHa());
			st.setHeightMean(oldStand.getHeightMean());
			st.setTreeSpeciesByTree1(oldStand.getTreeSpeciesByTree1());
			st.setTreeSpeciesByTree2(oldStand.getTreeSpeciesByTree2());
			st.setTreeSpeciesByTree3(oldStand.getTreeSpeciesByTree3());
			st.setSurveyDate(oldStand.getSurveyDate());
			st.setRemarks(oldStand.getRemarks());
			st.setStatus("UCH");
			st.setMinehazard(oldStand.getMinehazard());
			st.setCurrentUser(user);
			DAOFactory.getFactory().getStandDAO().save(st);
		}
		oldStand.setStatus("DEL");
		oldStand.setCurrentUser(user);
		DAOFactory.getFactory().getStandDAO().save(oldStand);
		return SUCCESS;
	}

	/**
	 * Gets the polygons.
	 *
	 * @return the polygons
	 */
	public String getPolygons() {
		return polygons;
	}

	/**
	 * Sets the polygons.
	 *
	 * @param polygons the new polygons
	 */
	public void setPolygons(String polygons) {
		this.polygons = polygons;
	}

	/**
	 * Gets the generate SNR list.
	 *
	 * @return the generate SNR list
	 */
	public List<String> getGenerateSNRList() {
		return generateSNRList;
	}

	/**
	 * Sets the generate SNR list.
	 *
	 * @param generateSNRList the new generate SNR list
	 */
	public void setGenerateSNRList(List<String> generateSNRList) {
		this.generateSNRList = generateSNRList;
	}
	
}
