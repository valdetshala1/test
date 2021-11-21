package com.geoland.kfis.persistence.base;

import java.util.Date;

import org.safehaus.uuid.UUIDGenerator;

// TODO: Auto-generated Javadoc
/**
 * The Class IdGenerator.
 */
public class IdGenerator {
	
	/** The Constant uuidGen. */
	public static final UUIDGenerator uuidGen = UUIDGenerator.getInstance();

	/**
	 * Creates the id.
	 *
	 * @return the string
	 */
	public static String createId() {
		org.safehaus.uuid.UUID uuid = uuidGen.generateRandomBasedUUID();
		return uuid.toString();
	}

	
	/**
	 * The main method.
	 *
	 * @param args the arguments
	 */
	public static void main(String[] args) {
		
		System.out.println(uuidGen.generateTimeBasedUUID(uuidGen.getDummyAddress()));
		System.out.println(uuidGen.generateTimeBasedUUID());
		long timestamp = java.util.UUID.fromString(uuidGen.generateTimeBasedUUID().toString()).timestamp();
		System.out.println(new Date(timestamp));
		
		System.out.println(new Date(java.util.UUID.fromString("2c30a3d7-c0dc-11e3-bd2a-171c8fa8f04b").timestamp()));
		System.out.println(new Date(java.util.UUID.fromString("2c307cc6-c0dc-11e3-bd2a-171c8fa8f04b").timestamp()));
		
		//Tue Feb 22 08:39:30 CET 4316850
		//Tue Feb 22 08:39:20 CET 4316850
	}
}
