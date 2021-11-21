package com.geoland.kfis.persistence.base;

import java.sql.Types;

import org.hibernate.spatial.dialect.postgis.PostgisDialect;

// TODO: Auto-generated Javadoc
/**
 * The Class PostgreSQLDialectUuid.
 */
public class PostgreSQLDialectUuid extends PostgisDialect {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1173935345587505641L;

	/**
	 * Instantiates a new postgre SQL dialect uuid.
	 */
	public PostgreSQLDialectUuid() {
		super();
		registerColumnType(Types.OTHER, "uuid");
	}

}
