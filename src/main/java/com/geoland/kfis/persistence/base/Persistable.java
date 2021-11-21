package com.geoland.kfis.persistence.base;

import java.io.Serializable;

// TODO: Auto-generated Javadoc
/**
 * Absolute base class for persistable classes.
 * Contract forces get and set methods for id.
 *
 * @author Bekim Bajraktari
 * @param <KeyType> the generic type
 */
public abstract class Persistable<KeyType extends Serializable> {
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public abstract KeyType getId();
 
	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public abstract void setId(KeyType id);
}
