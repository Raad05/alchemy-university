// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint _x) public pure returns (bool) {
        return _x % 2 == 0;
    }
}
