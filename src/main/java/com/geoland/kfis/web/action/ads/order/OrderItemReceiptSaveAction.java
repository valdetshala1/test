/**
 * 
 */
package com.geoland.kfis.web.action.ads.order;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PurchaseOrderItem;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class OrderItemReceiptSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:18:17 AM, Mar 18, 2015
 */
public class OrderItemReceiptSaveAction extends OrderBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3399913733867432871L;

	/** The item. */
	private PurchaseOrderItem item;
	
	/** The qtyrejected. */
	private BigDecimal qtydelivered=null,qtyreserved=null,qtyrejected=null;
	
	/** The datedelivered. */
	private Date datedelivered=null;
	
	/** The person. */
	private Person person;
	
	/** The status code. */
	private String msg,statusCode;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addActionError("login.user.employee.role.empty");

		if(item.getId()!=null){
			
			if(item!=null && item.getQtydelivered()==null)
				addFieldError("item.qtydelivered", getMessage("orderItem.qtydelivered.empty"));
			else qtydelivered=item.getQtydelivered();
			
			if(item!=null && item.getQtyreserved()!=null)
				qtyreserved=item.getQtyreserved();
			
			if(item!=null && item.getQtyrejected()==null)
				addFieldError("item.qtyrejected", getMessage("orderItem.qtyrejected.empty"));
			else qtyrejected=item.getQtyrejected();
			
			if(item!=null && item.getDatedelivered()==null)
				addFieldError("item.datedelivered", getMessage("order.item.date.delivered.empty"));
			else datedelivered=item.getDatedelivered();
			
			if(item!=null && StringUtils.isEmpty(item.getStatusCode()))
				addFieldError("item.statusCode", getMessage("order.item.status.code.empty"));
			else statusCode=item.getStatusCode();
			
		}else addFieldError("Item", getMessage("order.item.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}else {
			item=DAOFactory.getFactory().getPurchaseOrderItemDAO().get(item.getId());
			item.setQtydelivered(qtydelivered);
			item.setQtyrejected(qtyrejected);
			item.setQtyreserved(qtyreserved);
			item.setDatedelivered(datedelivered);
			item.setStatusCode(statusCode);
			item.setQtystocked(item.getQtyordered().subtract(item.getQtyrejected()));
			item.setDescription(msg);
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		item.setPersonByUpdatedby(person);
		item.setUpdated(new Date());
		item.setQtystocked(item.getQtyordered().subtract(item.getQtyrejected()));
		
		DAOFactory.getFactory().getPurchaseOrderItemDAO().save(item);
		return SUCCESS;
	}

	/**
	 * Gets the item.
	 *
	 * @return the item
	 */
	public PurchaseOrderItem getItem() {
		return item;
	}

	/**
	 * Sets the item.
	 *
	 * @param item the item to set
	 */
	public void setItem(PurchaseOrderItem item) {
		this.item = item;
	}

	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson() {
		return person;
	}

	/**
	 * Sets the person.
	 *
	 * @param person the person to set
	 */
	public void setPerson(Person person) {
		this.person = person;
	}

	/**
	 * Gets the msg.
	 *
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * Sets the msg.
	 *
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	
}
