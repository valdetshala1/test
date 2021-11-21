package com.geoland.kfis.web.action.frm.fire;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.logic.security.BoUserSecurity;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.FirePoint;
import com.geoland.kfis.model.FirePolygon;
import com.geoland.kfis.model.FireReport;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.persistence.dao.DAOFactory;

import blackboard.birt.extensions.dotbar.DotbarItemFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class FireReportAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:14:23 PM, May 18, 2015
 */
public class FireReportAction extends FireReportBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4457073389077965331L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		
		if(fireId!=null){
			List<FirePoint> fp=DAOFactory.getFactory().getFirePointDAO().executeSQLQuery("select * from tfrm_fire_point where fire_id="+fireId);
			List<FirePolygon> fPolygon=DAOFactory.getFactory().getFirePolygonDAO().executeSQLQuery("select * from tfrm_fire_polygon where fire_id="+fireId);
		
			if(fp.size()>0){
				firePoint=fp.get(0);
			}
			if(fPolygon.size()>0){
				firePolygon=fPolygon.get(0);
			}
			
			setFire(DAOFactory.getFactory().getFireReportDAO().get(fireId));
			String queryPoint="select ST_AsText(point) point from tfrm_fire_point where fire_id="+fireId;
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(queryPoint);
			sqlQuery.addScalar("point",StringType.INSTANCE);
			List list = sqlQuery.list();
			if(list!=null && list.size()>0){
				pointFire=(String) list.get(0);
			}
			String queryPolygon="select ST_AsText(polygon) polygon from tfrm_fire_polygon where fire_id="+fireId;
			sqlQuery=session.createSQLQuery(queryPolygon);
			sqlQuery.addScalar("polygon",StringType.INSTANCE);
			list = sqlQuery.list();
			if(list!=null && list.size()>0){
				polygonFire=(String) list.get(0);
			}
			
			if(fire.getFireDetailses().size()>0)
				inPubForest=true;
			
			if(fire.getPvtDamageEuro()!=null || fire.getPvtDamageM2()!=null || fire.getPvtDamageM3()!=null)
				inPvtForest=true;
		}
		
		BoUserSecurity user = getUser();
		if(user!=null){
			if(fire==null)
				setFire(new FireReport());
			Organisation org = user.getOrganisation();
			if(org!=null){
				Character oper_level = org.getOperLevelVal();
				Region reg = user.getRegion();
				if(oper_level.equals('M')){
					CadastralMunicipality cm = user.getCadastralMunicipality();
					fire.setCadastralMunicipality(cm);
					fire.setRegion(reg);
					munReadOnly=true;
					regReadOnly=true;
				}else if(oper_level.equals('R')){
					fire.setRegion(reg);
					regReadOnly=true;
				}
			}
		}
		return "form";
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
	 * Fire map action.
	 *
	 * @return the string
	 */
	public String fireMapAction(){
		return "fireMapAction";
	}
	
	/**
	 * Details grid.
	 *
	 * @return the string
	 */
	public String detailsGrid(){
		return "details_grid";
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
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}
}
