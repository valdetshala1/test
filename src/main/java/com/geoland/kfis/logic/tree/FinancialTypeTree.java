package com.geoland.kfis.logic.tree;

import java.util.List;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.framework.security.rbac.tree.Tree;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.model.Organisation;

import net.sf.json.JSONArray;

/**
 * The Class EconomicCodeTree.
 */
public class FinancialTypeTree extends Tree<FinancialType> {
	
	/**
	 * Instantiates a new organisation tree.
	 */
	public FinancialTypeTree(){
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
	protected void printOut(Node<FinancialType> node, StringBuilder output){
		output.append(getTabulator(node.getLevel()));
		output.append(node.getData().getId() + " - " + node.getData().getCode() + "\n");
		
    	List<Node<FinancialType>> children = node.getChildren();  
        for ( Node<FinancialType> child : children ) {        
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
	protected void printJSON(Node<FinancialType> node, JSONArray rows){
		rows.add(((FinancialTypeNode)node).getJSONObject());	
		
    	List<Node<FinancialType>> children = node.getChildren();  
        for ( Node<FinancialType> child : children ) {        
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
	public Node<FinancialType> findParent(Node<FinancialType> root, Long id) {      
		Node<FinancialType> node = null ;   
		if (root.getData().getId().equals(id)){  
			node = root ;   
	    }else {   
	    	List<Node<FinancialType>> children = root.getChildren();  
	        for ( Node<FinancialType> child : children ) {        
	        	node = findParent( child, id ) ;   
	            if( node != null ) {   
	                break ;   
	            }   
	        }        
	    }   
	       
	    return node ;   
	} 	
}
