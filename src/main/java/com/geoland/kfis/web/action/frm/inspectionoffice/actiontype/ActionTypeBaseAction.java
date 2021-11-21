package com.geoland.kfis.web.action.frm.inspectionoffice.actiontype;

import com.geoland.kfis.model.InspActionType;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ActionTypeBaseAction.
 *
 * @author Detjana Kastrati, GEO&LAND
 * @version 1.0
 * @created Feb 27, 2015, 9:25:00 AM
 */
public class ActionTypeBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8256116591277550965L;
	
	/** The action type id. */
	protected Long actionTypeId;
	
	/** The action type. */
	protected InspActionType actionType;
	
	/**
	 * Gets the action type id.
	 *
	 * @return the action type id
	 */
	public Long getActionTypeId() {
		return actionTypeId;
	}
	
	/**
	 * Sets the action type id.
	 *
	 * @param actionTypeId the new action type id
	 */
	public void setActionTypeId(Long actionTypeId) {
		this.actionTypeId = actionTypeId;
	}
	
	/**
	 * Gets the action type.
	 *
	 * @return the action type
	 */
	public InspActionType getActionType() {
		return actionType;
	}
	
	/**
	 * Sets the action type.
	 *
	 * @param actionType the new action type
	 */
	public void setActionType(InspActionType actionType) {
		this.actionType = actionType;
	}

}
