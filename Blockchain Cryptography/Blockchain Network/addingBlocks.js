const Block = require("./Block");

class Blockchain {
  constructor() {
    const newBlock = new Block("Genesis Block");
    this.chain = [newBlock];
  }

  addBlock(newBlock) {
    this.chain.push(newBlock);
  }
}

module.exports = Blockchain;
