package com.geoland.kfis.web.action.dem.importshape.line;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Roadtype;

// TODO: Auto-generated Javadoc
/**
 * The Class LineAction.
 */
public class LineAction  extends LineBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Form content.
	 *
	 * @return the string
	 */
	public String form_content(){
		if(lineTempId!=null){
			linetemp=DAOFactory.getFactory().getLineTempDAO().get(lineTempId);
			String language = getLocale().getLanguage().toLowerCase();
			if(linetemp.getLtheme12()!=null && Roadtype.getDomain(linetemp.getLtheme12())!=null){
	//			if("en".equals(language))
					roadTypeName=Roadtype.getDomain(linetemp.getLtheme12());
	//			else if("sr".equals(language))
	//				mngmclassName=Mngmclass.getDomain(linetemp.getLtheme12()).getDOMTEXT_SR();
	//			else mngmclassName=Mngmclass.getDomain(linetemp.getLtheme12()).getDOMTEXT();
			}
		}
		return "form_content";
	}

}
