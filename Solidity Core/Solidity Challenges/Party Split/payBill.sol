// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint public amount;
    address[] public participants;

    constructor(uint _amount) {
        amount = _amount;
    }

    function rsvp() external payable {
        require(!isParticipant(msg.sender), "Already RSVPd");
        require(msg.value == amount, "Not the exact amount");
        participants.push(msg.sender);
    }

    function isParticipant(address _address) public view returns (bool) {
        for (uint i = 0; i < participants.length; i++) {
            if (participants[i] == _address) {
                return true;
            }
        }
        return false;
    }

    function payBill(address _address, uint _amount) external {
        (bool paid, ) = _address.call{value: _amount}("");
        require(paid);

        uint evenAmount = address(this).balance / participants.length;

        for (uint i = 0; i < participants.length; i++) {
            (bool distributed, ) = participants[i].call{value: evenAmount}("");
            require(distributed);
        }
    }
}
