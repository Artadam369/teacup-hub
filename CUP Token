// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CUP is ERC20 {
    address public owner;

    constructor() ERC20("CUP Token", "CUP") {
        owner = msg.sender;
        _mint(owner, 10000000000 * 10 ** decimals()); // 初始100亿 CUP代币给合约创建者
    }

    // 铸造新的CUP代币
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can mint");
        _mint(to, amount);
    }

    // 提现功能，合约所有者可以提取代币
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        _transfer(address(this), owner, amount);
    }
}
