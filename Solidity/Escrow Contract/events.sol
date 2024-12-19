// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Escrow {
    event Approved(uint _balance);

    address public depositor;
    address public beneficiary;
    address public arbiter;

    bool public isApproved;

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "You are not the arbiter");
        uint balance = address(this).balance;
        (bool sent, ) = beneficiary.call{value: balance}("");
        require(sent);

        isApproved = true;

        emit Approved(balance);
    }
}
