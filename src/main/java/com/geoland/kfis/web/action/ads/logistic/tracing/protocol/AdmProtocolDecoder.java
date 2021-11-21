/*
 * Copyright 2012 Anton Tananaev (anton.tananaev@gmail.com)
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
import java.util.Date;

import org.apache.lucene.util.BitUtil;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.channel.Channel;

import com.geoland.kfis.model.Positions;
import com.geoland.kfis.web.action.ads.logistic.helper.UnitsConverter;
import com.geoland.kfis.web.action.ads.logistic.tracing.BaseProtocolDecoder;

// TODO: Auto-generated Javadoc
/**
 * The Class AdmProtocolDecoder.
 */
public class AdmProtocolDecoder implements Protocol {

    /**
     * Instantiates a new adm protocol decoder.
     */
    public AdmProtocolDecoder() {
    }

    /** The Constant MSG_IMEI. */
    public static final int MSG_IMEI = 0x03;
    
    /** The Constant MSG_PHOTO. */
    public static final int MSG_PHOTO = 0x0A;
    
    /** The Constant MSG_ADM5. */
    public static final int MSG_ADM5 = 0x01;

    /* (non-Javadoc)
     * @see com.geoland.kfis.web.action.ads.logistic.tracing.protocol.Protocol#decode(org.jboss.netty.channel.Channel, java.net.SocketAddress, java.lang.Object)
     */
    @Override
	public Object decode(
            Channel channel, SocketAddress remoteAddress, Object msg) throws Exception {

        ChannelBuffer buf = (ChannelBuffer) msg;

        buf.readUnsignedShort(); // device id
        buf.readUnsignedByte(); // length

        int type = buf.readUnsignedByte();

//        if (type == MSG_IMEI) {
//            identify(buf.toString(buf.readerIndex(), 15, Charset.defaultCharset()), channel, remoteAddress);
//        }

            Positions position = new Positions();
            position.setProtocol("adm");

            buf.readUnsignedByte(); // firmware version
            buf.readUnsignedShort(); // index

//            position.set(Event.KEY_STATUS, buf.readUnsignedShort());

            position.setValid(true);
            position.setLatitude((double) buf.readFloat());
            position.setLongitude((double) buf.readFloat());
            position.setCourse(buf.readUnsignedShort() * 0.1);
            position.setSpeed(UnitsConverter.knotsFromKph(buf.readUnsignedShort() * 0.1));

            buf.readUnsignedByte(); // acceleration

            position.setAltitude((double) buf.readUnsignedShort());

//            position.set(Event.KEY_HDOP, buf.readUnsignedByte() * 0.1);
//            position.set(Event.KEY_SATELLITES, buf.readUnsignedByte() & 0x0f);

            position.setDevicetime(new Date(buf.readUnsignedInt() * 1000));

//            position.set(Event.KEY_POWER, buf.readUnsignedShort());
//            position.set(Event.KEY_BATTERY, buf.readUnsignedShort());

//            if (BitUtil.check(type, 2)) {
//                buf.skipBytes(4);
//            }
//
//            if (BitUtil.check(type, 3)) {
//                buf.skipBytes(12);
//            }
//
//            if (BitUtil.check(type, 4)) {
//                buf.skipBytes(8);
//            }
//
//            if (BitUtil.check(type, 5)) {
//                buf.skipBytes(9);
//            }
//
//            if (BitUtil.check(type, 6)) {
//                buf.skipBytes(buf.getUnsignedByte(buf.readerIndex()));
//            }
//
//            if (BitUtil.check(type, 7)) {
//                position.set(Event.KEY_ODOMETER, buf.readUnsignedInt());
//            }

            return position;
    }

}
