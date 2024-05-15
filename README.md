# Token Smart Contract

This Solidity smart contract demonstrates basic token functionality, including depositing Ether and internal error checking using require(), assert(), and revert() statements.

## Description

The Voting contract is designed to facilitate a voting system where participants can vote for candidates within a specified duration. The contract provides functionalities to add candidates, vote for candidates, and end the voting process.

## Getting Started

### Executing program

To execute this program, you may use Remix, an online Solidity IDE; to get started, go visit https://remix.ethereum.org/.

Once on the Remix website, create a new file by clicking the "+" symbol in the left-hand sidebar. Save the file as myToken.sol. Copy and paste the following code into the file:

```solidity
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

```

Click on the "Solidity Compiler" tab in the left-hand sidebar to compile the code. Make sure the "Compiler" option is selected to "0.8.18" (or any suitable version), then click the "Compile voting.sol" button.

Click the "Deploy and Run Transactions" button to deploy the contract. This will launch a new window where you may deploy the contract. Before launching, be sure you choose the "MyToken" contract.


## Authors

NTCIAN Angela Morta
<br>
[Discord: @angelaaa#0676](https://discordapp.com/users/angelaaa#0676)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
