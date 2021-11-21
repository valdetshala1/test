package com.geoland.kfis.web.action.frm.annualplan.privaterequestimpl;

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

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrivateRequestImpl;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestImplSaveAction.
 */
public class PrivateRequestImplSaveAction extends PrivateRequestImplBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The private request impl array. */
	private List<PrivateRequestImpl> privateRequestImplArray;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void validate() {
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		
		privateRequestImplArray=new ArrayList<PrivateRequestImpl>();
		JSONArray array = (JSONArray) JSONSerializer.toJSON(jsonPrivateRequestImpl);
		for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
			JSONObject obj =  iterator.next();
			PrivateRequestImpl  pvtReqImp=new PrivateRequestImpl();
			
			if (obj.get("idImpl")!=null && (StringUtils.isNotEmpty(obj.get("idImpl").toString()))) {
				
					Long id=Long.parseLong(obj.get("idImpl").toString());
					privateRequestImpl=DAOFactory.getFactory().getPrivateRequestImplDAO().get(id);
					pvtReqImp=privateRequestImpl;
			}
			
			if(obj.get("isnew")!=null && (StringUtils.isNotEmpty(obj.get("isnew").toString()))){
				pvtReqImp.setCreatedDate(new Date());
				pvtReqImp.setEmployee(employee); 
			}

			
			if(obj.get("tree_species_id")!=null && StringUtils.isNotEmpty(obj.get("tree_species_id").toString())){
				String tree_species= obj.get("tree_species_id").toString();
				Long tree_species_id=Long.parseLong(tree_species);
				TreeSpecies ts=DAOFactory.getFactory().getTreeSpeciesDAO().get(tree_species_id);
				pvtReqImp.setTreeSpecies(ts);
			}else{
				addFieldError("tree_species_id", getMessage("tree.species.id.empty"));
			}	
			if(obj.get("diameter_1_3")!=null && StringUtils.isNotEmpty(obj.get("diameter_1_3").toString())){
				String dia= obj.get("diameter_1_3").toString();
				Double diameter13=Double.parseDouble(dia);
				pvtReqImp.setDiameter13(diameter13);
				
			}else{
				addFieldError("diameter_1_3", getMessage("diameter.13.empty"));
			}
			if(obj.get("factor")!=null && StringUtils.isNotEmpty(obj.get("factor").toString())){
				String f= obj.get("factor").toString();
				Double factor=Double.parseDouble(f);
				pvtReqImp.setFactor(factor);
				
			}else{
				addFieldError("factor", getMessage("factor.empty"));
			}
			
			if(obj.get("height")!=null && StringUtils.isNotEmpty(obj.get("height").toString())){
				String h= obj.get("height").toString();
				Double height=Double.parseDouble(h);
				pvtReqImp.setHeight(height);
				
			}else{
				addFieldError("height", getMessage("height.empty"));
			}
			
			if(obj.get("tech_volume")!=null && StringUtils.isNotEmpty(obj.get("tech_volume").toString())){
				String tv= obj.get("tech_volume").toString();
				Double tech_volume=Double.parseDouble(tv);
				pvtReqImp.setTechVolume(tech_volume);
			}else{
				addFieldError("tech_volume", getMessage("tech.volume.empty"));
			}
			
			if(obj.get("fire_volume")!=null && StringUtils.isNotEmpty(obj.get("fire_volume").toString())){
				String fv= obj.get("fire_volume").toString();
				Double fire_volume=Double.parseDouble(fv);
				pvtReqImp.setFireVolume(fire_volume);
			}else {
				addFieldError("fire_volume", getMessage("fire.volume.empty"));
			}
			
			if(obj.get("pulp_volume")!=null && StringUtils.isNotEmpty(obj.get("pulp_volume").toString())){
				String pv= obj.get("pulp_volume").toString();
				Double pulp_volume=Double.parseDouble(pv);
				pvtReqImp.setPulpVolume(pulp_volume);
			}
			
			if(obj.get("volume_total")!=null && StringUtils.isNotEmpty(obj.get("volume_total").toString())){
				String vt= obj.get("volume_total").toString();
				Double volume_total=Double.parseDouble(vt);
				pvtReqImp.setVolumeTotal(volume_total);
			}else {
				addFieldError("volume_total", getMessage("volume.total.empty"));
			}
			
			if(obj.get("remarks")!=null && StringUtils.isNotEmpty(obj.get("remarks").toString())){
				String remarks= obj.get("remarks").toString();
				pvtReqImp.setRemarks(remarks);
			}
			
			privateRequestImplArray.add(pvtReqImp);
		
		}
		String receiver_person="";
		String marking_tool="";
		Employee auth_person_id=null;
		Date marking_date=null;
		
		
		
		if(privateRequest!=null && StringUtils.isEmpty(privateRequest.getReceiverPerson()))
			addFieldError("privateRequest.receiverPerson",getMessage("privateRequest.receiver.person.empty"));
		else {
			 receiver_person = privateRequest.getReceiverPerson();
		}
		
		if(privateRequest!=null && StringUtils.isEmpty(privateRequest.getMarkingTool()))
			addFieldError("privateRequest.markingTool",getMessage("privateRequest.marking.tool.empty"));
		else {
			marking_tool=privateRequest.getMarkingTool();
		}
		
		if(privateRequest!=null && privateRequest.getAuthPerson().getId()==null)
			addFieldError("privateRequest.authPerson",getMessage("privateRequest.authPerson.empty"));
		else {
			auth_person_id = privateRequest.getAuthPerson();
		}
		if(privateRequest!=null && privateRequest.getMarkingDate()==null)
			addFieldError("privateRequest.markingDate",getMessage("privateRequest.markingDate.empty"));
		else {
		marking_date = privateRequest.getMarkingDate();
		}
		
		
		
		privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequest.getId());
		privateRequest.setReceiverPerson(receiver_person);
		privateRequest.setAuthPerson(auth_person_id);
		privateRequest.setMarkingDate(marking_date);
		privateRequest.setMarkingTool(marking_tool);
		
		if(getFieldErrors().isEmpty()){
			validateImplVolume(privateRequestImplArray, privateRequest);
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
		if(privateRequest.getApCreatedBy()==null || privateRequest.getApCreatedBy().getId()==null)
			privateRequest.setApCreatedBy(null);
		
		ActivityStatus status = new ActivityStatus();
		status.setCreatedDate(new Date());
		status.setActivity(privateRequest.getActivity());
		status.setPerson(employee);
		status.setStatus(Activitystatus.TERRAIN_DONE);
		privateRequest.setActivityStatus(status);
		
		User user = getUser().getUser();
		status.setCurrentUser(user);
		privateRequest.setCurrentUser(user);
		
		DAOFactory.getFactory().getActivityStatusDAO().save(status);
		DAOFactory.getFactory().getPrivateRequestDAO().save(privateRequest);
		
		for(PrivateRequestImpl pvtReqImpl: privateRequestImplArray){
			pvtReqImpl.setPrivateRequest(privateRequest);
//			pvtReqImpl.setVolumeTotal(calcVolumeTotal(pvtReqImpl.getDiameter13(), pvtReqImpl.getHeight(), pvtReqImpl.getFactor()));
			pvtReqImpl.setCurrentUser(user);
			DAOFactory.getFactory().getPrivateRequestImplDAO().save(pvtReqImpl);
		}
		
		return SUCCESS;
	}
	
	/**
	 * Calc volume total.
	 *
	 * @param d the d
	 * @param h the h
	 * @param f the f
	 * @return the double
	 */
	public double calcVolumeTotal(double d,double h, double f){
		double dm=d/100;
		double rez=(Math.PI/4)*dm*dm*h*f;
		return rez;
		
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
	
}
