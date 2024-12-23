// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint public required;
    uint public trxCount;

    struct Transaction {
        address destination;
        uint amountInWei;
        bool executed;
    }

    Transaction[] public transactions;
    mapping(uint => Transaction) public transactionsById;

    mapping(uint => mapping(address => bool)) public confirmations;

    constructor(address[] memory _ownerAddresses, uint _requiredAmount) {
        require(_ownerAddresses.length > 0, "No owner addresses sent");
        require(_requiredAmount != 0, "Should be more than zero");
        require(
            _requiredAmount <= _ownerAddresses.length,
            "Should be more than the total number of owner addresses"
        );

        owners = _ownerAddresses;
        required = _requiredAmount;
    }

    function transactionCount() public view returns (uint) {
        return transactions.length;
    }

    function addTransaction(
        address _destination,
        uint _amount
    ) internal returns (uint) {
        Transaction memory transaction = Transaction(
            _destination,
            _amount,
            false
        );
        transactions.push(transaction);
        transactionsById[trxCount] = transaction;

        uint trxId = trxCount;
        trxCount++;

        return trxId;
    }

    function confirmTransaction(uint _trxId) public {
        require(isOwner(msg.sender), "Not among the owners");
        require(_trxId < transactions.length, "Invalid Transaction ID");
        confirmations[_trxId][msg.sender] = true;

        if (isConfirmed(_trxId)) {
            executeTransaction(_trxId);
        }
    }

    function getConfirmationsCount(
        uint _transactionId
    ) public view returns (uint) {
        uint count = 0;

        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[_transactionId][owners[i]]) {
                count++;
            }
        }

        return count;
    }

    function submitTransaction(address _destination, uint _amount) external {
        uint trxId = addTransaction(_destination, _amount);
        confirmTransaction(trxId);
    }

    function isOwner(address _address) public view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == _address) {
                return true;
            }
        }
        return false;
    }

    receive() external payable {}

    function isConfirmed(uint _trxId) public view returns (bool) {
        require(_trxId < transactions.length, "Not a valid ID");
        return getConfirmationsCount(_trxId) >= required;
    }

    function executeTransaction(uint _trxId) public {
        require(isConfirmed(_trxId), "Transaction not confirmed");

        Transaction storage transaction = transactions[_trxId];

        (bool sent, ) = transaction.destination.call{
            value: transaction.amountInWei
        }("");
        require(sent);

        transaction.executed = true;
    }
}
