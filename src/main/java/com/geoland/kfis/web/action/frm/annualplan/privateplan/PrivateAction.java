package com.geoland.kfis.web.action.frm.annualplan.privateplan;

import java.security.Key;

import javax.crypto.spec.SecretKeySpec;
import javax.persistence.Table;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.IntegerType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Jan 5, 2015 , 4:08:23 PM
 */
public class PrivateAction extends PrivateBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 * @throws Exception the exception
	 */
	public String form() throws Exception{
		
		String sqlActivityDomian="select * from tfrm_activity_domain where code='DTNKM'";
		activityDomain=DAOFactory.getFactory().getActivityDomainDAO().executeSQLQuery(sqlActivityDomian).get(0);
		
		if(privateActivityId!=null){
			privateActivity=DAOFactory.getFactory().getPrivateActivityDAO().get(privateActivityId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(privateActivity.getActivity().getId()));
			activityStatus=DAOFactory.getFactory().getActivityStatusDAO().get(privateActivity.getActivityStatus().getId());
			if(privateActivity.getActivity()!=null && privateActivity.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(privateActivity.getActivity().getQrCode()));
		
		}else{
			activity=new Activity();
			activity.setActivityDomain(activityDomain);
		}
		
		if(annualplanId!=null)
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
		
		controlProcesOnPage();
		
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
	 * Doc grid.
	 *
	 * @return the string
	 */
	public String docGrid(){
		if(privateActivityId!=null){
			privateActivity=DAOFactory.getFactory().getPrivateActivityDAO().get(privateActivityId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(privateActivity.getActivity().getId()));
		}
		return "docGrid";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		String sqlActivityDomian="select * from tfrm_activity_domain where code='DTNKM'";
		activityDomain=DAOFactory.getFactory().getActivityDomainDAO().executeSQLQuery(sqlActivityDomian).get(0);
		if(annualplanId!=null){
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery("select pa.id from tfrm_private_activity as pa left join tfrm_activity as a on a.id=pa.activity_id left join " +
					"tfrm_annual_planning  as apl on a.annual_planning_id=apl.id where apl.id="+annualplanId);
			sqlQuery.addScalar("id",IntegerType.INSTANCE);
			Object pvtId = sqlQuery.uniqueResult();
			
			if(pvtId!=null){
				Integer pvtidVal=(Integer)pvtId;
				privateActivity=DAOFactory.getFactory().getPrivateActivityDAO().get(pvtidVal.longValue());
				setActivity(DAOFactory.getFactory().getActivityDAO().get(privateActivity.getActivity().getId()));
				setImplValueForPrivatePlan(privateActivity);
				activityStatus=DAOFactory.getFactory().getActivityStatusDAO().get(privateActivity.getActivityStatus().getId());
				if(privateActivity.getActivity()!=null && privateActivity.getActivity().getQrCode()!=null )
					barCodeImg=new String(Base64.encodeBase64(privateActivity.getActivity().getQrCode()));
			}else {
				activity=new Activity();
				activity.setActivityDomain(activityDomain);
				
			}
			controlProcesOnPage();	
		}
		return "page";
	}
	
	
	
}
