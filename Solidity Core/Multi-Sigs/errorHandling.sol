// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint public required;

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
}
