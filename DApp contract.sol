// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Faucet {
    address public owner;
    address public cupTokenAddress = 0x68E8ac068B621A88E2f825b97f8093367875093B;  // CUP代币合约地址
    IERC20 public cupToken;  // CUP代币接口
    uint256 public fee = 5 * 10 ** 18; // 5 TEA (假设 TEA 使用 18 位 decimals)
    uint256 public rewardAmount = 5000 * 10 ** 18; // 5000 CUP

    constructor() {
        owner = msg.sender;
        cupToken = IERC20(cupTokenAddress);
    }

    // 领取CUP代币
    function claim() external payable {
        require(msg.value == fee, "You must send 5 TEA to claim CUP tokens.");
        
        // 向调用者分发 5000 CUP
        require(cupToken.transfer(msg.sender, rewardAmount), "Transfer of CUP failed.");
    }

    // 提现功能，合约所有者可以提取收到的 TEA
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(owner).transfer(amount);
    }

    // 获取合约的TEA余额
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
