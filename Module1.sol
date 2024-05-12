// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public {
        require(msg.sender == owner, "Only the owner can change the owner");

        require(_newOwner != address(0), "Invalid new owner address");

        owner = _newOwner;
    }

    function divide(uint256 _numerator, uint256 _denominator) public pure returns (uint256) {
        assert(_denominator != 0);

        require(_numerator / _denominator > 0, "Division result should be greater than zero");

        return _numerator / _denominator;
    }
}
