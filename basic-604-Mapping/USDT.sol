// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract USDT {
  mapping(address => uint256) balances; // 保存所有持有 USDT 账户的余额
  
  // 构造函数，部署合约时自动调用
  constructor() {
    balances[msg.sender] = 100; // 初始设定合约部署者的账户余额为 100 USDT
  }

  // 查询某一个账户的USDT余额
  function balanceOf(address account) public view returns(uint256) {
    return balances[account];
  }
}
