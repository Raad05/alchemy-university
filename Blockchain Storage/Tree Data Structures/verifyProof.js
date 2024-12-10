function verifyProof(proof, node, root, concat) {
  // proof = array of objects
  // node = leaf node
  // root = valid merkle root
  // concat = to combine leaf nodes
  let hash = node;

  for (const { data, left } of proof) {
    if (left) {
      hash = concat(data, hash);
    } else {
      hash = concat(hash, data);
    }
  }
  return hash === root;
}

module.exports = verifyProof;
