package com.geoland.kfis.persistence.base;

import java.util.UUID;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

// TODO: Auto-generated Javadoc
/**
 * The Class UuidBasedEntity.
 */
@MappedSuperclass
public abstract class UuidBasedEntity extends Persistable<UUID> {

	/** The id. */
	@Id
	private UUID id;

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.base.Persistable#getId()
	 */
	@Override
	public UUID getId() {
		return id;
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.base.Persistable#setId(java.io.Serializable)
	 */
	@Override
	public void setId(UUID id) {
		this.id = id;
	}
}
