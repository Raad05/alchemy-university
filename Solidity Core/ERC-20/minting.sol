// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Token {
    uint public totalSupply;
    string public name = "Illuminani";
    string public symbol = "ILN";
    uint8 public decimals = 18;

    mapping(address => uint) public balances;

    constructor() {
        totalSupply = 1000 * (10 ** 18);
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address _address) external view returns (uint) {
        return balances[_address];
    }
}
