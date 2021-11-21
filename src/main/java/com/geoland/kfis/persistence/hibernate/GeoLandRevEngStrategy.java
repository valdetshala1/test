package com.geoland.kfis.persistence.hibernate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.cfg.reveng.AssociationInfo;
import org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.ReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.TableIdentifier;
import org.hibernate.mapping.ForeignKey;
import org.hibernate.mapping.MetaAttribute;

// TODO: Auto-generated Javadoc
/**
 * The Class GeoLandRevEngStrategy.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created January 7, 2014 3:06:01 PM
 * @Version 1.0
 */
public class GeoLandRevEngStrategy extends DelegatingReverseEngineeringStrategy {
	
	/** The log. */
	private static Log log = LogFactory.getLog(GeoLandRevEngStrategy.class);
	
	/**
	 * Instantiates a new geo land rev eng strategy.
	 *
	 * @param delegate the delegate
	 */
	public GeoLandRevEngStrategy(ReverseEngineeringStrategy delegate) {
		super(delegate);
	}
	
	/* (non-Javadoc)
	 * @see org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy#tableToMetaAttributes(org.hibernate.cfg.reveng.TableIdentifier)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Map tableToMetaAttributes(TableIdentifier tableIdentifier) {
		Map metaAttributes = super.tableToMetaAttributes(tableIdentifier);
		if(metaAttributes == null) {
		      metaAttributes = new HashMap<String, MetaAttribute>();
		}

		return metaAttributes;

	}
	
	/* (non-Javadoc)
	 * @see org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy#columnToMetaAttributes(org.hibernate.cfg.reveng.TableIdentifier, java.lang.String)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Map columnToMetaAttributes(TableIdentifier tableIdentifier, String columnName) {
		 Map metaAttributes = super.columnToMetaAttributes(tableIdentifier, columnName);
		 System.out.println(columnName);
		 log.debug(columnName);
		 log.info(columnName);
		 log.debug("Used default strategy of " + columnName); 
			if(metaAttributes == null) {
			      metaAttributes = new HashMap<String, MetaAttribute>();
			}		 
		 /*
		 if (notAuditedColumn(tableIdentifier, columnName)){        
			 MetaAttribute attributeimportEnvers = new MetaAttribute("extra-import");        
			 attributeimportEnvers.addValue("org.hibernate.envers.Audited");        
			 attributeimportEnvers.addValue("org.hibernate.envers.RelationTargetAuditMode");        
			 metaAttributes.put("extra-import", attributeimportEnvers);                 
			 MetaAttribute attributeEnvers = new MetaAttribute("scope-get");        
			 attributeEnvers.addValue("@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)");        
			 metaAttributes.put("scope-get", attributeEnvers);    
		}    
		*/
			 if ( log.isDebugEnabled() )       {           
				 log.debug( "Processing table " + columnName );       }
			 
//		 MetaAttribute attributeEnvers = new MetaAttribute("scope-get");        
//		 attributeEnvers.addValue("@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)");        
//		 metaAttributes.put("scope-get", attributeEnvers); 		 
		 return metaAttributes;
		 
	}

	/* (non-Javadoc)
	 * @see org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy#foreignKeyToInverseAssociationInfo(org.hibernate.mapping.ForeignKey)
	 */
	@Override
	public AssociationInfo foreignKeyToInverseAssociationInfo(
			ForeignKey foreignKey) {
		AssociationInfo associationInfo = super.foreignKeyToInverseAssociationInfo(foreignKey);
		return associationInfo;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy#foreignKeyToInverseEntityName(java.lang.String, org.hibernate.cfg.reveng.TableIdentifier, java.util.List, org.hibernate.cfg.reveng.TableIdentifier, java.util.List, boolean)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String foreignKeyToInverseEntityName(String keyname,
			TableIdentifier fromTable, List fromColumnNames,
			TableIdentifier referencedTable, List referencedColumnNames,
			boolean uniqueReference) {
		
		return super.foreignKeyToInverseEntityName(keyname, fromTable, fromColumnNames,
				referencedTable, referencedColumnNames, uniqueReference);
	}

	/* (non-Javadoc)
	 * @see org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy#foreignKeyToCollectionName(java.lang.String, org.hibernate.cfg.reveng.TableIdentifier, java.util.List, org.hibernate.cfg.reveng.TableIdentifier, java.util.List, boolean)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String foreignKeyToCollectionName(String keyname,
			TableIdentifier fromTable, List fromColumns,
			TableIdentifier referencedTable, List referencedColumns,
			boolean uniqueReference) {
		 
		return super.foreignKeyToCollectionName(keyname, fromTable, fromColumns,
				referencedTable, referencedColumns, uniqueReference);
	}

	
	
	

}
