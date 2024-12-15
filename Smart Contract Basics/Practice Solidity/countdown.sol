// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;
    uint public counter = 0;

    constructor() {
        owner = msg.sender;
    }

    function tick() external {
        counter++;

        if (counter == 10) {
            selfdestruct(payable(owner));
        }
    }
}
