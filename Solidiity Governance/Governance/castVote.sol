// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    function newProposal(address _target, bytes memory _calldata) external {
        Proposal memory proposal = Proposal(_target, _calldata, 0, 0);

        proposals.push(proposal);
    }

    function castVote(uint _pid, bool _support) external {
        if (_support) {
            proposals[_pid].yesCount += 1;
        } else {
            proposals[_pid].noCount += 1;
        }
    }
}
