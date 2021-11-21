package com.geoland.kfis.web.action.frm.managementUnit;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.ManagementUnit;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.RegionDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class ManagementUnitAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 14, 2015, 4:02:30 PM
 * v2.0
 */
public class ManagementUnitAction extends ManagementUnitBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
//		Character opl_val = getUser().getOrganisation().getOperLevelVal();
//		Region reg=null;
//		if(opl_val=='R'){
//			RegionDAO regDao= DAOFactory.getFactory().getRegionDAO();
//			String query="select distinct(region_id) from torganisation o left join torganisation_mun om on o.id=om.org_id left join "
//					+ " tgis_cadastral_municipality cm on om.mun_id=cm.id "
//					+ " where o.parent_id= "+getUser().getOrganisation().getId();
//			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
//			SQLQuery sqlQuery=session.createSQLQuery(query);
//			sqlQuery.addScalar("region_id",LongType.INSTANCE);
//			if(sqlQuery.list().size()>0){
//				 Object obj =(Object)sqlQuery.list().get(0);
//				 regionId=(Long) obj;
//				 reg=regDao.get(regionId);
//			}
//		}
//		if(managementUnit==null && reg !=null){
//			managementUnit=new ManagementUnit();
//			managementUnit.setRegion(reg);
//		}
		if(managementUnitId!=null)
			managementUnit = DAOFactory.getFactory().getManagementUnitDAO().get(managementUnitId);
		
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Mup form.
	 *
	 * @return the string
	 */
	public String mupForm(){
		return "mup_form";
	}
}
