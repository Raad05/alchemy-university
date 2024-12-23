// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./Hero.sol";

// TODO: create Mage/Warrior Heroes
contract Mage is Hero(50) {
    function attack(address _enemy) public override {
        Enemy(_enemy).takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200) {
    function attack(address _enemy) public override {
        Enemy(_enemy).takeAttack(AttackTypes.Brawl);
    }
}
