const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");

function hashMessage(message) {
  const toBytes = utf8ToBytes(message);
  const toHash = keccak256(toBytes);

  return toHash;
}

module.exports = hashMessage;
