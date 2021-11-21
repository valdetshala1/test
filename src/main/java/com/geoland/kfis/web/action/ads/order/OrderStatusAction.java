/**
 * 
 */
package com.geoland.kfis.web.action.ads.order;

import java.text.MessageFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PurchaseOrderItem;
import com.geoland.kfis.model.PurchaseOrderStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class OrderStatusAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @author changed at 07.03.2015
 * @version 1.0
 * ----------------------------------
 * @created 5:32:01 PM, Mar 4, 2015
 */
public class OrderStatusAction extends OrderBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The is AP. */
	private boolean isAP = false;
	
	/** The is RE. */
	private boolean isRE = false;
	
	/** The is CA. */
	private boolean isCA = false;	
	
	/** The is CL. */
	private boolean isCL = false;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(orderId != null){
			order = DAOFactory.getFactory().getPurchaseOrderDAO().get(orderId);
			if(order==null){
				addFieldError("order.id", getMessage("order.id.empty"));
			}
			
			for (PurchaseOrderItem ri : order.getPurchaseOrderItems()) {
				if("OP".equals(ri.getStatusCode())){
					String message = MessageFormat.format(getMessage("order.item.statuscode.op.invalid"), ri.getItemNumber()) ;
					addActionError(message);	
				}else{
					if("AP".equals(ri.getStatusCode())){
						isAP = true;
					}
					
					if("RE".equals(ri.getStatusCode())){
						isRE = true;
					}	
					
					if("CA".equals(ri.getStatusCode())){
						isCA = true;
					}
					
					if("CL".equals(ri.getStatusCode()))
						isCL=true;
				}
			}

			if(order.getPurchaseOrderItems() != null && order.getPurchaseOrderItems().isEmpty()){
				addActionError(getMessage("order.items.empty"));
			}			
			
		}else{
			addFieldError("order.id", getMessage("order.id.empty"));
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}

	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		Person person = getUser().getPerson();
		
		String statusCode = null;
		if(isCL && !isAP){
			statusCode = "CL";
		}else if(isAP){
			statusCode = "AP";
		}else if(isRE && !isAP){
			statusCode = "RE";
		}else if(!isAP && !isRE && isCA){
			statusCode = "CA";
		}
		
		PurchaseOrderStatus status = new PurchaseOrderStatus();
		status.setCreated(cdate);
		status.setPersonByCreatedby(person);
		status.setPersonByUpdatedby(person);
		status.setPurchaseOrder(order);
		status.setStatusCode(statusCode);
		status.setUpdated(cdate);
		
		order.setStatusCode(statusCode);
		order.setPurchaseOrderStatus(status);
		
		DAOFactory.getFactory().getPurchaseOrderDAO().save(order);
		DAOFactory.getFactory().getPurchaseOrderStatusDAO().save(status);
		
		return SUCCESS;
	}
}
