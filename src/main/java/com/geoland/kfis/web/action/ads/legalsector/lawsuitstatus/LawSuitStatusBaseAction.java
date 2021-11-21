package com.geoland.kfis.web.action.ads.legalsector.lawsuitstatus;

import java.io.File;
import java.util.List;

import com.geoland.kfis.model.LawSuitStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.LawSuitStatusDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Lawsuitstatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class LawSuitStatusBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Jun 4, 2014 4:28:47 PM
 * @Version 1.0
 */
public class LawSuitStatusBaseAction  extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The law suit status id. */
	protected Long lawSuitStatusId;
	
	/** The law suit status. */
	protected LawSuitStatus lawSuitStatus;
	
	/** The lawsuitstatus list. */
	protected Lawsuitstatus[] lawsuitstatusList=Lawsuitstatus.values();
	
	/** The file. */
	protected File file;
	
	/** The law suit id. */
	protected Long lawSuitId;
	
	/**
	 * lawsuitId-deactive all old satatus.
	 *
	 * @param lawsuitId the lawsuit id
	 */
	public void deactiveOldStatus(Long lawsuitId){
		String statusquery="SELECT * FROM tlegsec_lawsuit_status where lawsuit_id="+lawsuitId;
		LawSuitStatusDAO dao=DAOFactory.getFactory().getLawsuitStatusDAO();
		List<LawSuitStatus> status=dao.executeSQLQuery(statusquery);
		for(LawSuitStatus o:status){
			o.setActive(false);
		}
		
	}
	
	/**
	 * Gets the law suit status id.
	 *
	 * @return the law suit status id
	 */
	public Long getLawSuitStatusId() {
		return lawSuitStatusId;
	}
	
	/**
	 * Sets the law suit status id.
	 *
	 * @param lawSuitStatusId the new law suit status id
	 */
	public void setLawSuitStatusId(Long lawSuitStatusId) {
		this.lawSuitStatusId = lawSuitStatusId;
	}
	
	/**
	 * Gets the law suit status.
	 *
	 * @return the law suit status
	 */
	public LawSuitStatus getLawSuitStatus() {
		return lawSuitStatus;
	}
	
	/**
	 * Sets the law suit status.
	 *
	 * @param lawSuitStatus the new law suit status
	 */
	public void setLawSuitStatus(LawSuitStatus lawSuitStatus) {
		this.lawSuitStatus = lawSuitStatus;
	}
	
	/**
	 * Gets the lawsuitstatus list.
	 *
	 * @return the lawsuitstatus list
	 */
	public Lawsuitstatus[] getLawsuitstatusList() {
		return lawsuitstatusList;
	}
	
	/**
	 * Sets the lawsuitstatus list.
	 *
	 * @param lawsuitstatusList the new lawsuitstatus list
	 */
	public void setLawsuitstatusList(Lawsuitstatus[] lawsuitstatusList) {
		this.lawsuitstatusList = lawsuitstatusList;
	}
	
	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}
	
	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	/**
	 * Gets the law suit id.
	 *
	 * @return the law suit id
	 */
	public Long getLawSuitId() {
		return lawSuitId;
	}
	
	/**
	 * Sets the law suit id.
	 *
	 * @param lawSuitId the new law suit id
	 */
	public void setLawSuitId(Long lawSuitId) {
		this.lawSuitId = lawSuitId;
	}
	
	
	
	
}
