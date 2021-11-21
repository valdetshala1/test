package com.geoland.kfis.web.action.frm.compartment;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
// TODO: Auto-generated Javadoc

/**
 * The Class CompartmentSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 20, 2015, 1:18:41 PM
 * v2.0
 */
public class CompartmentSaveAction extends CompartmentBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3428455760161662430L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(compartment!=null && compartment.getId()!=null){
			Compartment comp=DAOFactory.getFactory().getCompartmentDAO().get(compartment.getId());
			compartment.setTheGeom(comp.getTheGeom());
		}
		if(compartment!=null && compartment.getManagementUnit().getId()==null)
			addFieldError("compartment.managementUnit.id", getMessage("compartment.management.unit.id.empty"));
	
		if(compartment!=null && (compartment.getCadastralMunicipality()==null || (compartment.getCadastralMunicipality()!=null && compartment.getCadastralMunicipality().getId()==null)))
			addFieldError("compartment.cadastralMunicipality", getMessage("dhpet.location.cadastral.municipality.empty"));
		
		if(compartment!=null && compartment.getManagementUnitPeriod().getId()==null)
			addFieldError("compartment.managementUnitPeriod.id", getMessage("compartment.management.unit.period.id.empty"));
	
		if(compartment!=null && StringUtils.isEmpty(compartment.getCompNr()))
			addFieldError("compartment.compNr", getMessage("compartment.comp.id.empty"));
		else if(compartment.getManagementUnit().getId()!=null){
			String sql="select count(*) from tgis_compartment c where c.comp_nr='"+compartment.getCompNr()+"' and c.mu_id="+compartment.getManagementUnit().getId();
			if(compartment!=null && compartment.getId()!=null)
				sql+=" and c.id!="+compartment.getId();
			
			Integer count = DAOFactory.getFactory().getCompartmentDAO().countQuery(sql);
			if(count>0)
				addFieldError("compartment.compNr", getMessage("frm.compartment.compnr.exists"));
		}
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
			User user = getUser().getUser();
			compartment.setCurrentUser(user);
			DAOFactory.getFactory().getCompartmentDAO().save(compartment);
		return SUCCESS;
	}

}
