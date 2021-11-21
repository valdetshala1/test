package com.geoland.kfis.logic.tree;

import java.util.List;

import net.sf.json.JSONArray;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.framework.security.rbac.tree.Tree;
import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.model.Organisation;

// TODO: Auto-generated Javadoc
/**
 * The Class LayerGisTree.
 */
public class LayerGisTree  extends Tree<LayersGis> {
	
	/**
	 * Instantiates a new layer gis tree.
	 */
	public LayerGisTree(){
		super();
	}
	
	/**
	 * Gets the JSON array.
	 *
	 * @return the JSON array
	 */
	public JSONArray getJSONArray() {
		JSONArray rows = new JSONArray();
		printJSON(getRootElement(), rows);
		return rows;
	}
	
	/**
	 * Prints the.
	 *
	 * @return the string
	 */
	public String print() {
		StringBuilder output = new StringBuilder();
		printOut(getRootElement(), output);
		
		return output.toString();
	}
	
	/**
	 * Prints the out.
	 *
	 * @param node the node
	 * @param output the output
	 */
	protected void printOut(Node<LayersGis> node, StringBuilder output){
		output.append(getTabulator(node.getLevel()));
		output.append(node.getData().getId() + " - " + node.getData().getStore() + "\n");
		
    	List<Node<LayersGis>> children = node.getChildren();  
        for ( Node<LayersGis> child : children ) {        
        	printOut(child, output);   
        }		
	}
	
	/**
	 * printJSON.
	 *
	 * @param node the node
	 * @param output the output
	 */
	protected void printJSON(Node<Organisation> node, StringBuilder output){
		output.append(((OrganisationNode)node).getJSONObject().toString());
		output.append("\n");
		
    	List<Node<Organisation>> children = node.getChildren();  
        for ( Node<Organisation> child : children ) {        
        	printJSON(child, output);   
        }		
	}

	/**
	 * printJSON.
	 *
	 * @param node the node
	 * @param rows the rows
	 */
	protected void printJSON(Node<LayersGis> node, JSONArray rows){
		rows.add(((LayerGisNode)node).getJSONObject());	
		
    	List<Node<LayersGis>> children = node.getChildren();  
        for ( Node<LayersGis> child : children ) {        
        	printJSON(child, rows);   
        }		
	}	
	
	/**
	 * Gets the tabulator.
	 *
	 * @param level the level
	 * @return the tabulator
	 */
	protected String getTabulator(int level){
		String tabs = "";
		for(int i = 0; i<level; i++){
			tabs += "\t"; 
		}
		return tabs;
	}
	
	/**
	 * Find parent.
	 *
	 * @param root the root
	 * @param id the id
	 * @return the node
	 */
	public Node<LayersGis> findParent(Node<LayersGis> root, Long id) {      
		Node<LayersGis> node = null ;   
		if (root.getData().getId().equals(id)){  
			node = root ;   
	    }else {   
	    	List<Node<LayersGis>> children = root.getChildren();  
	        for ( Node<LayersGis> child : children ) {        
	        	node = findParent( child, id ) ;   
	            if( node != null ) {   
	                break ;   
	            }   
	        }        
	    }   
	       
	    return node ;   
	} 	
}
