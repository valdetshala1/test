package com.geoland.kfis.web.action.frm.annualplan;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.logic.security.BoUserSecurity;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.FireReport;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanAction.
 */
public class AnnualPlanAction extends AnnualPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4204366631412991801L;

	/**
	 * Board.
	 *
	 * @return the string
	 */
	public String board(){
		if(annualplanId!=null){
			annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);
			if(annualplan.getAnnualPlanningStatus().getStatus()==newAP &&  annualplan.getActivities().isEmpty()){
				enableField=true;
			}else {
				enableField=false;
			}
			if(annualplan.getCadastralMunicipality()==null || annualplan.getCadastralMunicipality().getId()==null){
				centralplan=true;
			}else centralplan=false;
		}else centralplan=false;
		
		return "board";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getSession().getAttribute("geoserver_url")==null){
			String key = getSettings().getString("geoserver_url");
			request.getSession().setAttribute("geoserver_url", key);
		}
		if(request.getSession().getAttribute("gisserver_url")==null){
			String key = getSettings().getString("gisserver_url");
			request.getSession().setAttribute("gisserver_url", key);
		}
		if(request.getSession().getAttribute("geoserver_url_wfs")==null){
			String key = getSettings().getString("geoserver_url_wfs");
			request.getSession().setAttribute("geoserver_url_wfs", key);
		}
		return "page";
	}
	
	/**
	 * Submit popup.
	 *
	 * @return the string
	 */
	public String submitPopup(){
		if(annualplanId!=null){
			annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);
			if(annualplan.getAnnualPlanningStatus().getStatus()==newAP &&  annualplan.getActivities().isEmpty()){
				enableField=true;
			}else {
				enableField=false;
			}
			
		}
		return "submitPopup";
	}

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(annualplanId!=null){
			annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);
			if(annualplan.getAnnualPlanningStatus().getStatus()==newAP &&  annualplan.getActivities().isEmpty()){
				enableField=true;
			}else {
				enableField=false;
			}
			if(annualplan.getCadastralMunicipality()==null || annualplan.getCadastralMunicipality().getId()==null){
				centralplan=true;
			}else centralplan=false;
		}else centralplan=false;
			
		return "form";
	}
	
	/**
	 * Pvt req page.
	 *
	 * @return the string
	 */
	public String pvtReqPage(){
		return "pvtReqPage";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}	
	
	/**
	 * Status popup.
	 *
	 * @return the string
	 */
	public String statusPopup(){
		if(annualplanId!=null){
			annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);
			String tableName[][]=getTableNames();
			Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			tablesForReplan="";
			String language = getLocale().getLanguage();
			for (int n = 0; n < tableName.length; n++) {
				long count = countByRPLStatus(tableName[n][0], annualplanId, session);
				if(count>0){
					replan=true;
					if("en".equals(language))
						tablesForReplan+=tableName[n][1]+",";
					else if("al".equals(language))
						tablesForReplan+=tableName[n][2]+",";
					else if("sr".equals(language))
						tablesForReplan+=tableName[n][3]+",";
				}
					
			}
			
		}
		return "statusPopup";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		setTables(new ArrayList<ActivityDomain>());
		String language = getLocale().getLanguage();
		char oper_lev = getUser().getOrganisation().getOperLevelVal().charValue();
		for(String[] t:getTableNames()){
			if(t[1].equals("Seedling")){
				if('C'==oper_lev){
					ActivityDomain ad=new ActivityDomain();
					if("en".equals(language)){
						ad.setNameAl(t[1].toUpperCase());
						ad.setNameEn(t[1].toUpperCase());
						tables.add(ad);
					} else if("al".equals(language)){
						ad.setNameAl(t[2].toUpperCase());
						ad.setNameEn(t[1].toUpperCase());
						tables.add(ad);
					} else if("sr".equals(language)){
						ad.setNameAl(t[3].toUpperCase());
						ad.setNameEn(t[1].toUpperCase());
						tables.add(ad);
					}
				}
			}else{
				ActivityDomain ad=new ActivityDomain();
				if("en".equals(language)){
					ad.setNameAl(t[1].toUpperCase());
					ad.setNameEn(t[1].toUpperCase());
					tables.add(ad);
				} else if("al".equals(language)){
					ad.setNameAl(t[2].toUpperCase());
					ad.setNameEn(t[1].toUpperCase());
					tables.add(ad);
				} else if("sr".equals(language)){
					ad.setNameAl(t[3].toUpperCase());
					ad.setNameEn(t[1].toUpperCase());
					tables.add(ad);
				}
			}
		}
		BoUserSecurity user = getUser();
		if(user!=null){
//			if(fire==null)
//				setFire(new FireReport());
			Organisation org = user.getOrganisation();
			if(org!=null){
				Character oper_level = org.getOperLevelVal();
				Region reg = user.getRegion();
				if(oper_level.equals('M')){
					CadastralMunicipality cm = user.getCadastralMunicipality();
//					fire.setCadastralMunicipality(cm);
//					fire.setRegion(reg);
					munName = cm.getName();
					munId = cm.getId();
					munReadOnly=true;
//					regReadOnly=true;
				}else if(oper_level.equals('R')){
//					fire.setRegion(reg);
					regName = reg.getName();
					regId = reg.getId();
					regReadOnly=true;
				}
			}
		}
		return "report_generator";
	}
}
