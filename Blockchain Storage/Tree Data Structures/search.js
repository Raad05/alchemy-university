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

  hasNode(value) {
    return this.searchNode(this.root, value);
  }

  searchNode(current, value) {
    if (current == null) {
      return false;
    }

    if (current.data === value) {
      return true;
    } else if (value < current.data) {
      return this.searchNode(current.left, value);
    } else {
      return this.searchNode(current.right, value);
    }
  }
}

module.exports = Tree;
