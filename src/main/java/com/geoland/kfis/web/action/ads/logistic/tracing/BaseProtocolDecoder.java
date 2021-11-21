/*
 * Copyright 2012 - 2015 Anton Tananaev (anton.tananaev@gmail.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.geoland.kfis.web.action.ads.logistic.tracing;

import java.nio.ByteOrder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.handler.codec.http.DefaultHttpRequest;
import org.jboss.netty.handler.codec.http.HttpMethod;
import org.jboss.netty.handler.codec.http.HttpVersion;
import org.junit.Assert;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.Positions;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.ads.logistic.tracing.protocol.AdmProtocolDecoder;
import com.geoland.kfis.web.action.ads.logistic.tracing.protocol.Gl100ProtocolDecoder;
import com.geoland.kfis.web.action.ads.logistic.tracing.protocol.OsmAndProtocolDecoder;
import com.geoland.kfis.web.action.ads.logistic.tracing.protocol.Protocol;
import com.geoland.kfis.web.action.base.BaseActionSupport;


// TODO: Auto-generated Javadoc
/**
 * The Class BaseProtocolDecoder.
 */
public  class BaseProtocolDecoder extends BaseActionSupport  {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The log. */
	protected Logger log = Logger.getLogger(BaseProtocolDecoder.class);
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/** The protocol type. */
	protected String protocolType;
	
	/**
	 * Instantiates a new base protocol decoder.
	 */
	public BaseProtocolDecoder(){
		
	}
	
	/**
	 * Instantiates a new base protocol decoder.
	 *
	 * @param protocol the protocol
	 */
	public BaseProtocolDecoder(String protocol){
		protocolType=protocol;
	}
    
    /**
     * Device exists.
     *
     * @param uniqueId the unique id
     * @return true, if successful
     */
    protected boolean deviceExists(String uniqueId){
    	String query="SELECT count(*) as device_num FROM tlog_devices where uniqueid ='"+uniqueId+"'";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlForDeviceNum=session.createSQLQuery(query);
		Object devNo=sqlForDeviceNum.uniqueResult();
    	if(devNo!=null && !StringUtils.isEmpty(devNo.toString())){
    		Long deviceNumber=(Long)devNo;
    		if(deviceNumber!=0){
    		return true;	
    		}
    	}
		
    	return false;
    }
    
    /**
     * Gets the device object by unique id.
     *
     * @param uniqueId the unique id
     * @return the device object by unique id
     */
    protected Devices getDeviceObjectByUniqueId(String uniqueId){
    	Devices device=null;
        String query="SELECT * FROM tlog_devices where uniqueid ='"+uniqueId+"'";
        List<Devices> deviceList=DAOFactory.getFactory().getDevicesDAO().executeSQLQuery(query);
        if(deviceList.size()>0){
        	   device=DAOFactory.getFactory().getDevicesDAO().executeSQLQuery(query).get(0);
        }
    	return device;
    }
    
    /**
     * Gets the protocol decoder.
     *
     * @param protocolName the protocol name
     * @return the protocol decoder
     */
    protected Object getProtocolDecoder(String protocolName){
    	Object object=null;
    	switch (protocolName){
    		case "osmand":
	    		object=new OsmAndProtocolDecoder();
	    		break;
    		case "adm":
    			object=new AdmProtocolDecoder();
    			break;
    		case "gl100":
    			object=new Gl100ProtocolDecoder();
    			break;
    		
    	}
    		
    	return object;
    }        
    
    /**
     * Save positions.
     *
     * @param protocolDecoder the protocol decoder
     * @param protocolType the protocol type
     * @param urlReq the url req
     * @throws Exception the exception
     */
    protected void savePositions(Protocol protocolDecoder , String protocolType , String urlReq) throws Exception{
    	switch (protocolType){
    		case "osmand":
				verifyDecodedPosition(protocolDecoder.decode(null, null, request("/?"+urlReq)), true, false, null,(long)1);
	    		break;
    		case "adm":
				 verifyDecodedPosition(protocolDecoder.decode(null, null, binary(ByteOrder.LITTLE_ENDIAN,
						 urlReq)), true, false, null,(long)1);
    		case "gl100":
				 verifyDecodedPosition(protocolDecoder.decode(null, null, text(urlReq)), true, false, null,(long)1);
    			break;
    		
    	}
    		
    }
    
