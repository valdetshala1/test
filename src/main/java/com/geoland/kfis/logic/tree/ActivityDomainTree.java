package com.geoland.kfis.logic.tree;

import java.util.List;

import net.sf.json.JSONArray;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.framework.security.rbac.tree.Tree;
import com.geoland.kfis.model.ActivityDomain;

// TODO: Auto-generated Javadoc
/**
 * The Class ActivityDomainTree.
 */
public class ActivityDomainTree  extends Tree<ActivityDomain> {
	
	/**
	 * Instantiates a new activity domain tree.
	 */
	public ActivityDomainTree(){
		super();
	}
	
	/**
	 * Gets the JSON hierarchy.
	 *
	 * @return the JSON hierarchy
	 */
	public JSONArray getJSONHierarchy() {
		JSONArray rows = new JSONArray();
		printJSON(getRootElement(), rows);
		return rows;
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
	protected void printOut(Node<ActivityDomain> node, StringBuilder output){
		output.append(getTabulator(node.getLevel()));
		output.append(node.getData().getId() + " - " + node.getData().getNameAl() + "\n");
		
    	List<Node<ActivityDomain>> children = node.getChildren();  
        for ( Node<ActivityDomain> child : children ) {        
        	printOut(child, output);   
        }		
	}
	
	/**
	 * printJSON.
	 *
	 * @param node the node
	 * @param output the output
	 */
	protected void printJSON(Node<ActivityDomain> node, StringBuilder output){
		output.append(((ActivityDomainNode)node).getJSONObject().toString());
		output.append("\n");
		
    	List<Node<ActivityDomain>> children = node.getChildren();  
        for ( Node<ActivityDomain> child : children ) {        
        	printJSON(child, output);   
        }		
	}

	/**
	 * printJSON.
	 *
	 * @param node the node
	 * @param rows the rows
	 */
	protected void printJSON(Node<ActivityDomain> node, JSONArray rows){
		//rows.add(((ActivityDomain)node).getJSONObject());
		ActivityDomainNode adn = (ActivityDomainNode) node;
		rows.add(adn.getJSONObject());
		
    	List<Node<ActivityDomain>> children = node.getChildren();  
        for ( Node<ActivityDomain> child : children ) {        
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
	public Node<ActivityDomain> findParent(Node<ActivityDomain> root, Long id) {      
		Node<ActivityDomain> node = null ;   
		if (root.getData().getId().equals(id)){  
			node = root ;   
	    }else {   
	    	List<Node<ActivityDomain>> children = root.getChildren();  
	        for ( Node<ActivityDomain> child : children ) {        
	        	node = findParent( child, id ) ;   
	            if( node != null ) {   
	                break ;   
	            }   
	        }        
	    }   
	       
	    return node ;   
	} 	
}
