package com.geoland.kfis.web.action.frm.treespecies;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class TreeSpeciesSaveAction.
 *
 * @author Detjana Kastrati, GEO&LAND
 * @version 1.0
 * @created Feb 3, 2015, 4:40:33 PM
 */
public class TreeSpeciesSaveAction extends TreeSpeciesBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3950633646186196871L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate() {
		if(treespecies!=null && treespecies.getCode()==null)
			addFieldError("treespecies.code", getMessage("tree.species.code.empty"));
		
		if(treespecies!=null && StringUtils.isEmpty(treespecies.getNameAl()))
			addFieldError("treespecies.nameAl", getMessage("dhpet.wild.animals.name.al.empty"));
		
		if(treespecies!=null && StringUtils.isEmpty(treespecies.getNameEn()))
			addFieldError("treespecies.nameEn", getMessage("finance.type.name.en.empty"));
		
		if(treespecies!=null && StringUtils.isEmpty(treespecies.getNameSr()))
			addFieldError("treespecies.nameSr", getMessage("finance.type.name.sr.empty"));
		
		if(treespecies!=null && StringUtils.isEmpty(treespecies.getNameLa()))
			addFieldError("treespecies.nameLa", getMessage("tree.species.name.la.empty"));
		
		if(treespecies!=null && treespecies.getMaxDiameter()==null)
			addFieldError("treespecies.maxDiameter", getMessage("tree.species.max.diam.empty"));
		
		if(treespecies!=null && treespecies.getSpeciesBonitet()==null)
			addFieldError("treespecies.speciesBonitet", getMessage("tree.species.bonitet.empty"));
		
		if(treespecies!=null && treespecies.getSpeciesGroup()==null)
			addFieldError("treespecies.speciesGroup", getMessage("tree.species.group.empty"));
	
	if(hasFieldErrors()) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute(){
		User user = getUser().getUser();
		getTreespecies().setCurrentUser(user);
		DAOFactory.getFactory().getTreeSpeciesDAO().save(getTreespecies());
		return SUCCESS;
	}
}