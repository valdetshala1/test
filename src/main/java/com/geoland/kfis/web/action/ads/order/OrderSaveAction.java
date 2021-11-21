package com.geoland.kfis.web.action.ads.order;

import java.math.BigDecimal;
import java.text.MessageFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PurchaseOrderStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class OrderSaveAction.
 */
public class OrderSaveAction extends OrderBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6761894914078953680L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(order!=null && order.getId()!=null){
			String fieldNames[] = new String[]{"id", "status_id", "status_code"};
			String fieldTypes[] = new String[]{"LONG", "LONG", "STRING"};
			String query = "select r.id, r.status_id, r.status_code from tpurchase_order as r left join tpurchase_order_status as s on r.id = s.order_id where s.id=r.status_id and r.id=" + order.getId();
			List<Object[]> dataView = DAOFactory.getFactory().getRequisitionStatusDAO().getDataView(fieldNames, fieldTypes, query);
			if(dataView!=null && !dataView.isEmpty()){
				Object[] data = dataView.get(0);
				Long tid = (Long) data[0];
				//Long tstatusId = (Long) data[1];
				String tstatusCode = (String) data[2];
				if(order.getId().equals(tid) &&  (!"NEW".equals(tstatusCode) && !"OPEN".equals(tstatusCode))){
					addActionError(getMessage("order.save.operation.status.disabled"));
				}
			}else{
				addActionError(getMessage("order.status.data.invalid"));
			}
		}		
		
		if(order.getRequisition()!=null && order.getRequisition().getId()==null)
			order.setRequisition(null);
		else{
			String query = "select count(*) as count from tpurchase_order where requisition_id = " + order.getRequisition().getId();
			if(order.getId()!=null)
				query+=" and id!="+order.getId();
			Integer count = DAOFactory.getFactory().getPurchaseOrderDAO().countQuery(query);
			if(count != null && count>0){
				String message = MessageFormat.format(getMessage("requisition.order.exists.already"), order.getRequisition().getRequisitionNr()) ;
				addActionError(message);
			}
		}
		if(order.getDateordered()==null)
			addFieldError("order.dateordered", getMessage("order.dateordered.empty"));
		if(StringUtils.isEmpty(order.getDeptContactEmail()))
			addFieldError("order.deptContactEmail", getMessage("order.deptContactEmail.empty"));
		if(StringUtils.isEmpty(order.getDeptContactName()))
			addFieldError("order.deptContactName", getMessage("order.deptContactName.empty"));
		if(StringUtils.isEmpty(order.getDeptContactPhone()))
			addFieldError("order.deptContactPhone", getMessage("order.deptContactPhone.empty"));
		
		
		if(StringUtils.isEmpty(order.getIsdelivered()))
			order.setIsdelivered("N");

		if(order.getOrderInitialAmount()==null)
			addFieldError("order.orderInitialAmount", getMessage("order.orderInitialAmount.empty"));
		if(order.getOrderOriginalAmount()==null)
			addFieldError("order.orderOriginalAmount", getMessage("order.orderOriginalAmount.empty"));
		
		if(StringUtils.isEmpty(order.getIsinvoiced()))
			order.setIsinvoiced("N");
		if(StringUtils.isEmpty(order.getIsprinted()))
			order.setIsprinted("N");
		if(StringUtils.isEmpty(order.getIsselected()))
			order.setIsselected("N");
		if(StringUtils.isEmpty(order.getIsdelivered()))
			order.setIsdelivered("N");
		
		if(StringUtils.isEmpty(order.getIsBpartner())){
			addFieldError("order.isBpartner", getMessage("requisition.isBpartner.empty"));
		}else{
			if("Y".equals(order.getIsBpartner())){
				if(order.getBpartner() != null && order.getBpartner().getId() == null){
					addFieldError("order.bpartner.id", getMessage("requisition.isBpartner.empty"));
				}					
			}else{
				order.setBpartner(null);
				order.setBpartnerLocation(null);
				
				if(StringUtils.isEmpty(order.getSupplierName())){
					addFieldError("order.supplierName", getMessage("requisition.supplierName.empty"));
				}
				
				if(StringUtils.isEmpty(order.getSupplierAddress())){
					addFieldError("order.supplierAddress", getMessage("requisition.supplierAddress.empty"));
				}
				
				if(StringUtils.isEmpty(order.getSupplierContact())){
					addFieldError("order.supplierContact", getMessage("requisition.supplierContact.empty"));
				}		
				
				if(StringUtils.isEmpty(order.getSupplierPhone())){
					addFieldError("order.supplierPhone", getMessage("requisition.supplierPhone.empty"));
				}					
			}
		}
		if(order.getBpartner()!=null && order.getBpartner().getId()==null)
			order.setBpartner(null);
		if(order.getBpartnerLocation()!=null && order.getBpartnerLocation().getId()==null)
			order.setBpartnerLocation(null);
		
		if(order.getCurrency() != null && order.getCurrency().getId()==null){
			addFieldError("order.currency.id", getMessage("requisition.currency.id"));
		}
		/*
		if(order.getTaxamount()==null)
			addFieldError("order.taxamount", getMessage("order.taxamount.empty"));
		if(order.getFreight()==null)
			addFieldError("order.freight", getMessage("order.freight.empty"));
		*/
		
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
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
		String statusCode = "NEW";
		BigDecimal totalAmount= new BigDecimal(0.0),taxAmount= new BigDecimal(0.0),freightAmount = new BigDecimal(0.0);
		
		PurchaseOrderStatus s=new PurchaseOrderStatus();
		s.setCreated(cdate);
		s.setPersonByCreatedby(person);
		s.setPersonByUpdatedby(person);
		s.setPurchaseOrder(order);
		s.setStatusCode(statusCode);
		s.setUpdated(cdate);
		
		if(order.getId() == null && StringUtils.isEmpty(order.getPoNumber())){
			//order.setPoNumber(IdGenerator.createId());
			Calendar cal = Calendar.getInstance();
		    cal.setTime(cdate);
		    int year = cal.get(Calendar.YEAR);
			Long seqNr = DAOFactory.getFactory().getDpMngmtDAO().nextOfSequence("KFIS_TPURCHASE_ORDER_PO_NUMBER");
			String docNr = "PO-" + String.valueOf(year).substring(2) + "-" + seqNr;
			order.setPoNumber(docNr);			
		}
		
		order.setIsactive("Y");
		order.setSendemail("Y");
		order.setIsselfservice("Y");
		order.setEquipmentApproverName("");
		order.setEquipmentPrinted("Y");
		
		if(order.getId()==null)
			order.setStatusCode(statusCode);
		
		order.setPurchaseOrderStatus(s);
		
		if(order.getTotallines()==null)
			order.setTotallines(totalAmount);//Purchase order subtotal. Computed from po items
		
		if(order.getGrandtotal()==null)
			order.setGrandtotal(totalAmount);

		if(order.getTaxamount()!=null)
			taxAmount=order.getGrandtotal();
		
		if(order.getFreight()!=null)
			freightAmount=order.getFreight();
		
		order.setGrandtotal(order.getTotallines().add(freightAmount).add(taxAmount));//Total due to vendor. Computed as TOTALLINES + TaxAmt + Freight
		
		order.setCreated(cdate);
		order.setUpdated(cdate);
		order.setPersonByCreatedby(person);
		order.setPersonByUpdatedby(person);
		
		if(order.getBpartner()!=null && order.getBpartner().getId()!=null){
			order.setIsBpartner("Y");
		}else{
			order.setIsBpartner("N");
			order.setBpartner(null);
		}
		User user=getUser().getUser();
		order.setCurrentUser(user);
		DAOFactory.getFactory().getPurchaseOrderDAO().save(order);
		s.setCurrentUser(user);
		DAOFactory.getFactory().getPurchaseOrderStatusDAO().save(s);
		return SUCCESS;
	}
}
