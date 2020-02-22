import 'dart:collection';
import 'dart:convert';

import 'dart:ffi';

main(List<String> args) {
  var encoder = JsonEncoder.withIndent(' ');
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(9);
  tree.insert(4);
  tree.insert(6);
  tree.insert(20);
  tree.insert(170);
  tree.insert(15);
  tree.insert(1);
  // print(encoder.convert(tree.traverse(tree.root)));
  // print(encoder.convert(tree.traverse(tree.lookup(200))));
  //     9
  //  4     20
  //1  6  15  170
  var bfsResult = tree
      .breadthFirstSearch(); // INFO 📘: should return [9, 4, 20, 1, 6, 15, 170]
  print(bfsResult);
  var bfsResultR = tree.breadthFirstSearchR(Queue.from([tree.root]),
      []); // INFO 📘: should return [9, 4, 20, 1, 6, 15, 170]
  print(bfsResultR);
  tree.dfs_inOrder(); // INFO 📘: should print [1, 4, 6, 9, 15, 20, 170]
  tree.dfs_preOrder(); // INFO 📘: should print [9, 4, 1, 6, 20, 15, 170]
  tree.dfs_postOrder(); // INFO 📘: should print [1, 6, 4, 15, 170, 20, 9]
  tree.isValidBST();

  tree.delete(20);
  // print(encoder.convert(tree.traverse(tree.root)));
}

class Node {
  Node left;
  Node right;
  dynamic value;
  Node(dynamic val) {
    value = val;
    left = null;
    right = null;
  }
}

class BinarySearchTree {
  Node root;
  BinarySearchTree() {
    root = null;
  }
  BinarySearchTree insert(value) {
    Node newNode = Node(value);
    if (root == null) {
      root = newNode;
      return this;
    } else {
      Node currentNode = root;
      while (true) {
        if (newNode.value < currentNode.value) {
          if (currentNode.left == null) {
            currentNode.left = newNode;
            return this;
          }
          currentNode = currentNode.left;
        } else {
          if (currentNode.right == null) {
            currentNode.right = newNode;
            return this;
          }
          currentNode = currentNode.right;
        }
      }
    }
  }

  Node lookup(value) {
    if (root == null) {
      return null;
    } else {
      Node currentNode = root;
      while (currentNode != null) {
        if (value < currentNode.value) {
          currentNode = currentNode.left;
        } else if (value > currentNode.value) {
          currentNode = currentNode.right;
        } else if (currentNode.value == value) {
          return currentNode;
        }
      }
      return null;
    }
  }

  delete(value) {
    if (root == null) {
      return;
    }
    Node parentNode = null;
    Node currentNode = root;
    while (currentNode != null) {
      if (value < currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (value > currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else if (currentNode.value == value) {
        //Option 1: No right child:
        if (currentNode.right == null) {
          if (parentNode == null) {
            this.root = currentNode.left;
          } else {
            //if parent > current value, make current left child a child of parent
            if (currentNode.value < parentNode.value) {
              parentNode.left = currentNode.left;

              //if parent < current value, make left child a right child of parent
            } else if (currentNode.value > parentNode.value) {
              parentNode.right = currentNode.left;
            }
          }

          //Option 2: Right child which doesnt have a left child
        } else if (currentNode.right.left == null) {
          currentNode.right.left = currentNode.left;
          if (parentNode == null) {
            this.root = currentNode.right;
          } else {
            //if parent > current, make right child of the left the parent
            if (currentNode.value < parentNode.value) {
              parentNode.left = currentNode.right;

              //if parent < current, make right child a right child of the parent
            } else if (currentNode.value > parentNode.value) {
              parentNode.right = currentNode.right;
            }
          }

          //Option 3: Right child that has a left child
        } else {
          //find the Right child's left most child
          Node leftmost = currentNode.right.left;
          Node leftmostParent = currentNode.right;
          while (leftmost.left != null) {
            leftmostParent = leftmost;
            leftmost = leftmost.left;
          }

          //Parent's left subtree is now leftmost's right subtree
          leftmostParent.left = leftmost.right;
          leftmost.left = currentNode.left;
          leftmost.right = currentNode.right;

          if (parentNode == null) {
            this.root = leftmost;
          } else {
            if (currentNode.value < parentNode.value) {
              parentNode.left = leftmost;
            } else if (currentNode.value > parentNode.value) {
              parentNode.right = leftmost;
            }
          }
        }
        return;
      }
    }
  }

  List<int> breadthFirstSearch() {
    var currentNode = root;
    var list = List<int>();
    Queue queue = Queue();
    queue.add(currentNode);

    while (queue.isNotEmpty) {
      currentNode = queue.removeFirst();
      if (currentNode.left != null) {
        queue.add(currentNode.left);
      }
      if (currentNode.right != null) {
        queue.add(currentNode.right);
      }
      list.add(currentNode.value);
    }

    return list;
  }

  List<int> breadthFirstSearchR(Queue<Node> queue, List<int> list) {
    var currentNode = queue.removeFirst();
    if (currentNode.left != null) {
      queue.add(currentNode.left);
    }
    if (currentNode.right != null) {
      queue.add(currentNode.right);
    }
    list.add(currentNode.value);

    if (queue.isEmpty) {
      return list;
    }
    return breadthFirstSearchR(queue, list);
  }

  dfs_inOrder() {
    print('DFS In Order:  ${dfsTraverseInOrder(root, [])}');
  }

  dfs_preOrder() {
    print('DFS Pre Order:  ${dfsTraversePreOrder(root, [])}');
  }

  dfs_postOrder() {
    print('DFS Post Order:  ${dfsTraversePostOrder(root, [])}');
  }

  isValidBST() {
    print(
        'Tree is a binary search tree: ${isAValidBST(root, -999999999, 999999999)}');
  }

  traverse(node) {
    if (node == null) {
      return null;
    }
    Map<String, dynamic> tree = {'value': node.value};
    tree['left'] = node.left == null ? null : traverse(node.left);
    tree['right'] = node.right == null ? null : traverse(node.right);
    return tree;
  }
}

List<int> dfsTraverseInOrder(Node node, List<int> data) {
  if (node.left != null) {
    dfsTraverseInOrder(node.left, data);
  }
  data.add(node.value);
  if (node.right != null) {
    dfsTraverseInOrder(node.right, data);
  }

  return data;
}

List<int> dfsTraversePreOrder(Node node, List<int> data) {
  data.add(node.value);
  if (node.left != null) {
    dfsTraversePreOrder(node.left, data);
  }
  if (node.right != null) {
    dfsTraversePreOrder(node.right, data);
  }

  return data;
}

List<int> dfsTraversePostOrder(Node node, List<int> data) {
  if (node.left != null) {
    dfsTraversePostOrder(node.left, data);
  }
  if (node.right != null) {
    dfsTraversePostOrder(node.right, data);
  }
  data.add(node.value);

  return data;
}

bool isAValidBST(Node root, int min, int max) {
  //Valid tree
  //   2
  //  / \
  // 1   3
  //Invalid tree
  //   5
  //  / \
  // 1   4
  //    / \
  //   3   6
  //The root node's value is 5 but its right child's value is 4.
  if (root == null) {
    return true;
  }

  if (min < root.value && root.value < max) {
    bool left = isAValidBST(root.left, min, root.value);
    bool right = isAValidBST(root.right, root.value, max);

    return left && right;
  }

  return false;
}
