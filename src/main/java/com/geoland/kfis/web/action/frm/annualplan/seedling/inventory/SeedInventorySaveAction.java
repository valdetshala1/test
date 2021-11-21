package com.geoland.kfis.web.action.frm.annualplan.seedling.inventory;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
import com.ibm.icu.util.Calendar;

// TODO: Auto-generated Javadoc
/**
 * The Class SeedInventorySaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 6, 2015 , 11:08:30 AM
 */
public class SeedInventorySaveAction extends SeedInventoryBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person = getUser().getPerson();
		if(seedFromAnother || seedFromFrIns){
				
			if(seedlingInventory!=null && seedlingInventory.getStock()==null)
				addFieldError("seedlingInventory.stock", getMessage("seedlingInventory.stock.empty"));
			
			if(seedFromFrIns){
					if(seedlingInventory!=null && seedlingInventory.getSeedActivity().getId()==null) 
						addFieldError("seedlingInventory.seedActivity", getMessage("seedlingInventory.seedActivity.empty"));
					else {
						seedActivity=DAOFactory.getFactory().getSeedActivityDAO().get(seedlingInventory.getSeedActivity().getId());
						seedlingInventory.setProdType(seedActivity.getProdType());
						seedlingInventory.setTreeSpecies(seedActivity.getTreeSpecies());
						seedlingInventory.setSeedYear((long)seedActivity.getActivity().getAnnualPlanning().getYear());
						Short planedYear=seedActivity.getActivity().getAnnualPlanning().getYear();
						Short actualDate=(short) Calendar.getInstance().get(Calendar.YEAR);
						Short seedAge=(short) (actualDate-planedYear);
						seedlingInventory.setAge(seedAge);
						if(seedlingInventory.getStock()!=null){
							if(seedlingInventory.getStock().longValue()>seedActivity.getImValue()){
								addFieldError("seedlingInventory.stock", getMessage("seedlingInventory.stock.is.bigger"));
							}
						}
					}	
			}else{
				
				seedlingInventory.setSeedActivity(null);
				
				if(seedlingInventory!=null && seedlingInventory.getTreeSpecies().getId()==null) 
					addFieldError("seedlingInventory.treeSpecies", getMessage("seedlingInventory.treeSpecies.empty"));
				else{
					seedlingInventory.setTreeSpecies(DAOFactory.getFactory().getTreeSpeciesDAO().get(seedlingInventory.getTreeSpecies().getId()));
				}
				if(seedlingInventory!=null && seedlingInventory.getProdType()==null)
					addFieldError("seedlingInventory.prodType", getMessage("seedlingInventory.prodType.empty"));
				
			}
			if(seedlingInventory!=null && seedlingInventory.getSeedYear()==null)
				addFieldError("seedlingInventory.seedYear", getMessage("annual.planning.year.empty"));
			else {
				Long currentYear=new Long(Calendar.getInstance().get(Calendar.YEAR));
				seedlingInventory.setAge(new Short((int)(currentYear-seedlingInventory.getSeedYear())+""));
			}
		}else {
			addFieldError("seedlingInventory.form", getMessage("seedlingInventory.please.choose.one"));
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
		User user = getUser().getUser();
		
		if(seedActivity!=null && seedActivity.getId()!=null){
			seedActivity.setWorkStage("D");
			seedActivity.setCurrentUser(user);
			DAOFactory.getFactory().getSeedActivityDAO().save(seedActivity);
		}
		if(seedlingInventory.getId()==null){
			seedlingInventory.setPersonByCreatedBy(person);
			seedlingInventory.setCreatedDate(new Date());
			seedlingInventory.setPersonByChangedBy(null);
		}else{
			seedlingInventory.setPersonByChangedBy(person);
			seedlingInventory.setChangedDate(new Date());
		}
		seedlingInventory.setCurrentUser(user);
		DAOFactory.getFactory().getSeedlingInventoryDAO().save(seedlingInventory);
		
		return SUCCESS;
	}	
	

}
