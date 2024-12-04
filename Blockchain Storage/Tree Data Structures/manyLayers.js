class Tree {
  constructor() {
    this.root = null;
  }

  addNode(node) {
    if (this.root == null) {
      this.root = node;
    } else {
      this.insertNode(this.root, node);
    }
  }

  insertNode(current, newNode) {
    if (newNode.data < current.data) {
      if (current.left == null) {
        current.left = newNode;
      } else {
        this.insertNode(current.left, newNode);
      }
    } else {
      if (current.right == null) {
        current.right = newNode;
      } else {
        this.insertNode(current.right, newNode);
      }
    }
  }
}

module.exports = Tree;
