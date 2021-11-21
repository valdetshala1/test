package com.geoland.kfis.web.action.frm.inspectionoffice.inspection;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.InspectionDoc;
import com.geoland.kfis.model.Inspector;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Inspectiontype;
import com.geoland.kfis.web.action.base.Constants;
import com.ibm.icu.util.Calendar;

// TODO: Auto-generated Javadoc
/**
 * The Class InspectionSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 26, 2015 , 1:27:53 PM
 */
public class InspectionSaveAction extends InspectionBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The inspectors. */
	private List<Inspector> inspectors;
	
	/** The file. */
	private File[] file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {

		if(inspection!=null && inspection.getDate()==null){
			addFieldError("inspection.date", getMessage("frm.inspection.date.empty"));
		}

		if(inspection!=null && inspection.getInspectionType()==null){
			addFieldError("inspection.inspectionType", getMessage("frm.inspection.inspection.type.empty"));
		}else if(inspection.getInspectionType()==Inspectiontype.CONTROL){
			
			if(inspection!=null && inspection.getInspActionType().getId()==null){
				addFieldError("inspection.inspActionType", getMessage("frm.inspection.inspActionType.empty"));
			}
			if(inspection!=null && inspection.getRegion().getId()==null){
				addFieldError("inspection.region", getMessage("frm.inspection.region.empty"));
			}
			if(inspection!=null && inspectorIdList==null){
				addFieldError("inspection.inspectorIdList", getMessage("frm.inspection.inspector.empty"));
			}else{
				if(inspection.getId()==null){
					for(Long i:inspectorIdList){
						Inspector inspector=new Inspector();
						Employee emp=DAOFactory.getFactory().getEmployeeDAO().get(i);
						inspector.setEmployee(emp);
						inspector.setInspection(inspection);
						inspection.getInspectors().add(inspector);
						
						
					}
				}
				
			}
			
		}
		
		
		if(inspection.getCadastralMunicipality().getId()==null){
			inspection.setCadastralMunicipality(null);
		}
		if(inspection.getRegion().getId()==null){
			inspection.setRegion(null);
		}
		if(inspection.getInspActionType().getId()==null){
			inspection.setInspActionType(null);
		}
		
		if(inspection!=null && inspection.getProcesverbal()!=null && inspection.getProcesverbal()){
			
			if(inspection.getProcesverbalNo()==null){
				addFieldError("inspection.procesverbalNo", "frm.inspection.procesverbalNo.empty");
			}
			if(StringUtils.isEmpty(inspection.getContactPerson())){
				addFieldError("inspection.contactPerson", "frm.inspection.contactPerson.empty");
			}
			
		}
		
		if(inspection!=null  && inspection.getSequestration()!=null &&  inspection.getSequestration()){
			if(inspection.getSeqFireVolume()==null){
				addFieldError("inspection.seqFireVolume", "frm.inspection.seqFireVolume.empty");
			}
			if(inspection.getSeqTeachVolume()==null){
				addFieldError("inspection.seqTeachVolume", "frm.inspection.seqTeachVolume.empty");
			}
			
		}
		
		if(inspection!=null &&  inspection.getCharges()!=null && inspection.getCharges()){
			if(inspection.getChargesType()==null){
				addFieldError("inspection.chargesType", "frm.inspection.chargesType.empty");
			}
			if(StringUtils.isEmpty(inspection.getChargesRefNo())){
				addFieldError("inspection.chargesRefNo", "frm.inspection.chargesRefNo.empty");
				
			}
		}
		if(inspection!=null && inspection.getInspection()!=null && inspection.getInspection().getId()!=null)
			refNo=inspection.getInspection().getInspectionNo();
		
		if (hasFieldErrors() || hasActionErrors()) {
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
		
		if(inspection.getId()==null){
			inspection.setEmployee(getUser().getEmployee());
			inspection.setCreatedDate(new Date());	
			
		}
		if(inspection.getId()==null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			int actualYear=Calendar.getInstance().get(Calendar.YEAR);
			SQLQuery sqlForInspNo=session.createSQLQuery("select * from gen_inspection_no("+actualYear+")");
			sqlForInspNo.addScalar("gen_inspection_no",LongType.INSTANCE);
			Object inspNo=sqlForInspNo.uniqueResult();
			Long inspectionNo=null;
			if(inspNo!=null && !StringUtils.isEmpty(inspNo.toString())){
				inspectionNo=(Long)inspNo;
			}
			if(inspectionNo!=null){
				inspection.setInspectionNo((inspectionNo+1)+"/"+actualYear);
			}else {
				inspection.setInspectionNo("1/"+actualYear);
			}
			
		}
		if(inspection.getInspection()!=null && inspection.getInspection().getId()==null)
			inspection.setInspection(null);
		if(inspection.getInspectionType()==Inspectiontype.CONTROL){
			if(inspection.getId()!=null){
					String query="select i.* from tfrm_inspector as i  where i.office_activity_id="+inspection.getId();
					existsInspektors=DAOFactory.getFactory().getInspectorDAO().executeSQLQuery(query);
						for(Long i:inspectorIdList){
							boolean exist=false;
							for(Inspector e:existsInspektors){
								if(i.equals(e.getEmployee().getId())){
									exist=true; 
									inspection.getInspectors().add(e);
									break;
								}
							}
							if(!exist){
								Inspector inspector=new Inspector();
								Employee emp=DAOFactory.getFactory().getEmployeeDAO().get(i);
								inspector.setEmployee(emp);
								inspector.setInspection(inspection);
								inspector.setCurrentUser(user);
								DAOFactory.getFactory().getInspectorDAO().save(inspector);
								inspection.getInspectors().add(inspector);
							}
						}
					 for(Inspector e:existsInspektors){
						 boolean toDelete=true;
						 for(Long i:inspectorIdList){
							 if(e.getEmployee().getId().equals(i)){
								 toDelete=false;
								 
								 break;
							 }
						 }
						 if(toDelete){
							 e.setCurrentUser(user);
							 DAOFactory.getFactory().getInspectorDAO().delete(e);
							 inspection.getInspectors().remove(e);
						 }
					 	}
				inspection=DAOFactory.getFactory().getInspectionDAO().save(inspection);
			}else {
				inspection=DAOFactory.getFactory().getInspectionDAO().save(inspection);
				for(Long l:inspectorIdList){
					Inspector inspector=new Inspector();
					Employee emp=DAOFactory.getFactory().getEmployeeDAO().get(l);
					inspector.setEmployee(emp);
					inspector.setInspection(inspection);
					inspector.setCurrentUser(user);
					DAOFactory.getFactory().getInspectorDAO().save(inspector);
				}
				
			}
		}else {
			inspection.setCurrentUser(user);
			inspection=DAOFactory.getFactory().getInspectionDAO().save(inspection);
		}
		if(file!=null && file.length>0){
			StringTokenizer st=new StringTokenizer(docNames,";");
			int length = st.countTokens();
			String names[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					names[i]=a;
			}
			st=new StringTokenizer(docExts, ";");
			length=st.countTokens();
			String exts[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					exts[i]=a;
			}
			for(int i=0;i<file.length;i++){
				if(file[i]!=null){
					InspectionDoc doc=new InspectionDoc();
					doc.setCreatedDate(new Date());
					doc.setEmployee(getUser().getEmployee());
					doc.setInspection(inspection);
					doc.setDocName(names[i]);
					doc.setDocType(exts[i]);
					doc.setDoc(getFileBytes(file[i]));
					doc.setCurrentUser(user);
					DAOFactory.getFactory().getInspectionDocDAO().save(doc);
				}
			}
		}
	
		return SUCCESS;
	}

	/**
	 * Gets the inspectors.
	 *
	 * @return the inspectors
	 */
	public List<Inspector> getInspectors() {
		return inspectors;
	}

	/**
	 * Sets the inspectors.
	 *
	 * @param inspectors the new inspectors
	 */
	public void setInspectors(List<Inspector> inspectors) {
		this.inspectors = inspectors;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File[] getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File[] file) {
		this.file = file;
	}
	

}
