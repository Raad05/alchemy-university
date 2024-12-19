// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    function sum(uint[] memory _values) external pure returns (uint) {
        uint total = 0;

        for (uint i = 0; i < _values.length; i++) {
            total += _values[i];
        }

        return total;
    }
}
