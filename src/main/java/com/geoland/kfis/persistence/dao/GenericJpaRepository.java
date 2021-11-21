package com.geoland.kfis.persistence.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.geoland.kfis.persistence.base.Persistable;

// TODO: Auto-generated Javadoc
/**
 * http://www.famvdploeg.com/blog/2013/06/jpa-with-uuid/
 * http://simononsoftware.com/how-to-store-uuids-in-postgresql/
 *
 * @author Admin
 * @param <Entity> the generic type
 */
public class GenericJpaRepository<Entity extends Persistable<?>> implements GenericRepository<Entity> {
	
	/** The em. */
	@PersistenceContext
	protected EntityManager em;

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.GenericRepository#persist(com.geoland.kfis.persistence.base.Persistable)
	 */
	@Override
	public void persist(Entity e) {
		em.persist(e);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.GenericRepository#findById(java.io.Serializable)
	 */
	@Override
	public Entity findById(Serializable id) {
		return em.find(returnEntityClass(), id);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.GenericRepository#merge(com.geoland.kfis.persistence.base.Persistable)
	 */
	@Override
	public void merge(Entity t) {
		em.merge(t);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.GenericRepository#remove(java.io.Serializable)
	 */
	@Override
	public void remove(Serializable id) {
		em.remove(findById(id));
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.GenericRepository#saveOrUpdate(com.geoland.kfis.persistence.base.Persistable)
	 */
	@Override
	public Entity saveOrUpdate(Entity entity) {
		if (entity.getId() == null) {
			em.persist(entity);
			return entity;
		} else {
			return em.merge(entity);
		}
	}
	 
	/**
	 * Find all.
	 *
	 * @return the list
	 */
	protected List<Entity> findAll() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Entity> cq = cb.createQuery(returnEntityClass());
		return em.createQuery(cq).getResultList();
	}
 
	/**
	 * Find by property.
	 *
	 * @param property the property
	 * @param value the value
	 * @return the entity
	 */
	protected Entity findByProperty(String property, Object value) {
		try {
			return em.createQuery(createQueryByProperty(property, value)).getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}
 
	/**
	 * Find all by property.
	 *
	 * @param property the property
	 * @param value the value
	 * @return the list
	 */
	protected List<Entity> findAllByProperty(String property, Object value) {
		return em.createQuery(createQueryByProperty(property, value)).getResultList();
	}
 
	/**
	 * Find by properties.
	 *
	 * @param properties the properties
	 * @return the entity
	 */
	protected Entity findByProperties(Map<String, Object> properties) {
		try {
			return em.createQuery(createQueryByProperties(properties)).getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}
 
	/**
	 * Find all by properties.
	 *
	 * @param properties the properties
	 * @return the list
	 */
	protected List<Entity> findAllByProperties(Map<String, Object> properties) {
		return em.createQuery(createQueryByProperties(properties)).getResultList();
	}
 
	/**
	 * Return entity class.
	 *
	 * @return the class
	 */
	@SuppressWarnings("unchecked")
	public Class<Entity> returnEntityClass() {
		ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
		return (Class<Entity>) genericSuperclass.getActualTypeArguments()[0];
	}
 
	/**
	 * Creates the query by property.
	 *
	 * @param property the property
	 * @param value the value
	 * @return the criteria query
	 */
	private CriteriaQuery<Entity> createQueryByProperty(String property, Object value) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Entity> cq = cb.createQuery(returnEntityClass());
		Root<Entity> root = cq.from(returnEntityClass());
		cq = cq.where(cb.equal(root.get(property), value));
		return cq;
	}
 
	/**
	 * Creates the query by properties.
	 *
	 * @param properties the properties
	 * @return the criteria query
	 */
	private CriteriaQuery<Entity> createQueryByProperties(Map<String, Object> properties) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Entity> cq = cb.createQuery(returnEntityClass());
		Root<Entity> root = cq.from(returnEntityClass());
		for (Entry<String, Object> entry : properties.entrySet()) {
			cq = cq.where(cb.equal(root.get(entry.getKey()), entry.getValue()));
		}
		return cq;
	}
	
	
}
