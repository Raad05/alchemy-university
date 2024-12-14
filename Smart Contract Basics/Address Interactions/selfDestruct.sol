// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;
    address public charityAddress;

    constructor(address _charityAddress) {
        owner = msg.sender;
        charityAddress = _charityAddress;
    }

    receive() external payable {}

    function tip() public payable {
        (bool sent, ) = owner.call{value: msg.value}("");
        require(sent);
    }

    function donate() public {
        (bool sent, ) = charityAddress.call{value: address(this).balance}("");
        require(sent);
        selfdestruct(payable(msg.sender));
    }
}
