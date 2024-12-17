// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    event Deployed(address _address);
    event Transfer(address _originalOwner, address _newOwner);

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
}
