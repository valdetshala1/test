package com.geoland.kfis.web.action.frm.annualplan.harvest;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Iterator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.EstimateVolume;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.StandHarvestActivity;
import com.geoland.kfis.model.StandHarvestImplTransport;
import com.geoland.kfis.model.StandHarvestMarked;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Estimatetrees;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Treespeciesgroup;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class HarvestBaseAction.
 */
public class HarvestBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3778990350175587114L;
	
	/** The stand id. */
	protected Long standId;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The stand. */
	protected Stand stand;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;	
	
	/** The domain id. */
	protected Long domainId;
	
	/** The tree type id. */
	protected Long treeTypeId;
	
	/** The standharvest id. */
	protected Long standharvestId;
	
	/** The standharvest. */
	protected StandHarvestActivity standharvest;
	
	/** The new status. */
	protected Activitystatus newStatus=Activitystatus.NEW;
	
	/** The rejected. */
	protected Activitystatus rejected=Activitystatus.REJECTED;
	
	/** The replan. */
	protected Activitystatus replan=Activitystatus.REPLANNED;
	
	/** The approved. */
	protected Activitystatus approved=Activitystatus.APPROVED;
	
	/** The terrain done. */
	protected Activitystatus terrain_done=Activitystatus.TERRAIN_DONE;
	
	/** The transport. */
	protected Activitystatus transport=Activitystatus.TRANSPORT;
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/** The decision status. */
	protected boolean decisionStatus;
	
	/** The edit. */
	protected boolean edit;
	
	/** The activity. */
	protected Activity activity;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The mngmclass list. */
	protected Mngmclass mngmclassList[]=Mngmclass.values();
	
	/** The est volume list. */
	protected List<EstimateVolume> estVolumeList=DAOFactory.getFactory().getEstimateVolumeDAO().executeSQLQuery("select * from tfrm_estimate_volume order by code asc");
	
	/** The est trees list. */
	protected Estimatetrees[] estTreesList=Estimatetrees.values();
	
	/** The standgrowth. */
	protected boolean standgrowth;
	
	/** The terrain done. */
	protected boolean terrainDone=false;
	
	/** The transport done. */
	protected boolean transportDone=false;
	
	/** The harv impl transport. */
	protected StandHarvestImplTransport harvImplTransport;
	
	/** The harv imp ids. */
	protected String[] harvImpIds;
	
	/** The t file. */
	protected File tFile;
	
	/** The bar code img. */
	protected String barCodeImg;
	
	/**
	 * Validate planned activities.
	 *
	 * @param ts_group the ts group
	 * @param st the st
	 * @param act the act
	 */
	public void validatePlannedActivities(Treespeciesgroup ts_group,Stand st,StandHarvestActivity act){
		Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
		String sumQuery = "select coalesce((sum(h.pl_tech_volume) +sum(pl_fire_volume)+ sum(pl_pulp_volume)), 0) as volume" +
				" from tfrm_stand_harvest_activity h " +
				" left join tfrm_activity a on h.activity_id=a.id" +
				" left join tfrm_tree_species t on h.tree_species_id=t.id" +
				" where work_stage='P' and h.stand_id="+st.getId()+" and a.activity_domain_id="+act.getActivity().getActivityDomain().getId()+" and t.species_group='"+ts_group+"'";
		if(act.getId()!=null)
			sumQuery+=" and h.id!="+act.getId();
		
		SQLQuery sql=s.createSQLQuery(sumQuery);
		sql.addScalar("volume");
		Object ob = sql.uniqueResult();
		double volume=((Double)ob).doubleValue();
		
		
		double fire_pulp_volume=calculateFirePulp(act.getPlPulpVolume(), act.getPlTechVolume(), act.getPlFireVolume());
		double tech_pulp_volume=calculateTechPulp(act.getPlPulpVolume(), act.getPlTechVolume(), act.getPlFireVolume());
		if(hasMeasuredVolume(st)){//stand has measured volume
			if(ts_group.equals(Treespeciesgroup.BROADLEAVES) && st.getDecidousePerc()!=null){
	//		
				double decidouse_volume = standDecidouseVolume(st); //volume for broadleave trees
				decidouse_volume-=volume;
				
				if(st.getCl1PercDec()!=null || st.getCl2PercDec()!=null){//if(st.getCl1PercDec()!=null && st.getCl2PercDec()!=null){
					double tech_volume = techDecidouseVolume(st); //volume for broadleave technical
					if(tech_volume<act.getPlTechVolume().doubleValue()+tech_pulp_volume)
						addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.tech.volume.big.value"));
				}
				//else addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.tech.volume.no.value"));
				
				if(st.getCl3PercDec()!=null || st.getCl4PercDec()!=null){//if(st.getCl3PercDec()!=null && st.getCl4PercDec()!=null){
					double fire_volume = fireDecidouseVolume(st);//volume for broadleave fire
					if(fire_volume<act.getPlFireVolume().doubleValue()+fire_pulp_volume)
						addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.big.value"));
				}
				// else addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.no.value"));
				
				if((decidouse_volume-(act.getPlFireVolume()+act.getPlTechVolume())<act.getPlPulpVolume()))
						addFieldError("standharvest.plPulpVolume", getMessage("standharvest.plan.pulp.volume.big.value"));
			}else if(ts_group.equals(Treespeciesgroup.CONIFERS) && st.getVolumeM3ha()!=null && st.getConiferPerc()!=null){
				double coniferous_volume = standConiferousVolume(st); //volume for coniferous trees
				coniferous_volume-=volume;
				
				if(st.getCl1PercCon()!=null || st.getCl2PercCon()!=null){//	if(st.getCl1PercCon()!=null && st.getCl2PercCon()!=null){
					double tech_volume = techConiferousVolume(st); //volume for coniferous technical
					if(tech_volume<act.getPlTechVolume().doubleValue()+tech_pulp_volume)
						addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.tech.volume.big.value"));
				}
				//else addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.tech.volume.no.value"));
				
				if(st.getCl3PercCon()!=null || st.getCl4PercCon()!=null){//if(st.getCl3PercCon()!=null && st.getCl4PercCon()!=null){
					double fire_volume = fireConiferousVolume(st);//volume for coniferous fire
					if(fire_volume<act.getPlFireVolume().doubleValue()+fire_pulp_volume)
						addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.big.value"));
				}
				//else addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.no.value"));
				
				if((coniferous_volume-(act.getPlFireVolume()+act.getPlTechVolume())<act.getPlPulpVolume()))
						addFieldError("standharvest.plPulpVolume", getMessage("standharvest.plan.pulp.volume.big.value"));
			}else{
				addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.no.value"));
				addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.tech.volume.no.value"));
			}
		}else if(hasEstimatedVolume(st)){//if stand has estimated volume 
			double sum=act.getPlFireVolume()+act.getPlTechVolume()+act.getPlPulpVolume()+volume;
			if(sum>st.getEstimateVolume().getMaximum()){
				addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.tech.volume.big.value"));
				addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.big.value"));
				addFieldError("standharvest.plPulpVolume", getMessage("standharvest.plan.pulp.volume.big.value"));
			}
		}else {//this stand has no trees
			addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.stan.with.no.trees"));
			addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.stan.with.no.trees"));
		}
	}
	
	/**
	 * Recalculate stand volume.
	 *
	 * @param ts_group the ts group
	 * @param st the st
	 * @param act the act
	 */
	public void recalculateStandVolume(Treespeciesgroup ts_group,Stand st,StandHarvestActivity act){
		double stand_volume=standVolume(st);
		double fire_pulp_volume=calculateFirePulp(act.getPlPulpVolume(), act.getPlTechVolume(), act.getPlFireVolume());
		double tech_pulp_volume=calculateTechPulp(act.getPlPulpVolume(), act.getPlTechVolume(), act.getPlFireVolume());
		double decidouse_volume = standDecidouseVolume(st); //volume for broadleave trees
		double coniferous_volume = standConiferousVolume(st); //volume for coniferous trees
		
		if(ts_group.equals(Treespeciesgroup.BROADLEAVES) && st.getVolumeM3ha()!=null && st.getDecidousePerc()!=null){
			
			if(act.getImFireVolume()!=null){
				decidouse_volume-=(act.getImFireVolume()+fire_pulp_volume);
			}
			if(act.getImTechVolume()!=null){
				decidouse_volume-=(act.getImTechVolume()+tech_pulp_volume);
			}
		}else if(ts_group.equals(Treespeciesgroup.CONIFERS) && st.getVolumeM3ha()!=null && st.getConiferPerc()!=null){
			if(act.getImFireVolume()!=null){
				coniferous_volume-=(act.getImFireVolume()+fire_pulp_volume);
			}
			if(act.getImTechVolume()!=null){
				coniferous_volume-=(act.getImTechVolume()+tech_pulp_volume);
			}
		}
		
		stand_volume-=(standConiferousVolume(st)-coniferous_volume);
		double decidouse_old_volume=standDecidouseVolume(st);
		st.setConiferPerc((coniferous_volume/stand_volume)*100);
		if(st.getDecidousePerc()!=null && !(new Double("0.0")).equals(st.getDecidousePerc()))
			st.setDecidousePerc(100-st.getConiferPerc());
		
		stand_volume-=(decidouse_old_volume-decidouse_volume);
		st.setDecidousePerc((decidouse_volume/stand_volume)*100);
		if(st.getConiferPerc()!=null && !(new Double("0.0")).equals(st.getConiferPerc()))
			st.setConiferPerc(100-st.getDecidousePerc());
		st.setVolumeM3ha(stand_volume/st.getBasalArea());
	}

