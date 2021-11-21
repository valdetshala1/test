package com.geoland.kfis.persistence.dao;

import java.io.Serializable;

import com.geoland.kfis.persistence.base.Persistable;

// TODO: Auto-generated Javadoc
/**
 * The Interface GenericRepository.
 *
 * @param <Entity> the generic type
 */
public interface GenericRepository<Entity extends Persistable<?>> {
	
	/**
	 * Persist.
	 *
	 * @param e the e
	 */
	public void persist(Entity e);
	
	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the entity
	 */
	public Entity findById(Serializable id);
	
	/**
	 * Merge.
	 *
	 * @param t the t
	 */
	public void merge(Entity t);
	
	/**
	 * Removes the.
	 *
	 * @param id the id
	 */
	public void remove(Serializable id);
	
	/**
	 * Save or update.
	 *
	 * @param entity the entity
	 * @return the entity
	 */
	public Entity saveOrUpdate(Entity entity);
}