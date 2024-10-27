const secp = require("ethereum-cryptography/secp256k1");
const hashMessage = require("./hashMessage");

async function recoverKey(message, signature, recoveryBit) {
  const hashedMsg = await hashMessage(message);

  const publicKey = await secp.recoverPublicKey(
    hashedMsg,
    signature,
    recoveryBit
  );

  return publicKey;
}

module.exports = recoverKey;
