// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Switch {
    address public recipient;
    address public owner;
    uint latestTime;

    constructor(address _recipient) payable {
        recipient = payable(_recipient);
        owner = msg.sender;
        latestTime = block.timestamp;
    }

    function withdraw() external {
        uint timeLimit = latestTime + 52 weeks;
        require(block.timestamp >= timeLimit, "Time limit reached");

        (bool sent, ) = recipient.call{value: address(this).balance}("");
        require(sent);
    }

    function ping() external {
        require(msg.sender == owner, "Not the owner");
        latestTime = block.timestamp;
    }
}
