/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest;

import com.geoland.kfis.model.PrcmtTenderRequest;
import com.geoland.kfis.model.PrcmtTenderStatus;
import com.geoland.kfis.model.PrcmtTenderStatusDoc;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderRequestBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:17:27 PM, Oct 2, 2014
 */
public class TenderRequestBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2168407839494115873L;
	
	/** The tender request id. */
	protected Long tenderRequestId;
	
	/** The tender request. */
	protected PrcmtTenderRequest tenderRequest;
	
	/** The tender status. */
	protected PrcmtTenderStatus tenderStatus;
	
	/** The tender status id. */
	protected Long tenderStatusId;
	
	/** The approved. */
	protected Protenderstatus approved=Protenderstatus.APPROVED;
	
	/** The rejected. */
	protected Protenderstatus rejected=Protenderstatus.REJECTED;
	
	/** The tenderdone. */
	protected Protenderstatus tenderdone=Protenderstatus.TENDERDONE;
	
	/** The publish. */
	protected Protenderstatus publish=Protenderstatus.PUBLISH;
	
	/** The status new. */
	protected Protenderstatus statusNew=Protenderstatus.NEW;
	
	/** The contracted. */
	protected Protenderstatus contracted=Protenderstatus.CONTRACTED;
	
	/** The pending. */
	protected Protenderstatus pending=Protenderstatus.PENDING;
	
	/** The canceled. */
	protected Protenderstatus canceled=Protenderstatus.CANCELED;
	
	/** The selected. */
	protected Protenderstatus selected=Protenderstatus.SELECTED;
	
	/** The republish. */
	protected Protenderstatus republish=Protenderstatus.REPUBLISH;
	
	/** The show tabs. */
	protected boolean showTabs;
	
	/** The hide buttons. */
	protected boolean hideButtons;
	
	/** The hide popup buttons. */
	protected boolean hidePopupButtons;
	
	/** The attachment. */
	protected PrcmtTenderStatusDoc attachment;
	
	/** The status list. */
	protected Protenderstatus statusList[];
	
	/**
	 * Gets the tender request id.
	 *
	 * @return the tenderRequestId
	 */
	public Long getTenderRequestId() {
		return tenderRequestId;
	}
	
	/**
	 * Sets the tender request id.
	 *
	 * @param tenderRequestId the tenderRequestId to set
	 */
	public void setTenderRequestId(Long tenderRequestId) {
		this.tenderRequestId = tenderRequestId;
	}
	
	/**
	 * Gets the tender request.
	 *
	 * @return the tenderRequest
	 */
	public PrcmtTenderRequest getTenderRequest() {
		return tenderRequest;
	}
	
	/**
	 * Sets the tender request.
	 *
	 * @param tenderRequest the tenderRequest to set
	 */
	public void setTenderRequest(PrcmtTenderRequest tenderRequest) {
		this.tenderRequest = tenderRequest;
	}
	
	/**
	 * Gets the tender status.
	 *
	 * @return the tender status
	 */
	public PrcmtTenderStatus getTenderStatus() {
		return tenderStatus;
	}
	
	/**
	 * Sets the tender status.
	 *
	 * @param tenderStatus the new tender status
	 */
	public void setTenderStatus(PrcmtTenderStatus tenderStatus) {
		this.tenderStatus = tenderStatus;
	}
	
	/**
	 * Gets the approved.
	 *
	 * @return the approved
	 */
	public Protenderstatus getApproved() {
		return approved;
	}
	
	/**
	 * Sets the approved.
	 *
	 * @param approved the new approved
	 */
	public void setApproved(Protenderstatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the rejected.
	 *
	 * @return the rejected
	 */
	public Protenderstatus getRejected() {
		return rejected;
	}
	
	/**
	 * Sets the rejected.
	 *
	 * @param rejected the new rejected
	 */
	public void setRejected(Protenderstatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the tenderdone.
	 *
	 * @return the tenderdone
	 */
	public Protenderstatus getTenderdone() {
		return tenderdone;
	}
	
	/**
	 * Sets the tenderdone.
	 *
	 * @param tenderdone the new tenderdone
	 */
	public void setTenderdone(Protenderstatus tenderdone) {
		this.tenderdone = tenderdone;
	}
	
	/**
	 * Gets the publish.
	 *
	 * @return the publish
	 */
	public Protenderstatus getPublish() {
		return publish;
	}
	
	/**
	 * Sets the publish.
	 *
	 * @param publish the new publish
	 */
	public void setPublish(Protenderstatus publish) {
		this.publish = publish;
	}
	
	/**
	 * Gets the status new.
	 *
	 * @return the status new
	 */
	public Protenderstatus getStatusNew() {
		return statusNew;
	}
	
	/**
	 * Sets the status new.
	 *
	 * @param statusNew the new status new
	 */
	public void setStatusNew(Protenderstatus statusNew) {
		this.statusNew = statusNew;
	}
	
	/**
	 * Gets the attachment.
	 *
	 * @return the attachment
	 */
	public PrcmtTenderStatusDoc getAttachment() {
		return attachment;
	}
	
	/**
	 * Sets the attachment.
	 *
	 * @param attachment the attachment to set
	 */
	public void setAttachment(PrcmtTenderStatusDoc attachment) {
		this.attachment = attachment;
	}
	
	/**
	 * Gets the tender status id.
	 *
	 * @return the tenderStatusId
	 */
	public Long getTenderStatusId() {
		return tenderStatusId;
	}
	
	/**
	 * Sets the tender status id.
	 *
	 * @param tenderStatusId the tenderStatusId to set
	 */
	public void setTenderStatusId(Long tenderStatusId) {
		this.tenderStatusId = tenderStatusId;
	}
	
	/**
	 * Checks if is show tabs.
	 *
	 * @return the showTabs
	 */
	public boolean isShowTabs() {
		return showTabs;
	}
	
	/**
	 * Sets the show tabs.
	 *
	 * @param showTabs the showTabs to set
	 */
	public void setShowTabs(boolean showTabs) {
		this.showTabs = showTabs;
	}
	
	/**
	 * Gets the contracted.
	 *
	 * @return the contracted
	 */
	public Protenderstatus getContracted() {
		return contracted;
	}
	
	/**
	 * Sets the contracted.
	 *
	 * @param contracted the contracted to set
	 */
	public void setContracted(Protenderstatus contracted) {
		this.contracted = contracted;
	}
	
	/**
	 * Gets the pending.
	 *
	 * @return the pending
	 */
	public Protenderstatus getPending() {
		return pending;
	}
	
	/**
	 * Sets the pending.
	 *
	 * @param pending the pending to set
	 */
	public void setPending(Protenderstatus pending) {
		this.pending = pending;
	}
	
	/**
	 * Gets the canceled.
	 *
	 * @return the canceled
	 */
	public Protenderstatus getCanceled() {
		return canceled;
	}
	
	/**
	 * Sets the canceled.
	 *
	 * @param canceled the canceled to set
	 */
	public void setCanceled(Protenderstatus canceled) {
		this.canceled = canceled;
	}
	
	/**
	 * Gets the selected.
	 *
	 * @return the selected
	 */
	public Protenderstatus getSelected() {
		return selected;
	}
	
	/**
	 * Sets the selected.
	 *
	 * @param selected the selected to set
	 */
	public void setSelected(Protenderstatus selected) {
		this.selected = selected;
	}
	
	/**
	 * Checks if is hide buttons.
	 *
	 * @return the hideButtons
	 */
	public boolean isHideButtons() {
		return hideButtons;
	}
	
	/**
	 * Sets the hide buttons.
	 *
	 * @param hideButtons the hideButtons to set
	 */
	public void setHideButtons(boolean hideButtons) {
		this.hideButtons = hideButtons;
	}
	
	/**
	 * Checks if is hide popup buttons.
	 *
	 * @return the hidePopupButtons
	 */
	public boolean isHidePopupButtons() {
		return hidePopupButtons;
	}
	
	/**
	 * Sets the hide popup buttons.
	 *
	 * @param hidePopupButtons the hidePopupButtons to set
	 */
	public void setHidePopupButtons(boolean hidePopupButtons) {
		this.hidePopupButtons = hidePopupButtons;
	}
	
	/**
	 * Gets the republish.
	 *
	 * @return the republish
	 */
	public Protenderstatus getRepublish() {
		return republish;
	}
	
	/**
	 * Sets the republish.
	 *
	 * @param republish the republish to set
	 */
	public void setRepublish(Protenderstatus republish) {
		this.republish = republish;
	}
	
	/**
	 * Gets the status list.
	 *
	 * @return the statusList
	 */
	public Protenderstatus[] getStatusList() {
		return statusList;
	}
	
	/**
	 * Sets the status list.
	 *
	 * @param statusList the statusList to set
	 */
	public void setStatusList(Protenderstatus[] statusList) {
		this.statusList = statusList;
	}
}
