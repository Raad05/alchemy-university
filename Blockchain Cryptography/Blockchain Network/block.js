const SHA256 = require("crypto-js/sha256");

class Block {
  toHash() {
    return SHA256("hello"); // a hash!
  }
}

module.exports = Block;
