package com.geoland.kfis.web.action.ads.order.requisition;

import java.math.BigDecimal;
import java.text.MessageFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.base.IdGenerator;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PurchaseOrder;
import com.geoland.kfis.model.PurchaseOrderItem;
import com.geoland.kfis.model.PurchaseOrderStatus;
import com.geoland.kfis.model.RequisitionItem;
import com.geoland.kfis.model.Tax;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PRtoPOSaveAction.
 */
public class PRtoPOSaveAction extends RequisitionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6761894914078953680L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {

		if(requisitionId != null){
			requisition = DAOFactory.getFactory().getRequisitionDAO().get(requisitionId);
			if(!"AP".equals(requisition.getRequisitionStatus().getStatusCode())){
				addFieldError("requisition.statusCode", "requisition.purchase.order.statuscode.notvalid");
			}
			
			String query = "select count(*) as count from tpurchase_order where requisition_id = " + requisitionId;
			Integer count = DAOFactory.getFactory().getPurchaseOrderDAO().countQuery(query);
			if(count != null && count>0){
				String message = MessageFormat.format(getMessage("requisition.order.exists.already"), requisition.getRequisitionNr()) ;
				addActionError(message);
			}
			
		}else{
			addActionError(getMessage("requisition.requisition_id.empty"));
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		Person person = getUser().getPerson();
		
		Tax tax = DAOFactory.getFactory().getTaxDAO().findByUniqueField("name", "Standard");
		
		PurchaseOrderStatus st = new PurchaseOrderStatus();
		st.setStatusCode("NEW");
		st.setPersonByCreatedby(person);
		st.setPersonByUpdatedby(person);
		st.setCreated(cdate);
		st.setUpdated(cdate);
		
		PurchaseOrder po = new PurchaseOrder();
		po.setRequisition(requisition);
		po.setIsactive("Y");
		po.setStatusCode("NEW");
		po.setDpMngmt(requisition.getDpMngmt());
		
	    int year = Calendar.getInstance().get(Calendar.YEAR);
		Long seqNr = DAOFactory.getFactory().getDpMngmtDAO().nextOfSequence("KFIS_TPURCHASE_ORDER_PO_NUMBER");
		String docNr = "PO-" + String.valueOf(year).substring(2) + "-" + seqNr;
		po.setPoNumber(docNr);
		
		po.setIsBpartner(requisition.getIsBpartner());
		po.setBpartner(requisition.getBpartner());
		po.setSupplierName(requisition.getSupplierName());
		po.setSupplierAddress(requisition.getSupplierAddress());
		po.setSupplierContact(requisition.getSupplierContact());
		po.setSupplierEmail(requisition.getSupplierEmail());
		po.setSupplierSite(requisition.getSupplierSite());
		po.setSupplierPhone(requisition.getSupplierPhone());
		
		po.setTotallines(requisition.getTotalAmount());
		po.setGrandtotal(requisition.getTotalAmount());
		po.setOrderOriginalAmount(requisition.getTotalAmount());
		po.setOrderInitialAmount(requisition.getTotalAmount());
		po.setDateordered(cdate);
		po.setCurrency(requisition.getCurrency());
		po.setIsselfservice("N");
		
		po.setCreated(cdate);
		po.setUpdated(cdate);
		po.setPersonByCreatedby(person);
		po.setPersonByUpdatedby(person);
		
		st.setPurchaseOrder(po);
		po.setPurchaseOrderStatus(st);
		
		DAOFactory.getFactory().getPurchaseOrderDAO().save(po);
		DAOFactory.getFactory().getPurchaseOrderStatusDAO().save(st);
		
		BigDecimal totalLines = new BigDecimal(0.0);
		Set<RequisitionItem> ris = requisition.getRequisitionItems();
		for (RequisitionItem ri : ris) {
			if("AP".equals(ri.getStatusCode())){
				PurchaseOrderItem poi = new PurchaseOrderItem();
				poi.setPurchaseOrder(po);
				
				poi.setTax(tax);
				poi.setIsactive("Y");
				poi.setStatusCode("OP");
				poi.setDirectship("N");
				poi.setBpartner(requisition.getBpartner());
				poi.setItemName(ri.getItemName());
				poi.setItemNumber(po.getId()+"/"+ri.getItemNumber());
				poi.setItemDesc(ri.getItemDesc());
				
				poi.setUnitPrice(ri.getUnitPrice());
				BigDecimal qty = new BigDecimal(ri.getQuantity());
				poi.setQtyordered(qty);
				BigDecimal lineTotal = qty.multiply(ri.getUnitPrice());
				poi.setLineTotal(lineTotal);
				poi.setUom(ri.getUom());
				poi.setCurrency(requisition.getCurrency());
				
				poi.setDateordered(cdate);
				poi.setDateordered(cdate);				
				poi.setCreated(cdate);
				poi.setUpdated(cdate);
				poi.setPersonByCreatedby(person);
				poi.setPersonByUpdatedby(person);		
				
				totalLines.add(lineTotal);
				
				DAOFactory.getFactory().getPurchaseOrderItemDAO().save(poi);
			}
		}
		
		//TOTALLINES.multiply(new BigDecimal())
		//GRANDTOTAL
		
		po.setTotallines(totalLines);
		po.setGrandtotal(new BigDecimal(0.0));
		DAOFactory.getFactory().getPurchaseOrderDAO().save(po);
		
		requisition.setIsPo("Y");
		requisition.setUpdated(cdate);
		requisition.setPersonByUpdatedby(person);
		String textmsg = "";
		if(StringUtils.isNotEmpty(requisition.getTextmsg())){
			textmsg = requisition.getTextmsg() + ", Requisition was createted to Purchase order";
		}else{
			textmsg = "Requisition was createted to Purchase order";			
		}
		requisition.setTextmsg(textmsg);
		DAOFactory.getFactory().getRequisitionDAO().save(requisition);
		
		return SUCCESS;
	}
}
