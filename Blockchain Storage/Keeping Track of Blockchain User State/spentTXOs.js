class Transaction {
  constructor(inputUTXOs, outputUTXOs) {
    this.transaction = { inputUTXOs, outputUTXOs };
  }
  execute() {
    const doubleSpent = this.transaction.inputUTXOs.findIndex(
      (utxo) => utxo.spent === true
    );
    if (doubleSpent !== -1) {
      throw new Error("Already spent");
    }
  }
}

module.exports = Transaction;
