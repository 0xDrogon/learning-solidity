// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {

    event  Deposit(address indexed dst, uint amount);
    event  Withdrawal(address indexed src, uint amount);

    constructor() ERC20("Wrapped Ether", "WETH") {}

    fallback() external payable {
        deposit();
    }

    function deposit() public payable {
        _mint(msg.sender, msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint _amount) external {
        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "Failed to send ETH");
        _burn(msg.sender, _amount);
        emit Deposit(msg.sender, _amount);
    }
}