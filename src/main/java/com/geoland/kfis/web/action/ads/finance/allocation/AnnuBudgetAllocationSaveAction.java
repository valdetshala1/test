package com.geoland.kfis.web.action.ads.finance.allocation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnuBudgetAllocationSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Sep 8, 2014 10:11:36 AM
 * @Version 1.0
 */
public class AnnuBudgetAllocationSaveAction extends AnnuBudgetAllocationBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8079587316563686797L;
	
	/** The employee. */
	private Employee employee;
	
	/** The fin input id list. */
	private String finInputIdList;
	
	/** The financial inputs. */
	List<Long> financialInputs;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		financialInputs=new ArrayList<>();
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		if(annuBudgetAllocation!=null && annuBudgetAllocation.getOrganisation().getId()==null)
			addFieldError("annuBudgetAllocation.organization", getMessage("fin.allocation.organization.empty"));
		
		if(annuBudgetAllocation!=null && annuBudgetAllocation.getMonth()==null)
			addFieldError("annuBudgetAllocation.month", getMessage("fin.allocation.month.empty"));
		
		if(annuBudgetAllocation!=null && annuBudgetAllocation.getYear()==null)
			addFieldError("annuBudgetAllocation.year", getMessage("fin.allocation.year.empty"));
		
		if(annuBudgetAllocation!=null && annuBudgetAllocation.getOrganisation().getId()!=null && annuBudgetAllocation.getMonth()!=null  && annuBudgetAllocation.getYear()!=null ){
		
			if(allocationIsDone(annuBudgetAllocation.getOrganisation(), annuBudgetAllocation.getYear(), annuBudgetAllocation.getMonth())){
				addFieldError("annuBudgetAllocation.isDone", getMessage("fin.allocation.is.done.mesage"));
			}
			String[] values = finInputIdList.split(",");
			if(StringUtils.isNotEmpty(values[0])&& values.length>0){
				if(values.length==allFinInputsToAllocate(annuBudgetAllocation.getOrganisation(), annuBudgetAllocation.getYear(), annuBudgetAllocation.getMonth())){
					for (String sValue : values) {
						Long id = Long.valueOf(sValue);
						financialInputs.add(id);
					}
				}else {
					addFieldError("annuBudgetAllocation.toAllocate", getMessage("fin.allocation.fin.inputs.have.to.control"));
				}
			}else {
				addFieldError("annuBudgetAllocation.finTest", getMessage("fin.allocation.fin.inputs.are.empty"));
			}
		
		}
		if(!getFieldErrors().isEmpty()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		annuBudgetAllocation.setEmployee(employee);
		annuBudgetAllocation.setCreatedTime(new Date());
		
		double wood_sale=sumWoodSale(annuBudgetAllocation.getOrganisation(), annuBudgetAllocation.getYear(), annuBudgetAllocation.getMonth());
		annuBudgetAllocation.setWoodSales(wood_sale);
		double other_income=sumOtherIncome(annuBudgetAllocation.getOrganisation(), annuBudgetAllocation.getYear(), annuBudgetAllocation.getMonth());
		annuBudgetAllocation.setOtherIncome(other_income);
		
		double total=annuBudgetAllocation.getWoodSales()+annuBudgetAllocation.getOtherIncome();
		annuBudgetAllocation.setTotal(total);
		
		double total3683=total*0.3683;
		annuBudgetAllocation.setAllocation36(total3683);
		
		double municipality30=annuBudgetAllocation.getWoodSales()*0.3;
		annuBudgetAllocation.setMunicipality30Portion(municipality30);
		
		double kfaRemainder=total3683-municipality30;
		annuBudgetAllocation.setKfaRemainder(kfaRemainder);
		
		DAOFactory.getFactory().getAnnuBudgetAllocationDAO().save(annuBudgetAllocation);
		updateFinInput(financialInputs);
		return SUCCESS;
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
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	/**
	 * Gets the fin input id list.
	 *
	 * @return the fin input id list
	 */
	public String getFinInputIdList() {
		return finInputIdList;
	}
	
	/**
	 * Sets the fin input id list.
	 *
	 * @param finInputIdList the new fin input id list
	 */
	public void setFinInputIdList(String finInputIdList) {
		this.finInputIdList = finInputIdList;
	}
	
	

}