/**
 * Recalculate stand volume.
 *
 * @param ts_group the ts group
 * @param st the st
 * @param a the a
 * @param fireVolume the fire volume
 * @param techVolume the tech volume
 * @param pulpVolume the pulp volume
 */
	public void recalculateStandVolume(Treespeciesgroup ts_group,Stand st,StandHarvestActivity a,Double fireVolume,Double techVolume, Double pulpVolume){
		double stand_volume=standVolume(st);
		double fire_pulp_volume=calculateFirePulp(a.getPlPulpVolume(), a.getPlTechVolume(), a.getPlFireVolume());
		double tech_pulp_volume=calculateTechPulp(a.getPlPulpVolume(), a.getPlTechVolume(), a.getPlFireVolume());
		
		
		double decidouse_volume = standDecidouseVolume(st); //volume for broadleave trees
		double coniferous_volume = standConiferousVolume(st); //volume for coniferous trees
		
		if(ts_group.equals(Treespeciesgroup.BROADLEAVES) && st.getVolumeM3ha()!=null && st.getDecidousePerc()!=null){
			
			if(fireVolume!=null){
				decidouse_volume-=(fireVolume+fire_pulp_volume);
			}
			if(techVolume!=null){
				decidouse_volume-=(techVolume+tech_pulp_volume);
			}
		}else if(ts_group.equals(Treespeciesgroup.CONIFERS) && st.getVolumeM3ha()!=null && st.getConiferPerc()!=null){
			if(fireVolume!=null){
				coniferous_volume-=(fireVolume+fire_pulp_volume);
			}
			if(techVolume!=null){
				coniferous_volume-=(techVolume+tech_pulp_volume);
			}
		}
		
		stand_volume-=(standConiferousVolume(st)-coniferous_volume);
		double decidouse_old_volume=standDecidouseVolume(st);
		st.setConiferPerc((coniferous_volume/stand_volume)*100);
		if(st.getDecidousePerc()!=null && !(new Double("0.0")).equals(st.getDecidousePerc()))
			st.setDecidousePerc(100-st.getConiferPerc());
		
		stand_volume-=(decidouse_old_volume-decidouse_volume);
		st.setDecidousePerc((decidouse_volume/stand_volume)*100);
		if(st.getConiferPerc()!=null && !(new Double("0.0")).equals(st.getConiferPerc()))
			st.setConiferPerc(100-st.getDecidousePerc());
		st.setVolumeM3ha(stand_volume/st.getBasalArea());
	}
	
	
	/**
	 * Calc fire volume.
	 *
	 * @param s the s
	 * @return the double
	 */
	protected  double calcFireVolume(StandHarvestActivity s){
		double fireVolume=0.0;
			String query="select sum(d.fire_volume) as fire_volume  from tfrm_stand_harvest_impl_declare as d where d.harvest_activity_id="+s.getId();
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("fire_volume",DoubleType.INSTANCE);
			List list = sqlQuery.list();
			if(list!=null && list.size()>0){
				Double fireVol = (Double) list.get(0);
				fireVolume=fireVol.doubleValue();
			}	
		return fireVolume;
	}
	
	/**
	 * Calc tech volume.
	 *
	 * @param s the s
	 * @return the double
	 */
	protected  double calcTechVolume(StandHarvestActivity s){
		double techVolume=0.0;
			String query="select sum(d.tech_volume) as tech_volume  from tfrm_stand_harvest_impl_declare as d where d.harvest_activity_id="+s.getId();
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("tech_volume",DoubleType.INSTANCE);
			List list = sqlQuery.list();
			if(list!=null && list.size()>0){
				Double techVol = (Double) list.get(0);
				techVolume=techVol.doubleValue();
			}	
		return techVolume;
	}
	
	/**
	 * Calc pulp volume.
	 *
	 * @param s the s
	 * @return the double
	 */
	protected  double calcPulpVolume(StandHarvestActivity s){
		double pulpVolume=0.0;
			String query="select sum(d.pulp_volume) as pulp_volume  from tfrm_stand_harvest_impl_declare as d where d.harvest_activity_id="+s.getId();
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("pulp_volume",DoubleType.INSTANCE);
			List list = sqlQuery.list();
			if(list!=null && list.size()>0){
				Double pulpVol = (Double) list.get(0);
				pulpVolume=pulpVol.doubleValue();
			}	
		return pulpVolume;
	}
	
	/**
	 * get stand volume.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double standVolume(Stand stand){
		return stand.getBasalArea()*stand.getVolumeM3ha();
	}
	
	/**
	 * get decidouse volume in given stand.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double standDecidouseVolume(Stand stand){
		return standVolume(stand)*(stand.getDecidousePerc()/100);
	}
	
	/**
	 * get coniferous volume in given stand.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double standConiferousVolume(Stand stand){
		return standVolume(stand)*(stand.getConiferPerc()/100);
	}
	
	/**
	 * get technical coniferous volume in given stand.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double techConiferousVolume(Stand stand){
		if(stand.getCl1PercCon()==null)stand.setCl1PercCon(0.0);
		if(stand.getCl2PercCon()==null)stand.setCl2PercCon(0.0);
		return ((stand.getCl1PercCon()/100)+(stand.getCl2PercCon()/100))*standConiferousVolume(stand);
	}
	
	/**
	 * get fire coniferous volume in given stand.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double fireConiferousVolume(Stand stand){
		if(stand.getCl3PercCon()==null)stand.setCl3PercCon(0.0);
		if(stand.getCl4PercCon()==null)stand.setCl4PercCon(0.0);
		return ((stand.getCl3PercCon()/100)+(stand.getCl4PercCon()/100))*standConiferousVolume(stand);
	}
	
	/**
	 * get technical decidouse volume in given stand.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double techDecidouseVolume(Stand stand){
		if(stand.getCl1PercDec()==null)stand.setCl1PercDec(0.0);
		if(stand.getCl2PercDec()==null)stand.setCl2PercDec(0.0);
		return ((stand.getCl1PercDec()/100)+(stand.getCl2PercDec()/100))*standDecidouseVolume(stand);
	}
	
	/**
	 * get fire decidouse volume in given stand.
	 *
	 * @param stand the stand
	 * @return the double
	 */
	public Double fireDecidouseVolume(Stand stand){
		if(stand.getCl3PercDec()==null)stand.setCl3PercDec(0.0);
		if(stand.getCl4PercDec()==null)stand.setCl4PercDec(0.0);
		return ((stand.getCl3PercDec()/100)+(stand.getCl4PercDec()/100))*standDecidouseVolume(stand);
	}
	
	/**
	 * calculate pulp in technical tree.
	 *
	 * @param pulp the pulp
	 * @param tech the tech
	 * @param fire the fire
	 * @return the double
	 */
	public Double calculateTechPulp(Double pulp, Double tech, Double fire){
		Double techPulp=null;
		if(tech==null) tech=0.0;
		if(fire==null) fire=0.0;
		if(tech==0.0 && fire==0.0) techPulp=0.0;
		else techPulp=pulp*(tech/(tech+fire));
		return techPulp;
	}
	
	/**
	 * calculate pulp in fire tree.
	 *
	 * @param pulp the pulp
	 * @param tech the tech
	 * @param fire the fire
	 * @return the double
	 */
	public Double calculateFirePulp(Double pulp, Double tech, Double fire){
		Double firePulp=null;
		if(tech==null) tech=0.0;
		if(fire==null) fire=0.0;
		if(tech==0.0 && fire==0.0) firePulp=0.0;
		else  firePulp=pulp*(fire/(tech+fire));
		return firePulp;
	}
	
	/**
	 * Adds the harv marked.
	 *
	 * @param jsonHarvMarked the json harv marked
	 * @param ha the ha
	 * @return the list
	 */
	protected List<StandHarvestMarked> addHarvMarked(String jsonHarvMarked,StandHarvestActivity ha){
		List<StandHarvestMarked> harvestMarkeds=new ArrayList<StandHarvestMarked>(); 
		JSONArray array= (JSONArray) JSONSerializer.toJSON(jsonHarvMarked);
		if(array.size()>0){
			for(Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
				JSONObject obj=iterator.next();
				StandHarvestMarked hm=new StandHarvestMarked();
				hm.setStandHarvestActivity(ha);
				if(obj.get("idM")!=null && StringUtils.isNotEmpty(obj.getString("idM").toString())){
					Long id=Long.valueOf(obj.get("idM").toString());
					hm.setId(id);
				}
				if(obj.get("tree_species_id")!=null && StringUtils.isNotEmpty(obj.get("tree_species_id").toString())){
					String tree_species= obj.get("tree_species_id").toString();
					Long tree_species_id=Long.parseLong(tree_species);
					TreeSpecies ts=DAOFactory.getFactory().getTreeSpeciesDAO().get(tree_species_id);
					hm.setTreeSpecies(ts);
				}else{
					addFieldError("tree_species_id", getMessage("tree.species.id.empty"));
				}	
				if(obj.get("diameter_1_3")!=null && StringUtils.isNotEmpty(obj.get("diameter_1_3").toString())){
					String dia= obj.get("diameter_1_3").toString();
					Double diameter13=Double.parseDouble(dia);
					hm.setDiameter13(diameter13);
					
				}else{
					addFieldError("diameter_1_3", getMessage("diameter.13.empty"));
				}
				if(obj.get("height")!=null && StringUtils.isNotEmpty(obj.get("height").toString())){
					String h= obj.get("height").toString();
					Double height=Double.parseDouble(h);
					hm.setHeight(height);
					
				}else{
					addFieldError("height", getMessage("height.empty"));
				}
				
				if(obj.get("tech_volume")!=null && StringUtils.isNotEmpty(obj.get("tech_volume").toString())){
					String tv= obj.get("tech_volume").toString();
					Double tech_volume=Double.parseDouble(tv);
					hm.setTechVolume(tech_volume);
				}else{
					addFieldError("tech_volume", getMessage("tech.volume.empty"));
				}
				
				if(obj.get("fire_volume")!=null && StringUtils.isNotEmpty(obj.get("fire_volume").toString())){
					String fv= obj.get("fire_volume").toString();
					Double fire_volume=Double.parseDouble(fv);
					hm.setFireVolume(fire_volume);
				}else {
					addFieldError("fire_volume", getMessage("fire.volume.empty"));
				}
				
				if(obj.get("pulp_volume")!=null && StringUtils.isNotEmpty(obj.get("pulp_volume").toString())){
					String pv= obj.get("pulp_volume").toString();
					Double pulp_volume=Double.parseDouble(pv);
					hm.setPulpVolume(pulp_volume);
				}
				
				if(obj.get("volume_total")!=null && StringUtils.isNotEmpty(obj.get("volume_total").toString())){
					String vt= obj.get("volume_total").toString();
					Double volume_total=Double.parseDouble(vt);
					hm.setVolumeTotal(volume_total);
				}else {
					addFieldError("volume_total", getMessage("volume.total.empty"));
				}
				
				if(obj.get("remarks")!=null && StringUtils.isNotEmpty(obj.get("remarks").toString())){
					String remarks= obj.get("remarks").toString();
					hm.setRemarks(remarks);
				}
				harvestMarkeds.add(hm);
			
		 }
		}	
		return harvestMarkeds;
		
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
	 * @param stand the new stand
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
	}
	
	/**
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	public Long getStandId() {
		return standId;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param standId the new stand id
	 */
	public void setStandId(Long standId) {
		this.standId = standId;
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
	 * Gets the domain id.
	 *
	 * @return the domain id
	 */
	public Long getDomainId() {
		return domainId;
	}
	
	/**
	 * Sets the domain id.
	 *
	 * @param domainId the new domain id
	 */
	public void setDomainId(Long domainId) {
		this.domainId = domainId;
	}
	
	/**
	 * Gets the tree type id.
	 *
	 * @return the tree type id
	 */
	public Long getTreeTypeId() {
		return treeTypeId;
	}
	
	/**
	 * Sets the tree type id.
	 *
	 * @param treeTypeId the new tree type id
	 */
	public void setTreeTypeId(Long treeTypeId) {
		this.treeTypeId = treeTypeId;
	}
	
	/**
	 * Gets the standharvest id.
	 *
	 * @return the standharvest id
	 */
	public Long getStandharvestId() {
		return standharvestId;
	}
	
	/**
	 * Sets the standharvest id.
	 *
	 * @param standharvestId the new standharvest id
	 */
	public void setStandharvestId(Long standharvestId) {
		this.standharvestId = standharvestId;
	}
	
	/**
	 * Gets the standharvest.
	 *
	 * @return the standharvest
	 */
	public StandHarvestActivity getStandharvest() {
		return standharvest;
	}
	
	/**
	 * Sets the standharvest.
	 *
	 * @param standharvest the new standharvest
	 */
	public void setStandharvest(StandHarvestActivity standharvest) {
		this.standharvest = standharvest;
	}
	
	/**
	 * Gets the new status.
	 *
	 * @return the newStatus
	 */
	public Activitystatus getNewStatus() {
		return newStatus;
	}
	
	/**
	 * Sets the new status.
	 *
	 * @param newStatus the newStatus to set
	 */
	public void setNewStatus(Activitystatus newStatus) {
		this.newStatus = newStatus;
	}
	
	/**
	 * Gets the rejected.
	 *
	 * @return the rejected
	 */
	public Activitystatus getRejected() {
		return rejected;
	}
	
	/**
	 * Sets the rejected.
	 *
	 * @param rejected the rejected to set
	 */
	public void setRejected(Activitystatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the replan.
	 *
	 * @return the replan
	 */
	public Activitystatus getReplan() {
		return replan;
	}
	
	/**
	 * Sets the replan.
	 *
	 * @param replan the replan to set
	 */
	public void setReplan(Activitystatus replan) {
		this.replan = replan;
	}
	
	/**
	 * Gets the approved.
	 *
	 * @return the approved
	 */
	public Activitystatus getApproved() {
		return approved;
	}
	
	/**
	 * Sets the approved.
	 *
	 * @param approved the approved to set
	 */
	public void setApproved(Activitystatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the activity status.
	 *
	 * @return the activityStatus
	 */
	public ActivityStatus getActivityStatus() {
		return activityStatus;
	}
	
	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the activityStatus to set
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}
	
	/**
	 * Checks if is decision status.
	 *
	 * @return the decisionStatus
	 */
	public boolean isDecisionStatus() {
		return decisionStatus;
	}
	
	/**
	 * Sets the decision status.
	 *
	 * @param decisionStatus the decisionStatus to set
	 */
	public void setDecisionStatus(boolean decisionStatus) {
		this.decisionStatus = decisionStatus;
	}
	
	/**
	 * Checks if is edits the.
	 *
	 * @return the edit
	 */
	public boolean isEdit() {
		return edit;
	}
	
	/**
	 * Sets the edits the.
	 *
	 * @param edit the edit to set
	 */
	public void setEdit(boolean edit) {
		this.edit = edit;
	}
	
	/**
	 * Gets the activity.
	 *
	 * @return the activity
	 */
	public Activity getActivity() {
		return activity;
	}
	
	/**
	 * Sets the activity.
	 *
	 * @param activity the activity to set
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public ActivityStatusDoc getDoc() {
		return doc;
	}
	
	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(ActivityStatusDoc doc) {
		this.doc = doc;
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
	 * Checks if is standgrowth.
	 *
	 * @return the standgrowth
	 */
	public boolean isStandgrowth() {
		return standgrowth;
	}

	/**
	 * Sets the standgrowth.
	 *
	 * @param standgrowth the standgrowth to set
	 */
	public void setStandgrowth(boolean standgrowth) {
		this.standgrowth = standgrowth;
	}

	/**
	 * Checks if is terrain done.
	 *
	 * @return true, if is terrain done
	 */
	public boolean isTerrainDone() {
		return terrainDone;
	}

	/**
	 * Sets the terrain done.
	 *
	 * @param terrainDone the new terrain done
	 */
	public void setTerrainDone(boolean terrainDone) {
		this.terrainDone = terrainDone;
	}

	/**
	 * Checks if is transport done.
	 *
	 * @return true, if is transport done
	 */
	public boolean isTransportDone() {
		return transportDone;
	}

	/**
	 * Sets the transport done.
	 *
	 * @param transportDone the new transport done
	 */
	public void setTransportDone(boolean transportDone) {
		this.transportDone = transportDone;
	}

	/**
	 * Gets the harv impl transport.
	 *
	 * @return the harv impl transport
	 */
	public StandHarvestImplTransport getHarvImplTransport() {
		return harvImplTransport;
	}

	/**
	 * Sets the harv impl transport.
	 *
	 * @param harvImplTransport the new harv impl transport
	 */
	public void setHarvImplTransport(StandHarvestImplTransport harvImplTransport) {
		this.harvImplTransport = harvImplTransport;
	}

	/**
	 * Gets the harv imp ids.
	 *
	 * @return the harv imp ids
	 */
	public String[] getHarvImpIds() {
		return harvImpIds;
	}

	/**
	 * Sets the harv imp ids.
	 *
	 * @param harvImpIds the new harv imp ids
	 */
	public void setHarvImpIds(String[] harvImpIds) {
		this.harvImpIds = harvImpIds;
	}

	/**
	 * Gets the t file.
	 *
	 * @return the t file
	 */
	public File gettFile() {
		return tFile;
	}

	/**
	 * Sets the t file.
	 *
	 * @param tFile the new t file
	 */
	public void settFile(File tFile) {
		this.tFile = tFile;
	}

	/**
	 * Gets the terrain done.
	 *
	 * @return the terrain done
	 */
	public Activitystatus getTerrain_done() {
		return terrain_done;
	}

	/**
	 * Sets the terrain done.
	 *
	 * @param terrain_done the new terrain done
	 */
	public void setTerrain_done(Activitystatus terrain_done) {
		this.terrain_done = terrain_done;
	}

	/**
	 * Gets the transport.
	 *
	 * @return the transport
	 */
	public Activitystatus getTransport() {
		return transport;
	}

	/**
	 * Sets the transport.
	 *
	 * @param transport the new transport
	 */
	public void setTransport(Activitystatus transport) {
		this.transport = transport;
	}

	/**
	 * Gets the bar code img.
	 *
	 * @return the bar code img
	 */
	public String getBarCodeImg() {
		return barCodeImg;
	}

	/**
	 * Sets the bar code img.
	 *
	 * @param barCodeImg the new bar code img
	 */
	public void setBarCodeImg(String barCodeImg) {
		this.barCodeImg = barCodeImg;
	}


}
