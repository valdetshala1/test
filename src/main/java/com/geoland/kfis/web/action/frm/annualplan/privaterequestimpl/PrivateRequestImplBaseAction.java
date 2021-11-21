package com.geoland.kfis.web.action.frm.annualplan.privaterequestimpl;

import java.util.List;

import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.PrivateRequest;
import com.geoland.kfis.model.PrivateRequestImpl;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class PrivateRequestImplBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 10, 2014 , 3:41:17 PM
 */
public class PrivateRequestImplBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The private request impl. */
	protected PrivateRequestImpl  privateRequestImpl;
	
	/** The private request impl id. */
	protected Long privateRequestImplId;
	
	/** The private request. */
	protected PrivateRequest privateRequest;
	
	/** The private request id. */
	protected Long privateRequestId;
	
	/** The activity. */
	protected Activity activity;
	
	/** The json private request impl. */
	protected String jsonPrivateRequestImpl;
	
	/** The status new. */
	protected Activitystatus statusNew=Activitystatus.NEW;
	
	/** The approved. */
	protected Activitystatus approved=Activitystatus.APPROVED;
	
	/** The rejected. */
	protected Activitystatus rejected=Activitystatus.REJECTED;
	
	/** The transport. */
	protected Activitystatus transport=Activitystatus.TRANSPORT;
	
	/** The terrain done. */
	protected Activitystatus terrainDone=Activitystatus.TERRAIN_DONE;
	
	/** The status submit. */
	protected Activitystatus statusSubmit=Activitystatus.SUBMITTED;
	
	
	/**
	 * Validate impl volume.
	 *
	 * @param pvtReqImp the pvt req imp
	 * @param pvtreq the pvtreq
	 */
	protected void validateImplVolume(List<PrivateRequestImpl> pvtReqImp,PrivateRequest pvtreq ){
		if(pvtReqImp!=null && pvtReqImp.size()>0){
			
			double totalTech=0.0;
			double totalFire=0.0;
			for(PrivateRequestImpl p:pvtReqImp){
				totalFire+=p.getFireVolume();
				totalTech+=p.getTechVolume();
			}
			if(pvtreq.getAlwFireVolume()<totalFire){
				addFieldError("privateReques.markingData",getMessage("Volume of Fire wood is bigger than allowed volume"));
			}
			if(pvtreq.getAlwTechVolume()<totalTech){
				addFieldError("privateReques.markingData",getMessage("Volume of tech wood is bigger than allowed volume"));
			}
		}
		
		
	}
	
	/**
	 * Gets the private request impl.
	 *
	 * @return the private request impl
	 */
	public PrivateRequestImpl getPrivateRequestImpl() {
		return privateRequestImpl;
	}
	
	/**
	 * Sets the private request impl.
	 *
	 * @param privateRequestImpl the new private request impl
	 */
	public void setPrivateRequestImpl(PrivateRequestImpl privateRequestImpl) {
		this.privateRequestImpl = privateRequestImpl;
	}
	
	/**
	 * Gets the private request impl id.
	 *
	 * @return the private request impl id
	 */
	public Long getPrivateRequestImplId() {
		return privateRequestImplId;
	}
	
	/**
	 * Sets the private request impl id.
	 *
	 * @param privateRequestImplId the new private request impl id
	 */
	public void setPrivateRequestImplId(Long privateRequestImplId) {
		this.privateRequestImplId = privateRequestImplId;
	}
	
	/**
	 * Gets the private request.
	 *
	 * @return the private request
	 */
	public PrivateRequest getPrivateRequest() {
		return privateRequest;
	}
	
	/**
	 * Sets the private request.
	 *
	 * @param privateRequest the new private request
	 */
	public void setPrivateRequest(PrivateRequest privateRequest) {
		this.privateRequest = privateRequest;
	}
	
	/**
	 * Gets the private request id.
	 *
	 * @return the private request id
	 */
	public Long getPrivateRequestId() {
		return privateRequestId;
	}
	
	/**
	 * Sets the private request id.
	 *
	 * @param privateRequestId the new private request id
	 */
	public void setPrivateRequestId(Long privateRequestId) {
		this.privateRequestId = privateRequestId;
	}
	
	/**
	 * Gets the activity.
	 *
	 * @return the activity
	 */
	public Activity getActivity() {
		return activity;
	}
	
	/**
	 * Sets the activity.
	 *
	 * @param activity the new activity
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the json private request impl.
	 *
	 * @return the json private request impl
	 */
	public String getJsonPrivateRequestImpl() {
		return jsonPrivateRequestImpl;
	}
	
	/**
	 * Sets the json private request impl.
	 *
	 * @param jsonPrivateRequestImpl the new json private request impl
	 */
	public void setJsonPrivateRequestImpl(String jsonPrivateRequestImpl) {
		this.jsonPrivateRequestImpl = jsonPrivateRequestImpl;
	}
	
	/**
	 * Gets the status new.
	 *
	 * @return the status new
	 */
	public Activitystatus getStatusNew() {
		return statusNew;
	}
	
	/**
	 * Sets the status new.
	 *
	 * @param statusNew the new status new
	 */
	public void setStatusNew(Activitystatus statusNew) {
		this.statusNew = statusNew;
	}
	
	/**
	 * Gets the approved.
	 *
	 * @return the approved
	 */
	public Activitystatus getApproved() {
		return approved;
	}
	
	/**
	 * Sets the approved.
	 *
	 * @param approved the new approved
	 */
	public void setApproved(Activitystatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the rejected.
	 *
	 * @return the rejected
	 */
	public Activitystatus getRejected() {
		return rejected;
	}
	
	/**
	 * Sets the rejected.
	 *
	 * @param rejected the new rejected
	 */
	public void setRejected(Activitystatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the terrain done.
	 *
	 * @return the terrain done
	 */
	public Activitystatus getTerrainDone() {
		return terrainDone;
	}
	
	/**
	 * Sets the terrain done.
	 *
	 * @param terrainDone the new terrain done
	 */
	public void setTerrainDone(Activitystatus terrainDone) {
		this.terrainDone = terrainDone;
	}
	
	/**
	 * Gets the status submit.
	 *
	 * @return the status submit
	 */
	public Activitystatus getStatusSubmit() {
		return statusSubmit;
	}
	
	/**
	 * Sets the status submit.
	 *
	 * @param statusSubmit the new status submit
	 */
	public void setStatusSubmit(Activitystatus statusSubmit) {
		this.statusSubmit = statusSubmit;
	}

	/**
	 * Gets the transport.
	 *
	 * @return the transport
	 */
	public Activitystatus getTransport() {
		return transport;
	}

	/**
	 * Sets the transport.
	 *
	 * @param transport the new transport
	 */
	public void setTransport(Activitystatus transport) {
		this.transport = transport;
	}


	
	
	
}
