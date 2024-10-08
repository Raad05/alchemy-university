const { sha256 } = require("ethereum-cryptography/sha256");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

// the possible colors that the hash could represent
const COLORS = ["red", "green", "blue", "yellow", "pink", "orange"];

// given a hash, return the color that created the hash
function findColor(hash) {
  for (let i = 0; i < COLORS.length; i++) {
    const toBytes = utf8ToBytes(COLORS[i]);
    const toHash = sha256(toBytes);

    if (toHex(toHash) === toHex(hash)) {
      return COLORS[i];
    }
  }
}

module.exports = findColor;
