/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 10:33:41 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.adm.person;

import java.util.List;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.model.Address;
import com.geoland.kfis.model.PartyRole;
import com.geoland.kfis.persistence.dao.DAOFactory;


/**
 * The Class PersonAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 10:33:41 AM
 * @Version 1.0
 */
public class PersonAction  extends PersonBaseAction{

/** The Constant serialVersionUID. */
private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		
		if(personId!=null){
			
			person=DAOFactory.getFactory().getPersonDAO().get(getPersonId());
			
			if(parentPersonId!=null){
				parentPerson=DAOFactory.getFactory().getPersonDAO().get(parentPersonId);
				person.setParty(parentPerson);
			}
			
			if(person.getAddress()!=null){
				List<Address> add=DAOFactory.getFactory().getAddressDAO().executeSQLQuery("select * from taddress as ad where ad.id="+person.getAddress().getId());
				address=add.get(0);
			}
			String query="select * from tparty_role where party_id="+personId;
			List<PartyRole> prList = DAOFactory.getFactory().getPartyRoleDAO().executeSQLQuery(query);
			if(prList.size()>0){
				partyRole = prList.get(0);
				codeRole = partyRole.getRoleCode().getDOMKEY();
			}else {
				codeRole="";
			}
			
			if(person.getPhoto()!=null) {
				photo=new String(Base64.encodeBase64(person.getPhoto()));
			}
		}
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 */
	public String list(){
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}

	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}	
	
}
