// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public admin;
    bool public votingEnded;
    uint256 public totalVotes;
    uint256 public votingEndTime;

    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public hasVoted;
    mapping(uint256 => Candidate) public candidates;
    uint256 public candidatesCount;

    event CandidateAdded(uint256 id, string name);
    event Voted(address voter, uint256 candidateId);
    event VotingEnded();

    modifier onlyAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
        _;
    }

    modifier votingActive() {
        require(block.timestamp <= votingEndTime && !votingEnded, "Voting is not active");
        _;
    }

    modifier votingInactive() {
        require(block.timestamp > votingEndTime || votingEnded, "Voting is still active");
        _;
    }

    constructor(uint256 _votingDuration) {
        admin = msg.sender;
        votingEndTime = block.timestamp + _votingDuration;
        votingEnded = false;
    }

    function addCandidate(string memory name) public onlyAdmin votingActive {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
        emit CandidateAdded(candidatesCount, name);
    }

    function vote(uint256 candidateId) public votingActive {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID");

        // Perform voting actions
        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;
        totalVotes++;

        emit Voted(msg.sender, candidateId);
    }

    function endVoting() public onlyAdmin votingActive {
        require(block.timestamp > votingEndTime, "Voting duration not yet over");

        // Perform voting end actions
        votingEnded = true;
        emit VotingEnded();
    }

    function customRevert(string memory errorMessage) internal pure {
        revert(errorMessage);
    }
}
