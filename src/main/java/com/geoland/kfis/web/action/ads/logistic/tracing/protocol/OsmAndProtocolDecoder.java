/*
 * Copyright 2013 - 2016 Anton Tananaev (anton.tananaev@gmail.com)
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
package com.geoland.kfis.web.action.ads.logistic.tracing.protocol;

import java.net.SocketAddress;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelFutureListener;
import org.jboss.netty.handler.codec.http.DefaultHttpResponse;
import org.jboss.netty.handler.codec.http.HttpRequest;
import org.jboss.netty.handler.codec.http.HttpResponse;
import org.jboss.netty.handler.codec.http.HttpResponseStatus;
import org.jboss.netty.handler.codec.http.HttpVersion;
import org.jboss.netty.handler.codec.http.QueryStringDecoder;
import org.joda.time.format.ISODateTimeFormat;

import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.Positions;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class OsmAndProtocolDecoder.
 */
public class OsmAndProtocolDecoder  implements Protocol{

    /**
     * Instantiates a new osm and protocol decoder.
     */
    public OsmAndProtocolDecoder() {
//        super(protocol);
    }


    /* (non-Javadoc)
     * @see com.geoland.kfis.web.action.ads.logistic.tracing.protocol.Protocol#decode(org.jboss.netty.channel.Channel, java.net.SocketAddress, java.lang.Object)
     */
    public Object decode( Channel channel, SocketAddress remoteAddress, Object msg) throws Exception {
 
        HttpRequest request = (HttpRequest) msg;
        QueryStringDecoder decoder = new QueryStringDecoder(request.getUri());
        Map<String, List<String>> params = decoder.getParameters();
        if (params.isEmpty()) {
            decoder = new QueryStringDecoder(
                    request.getContent().toString(Charset.defaultCharset()), false);
            params = decoder.getParameters();
        }

        Positions position = new Positions();
        position.setProtocol("osmand");
        position.setValid(true);

        for (Map.Entry<String, List<String>> entry : params.entrySet()) {
            String value = entry.getValue().get(0);
            switch (entry.getKey()) {
                case "id":
                case "deviceid":
//                    if (!identify(value, channel, remoteAddress)) {
//                        return null;
//                    }
                
                    break;
                case "valid":
                    position.setValid(Boolean.parseBoolean(value));
                    break;
                case "timestamp":
                    try {
                        long timestamp = Long.parseLong(value);
                        if (timestamp < Integer.MAX_VALUE) {
                            timestamp *= 1000;
                        }
                        position.setFixtime(new Date(timestamp));
                    } catch (NumberFormatException error) {
                        if (value.contains("T")) {
//                            position.setFixtime(new Date(
//                                    ISODateTimeFormat.dateTimeParser().parseMillis(value)));
                        	position.setFixtime(new Date());
                        } else {
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            position.setFixtime(dateFormat.parse(value));
                        }
                    }
                    break;
                case "devicetime":
                    try {
                        long devicetime = Long.parseLong(value);
                        if (devicetime < Integer.MAX_VALUE) {
                        	devicetime *= 1000;
                        }
                        position.setDevicetime(new Date(devicetime));
                    } catch (NumberFormatException error) {
                        if (value.contains("T")) {
//                            position.setFixtime(new Date(
//                                    ISODateTimeFormat.dateTimeParser().parseMillis(value)));
                        	position.setFixtime(new Date());
                        } else {
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            position.setDevicetime(dateFormat.parse(value));
                        }
                    }
                    break;
                case "lat":
                    position.setLatitude(Double.parseDouble(value));
                    break;
                case "lon":
                    position.setLongitude(Double.parseDouble(value));
                    break;
                case "speed":
                    position.setSpeed(Double.parseDouble(value));
                    break;
                case "bearing":
                case "heading":
                    position.setCourse(Double.parseDouble(value));
                    break;
                case "altitude":
                    position.setAltitude(Double.parseDouble(value));
                    break;
                case "cours":
                    position.setCourse(Double.parseDouble(value));
                    break;
                case "hdop":
//                    position.set(Event.KEY_HDOP, Double.parseDouble(value));
                    break;
                case "batt":
//                    position.set(Event.KEY_BATTERY, value);
                    break;
                default:
//                    position.set(entry.getKey(), value);
                    break;
            }
        }

        if (position.getFixtime() == null) {
//            position.setTime(new Date());
        }

        if (channel != null) {
            HttpResponse response = new DefaultHttpResponse(
                    HttpVersion.HTTP_1_1, HttpResponseStatus.OK);
            channel.write(response).addListener(ChannelFutureListener.CLOSE);
        }

        return position;
    }

}