	/**
	 * Verify decoded position.
	 *
	 * @param decodedObject the decoded object
	 * @param checkLocation the check location
	 * @param checkAttributes the check attributes
	 * @param expected the expected
	 * @param deviceId the device id
	 */
	private void verifyDecodedPosition(Object decodedObject, boolean checkLocation, boolean checkAttributes, Positions expected,Long deviceId) {

//      Assert.assertNotNull("position is null", decodedObject);
//      Assert.assertTrue("not a position", decodedObject instanceof Positions);
		if(decodedObject instanceof Positions){
      Positions position = (Positions) decodedObject;

      if (checkLocation) {

          if (expected != null) {

              if (expected.getFixtime() != null) {
                  Assert.assertEquals("time", expected.getFixtime(), position.getFixtime());
              }
//              Assert.assertEquals("valid", expected.getValid(), position.getValid());
              Assert.assertEquals("latitude", expected.getLatitude(), position.getLatitude(), 0.00001);
              Assert.assertEquals("longitude", expected.getLongitude(), position.getLongitude(), 0.00001);

          } else {

//              Assert.assertNotNull(position.getFixtime());
//              Assert.assertTrue("year > 2000", position.getFixtime().after(new Date(946684800000L)));
//              Assert.assertTrue("time < +25 hours",
//                      position.getFixtime().getTime() < System.currentTimeMillis() + 25 * 3600000);
//
//              Assert.assertTrue("latitude >= -90", position.getLatitude() >= -90);
//              Assert.assertTrue("latitude <= 90", position.getLatitude() <= 90);

          }

//          Assert.assertTrue("altitude >= -12262", position.getAltitude() >= -12262);
//          Assert.assertTrue("altitude <= 18000", position.getAltitude() <= 18000);
//
//          Assert.assertTrue("speed >= 0", position.getSpeed() >= 0);
//          Assert.assertTrue("speed <= 869", position.getSpeed() <= 869);
//
//          Assert.assertTrue("course >= 0", position.getCourse() >= 0);
//          Assert.assertTrue("course <= 360", position.getCourse() <= 360);
//
//          Assert.assertNotNull("protocol is null", position.getProtocol());
          if(position.getAttributes()==null)
          	position.setAttributes("test");
          
          if(position.getDevicetime()==null)
          	position.setDevicetime(new Date());
          
          if(position.getServertime()==null)
          	position.setServertime(new Date());
          if(position.getCourse()==null)
        	  position.setCourse(0.0);
        
          	Devices devices=DAOFactory.getFactory().getDevicesDAO().get(deviceId);
//      		position.setDevices(devices);
      	
	      	if(position.getFixtime()==null)
	      		position.setFixtime(new Date());
	      	
	          DAOFactory.getFactory().getPositionsDAO().save(position);

      	}
		}

  }

	/**
	 * Request.
	 *
	 * @param url the url
	 * @return the default http request
	 */
	protected DefaultHttpRequest request(String url) {
	    return request(HttpMethod.GET, url);
	}
	
	  /**
  	 * Request.
  	 *
  	 * @param method the method
  	 * @param url the url
  	 * @return the default http request
  	 */
  	protected DefaultHttpRequest request(HttpMethod method, String url) {
	      return new DefaultHttpRequest(HttpVersion.HTTP_1_1, method, url);
	  }
	  
	  /**
  	 * Binary.
  	 *
  	 * @param endianness the endianness
  	 * @param data the data
  	 * @return the channel buffer
  	 */
  	protected ChannelBuffer binary(ByteOrder endianness, String... data) {
	      return ChannelBuffers.wrappedBuffer(
	              endianness, DatatypeConverter.parseHexBinary(concatenateStrings(data)));
	  }
	  
