package com.geoland.kfis.web.action.fal.request;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.RequestCoord;
import com.geoland.kfis.model.RequestDoc;
import com.geoland.kfis.model.RequestStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Requeststatus;
import com.geoland.kfis.web.action.base.Constants;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.operation.valid.IsValidOp;
// TODO: Auto-generated Javadoc

/**
 * The Class RequestSaveAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 18, 2015, 3:24:48 PM
 * v2.0
 */
public class RequestSaveAction extends RequestBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The coords. */
	private List<RequestCoord> coords;
	
	/** The file. */
	private File file[];

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(leaseRequest != null && leaseRequest.getStartLease()==null)
			addFieldError("leaseRequest.startLease", getMessage("payment.start.date.empty"));
		
		if(leaseRequest != null && leaseRequest.getEndLease()==null)
			addFieldError("leaseRequest.endLease", getMessage("payment.completion.date.empty"));
		
		if(leaseRequest != null && (leaseRequest.getRequestType()==null || leaseRequest.getRequestType().getId()==null))
			addFieldError("leaseRequest.requestType.id", getMessage("fal.request.requesttype.empty"));
		
		if(leaseRequest != null && (leaseRequest.getContractor()==null || leaseRequest.getContractor().getId()==null) 
				&& (leaseRequest.getPersonByPersonId() == null || leaseRequest.getPersonByPersonId().getId() == null)){
			addFieldError("leaseRequest.personByPersonId.id", getMessage("this.user.person.empty"));
			addFieldError("leaseRequest.contractor.id", getMessage("contractor.comopany.name.empty"));
		}
		coords = new ArrayList<RequestCoord>();
		if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
			JSONArray array=(JSONArray) JSONSerializer.toJSON(jsonDetails);
			if(array.size()>0){
				for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
					RequestCoord coord = new RequestCoord();
					JSONObject o =  iterator.next();
					if(o.get("x")!=null && StringUtils.isNotEmpty(o.get("x").toString().trim())){
						Double x=Double.valueOf(o.get("x").toString());
						coord.setX(x);
					}else {
						addFieldError("x.coord",  getMessage("leaseRequest.x.coord.empty"));
					}
					if(o.get("y")!=null && StringUtils.isNotEmpty(o.get("y").toString())){
						Double y=Double.valueOf(o.get("y").toString());
						coord.setY(y);
					}else {
						addFieldError("y.coord",  getMessage("leaseRequest.y.coord.empty"));
					}
					coord.setRequest(leaseRequest);
					coord.setCreatedDate(new Date());
					coords.add(coord);
				}
			}else
				addFieldError("coords",  getMessage("fal.request.coords.empty"));
		}
		else {
			addFieldError("coords",  getMessage("fal.request.coords.empty"));
		}
		
		
		if(StringUtils.isNotEmpty(getGeometry())){
		    WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
		    Geometry geo;
			try {
				geo = wktReader.read(getGeometry());
			    if ((!"MultiPolygon".equalsIgnoreCase(geo.getGeometryType()) 
			    		&& !"Polygon".equalsIgnoreCase(geo.getGeometryType())) || !IsValidOp.isValid(geo)){
			    	addFieldError("vineyard.theGeom", "Geometry is not MultiPolygon");
				}				
			    geo.setSRID(900916);
			    leaseRequest.setTheGeom(geo);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}else
			addFieldError("leaseRequest.area", getMessage("fal.request.geometry.empty"));
		
		if(hasActionErrors() || hasFieldErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		RequestStatus currentStatus = leaseRequest.getRequestStatus();
		if(currentStatus!=null && currentStatus.getId()!=null){
			currentStatus = DAOFactory.getFactory().getRequestStatusDAO().get(currentStatus.getId());				
		}
		Person user = getUser().getPerson();
		leaseRequest.setPersonByCreatedBy(user);
		leaseRequest.setLeaseDate(new Date());
		User currentUser = getUser().getUser();
		leaseRequest.setCurrentUser(currentUser);
		
		if(leaseRequest.getPersonByPersonId()!=null && leaseRequest.getPersonByPersonId().getId()==null)
			leaseRequest.setPersonByPersonId(null);
		if(leaseRequest.getContractor()!=null && leaseRequest.getContractor().getId()==null)
			leaseRequest.setContractor(null);
		
		if(currentStatus==null ){
			leaseRequest.setActive(true);
			currentStatus = new RequestStatus();
			currentStatus.setActive(true);
			currentStatus.setCreatedDate(new Date());
			currentStatus.setPerson(user);
			currentStatus.setStatus(Requeststatus.NEW);
			currentStatus.setRequest(leaseRequest);
			currentStatus.setCurrentUser(currentUser);
			leaseRequest.setRequestStatus(currentStatus);			
		}
		DAOFactory.getFactory().getRequestDAO().save(leaseRequest);
		DAOFactory.getFactory().getRequestStatusDAO().save(currentStatus);
		
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
					RequestDoc doc=new RequestDoc();
					doc.setCreateDate(new Date());
					doc.setRequestStatus(currentStatus);
					doc.setDocName(names[i]);
					doc.setDocType(exts[i]);
					doc.setDoc(getFileBytes(file[i]));
					doc.setPerson(user);
					doc.setCurrentUser(currentUser);
					DAOFactory.getFactory().getRequestDocDAO().save(doc);
				}
			}
		}
		
		for(RequestCoord coord : coords){
			coord.setCurrentUser(currentUser);
			DAOFactory.getFactory().getRequestCoordDAO().save(coord);
		}
		return SUCCESS;
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
