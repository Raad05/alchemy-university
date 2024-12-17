// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    event Deployed(address _address);
    event Transfer(address _originalOwner, address _newOwner);
    event ForSale(uint _price, uint _timestamp);

    address public owner;

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address _address) external {
        require(owner == msg.sender, "Cannot transfer twice");
        address originalOwner = owner;
        owner = _address;

        emit Transfer(originalOwner, _address);
    }

    function markPrice(uint _askingPrice) external {
        require(msg.sender == owner, "Not the owner");
        emit ForSale(_askingPrice, block.timestamp);
    }
}
