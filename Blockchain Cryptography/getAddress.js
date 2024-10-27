const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function getAddress(publicKey) {
  const a1 = publicKey.slice(1);

  const toHash = keccak256(a1);

  return toHash.slice(-20);
}

module.exports = getAddress;
