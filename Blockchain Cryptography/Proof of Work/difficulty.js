const SHA256 = require("crypto-js/sha256");
const TARGET_DIFFICULTY =
  BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
  // TODO: add transaction to mempool
  mempool.push(transaction);
}

function mine() {
  // TODO: mine a block
  const blockHeight = blocks.length;
  const transactions = mempool.splice(0, MAX_TRANSACTIONS);

  const newBlock = {
    id: blockHeight,
    transactions: transactions,
    nonce: 0,
  };

  while (true) {
    const stringify = JSON.stringify(newBlock);
    const blockHash = SHA256(stringify).toString();

    if (BigInt(`0x${blockHash}`) < TARGET_DIFFICULTY) {
      newBlock.hash = blockHash;
      blocks.push(newBlock);
      break;
    }
    newBlock.nonce++;
  }
}

module.exports = {
  TARGET_DIFFICULTY,
  MAX_TRANSACTIONS,
  addTransaction,
  mine,
  blocks,
  mempool,
};
