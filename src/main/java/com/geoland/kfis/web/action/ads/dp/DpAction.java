package com.geoland.kfis.web.action.ads.dp;

import com.geoland.kfis.model.DpMngmt;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DpAction.
 */
public class DpAction extends DpBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8278418505622045409L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if (dpId != null) {
			DpMngmt mydp = DAOFactory.getFactory().getDpMngmtDAO().get(dpId);
			setDp(mydp);
		}
		return "form";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}

	/**
	 * Doc edit.
	 *
	 * @return the string
	 */
	public String docEdit(){
		if(docId!=null){
			doc=DAOFactory.getFactory().getDpMngmtAttachDAO().get(docId);
		}
		return "doc_edit";
	}
}
