/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.input;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.FinancialInput;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class FinancialInputAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 3, 2014, 1:43:21 PM
 */
public class FinancialInputAction extends FinancialInputBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3973438456242160611L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(finInputId!=null){
			FinancialInput fi=DAOFactory.getFactory().getFinancialInputDAO().get(finInputId);
			setFinInput(fi);
			setStatus(fi.getFinInputStatus());
			checkStatus(finInput);
		}
		if(getUser().getOperationalLevelVal().equals('M')){
			if(finInput==null){
				setFinInput(new FinancialInput());
				finInput.setOrganisation(getUser().getOrganisation());
			}
			munReadOnly=true;
		}
		return "form";
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
	 * Report popup.
	 *
	 * @return the string
	 */
	public String reportPopup(){
		String sql="select id from torganisation where orga_name='APK'";
	    Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
	    SQLQuery query=session.createSQLQuery(sql);
	    query.addScalar("id", LongType.INSTANCE);
	    List list=query.list();
	    if(list!=null && list.size()>0)
	    	apkId=(Long)query.list().get(0);
		return "reportPopup";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		if(getUser().getOperationalLevelVal()!=null && 
				getUser().getOperationalLevelVal().equals('M')){
			if(finInput==null){
				setFinInput(new FinancialInput());
				finInput.setOrganisation(getUser().getOrganisation());
			}
			munReadOnly=true;
		}
		return "page";
	}
	
	/**
	 * Status popup.
	 *
	 * @return the string
	 */
	public String statusPopup(){
		if(finInputId!=null){
			if(finInput==null)
				setFinInput(new FinancialInput());
			finInput.setId(finInputId);
		}
		Character opl = getUser().getOperationalLevelVal();
		if(opl=='R'){
			regStatus=true;
		}else{
			regStatus=false;
		}
		return "status_popup";
	}
}
