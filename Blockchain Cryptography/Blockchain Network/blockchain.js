const Block = require("./Block");

class Blockchain {
  constructor() {
    const newBlock = new Block("Genesis Block");
    this.chain = [newBlock];
  }
}

module.exports = Blockchain;
