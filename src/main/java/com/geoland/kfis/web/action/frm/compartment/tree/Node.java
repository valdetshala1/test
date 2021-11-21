package com.geoland.kfis.web.action.frm.compartment.tree;


import java.util.ArrayList;
import java.util.List;

// TODO: Auto-generated Javadoc
/**
 * Represents a node of the Tree<T> class. The Node<T> is also a container, and
 * can be thought of as instrumentation to determine the location of the type T
 * in the Tree<T>.
 *
 * @param <T> the generic type
 */
public class Node<T> {
 
    /** The data. */
    private T data;
    
    /** The parent. */
    private Node<T> parent;
    
    /** The children. */
    private List<Node<T>> children;
 
    /**
     * Default constructor.
     */
    public Node() {
        super();
    }
 
    /**
     * Convenience constructor to create a Node<T> with an instance of T.
     * @param data an instance of T.
     */
    public Node(T data) {
        this();
        setData(data);
    }
    
    /**
     * Convenience constructor to create a Node<T> with an instance of T.
     *
     * @param data an instance of T.
     * @param parent the parent
     */
    public Node(T data, Node<T> parent) {
        this();
        setData(data);
        this.parent = parent;
    }    
     
    /**
     * Return the children of Node<T>. The Tree<T> is represented by a single
     * root Node<T> whose children are represented by a List<Node<T>>. Each of
     * these Node<T> elements in the List can have children. The getChildren()
     * method will return the children of a Node<T>.
     * @return the children of Node<T>
     */
    public List<Node<T>> getChildren() {
        if (this.children == null) {
            return new ArrayList<Node<T>>();
        }
        return this.children;
    }
 
    /**
     * Sets the children of a Node<T> object. See docs for getChildren() for
     * more information.
     * @param children the List<Node<T>> to set.
     */
    public void setChildren(List<Node<T>> children) {
        this.children = children;
    }
 
    /**
     * Returns true if this node has no children. To distinguish between nodes
     * that have no children and nodes that <i>cannot</i> have children (e.g. to
     * distinguish files from empty directories), use this method in conjunction
     * with <code>getAllowsChildren</code>
     *
     * @return true if this node has no children
     * @see #getAllowsChildren
     */
    public boolean isLeaf() {
      return (getChildCount() == 0);
    }
    
    /**
     * Returns the number of children of this node.
     * @return an the number of children of this node
     */
    public int getChildCount() {
      if (children == null) {
        return 0;
      } else {
        return children.size();
      }
    }
    
    /**
     * Returns the number of immediate children of this Node<T>.
     * @return the number of immediate children.
     */
    public int getNumberOfChildren() {
        if (children == null) {
            return 0;
        }
        return children.size();
    }
    
    /**
     * Returns the number of levels above this node -- the distance from the root
     * to this node. If this node is the root, returns 0.
     *
     * @return the number of levels above this node
     * @see #getDepth
     */
    public int getLevel() {
      Node<T> ancestor = this;
      int levels = 0;

      while ((ancestor = ancestor.getParent()) != null) {
        levels++;
      }

      return levels;
    }    
     
    /**
     * Returns this node's parent or null if this node has no parent.
     * 
     * @return this node's parent TreeNode, or null if this node has no parent
     */
    public Node<T> getParent() {
      return parent;
    }
    
    /**
     * Sets the parent.
     *
     * @param parent the new parent
     */
    public void setParent(Node<T> parent) {
		this.parent = parent;
	}
    
    /**
     * Adds a child to the list of children for this Node<T>. The addition of
     * the first child will create a new List<Node<T>>.
     * @param child a Node<T> object to set.
     */
    public void addChild(Node<T> child) {
        if (children == null) {
            children = new ArrayList<Node<T>>();
        }
        children.add(child);
    }
     
    /**
     * Inserts a Node<T> at the specified position in the child list. Will     * throw an ArrayIndexOutOfBoundsException if the index does not exist.
     * @param index the position to insert at.
     * @param child the Node<T> object to insert.
     * @throws IndexOutOfBoundsException if thrown.
     */
    public void insertChildAt(int index, Node<T> child) throws IndexOutOfBoundsException {
        if (index == getNumberOfChildren()) {
            // this is really an append
            addChild(child);
            return;
        } else {
            children.get(index); //just to throw the exception, and stop here
            children.add(index, child);
        }
    }
     
    /**
     * Remove the Node<T> element at index index of the List<Node<T>>.
     * @param index the index of the element to delete.
     * @throws IndexOutOfBoundsException if thrown.
     */
    public void removeChildAt(int index) throws IndexOutOfBoundsException {
        children.remove(index);
    }
 
    /**
     * Gets the data.
     *
     * @return the data
     */
    public T getData() {
        return this.data;
    }
 
    /**
     * Sets the data.
     *
     * @param data the new data
     */
    public void setData(T data) {
        this.data = data;
    }
     
    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{").append(getData().toString()).append(",[");
        int i = 0;
        for (Node<T> e : getChildren()) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append(e.getData().toString());
            i++;
        }
        sb.append("]").append("}");
        return sb.toString();
    }
    
}

