// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    // TODO: create a public state variable: an array of votes
    Vote[] public votes;

    function createVote(Choices choice) external {
        // TODO: add a new vote to the array of votes state variable
        require(!hasVoted(msg.sender), "Already voted");
        Vote memory newVote = Vote(choice, msg.sender);
        votes.push(newVote);
    }

    function hasVoted(address _member) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _member) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address _member) external view returns (Choices) {
        Choices choice;
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _member) {
                choice = votes[i].choice;
                break;
            }
        }
        return choice;
    }

    function changeVote(Choices choice) external {
        require(hasVoted(msg.sender), "Have not voted");
        for (uint i = 0; i < votes.length; i++) {
            if (msg.sender == votes[i].voter) {
                votes[i].choice = choice;
                break;
            }
        }
    }
}
