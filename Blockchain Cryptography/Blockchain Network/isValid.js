const Block = require("./Block");

class Blockchain {
  constructor() {
    const newBlock = new Block("Genesis Block");
    this.chain = [newBlock];
  }

  addBlock(newBlock) {
    newBlock.previousHash = this.chain[this.chain.length - 1].toHash();
    this.chain.push(newBlock);
  }

  isValid() {
    for (let i = 1; i < this.chain.length; i++) {
      if (
        this.chain[i].previousHash.toString() !==
        this.chain[i - 1].toHash().toString()
      ) {
        return false;
      }
    }
    return true;
  }
}

module.exports = Blockchain;
