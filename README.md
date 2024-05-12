# Smart Contract

The primary goal of this solidity program is to construct a token contract that allows users to mint and burn tokens. Furthermore, the application provides for the tracking of balances connected with certain addresses and includes conditional statements to guarantee that certain actions are carried out only when viable.

## Description

This repository contains a Solidity smart contract (`ErrorHandlingExample.sol`) that showcases the usage of error handling mechanisms in Ethereum smart contracts. The contract includes functions to change ownership and perform a division operation with error checks.

## Getting Started

### Executing program

To execute this program, you may use Remix, an online Solidity IDE; to get started, go visit https://remix.ethereum.org/.

Once on the Remix website, create a new file by clicking the "+" symbol in the left-hand sidebar. Save the file as myToken.sol. Copy and paste the following code into the file:

```solidity
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
```

Click on the "Solidity Compiler" tab in the left-hand sidebar to compile the code. Make sure the "Compiler" option is selected to "0.8.18" (or any suitable version), then click the "Compile myToken.sol" button.

Click the "Deploy and Run Transactions" button to deploy the contract. This will launch a new window where you may deploy the contract. Before launching, be sure you choose the "MyToken" contract.


## Authors

NTCIAN Angela Morta
<br>
[Discord: @angelaaa#0676](https://discordapp.com/users/angelaaa#0676)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
