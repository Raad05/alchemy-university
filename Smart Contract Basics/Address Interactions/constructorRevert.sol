// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    constructor() payable {
        if (msg.value < 1 ether) {
            revert("Need at least 1 eth");
        }
    }
}
