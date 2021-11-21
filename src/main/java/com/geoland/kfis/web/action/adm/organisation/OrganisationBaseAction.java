/**
 * 
 */
package com.geoland.kfis.web.action.adm.organisation;

import java.util.List;

import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.OrganisationMun;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Operationlevel;
import com.geoland.kfis.persistence.hibernate.usertypes.Orgacategory;
import com.geoland.kfis.persistence.hibernate.usertypes.Organisationtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class OrganisationBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created Jun 3, 2014 9:34:05 AM
 * @Version 1.0
 */
public class OrganisationBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The cad mun list. */
	protected List<CadastralMunicipality> cadMunList;
	
	/** The mun list. */
	protected List<Long> munList;
	
	/** The organisation id. */
	protected Long organisationId;
	
	/** The organisation. */
	protected Organisation organisation;
	
	/** The operation level list. */
	protected Operationlevel[] operationLevelList=Operationlevel.values();
	
	/** The organisation type list. */
	protected Organisationtype[] organisationTypeList=Organisationtype.values();
	
	/** The orga category list. */
	protected Orgacategory[] orgaCategoryList=Orgacategory.values();
	
	/** The parent. */
	protected Organisation parent;
	
	/** The org logo. */
	protected String org_logo;
	
	/**
	 * Org mun list.
	 *
	 * @param munList the mun list
	 * @param oper_level the oper level
	 * @param org_id the org id
	 * @return the list
	 */
	protected List<OrganisationMun> orgMunList(List<Long> munList, Character oper_level, Long org_id){
		String mun_ids="";
		for(int i=0;i<munList.size();i++){
			if(i<munList.size()-1)
				mun_ids+=munList.get(i)+",";
			else mun_ids+=munList.get(i);
		}
		String query="select * from torganisation_mun om left join torganisation o on o.id=om.org_id where o.oper_level_val='"+oper_level+"'and mun_id in ("+mun_ids+")";
		if(org_id!=null)
			query+=" and org_id!="+org_id;
		
		return DAOFactory.getFactory().getOrganisationMunDAO().executeSQLQuery(query);
	}
	
	/**
	 * Duplicated mun.
	 *
	 * @param munList the mun list
	 * @param mun_id the mun id
	 * @return the cadastral municipality
	 */
	protected CadastralMunicipality duplicatedMun(List<OrganisationMun> munList, Long mun_id){
		for(OrganisationMun om:munList){
			if(om.getCadastralMunicipality().getId().equals(mun_id))
				return om.getCadastralMunicipality();
		}
		return null;
	}
	
	/**
	 * Gets the organisation id.
	 *
	 * @return the organisationId
	 */
	public Long getOrganisationId() {
		return organisationId;
	}
	
	/**
	 * Sets the organisation id.
	 *
	 * @param organisationId the organisationId to set
	 */
	public void setOrganisationId(Long organisationId) {
		this.organisationId = organisationId;
	}
	
	/**
	 * Gets the organisation.
	 *
	 * @return the organisation
	 */
	public Organisation getOrganisation() {
		return organisation;
	}
	
	/**
	 * Sets the organisation.
	 *
	 * @param organisation the organisation to set
	 */
	public void setOrganisation(Organisation organisation) {
		this.organisation = organisation;
	}
	
	/**
	 * Gets the operation level list.
	 *
	 * @return the operationLevelList
	 */
	public Operationlevel[] getOperationLevelList() {
		return operationLevelList;
	}
	
	/**
	 * Sets the operation level list.
	 *
	 * @param operationLevelList the operationLevelList to set
	 */
	public void setOperationLevelList(Operationlevel[] operationLevelList) {
		this.operationLevelList = operationLevelList;
	}
	
	/**
	 * Gets the organisation type list.
	 *
	 * @return the organisationTypeList
	 */
	public Organisationtype[] getOrganisationTypeList() {
		return organisationTypeList;
	}
	
	/**
	 * Sets the organisation type list.
	 *
	 * @param organisationTypeList the organisationTypeList to set
	 */
	public void setOrganisationTypeList(Organisationtype[] organisationTypeList) {
		this.organisationTypeList = organisationTypeList;
	}
	
	/**
	 * Gets the orga category list.
	 *
	 * @return the orgaCategoryList
	 */
	public Orgacategory[] getOrgaCategoryList() {
		return orgaCategoryList;
	}
	
	/**
	 * Sets the orga category list.
	 *
	 * @param orgaCategoryList the orgaCategoryList to set
	 */
	public void setOrgaCategoryList(Orgacategory[] orgaCategoryList) {
		this.orgaCategoryList = orgaCategoryList;
	}
	
	/**
	 * Gets the parent.
	 *
	 * @return the parent
	 */
	public Organisation getParent() {
		return parent;
	}
	
	/**
	 * Sets the parent.
	 *
	 * @param parent the parent to set
	 */
	public void setParent(Organisation parent) {
		this.parent = parent;
	}
	
	/**
	 * Gets the mun list.
	 *
	 * @return the mun list
	 */
	public List<Long> getMunList() {
		return munList;
	}
	
	/**
	 * Sets the mun list.
	 *
	 * @param munList the new mun list
	 */
	public void setMunList(List<Long> munList) {
		this.munList = munList;
	}
	
	/**
	 * Gets the cad mun list.
	 *
	 * @return the cad mun list
	 */
	public List<CadastralMunicipality> getCadMunList() {
		return cadMunList;
	}
	
	/**
	 * Sets the cad mun list.
	 *
	 * @param cadMunList the new cad mun list
	 */
	public void setCadMunList(List<CadastralMunicipality> cadMunList) {
		this.cadMunList = cadMunList;
	}
	
	/**
	 * Gets the org logo.
	 *
	 * @return the org logo
	 */
	public String getOrg_logo() {
		return org_logo;
	}
	
	/**
	 * Sets the org logo.
	 *
	 * @param org_logo the new org logo
	 */
	public void setOrg_logo(String org_logo) {
		this.org_logo = org_logo;
	}
}
