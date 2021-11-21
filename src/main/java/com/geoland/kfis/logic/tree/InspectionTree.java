package com.geoland.kfis.logic.tree;

import java.util.List;

import net.sf.json.JSONArray;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.framework.security.rbac.tree.Tree;
import com.geoland.kfis.model.Inspection;

// TODO: Auto-generated Javadoc
/**
 * The Class InspectionTree.
 */
public class InspectionTree  extends Tree<Inspection> {
	
	/**
	 * Instantiates a new inspection tree.
	 */
	public InspectionTree(){
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
	protected void printOut(Node<Inspection> node, StringBuilder output){
		output.append(getTabulator(node.getLevel()));
		output.append(node.getData().getId() + " - " + node.getData().getInspectionNo() + "\n");
		
    	List<Node<Inspection>> children = node.getChildren();  
        for ( Node<Inspection> child : children ) {        
        	printOut(child, output);   
        }		
	}
	
	/**
	 * printJSON.
	 *
	 * @param node the node
	 * @param output the output
	 */
	protected void printJSON(Node<Inspection> node, StringBuilder output){
		output.append(((InspectionNode)node).getJSONObject().toString());
		output.append("\n");
		
    	List<Node<Inspection>> children = node.getChildren();  
        for ( Node<Inspection> child : children ) {        
        	printJSON(child, output);   
        }		
	}

	/**
	 * printJSON.
	 *
	 * @param node the node
	 * @param rows the rows
	 */
	protected void printJSON(Node<Inspection> node, JSONArray rows){
		rows.add(((InspectionNode)node).getJSONObject());	
		
    	List<Node<Inspection>> children = node.getChildren();  
        for ( Node<Inspection> child : children ) {        
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
	public Node<Inspection> findParent(Node<Inspection> root, Long id) {      
		Node<Inspection> node = null ;   
		if (root.getData().getId().equals(id)){  
			node = root ;   
	    }else {   
	    	List<Node<Inspection>> children = root.getChildren();  
	        for ( Node<Inspection> child : children ) {        
	        	node = findParent( child, id ) ;   
	            if( node != null ) {   
	                break ;   
	            }   
	        }        
	    }   
	       
	    return node ;   
	} 	
}
