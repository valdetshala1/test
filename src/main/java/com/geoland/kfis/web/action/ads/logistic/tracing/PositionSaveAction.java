/**
 * 
 */
package com.geoland.kfis.web.action.ads.logistic.tracing;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.Positions;

// TODO: Auto-generated Javadoc
/**
 * The Class PositionSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Apr 1, 2016 , 3:56:44 PM
 * @Version 1.0
 */
public class PositionSaveAction  extends BaseProtocolDecoder{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Save position.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void savePosition() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		try{
			String device_uniqueId=request.getParameter("id");//unique id from device
			if(!StringUtils.isEmpty(device_uniqueId)){
				if(deviceExists(device_uniqueId)){
					Positions p=new Positions();
					if(!StringUtils.isEmpty(request.getParameter("timestamp"))){
						p.setFixtime(TIMESTAMP_FORMAT.parse(request.getParameter("timestamp")));
					}
					if(!StringUtils.isEmpty(request.getParameter("lat"))){
						p.setLatitude(new Double(request.getParameter("lat")));
					}
					if(!StringUtils.isEmpty(request.getParameter("lon"))){
						p.setLongitude(new Double(request.getParameter("lon")));
					}
					if(!StringUtils.isEmpty(request.getParameter("speed"))){
						p.setSpeed(new Double(request.getParameter("speed")));
					}
					//bearing ==??
//					if(!StringUtils.isEmpty(request.getParameter("bearing"))){
//						p.set(new Double(request.getParameter("bearing")));
//					}
					if(!StringUtils.isEmpty(request.getParameter("altitude"))){
						p.setAltitude(new Double(request.getParameter("altitude")));
					}
				
//					p.setDevices(getDeviceObjectByUniqueId(device_uniqueId));
				}
				
				
				
				
			}
		}catch (Exception e){
			log.error("PositionSaveAction.savePosition", e);
			throw new BusinessException("AdmGridAction.savePosition", e);
		}
		
		
	}
	
	
	
}
