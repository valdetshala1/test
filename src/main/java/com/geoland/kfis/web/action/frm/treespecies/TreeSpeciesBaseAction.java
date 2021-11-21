package com.geoland.kfis.web.action.frm.treespecies;

import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.hibernate.usertypes.Treespeciesgroup;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class TreeSpeciesBaseAction.
 *
 * @author Detjana Kastrati, GEO&LAND
 * @version 1.0
 * @created Feb 3, 2015, 4:40:22 PM
 */
public class TreeSpeciesBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The treespecies id. */
	protected Long treespeciesId;
	
	/** The treespecies. */
	protected TreeSpecies treespecies;
	
	/** The tree species group list. */
	protected Treespeciesgroup treeSpeciesGroupList[]=Treespeciesgroup.values();
	
	/**
	 * Gets the treespecies id.
	 *
	 * @return the treespecies id
	 */
	public Long getTreespeciesId() {
		return treespeciesId;
	}
	
	/**
	 * Sets the treespecies id.
	 *
	 * @param treespeciesId the new treespecies id
	 */
	public void setTreespeciesId(Long treespeciesId) {
		this.treespeciesId = treespeciesId;
	}
	
	/**
	 * Gets the treespecies.
	 *
	 * @return the treespecies
	 */
	public TreeSpecies getTreespecies() {
		return treespecies;
	}
	
	/**
	 * Sets the treespecies.
	 *
	 * @param treespecies the new treespecies
	 */
	public void setTreespecies(TreeSpecies treespecies) {
		this.treespecies = treespecies;
	}
	
	/**
	 * Gets the tree species group list.
	 *
	 * @return the treeSpeciesGroupList
	 */
	public Treespeciesgroup[] getTreeSpeciesGroupList() {
		return treeSpeciesGroupList;
	}
	
	/**
	 * Sets the tree species group list.
	 *
	 * @param treeSpeciesGroupList the treeSpeciesGroupList to set
	 */
	public void setTreeSpeciesGroupList(Treespeciesgroup[] treeSpeciesGroupList) {
		this.treeSpeciesGroupList = treeSpeciesGroupList;
	}
	
	
	

}
