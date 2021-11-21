/**
 * 
 */
package com.geoland.kfis.web.action.frm.confiscation;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.ConfiscationDetail;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Confiscationtype;

// TODO: Auto-generated Javadoc
/**
 * The Class ConfiscationSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Aug 9, 2016 , 10:20:34 AM
 * @Version 1.0
 */
public class ConfiscationSaveAction  extends ConfiscationBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The confiscation detail. */
	private List<ConfiscationDetail> confiscationDetail;
	
	/** The json conf detail. */
	private String jsonConfDetail;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		
		if(employee==null)
			addActionError("login.user.employee.role.empty");
		
		if( StringUtils.isEmpty(confType)){
			addFieldError("confiscation.type", getMessage("frm.confiscation.type.is.empty"));
		}else{
			if(confType.equals("CO"))
				 confiscation.setType(Confiscationtype.CONFISCATION);
			else confiscation.setType(Confiscationtype.SALE);
		}
		if(confiscation.getCadastralMunicipality()==null || confiscation.getCadastralMunicipality().getId()==null){
			addFieldError("confiscation.cadastralMunicipality", getMessage("fin.input.organisation.empty"));
		}
		if(confiscation!=null && confiscation.getConfiscationDate()==null){
			addFieldError("confiscation.confiscationDate", getMessage("frm.confiscation.date.empty"));
		}
		confiscationDetail=new ArrayList<ConfiscationDetail>();
		JSONArray array= (JSONArray) JSONSerializer.toJSON(jsonConfDetail);
		
		for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
			JSONObject obj=iterator.next();
			ConfiscationDetail cd=new ConfiscationDetail();
			cd.setConfiscation(confiscation);
			if(obj.get("confiscation_detail_id")!=null && StringUtils.isNotEmpty(obj.get("confiscation_detail_id").toString())){
				String id = obj.get("confiscation_detail_id").toString();
				cd.setId(new Long(id));
			}
			
			if(obj.get("tree_species_id")!=null && StringUtils.isNotEmpty(obj.get("tree_species_id").toString())){
				String id = obj.get("tree_species_id").toString();
				TreeSpecies ts=new TreeSpecies();
				ts.setId(new Long(id));
				cd.setTreeSpecies(ts);
			}else{
				addFieldError("tree_species_id", getMessage("annu.prod.wood.type.wood.type.empty"));
			}
			
			if(obj.get("tree_tech_volume")!=null && StringUtils.isNotEmpty(obj.get("tree_tech_volume").toString())){
				double tree_tech=new Double(obj.get("tree_tech_volume").toString()).doubleValue();
				cd.setTreeTechVolume(tree_tech);
			}
			
			if(obj.get("tree_fire_volume")!=null && StringUtils.isNotEmpty(obj.get("tree_fire_volume").toString())){
				double tree_fire=new Double(obj.get("tree_fire_volume").toString()).doubleValue();
				cd.setTreeFireVolume(tree_fire);
			}
			
			if(cd.getTreeFireVolume()==null && cd.getTreeTechVolume()==null){
				addFieldError("fire_tech_volume", getMessage("frm.fire.and.tech.volume.empty"));
			}
			if(obj.get("total_volume")!=null && StringUtils.isNotEmpty(obj.get("total_volume").toString())){
				double total_volume=new Double(obj.get("total_volume").toString()).doubleValue();
				cd.setTotalVolume(total_volume);
			}
			if(cd.getTreeFireVolume()==null && cd.getTreeTechVolume()==null){
				addFieldError("confiscation.fire.tech", getMessage("frm.confiscation.fire.and.tech.empty"));
				cd.setTreeFireVolume(0.0);
				cd.setTreeTechVolume(0.0);
			}else if(cd.getTreeFireVolume()==null){
				cd.setTreeFireVolume(0.0);
			}else if(cd.getTreeTechVolume()==null){
				cd.setTreeTechVolume(0.0);
			}
			cd.setTotalVolume(cd.getTreeFireVolume()+cd.getTreeTechVolume());
			
			confiscationDetail.add(cd);
		}
		if(confiscationDetail.size()==0){
			addFieldError("confiscation.confiscationDetail", getMessage("frm.confiscation.confiscationDetail.empty"));
		}
		
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
		
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
	  if(confiscation.getId()==null){
			confiscation.setEmployee(employee);
			confiscation.setCreatedDate(new Date());
		}
	   DAOFactory.getFactory().getConfiscationDAO().save(confiscation);
	   for(ConfiscationDetail cd:confiscationDetail){
		   cd.setConfiscation(confiscation);
		   DAOFactory.getFactory().getConfiscationDetailDAO().save(cd);
	   }
		return SUCCESS;
	}



	/**
	 * Gets the json conf detail.
	 *
	 * @return the json conf detail
	 */
	public String getJsonConfDetail() {
		return jsonConfDetail;
	}

	/**
	 * Sets the json conf detail.
	 *
	 * @param jsonConfDetail the new json conf detail
	 */
	public void setJsonConfDetail(String jsonConfDetail) {
		this.jsonConfDetail = jsonConfDetail;
	}
	

}
