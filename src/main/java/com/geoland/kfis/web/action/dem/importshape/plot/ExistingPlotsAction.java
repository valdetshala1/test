/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.plot;

import java.math.BigInteger;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.web.action.base.Constants;



// TODO: Auto-generated Javadoc
/**
 * The Class ExistingPlotsAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 19, 2015, 10:15:42 AM
 */
public class ExistingPlotsAction extends ImportPlotBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6260171131847427561L;
	
	/** The region code. */
	private String regionCode;
	
	/** The mu code. */
	private String muCode;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		String countQuery = "select count(p.id) from get_stand_id('Y','"+regionCode+"','"+muCode+"') m right join tgis_plots p on m.id=p.stand_id";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(countQuery);
		
		BigInteger count = (BigInteger) sqlQuery.uniqueResult();
		if(count.intValue()>0)
			addFieldError("plot.import", getMessage("plot.import.is.done")); 
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * Gets the region code.
	 *
	 * @return the regionCode
	 */
	public String getRegionCode() {
		return regionCode;
	}

	/**
	 * Sets the region code.
	 *
	 * @param regionCode the regionCode to set
	 */
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	/**
	 * Gets the mu code.
	 *
	 * @return the muCode
	 */
	public String getMuCode() {
		return muCode;
	}

	/**
	 * Sets the mu code.
	 *
	 * @param muCode the muCode to set
	 */
	public void setMuCode(String muCode) {
		this.muCode = muCode;
	}

}
