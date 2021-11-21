package com.geoland.kfis.web.action.frm.annualplan.protection;

import java.util.List;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.model.ManagementUnitPeriod;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ProtectionActivityAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 29, 2014 , 2:08:47 PM
 */
public class ProtectionActivityAction extends ProtectionActivityBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(protectionId!=null){
			protection=DAOFactory.getFactory().getProtectionActivityDAO().get(protectionId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(protection.getActivity().getId()));
			activityStatus=DAOFactory.getFactory().getActivityStatusDAO().get(protection.getActivityStatus().getId());
			String mup_query="select mp.* from tgis_mu_period mp left join tgis_management_unit mu on mp.mu_id=mu.id where isactive='Y' and mu.id="+protection.getManagementUnit().getId();
			List<ManagementUnitPeriod> mupList=DAOFactory.getFactory().getManagementUnitPeriodDAO().executeSQLQuery(mup_query);
			if(mupList.size()>0){
				ManagementUnitPeriod mup=mupList.get(0);
				muperiodId=mup.getId();	
			}
			if(protection.getActivity()!=null && protection.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(protection.getActivity().getQrCode()));
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}

}
