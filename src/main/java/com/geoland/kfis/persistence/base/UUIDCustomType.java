package com.geoland.kfis.persistence.base;

import java.io.IOException;
import java.util.Properties;

import org.hibernate.type.AbstractSingleColumnStandardBasicType;
import org.hibernate.type.PostgresUUIDType;
import org.hibernate.type.descriptor.java.JavaTypeDescriptor;
import org.hibernate.type.descriptor.java.UUIDTypeDescriptor;
import org.hibernate.type.descriptor.sql.SqlTypeDescriptor;
import org.hibernate.type.descriptor.sql.VarcharTypeDescriptor;

// TODO: Auto-generated Javadoc
/**
 * The Class UUIDCustomType.
 */
@SuppressWarnings("rawtypes")
public class UUIDCustomType extends AbstractSingleColumnStandardBasicType {
	 
    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = 902830399800029445L;
 
    /** The Constant SQL_DESCRIPTOR. */
    private static final SqlTypeDescriptor SQL_DESCRIPTOR;
    
    /** The Constant TYPE_DESCRIPTOR. */
    private static final JavaTypeDescriptor TYPE_DESCRIPTOR;
 
    static {
        Properties properties = new Properties();
        try {
            ClassLoader loader = Thread.currentThread().getContextClassLoader();
            properties.load(loader.getResourceAsStream("database.properties"));
        } catch (IOException e) {
            throw new RuntimeException("Could not load properties!", e);
        }
 
        String dialect = properties.getProperty("dialect");
        if(dialect.equals("org.hibernate.dialect.PostgreSQLDialect")) {
            SQL_DESCRIPTOR = PostgresUUIDType.PostgresUUIDSqlTypeDescriptor.INSTANCE;
        } else if(dialect.equals("org.hibernate.dialect.H2Dialect")) {
            SQL_DESCRIPTOR = VarcharTypeDescriptor.INSTANCE;
        } else {
            throw new UnsupportedOperationException("Unsupported database!");
        }
 
        TYPE_DESCRIPTOR = UUIDTypeDescriptor.INSTANCE;
    }
 
    /**
     * Instantiates a new UUID custom type.
     */
    @SuppressWarnings("unchecked")
	public UUIDCustomType() {
        super(SQL_DESCRIPTOR, TYPE_DESCRIPTOR);
    }
 
    /* (non-Javadoc)
     * @see org.hibernate.type.Type#getName()
     */
    @Override
    public String getName() {
        return "uuid-custom";
    }
 
}