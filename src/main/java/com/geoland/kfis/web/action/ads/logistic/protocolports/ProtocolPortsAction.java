package com.geoland.kfis.web.action.ads.logistic.protocolports;

import com.geoland.kfis.model.ProtocolPorts;
import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ProtocolPortsAction.
 *
 * @author Arta Hoxha , GEO&LAND
 * @version 1.0
 * @created Apr 4, 2016 , 11:39:21 AM
 */
public class ProtocolPortsAction  extends ProtocolPortsBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if (protocolId != null) {
			ProtocolPorts pp = DAOFactory.getFactory().getProtocolPortsDAO()
					.get(protocolId);
			setProtocolPorts(pp);
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
	 * Profile.
	 *
	 * @return the string
	 */
	public String profile() {
		if (protocolId != null) {
			protocolPorts=DAOFactory.getFactory().getProtocolPortsDAO().get(protocolId);
		}
		return "profile";
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
