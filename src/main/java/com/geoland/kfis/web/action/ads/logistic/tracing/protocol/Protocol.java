package com.geoland.kfis.web.action.ads.logistic.tracing.protocol;

import java.net.SocketAddress;

import org.jboss.netty.channel.Channel;

// TODO: Auto-generated Javadoc
/**
 * The Interface Protocol.
 */
public interface Protocol {
	 
 	/**
 	 * Decode.
 	 *
 	 * @param channel the channel
 	 * @param remoteAddress the remote address
 	 * @param msg the msg
 	 * @return the object
 	 * @throws Exception the exception
 	 */
 	Object decode( Channel channel, SocketAddress remoteAddress, Object msg) throws Exception ;
}
