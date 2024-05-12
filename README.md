# Token Smart Contract

This Solidity smart contract demonstrates basic token functionality, including depositing Ether and internal error checking using require(), assert(), and revert() statements.

## Description

The Token smart contract is a basic example that demonstrates token functionality on the Ethereum blockchain. It includes the following features:

Deposit Function:
- Users can deposit Ether into the contract using the deposit() function.
- The deposited Ether is added to the user’s balance and the total supply of tokens.

Invariant Check with assert():
- The assert() statement ensures that the contract’s balance is greater than or equal to the total supply.
- If this condition fails, the transaction reverts, indicating an internal error.

## Getting Started

### Executing program

To execute this program, you may use Remix, an online Solidity IDE; to get started, go visit https://remix.ethereum.org/.

Once on the Remix website, create a new file by clicking the "+" symbol in the left-hand sidebar. Save the file as myToken.sol. Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint) public balanceOf;
    uint public totalSupply;

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;

        assert(address(this).balance >= totalSupply);
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
