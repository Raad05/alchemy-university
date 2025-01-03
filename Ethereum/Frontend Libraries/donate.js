const { utils, providers, Wallet } = require("ethers");
const { ganacheProvider } = require("./config");

const provider = new providers.Web3Provider(ganacheProvider);

/**
 * Donate at least 1 ether from the wallet to each charity
 * @param   {string} a hex string private key for a wallet with 10 ETH
 * @param   {array} an array of ethereum charity addresses
 *
 * @returns {Promise} a promise that resolves after all donations have been sent
 */
async function donate(privateKey, charities) {
  // TODO: donate to charity!
  const wallet = new Wallet(privateKey, provider);

  for (let i = 0; i < charities.length; i++) {
    const nonce = await wallet.getTransactionCount();

    const tx = {
      to: charities[i],
      value: utils.parseEther("1", "ether"),
      nonce,
    };

    await wallet.sendTransaction(tx);
  }
}

module.exports = donate;
