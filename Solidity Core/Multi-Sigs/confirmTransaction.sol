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
        confirmations[_trxId][msg.sender] = true;
    }
}
