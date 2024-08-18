const SHA256 = require("crypto-js/sha256");

class Block {
  constructor(data, previousHash = "") {
    this.data = data;
    this.previousHash = previousHash;
  }

  toHash() {
    return SHA256(this.data + this.previousHash);
  }
}

module.exports = Block;

class Blockchain {
  constructor() {
    const newBlock = new Block("Genesis Block");
    this.chain = [newBlock];
  }

  addBlock(newBlock) {
    newBlock.previousHash = this.chain[this.chain.length - 1].toHash();
    this.chain.push(newBlock);
  }
}

module.exports = Blockchain;
