package com.geoland.kfis.web.action.dem.importshape.line;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Linetempstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class LineDeleteAction.
 */
public class LineDeleteAction extends LineBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(lineTempId==null){
			addFieldError("","");	
		}
		if(hasFieldErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");	
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		linetemp=DAOFactory.getFactory().getLineTempDAO().get(lineTempId);
		linetemp.setStatus(Linetempstatus.DELETED);
		linetemp.setChangedDate(new Date());
		linetemp.setPersonByChangedBy(getUser().getPerson());
		return NONE;
	}
}
