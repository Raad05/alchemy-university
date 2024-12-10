class MerkleTree {
  constructor(leaves, concat) {
    this.root = null;
    this.leaves = leaves;
    this.hash = concat;
  }
  getRoot() {
    let current = this.leaves;

    while (current.length > 1) {
      const next = [];

      for (let i = 0; i < current.length; i += 2) {
        if (i + 1 < current.length) {
          next.push(this.hash(current[i], current[i + 1]));
        } else {
          next.push(current[i]);
        }
      }

      current = next;
    }

    this.root = current[0];

    return this.root;
  }

  getProof(idx) {
    let proof = [];
    let current = this.leaves;

    while (current.length > 1) {
      const next = [];

      for (let i = 0; i < current.length; i += 2) {
        if (i + 1 < current.length) {
          next.push(this.hash(current[i], current[i + 1]));

          if (i === idx) {
            proof.push({ data: current[i + 1], left: false });
          } else if (i + 1 === idx) {
            proof.push({ data: current[i], left: true });
          }
        } else {
          next.push(current[i]);
        }
      }
      idx = Math.floor(idx / 2);
      current = next;
    }

    return proof;
  }
}

module.exports = MerkleTree;
