package com.geoland.kfis.web.action.frm.compartment;

import java.util.ArrayList;
import java.util.List;

import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class CompartmentBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 19, 2015, 4:14:32 PM
 * v2.0
 */
public class CompartmentBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3778990350175587114L;
	
	/** The compartment id. */
	protected Long compartmentId;
	
	/** The compartment. */
	protected Compartment compartment;
	
	/** The stand. */
	protected Stand stand;
	
	/** The mu id. */
	protected Long mu_id;
	
	/** The mup id. */
	protected Long mup_id;
	
	/** The profile link. */
	protected String profileLink;
	
	/** The map layers. */
	protected List<LayersGis> mapLayers;
	
	/** The parent id. */
	protected Long parentId;
	
	/** The layer name. */
	protected String layer_name;
	
	
	/**
	 * Gets the layer name.
	 *
	 * @return the layer name
	 */
	public String getLayer_name() {
		return layer_name;
	}
	
	/**
	 * Sets the layer name.
	 *
	 * @param layer_name the new layer name
	 */
	public void setLayer_name(String layer_name) {
		this.layer_name = layer_name;
	}
	
	/**
	 * Gets the compartment id.
	 *
	 * @return the compartment id
	 */
	public Long getCompartmentId() {
		return compartmentId;
	}
	
	/**
	 * Sets the compartment id.
	 *
	 * @param compartmentId the new compartment id
	 */
	public void setCompartmentId(Long compartmentId) {
		this.compartmentId = compartmentId;
	}
	
	/**
	 * Gets the compartment.
	 *
	 * @return the compartment
	 */
	public Compartment getCompartment() {
		return compartment;
	}
	
	/**
	 * Sets the compartment.
	 *
	 * @param compartment the new compartment
	 */
	public void setCompartment(Compartment compartment) {
		this.compartment = compartment;
	}
	
	/**
	 * Gets the mu id.
	 *
	 * @return the mu id
	 */
	public Long getMu_id() {
		return mu_id;
	}
	
	/**
	 * Sets the mu id.
	 *
	 * @param mu_id the new mu id
	 */
	public void setMu_id(Long mu_id) {
		this.mu_id = mu_id;
	}
	
	/**
	 * Gets the mup id.
	 *
	 * @return the mup id
	 */
	public Long getMup_id() {
		return mup_id;
	}
	
	/**
	 * Sets the mup id.
	 *
	 * @param mup_id the new mup id
	 */
	public void setMup_id(Long mup_id) {
		this.mup_id = mup_id;
	}
	
	/**
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	public Stand getStand() {
		return stand;
	}
	
	/**
	 * Sets the stand.
	 *
	 * @param stand the new stand
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
	}
	
	/**
	 * Gets the profile link.
	 *
	 * @return the profile link
	 */
	public String getProfileLink() {
		return profileLink;
	}
	
	/**
	 * Sets the profile link.
	 *
	 * @param profileLink the new profile link
	 */
	public void setProfileLink(String profileLink) {
		this.profileLink = profileLink;
	}
	
	/**
	 * Gets the map layers.
	 *
	 * @return the map layers
	 */
	public List<LayersGis> getMapLayers() {
		return mapLayers;
	}
	
	/**
	 * Sets the map layers.
	 *
	 * @param mapLayers the new map layers
	 */
	public void setMapLayers(List<LayersGis> mapLayers) {
		this.mapLayers = mapLayers;
	}
	
	/**
	 * Gets the parent id.
	 *
	 * @return the parent id
	 */
	public Long getParentId() {
		return parentId;
	}
	
	/**
	 * Sets the parent id.
	 *
	 * @param parentId the new parent id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	
}
