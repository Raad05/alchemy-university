// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint x1, uint x2) public pure returns (bool) {
        return x1 % x2 == 0;
    }
}
