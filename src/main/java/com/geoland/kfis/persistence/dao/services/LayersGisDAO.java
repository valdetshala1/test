package com.geoland.kfis.persistence.dao.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.web.action.frm.compartment.tree.LayersGisTree;
import com.geoland.kfis.web.action.frm.compartment.tree.Node;

// TODO: Auto-generated Javadoc
/**
 * The Class LayersGisDAO.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 15, 2017 , 4:35:41 PM
 */
public class LayersGisDAO extends GenericDAO<LayersGis, Long>{


	  /**
  	 * Gets the tree.
  	 *
  	 * @param id the id
  	 * @return the tree
  	 */
  	public LayersGisTree getTree(Long id) {
		  LayersGisTree roTree = new LayersGisTree();
	        Node<LayersGis> rootElement = new Node<LayersGis>(get(id), null);
	        getRecursive(rootElement, roTree);
	        roTree.setRootElement(rootElement);
	        return roTree;
	    }

	    /**
    	 * Recursively descends the Tree and populates the TaskTree object.
    	 *
    	 * @param roElement the ro element
    	 * @param tree the TaskTree object to populate.
    	 * @return the recursive
    	 */
	    private void getRecursive(Node<LayersGis> roElement, LayersGisTree tree) {
	    	List<Node<LayersGis>> childElements = new ArrayList<Node<LayersGis>>();

	    	List<LayersGis> children = executeSQLQuery("select * from tlayers_gis where parent_id = " + roElement.getData().getId() + " order by sort asc");
	    	
	        for (Iterator<LayersGis> it = children.iterator(); it.hasNext();) {
	        	
	        	LayersGis childLayersGis = it.next();
	            Node<LayersGis> childElement = new Node<LayersGis>(childLayersGis, roElement);
	            childElements.add(childElement);
	            
	            getRecursive(childElement, tree);
	        }
	        
	        roElement.setChildren(childElements);
	    }


}
