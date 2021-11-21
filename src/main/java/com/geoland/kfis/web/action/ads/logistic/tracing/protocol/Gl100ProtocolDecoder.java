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
package com.geoland.kfis.web.action.ads.logistic.tracing.protocol;

import java.net.SocketAddress;
import java.util.regex.Pattern;
import org.jboss.netty.channel.Channel;

import com.geoland.kfis.model.Positions;
import com.geoland.kfis.web.action.ads.logistic.helper.DateBuilder;
import com.geoland.kfis.web.action.ads.logistic.helper.Parser;
import com.geoland.kfis.web.action.ads.logistic.helper.PatternBuilder;

// TODO: Auto-generated Javadoc
/**
 * The Class Gl100ProtocolDecoder.
 */
public class Gl100ProtocolDecoder  implements Protocol {

    /**
     * Instantiates a new gl 100 protocol decoder.
     */
    public Gl100ProtocolDecoder() {
    }

    /** The Constant PATTERN. */
    private static final Pattern PATTERN = new PatternBuilder()
            .text("+RESP:")
            .expression("GT...,")
            .number("(d{15}),")                  // imei
            .groupBegin()
            .number("d+,")                       // number
            .number("d,")                        // reserved / geofence id
            .number("d+")                        // reserved / geofence alert // battery
            .or()
            .number("[^,]*")                     // calling number
            .groupEnd(",")
            .expression("([01]),")               // gps fix
            .number("(d+.d),")                   // speed
            .number("(d+),")                     // course
            .number("(-?d+.d),")                 // altitude
            .number("d*,")                       // gps accuracy
            .number("(-?d+.d+),")                // longitude
            .number("(-?d+.d+),")                // latitude
            .number("(dddd)(dd)(dd)")            // date
            .number("(dd)(dd)(dd),")             // time
            .any()
            .compile();

    /* (non-Javadoc)
     * @see com.geoland.kfis.web.action.ads.logistic.tracing.protocol.Protocol#decode(org.jboss.netty.channel.Channel, java.net.SocketAddress, java.lang.Object)
     */
    @Override
	public Object decode(Channel channel, SocketAddress remoteAddress, Object msg) throws Exception {

        String sentence = (String) msg;

        if (sentence.contains("AT+GTHBD=") && channel != null) {
            String response = "+RESP:GTHBD,GPRS ACTIVE,";
            response += sentence.substring(9, sentence.lastIndexOf(','));
            response += '\0';
            channel.write(response); // heartbeat response
        }

        Parser parser = new Parser(PATTERN, sentence);
        if (!parser.matches()) {
            return null;
        }

        Positions position = new Positions();
        position.setProtocol("gl100");

//        if (!identify(parser.next(), channel, remoteAddress)) {
//            return null;
//        }
//        position.setDeviceId(getDeviceId());

        position.setValid(parser.nextLong() == 0);
        position.setSpeed(parser.nextDouble());
        position.setCourse(parser.nextDouble());
        position.setAltitude(parser.nextDouble());
        position.setLongitude(parser.nextDouble());
        position.setLatitude(parser.nextDouble());
        
//        DateBuilder dateBuilder = new DateBuilder()
//        .setDate(parser.nextInt(), parser.nextInt(), parser.nextInt())
//        .setTime(parser.nextInt(), parser.nextInt(), parser.nextInt());

        DateBuilder dateBuilder = new DateBuilder()
                .setDate((int)parser.nextDouble(),(int)parser.nextDouble(), (int)parser.nextDouble())
                .setTime((int)parser.nextDouble(), (int)parser.nextDouble(),(int)parser.nextDouble());
        
        
        position.setDevicetime(dateBuilder.getDate());
        position.setFixtime(dateBuilder.getDate());

        return position;
    }

}
