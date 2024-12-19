// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address _newMember) external {
        require(isMember(msg.sender), "Not a member");
        members.push(_newMember);
    }

    function isMember(address _member) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _member) {
                return true;
            }
        }
        return false;
    }

    function removeLastMember() external {
        require(isMember(msg.sender), "Not a member");
        members.pop();
    }
}
