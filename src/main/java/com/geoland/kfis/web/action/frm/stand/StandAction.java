/**
 * 
 */
package com.geoland.kfis.web.action.frm.stand;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Accessible;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Standtype;

// TODO: Auto-generated Javadoc
/**
 * The Class StandAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:32:20 PM, Oct 13, 2014
 */
public class StandAction extends StandBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4863156298349697373L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(standId!=null){
			setStand(DAOFactory.getFactory().getStandDAO().get(standId));
			if(!getUser().getOperationalLevelVal().toString().equals("M") && hasMeasuredVolume(stand))
				standgrowth=true;
		}
		if(compId!=null){
			Compartment c = DAOFactory.getFactory().getCompartmentDAO().get(compId);
			if(getStand()!=null)
				getStand().setCompartment(c);
			else{
				setStand(new Stand());
				getStand().setCompartment(c);
			}
				
		}
		return "form";
	}
	
	/**
	 * Plan form.
	 *
	 * @return the string
	 */
	public String planForm(){
		if(standId!=null)
			setStand(DAOFactory.getFactory().getStandDAO().get(standId));
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);		
		return "plan_form";
	}	
	
	/**
	 * Geom detail.
	 *
	 * @return the string
	 */
	public String geomDetail(){
		if(getGeometry()!=null)
		standGeomDetails=fillStandGeomDetailsObject(getGeometry());
		return "geomDetail";
	}
	
	
	/**
	 * Fill stand geom details object.
	 *
	 * @param geometry the geometry
	 * @return the stand geom details
	 */
	private StandGeomDetails  fillStandGeomDetailsObject(String geometry){
		StandGeomDetails standGeomDetails=null;
		Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
		String sqlQuery = "select * from get_surfacedata('"+geometry+"')";
		SQLQuery SQLQuery = s.createSQLQuery(sqlQuery);
		SQLQuery.addScalar("nr", LongType.INSTANCE);
		SQLQuery.addScalar("min_elevation", DoubleType.INSTANCE);
		SQLQuery.addScalar("max_elevation", DoubleType.INSTANCE);
		SQLQuery.addScalar("mean_elevation", DoubleType.INSTANCE);
		SQLQuery.addScalar("min_slope", DoubleType.INSTANCE);
		SQLQuery.addScalar("max_slope", DoubleType.INSTANCE);
		SQLQuery.addScalar("mean_slope", DoubleType.INSTANCE);
		SQLQuery.addScalar("exp", StringType.INSTANCE);
		SQLQuery.addScalar("soil_code", IntegerType.INSTANCE);
		
		List list = SQLQuery.list();
		if(list.size()>0){
			standGeomDetails=new StandGeomDetails();
			Object obj[] =(Object[])list.get(0);
			Long id = (Long) obj[0];
			Double min_elevation = (Double) obj[1];
			Double max_elevation = (Double) obj[2];
			Double mean_elevation = (Double) obj[3];
			Double min_slope = (Double) obj[4];
			Double max_slope = (Double) obj[5];
			Double mean_slope=(Double) obj[6];
			String exp = (String) obj[7];
			Integer soil_code = (Integer) obj[8];
			standGeomDetails.setNr(id);
			standGeomDetails.setMinElevation(min_elevation);
			standGeomDetails.setMaxElevation(max_elevation);
			standGeomDetails.setMeanElevation(mean_elevation);
			standGeomDetails.setMinSlop(min_slope);
			standGeomDetails.setMaxSlope(max_slope);
			standGeomDetails.setMeanSlope(mean_slope);
			standGeomDetails.setExp(exp);
			standGeomDetails.setSoilCode(soil_code);
			
	
		}
		return standGeomDetails;
	}
	
	/**
	 * Plan page.
	 *
	 * @return the string
	 */
	public String planPage(){
		if(standId!=null)
			setStand(DAOFactory.getFactory().getStandDAO().get(standId));
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);		
		return "plan_page";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		if(compId!=null){
			Compartment c = DAOFactory.getFactory().getCompartmentDAO().get(compId);
			if(standId!=null){
				setStand(DAOFactory.getFactory().getStandDAO().get(standId));
			}
			if(getStand()!=null)
				getStand().setCompartment(c);
			else{
				setStand(new Stand());
				getStand().setCompartment(c);
			}
				
		}
		return "grid";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}

	/**
	 * Report.
	 *
	 * @return the string
	 */
	public String report(){
		if(standId!=null)
			setStand(DAOFactory.getFactory().getStandDAO().get(standId));
		return "report";
	}
	
	/**
	 * Search.
	 *
	 * @return the string
	 */
	public String search(){
		String lang = getLocale().getLanguage();
		mngm=":";
		stype=":";
		acctype=":";
		if("en".equals(lang)){
			for(Mngmclass mc:mngmclassList)
				mngm+=";"+mc.getDOMKEY()+":"+mc.getDOMTEXT_EN();
			
			for(Standtype st:standtypes)
				stype+=";"+st.getDOMKEY()+":"+st.getDOMTEXT_EN();
			
			for(Accessible at:accesstype)
				acctype+=";"+at.getDOMKEY()+":"+at.getDOMTEXT_EN();
			
		}else if("sr".equals(lang)){
			for(Mngmclass mc:mngmclassList)
				mngm+=";"+mc.getDOMKEY()+":"+mc.getDOMTEXT_SR();
			
			for(Standtype st:standtypes)
				stype+=";"+st.getDOMKEY()+":"+st.getDOMTEXT_SR();
			
			for(Accessible at:accesstype)
				acctype+=";"+at.getDOMKEY()+":"+at.getDOMTEXT_SR();
		}else{
			for(Mngmclass mc:mngmclassList)
				mngm+=";"+mc.getDOMKEY()+":"+mc.getDOMTEXT();
			
			for(Standtype st:standtypes)
				stype+=";"+st.getDOMKEY()+":"+st.getDOMTEXT();
			
			for(Accessible at:accesstype)
				acctype+=";"+at.getDOMKEY()+":"+at.getDOMTEXT();
		}
		return "search";
	}
}
