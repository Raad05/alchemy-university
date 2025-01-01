// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint x1, uint x2) public pure returns (bool) {
        return x1 % x2 == 0;
    }

    function isPrime(uint x) public pure returns (bool) {
        uint count;
        for (uint i = 1; i <= x; i++) {
            if (x % i == 0) {
                count++;
            }
        }
        if (count == 2) {
            return true;
        }

        return false;
    }
}
