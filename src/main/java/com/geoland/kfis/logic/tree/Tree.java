package com.geoland.kfis.logic.tree;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

// TODO: Auto-generated Javadoc
/**
 * The Class Tree.
 *
 * @author GEO&LAND
 * @param <T> the generic type
 * @created October 22, 2014 4:17:49 PM
 * @Version 1.0
 */
public class Tree<T> {

  /** The head. */
  private T head;

  /** The leafs. */
  private ArrayList<Tree<T>> leafs = new ArrayList<Tree<T>>();

  /** The parent. */
  private Tree<T> parent = null;

  /** The locate. */
  private HashMap<T, Tree<T>> locate = new HashMap<T, Tree<T>>();

  /**
   * Instantiates a new tree.
   *
   * @param head the head
   */
  public Tree(T head) {
    this.head = head;
    locate.put(head, this);
  }

  /**
   * Adds the leaf.
   *
   * @param root the root
   * @param leaf the leaf
   */
  public void addLeaf(T root, T leaf) {
    if (locate.containsKey(root)) {
      locate.get(root).addLeaf(leaf);
    } else {
      addLeaf(root).addLeaf(leaf);
    }
  }

  /**
   * Adds the leaf.
   *
   * @param leaf the leaf
   * @return the tree
   */
  public Tree<T> addLeaf(T leaf) {
    Tree<T> t = new Tree<T>(leaf);
    leafs.add(t);
    t.parent = this;
    t.locate = this.locate;
    locate.put(leaf, t);
    return t;
  }

  /**
   * Sets the as parent.
   *
   * @param parentRoot the parent root
   * @return the tree
   */
  public Tree<T> setAsParent(T parentRoot) {
    Tree<T> t = new Tree<T>(parentRoot);
    t.leafs.add(this);
    this.parent = t;
    t.locate = this.locate;
    t.locate.put(head, this);
    t.locate.put(parentRoot, t);
    return t;
  }

  /**
   * Gets the head.
   *
   * @return the head
   */
  public T getHead() {
    return head;
  }

  /**
   * Gets the tree.
   *
   * @param element the element
   * @return the tree
   */
  public Tree<T> getTree(T element) {
    return locate.get(element);
  }

  /**
   * Gets the parent.
   *
   * @return the parent
   */
  public Tree<T> getParent() {
    return parent;
  }

  /**
   * Gets the successors.
   *
   * @param root the root
   * @return the successors
   */
  public Collection<T> getSuccessors(T root) {
    Collection<T> successors = new ArrayList<T>();
    Tree<T> tree = getTree(root);
    if (null != tree) {
      for (Tree<T> leaf : tree.leafs) {
        successors.add(leaf.head);
      }
    }
    return successors;
  }

  /**
   * Gets the sub trees.
   *
   * @return the sub trees
   */
  public Collection<Tree<T>> getSubTrees() {
    return leafs;
  }

  /**
   * Gets the successors.
   *
   * @param <T> the generic type
   * @param of the of
   * @param in the in
   * @return the successors
   */
  public static <T> Collection<T> getSuccessors(T of, Collection<Tree<T>> in) {
    for (Tree<T> tree : in) {
      if (tree.locate.containsKey(of)) {
        return tree.getSuccessors(of);
      }
    }
    return new ArrayList<T>();
  }

  /* (non-Javadoc)
   * @see java.lang.Object#toString()
   */
  @Override
  public String toString() {
    return printTree(0);
  }

  /** The Constant indent. */
  private static final int indent = 2;

  /**
   * Prints the tree.
   *
   * @param increment the increment
   * @return the string
   */
  private String printTree(int increment) {
    String s = "";
    String inc = "";
    for (int i = 0; i < increment; ++i) {
      inc = inc + " ";
    }
    s = inc + head;
    for (Tree<T> child : leafs) {
      s += "\n" + child.printTree(increment + indent);
    }
    return s;
  }
}


