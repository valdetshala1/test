/**
 * 
 */
package com.geoland.kfis.web.action.ads.logistic.tracing;

import java.nio.ByteOrder;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.struts2.ServletActionContext;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.handler.codec.http.DefaultHttpRequest;
import org.jboss.netty.handler.codec.http.HttpMethod;
import org.jboss.netty.handler.codec.http.HttpVersion;
import org.junit.Assert;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.Positions;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.ads.logistic.tracing.protocol.Protocol;

// TODO: Auto-generated Javadoc
/**
 * The Class TracPositionSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Jul 12, 2016 , 10:58:50 AM
 * @Version 1.0
 */
public class TracPositionSaveAction  extends BaseProtocolDecoder{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The decoder. */
	private Protocol decoder;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();		
		try{
			Long portNr=(long) request.getLocalPort();
			String protocolType=deviceProtocolType(portNr);
			Protocol protocolDecoder=(Protocol) getProtocolDecoder(protocolType);
				if(protocolDecoder!=null){
//					decoder=new OsmAndProtocolDecoder();
//					verifyDecodedPosition(protocolDecoder.decode(null, null, request("/?"+request.getQueryString())), true, false, null,,(long)2);
//					 verifyPosition(protocolDecoder, binary(ByteOrder.LITTLE_ENDIAN,
//				                "01002680336510002062A34C423DCF8E42A50B1700005801140767E30F568F2534107D220000"));
//					 verifyDecodedPosition(protocolDecoder.decode(null, null, binary(ByteOrder.LITTLE_ENDIAN,
//				                request.getQueryString())), true, false, null,(long)2);
					savePositions(protocolDecoder, protocolType, request.getQueryString());
			
				}
			
//			if(request.getLocalPort()==8085){
//				decoder=new OsmAndProtocolDecoder();
//				verifyDecodedPosition(decoder.decode(null, null, request("/?"+request.getQueryString()),(long)2), true, false, null);
//		
//			}

		}catch (Exception e){
			log.error("PositionSaveAction.savePosition", e);
			throw new BusinessException("AdmGridAction.savePosition", e);
		}
		
		return NONE;
	}
	

	
	
}
