// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract Chest {
    function plunder(address[] memory addresses) external {
        for (uint i = 0; i < addresses.length; i++) {
            IERC20 token = IERC20(addresses[i]);
            uint balance = token.balanceOf(address(this));

            token.transfer(msg.sender, balance);
        }
    }
}
