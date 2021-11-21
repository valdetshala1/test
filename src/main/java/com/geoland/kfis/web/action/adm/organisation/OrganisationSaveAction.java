/**
 * 
 */
package com.geoland.kfis.web.action.adm.organisation;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.OrganisationMun;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class OrganisationSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created Jun 3, 2014 9:40:32 AM
 * @Version 1.0
 */
public class OrganisationSaveAction extends OrganisationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1769671403084554571L;
	
	/** The input map. */
	private Map<Long, OrganisationMun> inputMap = new HashMap<Long, OrganisationMun>();
	
	/** The exists map. */
	private Map<Long, OrganisationMun> existsMap = new HashMap<Long, OrganisationMun>();
	
	/** The file. */
	private File file;
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		String duplicated_mun="";
		
		if(getParent()!= null && getParent().getId() == null){
			addFieldError("organisation.parent", getMessage("organisation.parent.empty"));
		}
		if(organisation.getActive()==null)
			organisation.setActive(false);
		
		if(StringUtils.isEmpty(getOrganisation().getOrgaName()))
			addFieldError("organisation.orgaName", getMessage("organisation.orga.name.empty"));
		if(StringUtils.isEmpty(getOrganisation().getOrgaNameEn()))
			addFieldError("organisation.orgaNameEn", getMessage("finance.type.name.en.empty"));
		if(StringUtils.isEmpty(getOrganisation().getOrgaNameSr()))
			addFieldError("organisation.orgaNameSr", getMessage("finance.type.name.sr.empty"));
		
		if(StringUtils.isEmpty(getOrganisation().getCode()))
			addFieldError("organisation.code", getMessage("organisation.code.empty"));
		
		if(getOrganisation().getOperLevelVal() == null)
			addFieldError("organisation.operLevelVal", getMessage("organisation.operation.level.empty"));		
		
//		if(munList == null || munList.isEmpty())
//			addFieldError("organisation.municipality", getMessage("organisation.municipality.empty"));
		if(munList!=null && !munList.isEmpty() && getOrganisation().getOperLevelVal() != null){
			List<OrganisationMun> orgMunList=orgMunList(munList, getOrganisation().getOperLevelVal(), organisation.getId());
			if(orgMunList!=null && !orgMunList.isEmpty()){
				for(Long om:munList){
					CadastralMunicipality cm=duplicatedMun(orgMunList, om);
					if(cm!=null)
						duplicated_mun+=cm.getName()+", ";
				}
			}
		}
		if(duplicated_mun.isEmpty()){
			if(getOrganisation() != null && getOrganisation().getId() != null){
				List<OrganisationMun> result = DAOFactory.getFactory().getOrganisationMunDAO().executeSQLQuery("select * from torganisation_mun where org_id = " + getOrganisation().getId());
				for (OrganisationMun om : result) {
					existsMap.put(om.getCadastralMunicipality().getId(), om);
					getOrganisation().getOrganisationMuns().add(om);
				}			
				if(munList != null){
					for (Long munId : munList) {
						if(existsMap.get(munId) != null){
							inputMap.put(munId, existsMap.get(munId));
						}else{
							OrganisationMun om = new OrganisationMun();
							CadastralMunicipality cm = DAOFactory.getFactory().getCadastralMunicipalityDAO().get(munId);
							om.setCadastralMunicipality(cm);
							om.setOrganisation(getOrganisation());		
							
							getOrganisation().getOrganisationMuns().add(om);	
							inputMap.put(munId, om);
						}
					}
				}
			}else{
				if(munList != null) {
					for (Long munId : munList) {
						OrganisationMun om = new OrganisationMun();
						CadastralMunicipality cm = DAOFactory.getFactory().getCadastralMunicipalityDAO().get(munId);
						
						om.setCadastralMunicipality(cm);
						om.setOrganisation(getOrganisation());		
						
						getOrganisation().getOrganisationMuns().add(om);	
						inputMap.put(munId, om);
					}
				}
			}
		}else addFieldError("duplicated_mun", duplicated_mun);
		
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
			response.addHeader("duplicated_mun", duplicated_mun);
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User currentUser = getUser().getUser();
		if(parent.getId() != null){
			parent = DAOFactory.getFactory().getOrganisationDAO().get(parent.getId());
			getOrganisation().setParty(parent);
			short opl = (short) (parent.getOperLevel() + 1);
			getOrganisation().setOperLevel(opl);
			
		}
		if(file!=null){
			organisation.setLogo(getFileBytes(file));
		}else if(organisation.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select o.logo from torganisation as o left join tparty as y on o.id = y.id where o.id="+organisation.getId());
			sqlQuery.addScalar("logo");
			Object ob1 = sqlQuery.uniqueResult();
			organisation.setLogo((byte[])ob1);
		}
		if(organisation.getLogo()!=null)
			org_logo=new String(Base64.encodeBase64(organisation.getLogo()));
		//getOrganisation().setCreatedDate(new Date());
		//getOrganisation().setPartyType(Partytype.ORGANISATION);
		getOrganisation().setPartyType("O");
		getOrganisation().setCurrentUser(currentUser);
		DAOFactory.getFactory().getOrganisationDAO().save(getOrganisation());
		
		
		if(!inputMap.keySet().equals(existsMap.keySet())){
	        Map<Long, OrganisationMun> insert = new HashMap<Long, OrganisationMun>();
	        Map<Long, OrganisationMun> remove = new HashMap<Long, OrganisationMun>();
	        
	        for(Long key: inputMap.keySet()){
	        	if(!existsMap.containsKey(key)){
	        		insert.put(key, inputMap.get(key));
	        	}
	        }
	        
	        for(Long key: existsMap.keySet()){
	        	if(!inputMap.containsKey(key)){
	        		remove.put(key, existsMap.get(key));
	        	}
	        }	        
	        
	        for (Map.Entry<Long, OrganisationMun> entry : insert.entrySet()){
	        	entry.getValue().setCurrentUser(currentUser);
	        	DAOFactory.getFactory().getOrganisationMunDAO().save(entry.getValue());
	        }
	        
	        
	        for (Map.Entry<Long, OrganisationMun> entry : remove.entrySet()){
	        	entry.getValue().setCurrentUser(currentUser);
	        	DAOFactory.getFactory().getOrganisationMunDAO().delete(entry.getValue());
	        	getOrganisation().getOrganisationMuns().remove(entry.getValue());
	        }
	    }
		
		return SUCCESS;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
}
