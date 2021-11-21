/**
 * 
 */
package com.geoland.kfis.web.action.adm.organisation;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class OrganisationAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created Jun 3, 2014 9:36:27 AM
 * @Version 1.0
 */
public class OrganisationAction extends OrganisationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5661516611989613783L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(organisationId!=null){
			Organisation org=DAOFactory.getFactory().getOrganisationDAO().get(organisationId);
			setOrganisation(org);
			if(org.getParty()!=null)
				parent=DAOFactory.getFactory().getOrganisationDAO().get(org.getParty().getId());
			if(organisation.getLogo()!=null && organisation.getLogo().length>0)
				org_logo=new String(Base64.encodeBase64(organisation.getLogo()));
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
}
