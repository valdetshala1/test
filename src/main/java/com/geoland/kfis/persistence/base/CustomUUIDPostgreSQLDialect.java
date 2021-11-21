package com.geoland.kfis.persistence.base;

import java.sql.Types;

import org.hibernate.dialect.PostgreSQL82Dialect;

// TODO: Auto-generated Javadoc
/**
 * The Class CustomUUIDPostgreSQLDialect.
 */
public class CustomUUIDPostgreSQLDialect extends PostgreSQL82Dialect{
	
	/**
	 * Instantiates a new custom UUID postgre SQL dialect.
	 */
	public CustomUUIDPostgreSQLDialect() {
		 super();
		 registerColumnType(Types.OTHER, "uuid");
		 registerHibernateType(Types.OTHER, "string");
	 }
}
