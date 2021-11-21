/**
 * 
 */
package com.geoland.kfis.web.action.frm.stand;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.EstimateVolume;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Accessible;
import com.geoland.kfis.persistence.hibernate.usertypes.Estimatetrees;
import com.geoland.kfis.persistence.hibernate.usertypes.Forestorigin;
import com.geoland.kfis.persistence.hibernate.usertypes.Minehazard;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Reporttype;
import com.geoland.kfis.persistence.hibernate.usertypes.Standtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class StandBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:31:59 PM, Oct 13, 2014
 */
public class StandBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4537752329134142862L;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;
	
	/** The stand geom details. */
	protected StandGeomDetails standGeomDetails;
	
	/** The stand id. */
	protected Long standId;
	
	/** The comp id. */
	protected Long compId;
	
	/** The mu id. */
	protected Long muId;
	
	/** The mup id. */
	protected Long mupId;
	
	/** The stand. */
	protected Stand stand;
	
	/** The est volume list. */
	protected List<EstimateVolume> estVolumeList=DAOFactory.getFactory().getEstimateVolumeDAO().executeSQLQuery("select * from tfrm_estimate_volume order by code asc");
	
	/** The est trees list. */
	protected Estimatetrees[] estTreesList=Estimatetrees.values();
	
	/** The mngmclass list. */
	protected Mngmclass mngmclassList[]=Mngmclass.values();
	
	/** The origins. */
	protected Forestorigin origins[]=Forestorigin.values();
	
	/** The standtypes. */
	protected Standtype standtypes[]=Standtype.values();
	
	/** The accesstype. */
	protected Accessible accesstype[]=Accessible.values();
	
	/** The minehazards. */
	protected Minehazard minehazards[]=Minehazard.values();
	
	/** The standgrowth. */
	protected boolean standgrowth;
	
	/** The geometry. */
	private String geometry;
	
	/** The mngm. */
	protected String mngm;//for sort in grid
	
	/** The stype. */
	protected String stype;//for sort in grid
	
	/** The acctype. */
	protected String acctype;//for sort in grid
	
	/** The report type list. */
	protected Reporttype reportTypeList[]=Reporttype.values();
	
	/** The stand data. */
	protected String standData;
	
	/** The tree species by tree 1 id. */
	protected Long treeSpeciesByTree1Id;
	
	/** The tree species by tree 2 id. */
	protected Long treeSpeciesByTree2Id;
	
	/** The tree species by tree 3 id. */
	protected Long treeSpeciesByTree3Id;
	
	/**
	 * Generate SNR.
	 *
	 * @param s the s
	 * @param size the size
	 * @return the list
	 */
	protected List<String> generateSNR(Stand s, int size){
		List<String> snrList = new ArrayList<String>();
		
		String sql = "select * from gen_stand_nr("+s.getStandType().getDOMKEY()+","+s.getCompartment().getId()+","+size+") as stand_nr";
		Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.addScalar("stand_nr", StringType.INSTANCE);
		List list = query.list();
		
		for(int i=0; i<list.size();i++){
			Object obj =(Object)list.get(i);
			String stand_nr = (String) obj;
			snrList.add(stand_nr);
		}
		return snrList;
	}
	
	/**
	 * Gets the annualplan id.
	 *
	 * @return the annualplan id
	 */
	public Long getAnnualplanId() {
		return annualplanId;
	}
	
	/**
	 * Sets the annualplan id.
	 *
	 * @param annualplanId the new annualplan id
	 */
	public void setAnnualplanId(Long annualplanId) {
		this.annualplanId = annualplanId;
	}
	
	/**
	 * Gets the annualplan.
	 *
	 * @return the annualplan
	 */
	public AnnualPlanning getAnnualplan() {
		return annualplan;
	}
	
	/**
	 * Sets the annualplan.
	 *
	 * @param annualplan the new annualplan
	 */
	public void setAnnualplan(AnnualPlanning annualplan) {
		this.annualplan = annualplan;
	}
	
	/**
	 * Gets the stand id.
	 *
	 * @return the standId
	 */
	public Long getStandId() {
		return standId;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param standId the standId to set
	 */
	public void setStandId(Long standId) {
		this.standId = standId;
	}
	
	/**
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	public Stand getStand() {
		return stand;
	}
	
	/**
	 * Sets the stand.
	 *
	 * @param stand the stand to set
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
	}
	
	/**
	 * Gets the est volume list.
	 *
	 * @return the estVolumeList
	 */
	public List<EstimateVolume> getEstVolumeList() {
		return estVolumeList;
	}
	
	/**
	 * Sets the est volume list.
	 *
	 * @param estVolumeList the estVolumeList to set
	 */
	public void setEstVolumeList(List<EstimateVolume> estVolumeList) {
		this.estVolumeList = estVolumeList;
	}
	
	/**
	 * Gets the est trees list.
	 *
	 * @return the estTreesList
	 */
	public Estimatetrees[] getEstTreesList() {
		return estTreesList;
	}
	
	/**
	 * Sets the est trees list.
	 *
	 * @param estTreesList the estTreesList to set
	 */
	public void setEstTreesList(Estimatetrees[] estTreesList) {
		this.estTreesList = estTreesList;
	}
	
	/**
	 * Gets the mngmclass list.
	 *
	 * @return the mngmclassList
	 */
	public Mngmclass[] getMngmclassList() {
		return mngmclassList;
	}
	
	/**
	 * Sets the mngmclass list.
	 *
	 * @param mngmclassList the mngmclassList to set
	 */
	public void setMngmclassList(Mngmclass[] mngmclassList) {
		this.mngmclassList = mngmclassList;
	}
	
	/**
	 * Gets the comp id.
	 *
	 * @return the comp id
	 */
	public Long getCompId() {
		return compId;
	}
	
	/**
	 * Sets the comp id.
	 *
	 * @param compId the new comp id
	 */
	public void setCompId(Long compId) {
		this.compId = compId;
	}
	
	/**
	 * Checks if is standgrowth.
	 *
	 * @return true, if is standgrowth
	 */
	public boolean isStandgrowth() {
		return standgrowth;
	}
	
	/**
	 * Sets the standgrowth.
	 *
	 * @param standgrowth the new standgrowth
	 */
	public void setStandgrowth(boolean standgrowth) {
		this.standgrowth = standgrowth;
	}
	
	/**
	 * Gets the origins.
	 *
	 * @return the origins
	 */
	public Forestorigin[] getOrigins() {
		return origins;
	}
	
	/**
	 * Sets the origins.
	 *
	 * @param origins the new origins
	 */
	public void setOrigins(Forestorigin[] origins) {
		this.origins = origins;
	}
	
	/**
	 * Gets the standtypes.
	 *
	 * @return the standtypes
	 */
	public Standtype[] getStandtypes() {
		return standtypes;
	}
	
	/**
	 * Sets the standtypes.
	 *
	 * @param standtypes the new standtypes
	 */
	public void setStandtypes(Standtype[] standtypes) {
		this.standtypes = standtypes;
	}
	
	/**
	 * Gets the accesstype.
	 *
	 * @return the accesstype
	 */
	public Accessible[] getAccesstype() {
		return accesstype;
	}
	
	/**
	 * Sets the accesstype.
	 *
	 * @param accesstype the new accesstype
	 */
	public void setAccesstype(Accessible[] accesstype) {
		this.accesstype = accesstype;
	}
	
	/**
	 * Gets the geometry.
	 *
	 * @return the geometry
	 */
	public String getGeometry() {
		return geometry;
	}
	
	/**
	 * Sets the geometry.
	 *
	 * @param geometry the new geometry
	 */
	public void setGeometry(String geometry) {
		this.geometry = geometry;
	}
	
	/**
	 * Gets the mu id.
	 *
	 * @return the mu id
	 */
	public Long getMuId() {
		return muId;
	}
	
	/**
	 * Sets the mu id.
	 *
	 * @param muId the new mu id
	 */
	public void setMuId(Long muId) {
		this.muId = muId;
	}
	
	/**
	 * Gets the mup id.
	 *
	 * @return the mup id
	 */
	public Long getMupId() {
		return mupId;
	}
	
	/**
	 * Sets the mup id.
	 *
	 * @param mupId the new mup id
	 */
	public void setMupId(Long mupId) {
		this.mupId = mupId;
	}

	/**
	 * Gets the minehazards.
	 *
	 * @return the minehazards
	 */
	public Minehazard[] getMinehazards() {
		return minehazards;
	}

	/**
	 * Sets the minehazards.
	 *
	 * @param minehazards the new minehazards
	 */
	public void setMinehazards(Minehazard[] minehazards) {
		this.minehazards = minehazards;
	}

	/**
	 * Gets the mngm.
	 *
	 * @return the mngm
	 */
	public String getMngm() {
		return mngm;
	}

	/**
	 * Sets the mngm.
	 *
	 * @param mngm the mngm to set
	 */
	public void setMngm(String mngm) {
		this.mngm = mngm;
	}

	/**
	 * Gets the stype.
	 *
	 * @return the stype
	 */
	public String getStype() {
		return stype;
	}

	/**
	 * Sets the stype.
	 *
	 * @param stype the stype to set
	 */
	public void setStype(String stype) {
		this.stype = stype;
	}

	/**
	 * Gets the acctype.
	 *
	 * @return the acctype
	 */
	public String getAcctype() {
		return acctype;
	}

	/**
	 * Sets the acctype.
	 *
	 * @param acctype the acctype to set
	 */
	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}

	/**
	 * Gets the report type list.
	 *
	 * @return the reportTypeList
	 */
	public Reporttype[] getReportTypeList() {
		return reportTypeList;
	}

	/**
	 * Sets the report type list.
	 *
	 * @param reportTypeList the reportTypeList to set
	 */
	public void setReportTypeList(Reporttype[] reportTypeList) {
		this.reportTypeList = reportTypeList;
	}

	/**
	 * Gets the stand data.
	 *
	 * @return the stand data
	 */
	public String getStandData() {
		return standData;
	}

	/**
	 * Sets the stand data.
	 *
	 * @param standData the new stand data
	 */
	public void setStandData(String standData) {
		this.standData = standData;
	}

	/**
	 * Gets the stand geom details.
	 *
	 * @return the stand geom details
	 */
	public StandGeomDetails getStandGeomDetails() {
		return standGeomDetails;
	}

	/**
	 * Sets the stand geom details.
	 *
	 * @param standGeomDetails the new stand geom details
	 */
	public void setStandGeomDetails(StandGeomDetails standGeomDetails) {
		this.standGeomDetails = standGeomDetails;
	}

	/**
	 * Gets the tree species by tree 1 id.
	 *
	 * @return the tree species by tree 1 id
	 */
	public Long getTreeSpeciesByTree1Id() {
		return treeSpeciesByTree1Id;
	}

	/**
	 * Sets the tree species by tree 1 id.
	 *
	 * @param treeSpeciesByTree1Id the new tree species by tree 1 id
	 */
	public void setTreeSpeciesByTree1Id(Long treeSpeciesByTree1Id) {
		this.treeSpeciesByTree1Id = treeSpeciesByTree1Id;
	}

	/**
	 * Gets the tree species by tree 2 id.
	 *
	 * @return the tree species by tree 2 id
	 */
	public Long getTreeSpeciesByTree2Id() {
		return treeSpeciesByTree2Id;
	}

	/**
	 * Sets the tree species by tree 2 id.
	 *
	 * @param treeSpeciesByTree2Id the new tree species by tree 2 id
	 */
	public void setTreeSpeciesByTree2Id(Long treeSpeciesByTree2Id) {
		this.treeSpeciesByTree2Id = treeSpeciesByTree2Id;
	}

	/**
	 * Gets the tree species by tree 3 id.
	 *
	 * @return the tree species by tree 3 id
	 */
	public Long getTreeSpeciesByTree3Id() {
		return treeSpeciesByTree3Id;
	}

	/**
	 * Sets the tree species by tree 3 id.
	 *
	 * @param treeSpeciesByTree3Id the new tree species by tree 3 id
	 */
	public void setTreeSpeciesByTree3Id(Long treeSpeciesByTree3Id) {
		this.treeSpeciesByTree3Id = treeSpeciesByTree3Id;
	}


	
	
}
