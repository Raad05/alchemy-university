// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;

    constructor() payable {
        if (msg.value < 1 ether) {
            revert("Need at least 1 eth");
        }
        owner = msg.sender;
    }

    function withdraw() public {
        if (msg.sender != owner) {
            revert("Not the owner");
        }

        (bool sent, ) = owner.call{value: address(this).balance}("");
        require(sent);
    }
}
