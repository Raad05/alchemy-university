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

    const inputValue = this.transaction.inputUTXOs.reduce(
      (sum, utxo) => sum + utxo.amount,
      0
    );
    const outputValue = this.transaction.outputUTXOs.reduce(
      (sum, utxo) => sum + utxo.amount,
      0
    );

    if (inputValue < outputValue) {
      throw new Error("Input value less than the output value");
    }

    const newInputUTXOs = this.transaction.inputUTXOs.map(
      (utxo) => (utxo.spent = true)
    );

    this.transaction.inputUTXOs = newInputUTXOs;
  }
}

module.exports = Transaction;
