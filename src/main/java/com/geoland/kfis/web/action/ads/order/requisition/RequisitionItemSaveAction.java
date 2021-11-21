package com.geoland.kfis.web.action.ads.order.requisition;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.Requisition;
import com.geoland.kfis.model.RequisitionItem;
import com.geoland.kfis.model.Uom;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequisitionItemSaveAction.
 */
public class RequisitionItemSaveAction extends RequisitionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6761894914078953680L;
	
	/** The json data. */
	private String jsonData;
	
	/** The items. */
	private List<RequisitionItem> items;
	
	/** The item. */
	private RequisitionItem item;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		item = new RequisitionItem();
		
		if(StringUtils.isNotEmpty(request.getParameter("requisition_id"))){
			Long reqId = Long.valueOf(request.getParameter("requisition_id"));
			Requisition reqFake = new Requisition();
			reqFake.setId(reqId);
			item.setRequisition(reqFake);
		}else{
			addFieldError("Requisition", getMessage("requisition.requisition_id.empty"));
		}
		
		if(StringUtils.isNotEmpty(request.getParameter("id"))){
			item.setId(Long.valueOf(request.getParameter("id")));
		}
		
		if(StringUtils.isNotEmpty(request.getParameter("status_code"))){
			item.setStatusCode(request.getParameter("status_code"));
		}else{
			addFieldError("Status code", getMessage("requisition.status.code.empty"));
		}
		
		if(StringUtils.isNotEmpty(request.getParameter("item_name"))){
			item.setItemName(request.getParameter("item_name"));
		}else{
			addFieldError("Item name", getMessage("order.item.name.empty"));
		}
		
		if(StringUtils.isNotEmpty(request.getParameter("item_number")))
			item.setItemNumber(request.getParameter("item_number"));
		
		if(StringUtils.isNotEmpty(request.getParameter("item_desc"))){
			item.setItemDesc(request.getParameter("item_desc"));
		}else{
			//addFieldError("item_desc", "requisition.item_desc.empty");
		}
		
		if(StringUtils.isNotEmpty(request.getParameter("unit_of_issue_code"))){
			item.setUnitOfIssueCode(request.getParameter("unit_of_issue_code"));
		}else{
			addFieldError("Unit of issue code", getMessage("requisition.unit.of.issue.code.empty"));
		}
		
		if(StringUtils.isNotEmpty(request.getParameter("unit_price"))){
			item.setUnitPrice(new BigDecimal(request.getParameter("unit_price")));
		}else{
			addFieldError("Unit price", getMessage("order.item.unit.price.empty"));
		}	
		
		if(StringUtils.isNotEmpty(request.getParameter("quantity"))){
			item.setQuantity(Long.valueOf(request.getParameter("quantity")));
		}else{
			addFieldError("Quantity", getMessage("requisition.quantity.empty"));
		}		
		
		if(StringUtils.isNotEmpty(request.getParameter("uom_id"))){
			Long reqId = Long.valueOf(request.getParameter("uom_id"));
			Uom uom = new Uom();
			uom.setId(reqId);
			item.setUom(uom);
		}else{
			addFieldError("Uom", getMessage("order.item.uom.empty"));
		}		
		
		/*
		if(StringUtils.isNotEmpty(request.getParameter("unit_price_amount"))){
			item.setUnitPriceAmount(Double.valueOf(request.getParameter("unit_price_amount")));
		}else{
			addFieldError("unit_price_amount", "requisition.unit_price_amount.empty");
		}
		*/

		if(StringUtils.isNotEmpty(request.getParameter("need_by_date"))){
			Date needByDate;
			try {
				needByDate = DATE_FORMAT.parse(request.getParameter("need_by_date"));
				item.setNeedByDate(needByDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		}else{
			//addFieldError("need_by_date", "requisition.need_by_date.empty");
		}		
		
		if(StringUtils.isNotEmpty(request.getParameter("textmsg"))){
			item.setTextmsg(request.getParameter("textmsg"));
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
		
		Requisition reqObj = DAOFactory.getFactory().getRequisitionDAO().get(item.getRequisition().getId());
		BigDecimal amount = item.getUnitPrice().multiply(new BigDecimal(item.getQuantity()));
		BigDecimal totalAmount = reqObj.getTotalAmount().add(amount);
		reqObj.setTotalAmount(totalAmount);
		
		if(item.getId() == null){
			item.setStatusCode("OP");
			item.setCreated(cdate);
			item.setPersonByCreatedby(person);
			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForno=session.createSQLQuery("select * from gen_po_item_no("+item.getRequisition().getId()+")");
			sqlForno.addScalar("gen_po_item_no",LongType.INSTANCE);
			Object no=sqlForno.uniqueResult();
			Long nr=null;
			if(no!=null && !StringUtils.isEmpty(no.toString())){
				nr=(Long)no;
			}
			if(nr!=null)
				item.setItemNumber(item.getRequisition().getId()+"/"+(nr+1));
			else item.setItemNumber(item.getRequisition().getId()+"/1");
			
		}else{
			String query = "select created, createdby from trequisition_item where id = " + item.getId();
			List<Object[]> dataView = DAOFactory.getFactory().getRequisitionItemDAO().getDataView(new String[]{"created", "createdby"}, new String[]{"DATE", "LONG"}, query);
			Object[] data = dataView.get(0);
			item.setCreated((Date) data[0]);
			Person p = new Person();
			p.setId((Long) data[1]);
			item.setPersonByCreatedby(p);
		}
		
		item.setUnitPriceAmount(amount);
		item.setUpdated(cdate);
		item.setPersonByUpdatedby(person);
		item.setAcceptDate(cdate);
		item.setReceivedDate(cdate);
		item.setIsactive("Y");
		
		DAOFactory.getFactory().getRequisitionItemDAO().save(item);
		
		return SUCCESS;
	}

	/**
	 * Gets the json data.
	 *
	 * @return the json data
	 */
	public String getJsonData() {
		return jsonData;
	}

	/**
	 * Sets the json data.
	 *
	 * @param jsonData the new json data
	 */
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}
	
	
}
