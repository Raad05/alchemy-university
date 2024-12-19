// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    function filterEven(
        uint[] memory _values
    ) external pure returns (uint[] memory) {
        uint counter;

        for (uint i = 0; i < _values.length; i++) {
            if (_values[i] % 2 == 0) {
                counter++;
            }
        }
        uint[] memory evenNumbers = new uint[](counter);
        uint evenCounter;

        for (uint i = 0; i < _values.length; i++) {
            if (_values[i] % 2 == 0) {
                evenNumbers[evenCounter] = _values[i];
                evenCounter++;
            }
        }

        return evenNumbers;
    }
}
