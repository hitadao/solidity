// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
  mapping (address => uint256) balances;
  address owner;

  // 定义转账事件
  event Transfer(address from, address to, uint256 value);

  // 构造函数，设置合约部署者的余额无限大
  constructor() {
    owner = msg.sender;
    balances[msg.sender] = type(uint256).max;
  }
 
  // 由调用者账户转账到 `to` 地址
  function tranfer(address to, uint256 value) external {
    // 转账操作
    balances[owner] -= value;
    balances[to] += value;

    // 触发转账事件
    emit Transfer(owner, to, value);
  }
}
