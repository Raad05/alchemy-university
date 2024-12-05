class MerkleTree {
  constructor(leaves, concat) {
    this.root = null;
    this.leaves = leaves;
    this.hash = concat;
  }
  getRoot() {
    this.root = this.hash(this.leaves[0], this.leaves[1]);

    return this.root;
  }
}

module.exports = MerkleTree;