	  /**
  	 * Concatenate strings.
  	 *
  	 * @param strings the strings
  	 * @return the string
  	 */
  	private String concatenateStrings(String... strings) {
	      StringBuilder builder = new StringBuilder();
	      for (String s : strings) {
	          builder.append(s);
	      }
	      return builder.toString();
	  }
	  
	  /**
  	 * Text.
  	 *
  	 * @param data the data
  	 * @return the string
  	 */
  	protected String text(String... data) {
	        return concatenateStrings(data);
	    }

    
    /**
     * Device protocol type.
     *
     * @param port the port
     * @return the name of protocol that device use
     */
    protected String deviceProtocolType(Long port){
    	String deviceProtType="";
    	switch (port.toString()){
    			case "5001":
    				deviceProtType="gps103";
    				break;
    			case "5002":
    				deviceProtType="tk103";
    				break;
    			case "5003":
    				deviceProtType="gl100";
    				break;
    			case "5004":
    				deviceProtType="gl200";
    				break;
    			case "5005":
    				deviceProtType="t55";
    				break;
    			case "5006":
    				deviceProtType="xexun";
    				break;
    			case "5007":
    				deviceProtType="totem";
    				break;
    			case "5008":
    				deviceProtType="enfora";
    				break;
    			case "5009":
    				deviceProtType="meiligao";
    				break;
    			case "5010":
    				deviceProtType="trv";
    				break;
    			case "5011":
    				deviceProtType="suntech";
    				break;
    			case "5012":
    				deviceProtType="progress";
    				break;
    			case "5013":
    				deviceProtType="h02";
    				break;
    			case "5014":
    				deviceProtType="jt600";
    				break;
    			case "5015":
    				deviceProtType="huabao";
    				break;
    			case "5016":
    				deviceProtType="v680";
    				break;
    			case "5017":
    				deviceProtType="pt502";
    				break;
    			case "5018":
    				deviceProtType="tr20";
    				break;
    			case "5019":
    				deviceProtType="navis";
    				break;
    			case "5020":
    				deviceProtType="meitrack";
    				break;
    			case "5021":
    				deviceProtType="skypatrol";
    				break;
    			case "5022":
    				deviceProtType="gt02";
    				break;
    			case "5023":
    				deviceProtType="gt06";
    				break;
    			case "5024":
    				deviceProtType="megastek";
    				break;
    			case "5025":
    				deviceProtType="navigil";
    				break;
    			case "5026":
    				deviceProtType="gpsgate";
    				break;
    			case "5027":
    				deviceProtType="teltonika";
    				break;
    			case "5028":
    				deviceProtType="mta6";
    				break;
    			case "5029":
    				deviceProtType="tzone";
    				break;
    			case "5030":
    				deviceProtType="tlt2h";
    				break;
    			case "5031":
    				deviceProtType="taip";
    				break;
    			case "5032":
    				deviceProtType="wondex";
    				break;
    			case "5033":
    				deviceProtType="cellocator";
    				break;
    			case "5034":
    				deviceProtType="galileo";
    				break;
    			case "5035":
    				deviceProtType="ywt";
    				break;
    			case "5036":
    				deviceProtType="tk102";
    				break;
    			case "5037":
    				deviceProtType="intellitrac";
    				break;
    			case "5038":
    				deviceProtType="gpsmta";
    				break;
    			case "5039":
    				deviceProtType="wialon";
    				break;
    			case "5040":
    				deviceProtType="carscop";
    				break;
    			case "5041":
    				deviceProtType="apel";
    				break;
    			case "5042":
    				deviceProtType="manpower";
    				break;
    			case "5043":
    				deviceProtType="globalsat";
    				break;
    			case "5044":
    				deviceProtType="atrack";
    				break;
    			case "5045":
    				deviceProtType="pt3000";
    				break;
    			case "5046":
    				deviceProtType="ruptela";
    				break;
    			case "5047":
    				deviceProtType="topflytech";
    				break;
    			case "5048":
    				deviceProtType="laipac";
    				break;
    			case "5049":
    				deviceProtType="aplicom";
    				break;
    			case "5050":
    				deviceProtType="gotop";
    				break;
    			case "5051":
    				deviceProtType="sanav";
    				break;
    			case "5052":
    				deviceProtType="gator";
    				break;
    			case "5053":
    				deviceProtType="noran";
    				break;
    			case "5054":
    				deviceProtType="m2m";
    				break;
    			case "88":
    				deviceProtType="osmand";
    				break;
    			case "5056":
    				deviceProtType="easytrack";
    				break;
    			case "5057":
    				deviceProtType="gpsmarker";
    				break;
    			case "5058":
    				deviceProtType="khd";
    				break;
    			case "5059":
    				deviceProtType="piligrim";
    				break;
    			case "5060":
    				deviceProtType="stl060";
    				break;
    			case "5061":
    				deviceProtType="cartrack";
    				break;
    			case "5062":
    				deviceProtType="minifinder";
    				break;
    			case "5063":
    				deviceProtType="haicom";
    				break;
    			case "5064":
    				deviceProtType="eelink";
    				break;
    			case "5065":
    				deviceProtType="box";
    				break;
    			case "5066":
    				deviceProtType="freedom";
    				break;
    			case "5067":
    				deviceProtType="telic";
    				break;
    			case "5068":
    				deviceProtType="trackbox";
    				break;
    			case "5069":
    				deviceProtType="visiontek";
    				break;
    			case "5070":
    				deviceProtType="orion";
    				break;
    			case "5071":
    				deviceProtType="riti";
    				break;
    			case "5072":
    				deviceProtType="ulbotech";
    				break;
    			case "5073":
    				deviceProtType="tramigo";
    				break;
    			case "5074":
    				deviceProtType="tr900";
    				break;
    			case "5075":
    				deviceProtType="ardi01";
    				break;
    			case "5076":
    				deviceProtType="xt013";
    				break;
    			case "5077":
    				deviceProtType="autofon";
    				break;
    			case "5078":
    				deviceProtType="gosafe";
    				break;
    			case "5079":
    				deviceProtType="tt8850";
    				break;
    			case "5080":
    				deviceProtType="bce";
    				break;
    			case "5081":
    				deviceProtType="xirgo";
    				break;
    			case "5082":
    				deviceProtType="calamp";
    				break;
    			case "5083":
    				deviceProtType="mtx";
    				break;
    			case "5084":
    				deviceProtType="tytan";
    				break;
    			case "5085":
    				deviceProtType="avl301";
    				break;
    			case "5087":
    				deviceProtType="mxt";
    				break;
    			case "5088":
    				deviceProtType="cityeasy";
    				break;
    			case "5089":
    				deviceProtType="aquila";
    				break;
    			case "5090":
    				deviceProtType="flextrack";
    				break;
    			case "5091":
    				deviceProtType="blackkite";
    				break;
    			case "5092":
    				deviceProtType="adm";
    				break;
    			case "5093":
    				deviceProtType="watch";
    				break;
    			case "5094":
    				deviceProtType="t800x";
    				break;
    			case "5095":
    				deviceProtType="upro";
    				break;
    			case "5096":
    				deviceProtType="auro";
    				break;
    			case "5097":
    				deviceProtType="disha";
    				break;
    			case "5098":
    				deviceProtType="thinkrace";
    				break;
    			case "5099":
    				deviceProtType="pathaway";
    				break;
    			case "5100":
    				deviceProtType="arnavi";
    				break;
    			case "5101":
    				deviceProtType="nvs";
    				break;
    			case "5102":
    				deviceProtType="kenji";
    				break;
    			case "5104":
    				deviceProtType="homtecs";
    				break;
    			case "5105":
    				deviceProtType="fox";
    				break;
    			case "5106":
    				deviceProtType="gnx";
    				break;
    			case "5107":
    				deviceProtType="arknav";
    				break;
    	}
    	
    	
    	return  deviceProtType;
    }
    
    
  
}
