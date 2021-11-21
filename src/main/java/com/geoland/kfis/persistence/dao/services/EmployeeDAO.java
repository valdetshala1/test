package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class EmployeeDAO.
 */
public class EmployeeDAO extends GenericDAO<Employee, Long> {

	/**
	 * Gets the region.
	 *
	 * @param orgId the org id
	 * @return the region
	 */
	public Region getRegion(Long orgId){
		String query="select m.* from tgis_cadastral_municipality m " +
				"left join torganisation_mun om on om.mun_id=m.id " +
				"where om.org_id="+orgId +" limit 1";
		List<CadastralMunicipality> munList = DAOFactory.getFactory().getCadastralMunicipalityDAO().executeSQLQuery(query);
		if(munList.size()>0){
			return DAOFactory.getFactory().getRegionDAO().get(munList.get(0).getRegion().getId());
		}
		return null;
	}
	
	/**
	 * Gets the cadastral municipality.
	 *
	 * @param orgId the org id
	 * @return the cadastral municipality
	 */
	public CadastralMunicipality getCadastralMunicipality(Long orgId){
		String query="select m.* from tgis_cadastral_municipality m " +
				"left join torganisation_mun om on om.mun_id=m.id " +
				"where om.org_id="+orgId +" limit 1";
		List<CadastralMunicipality> munList = DAOFactory.getFactory().getCadastralMunicipalityDAO().executeSQLQuery(query);
		if(munList.size()>0){
			return DAOFactory.getFactory().getCadastralMunicipalityDAO().get(munList.get(0).getId());
		}
		return null;
	}
}
