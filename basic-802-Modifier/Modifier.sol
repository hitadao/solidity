// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Modifier {
  address owner; // 合约部署者地址
  mapping (address => bool) blacklist; // 账户黑名单

  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _; // 继续执行被修饰的函数
  }

  // 构造函数，保存合约部署者地址
  constructor() {
    owner = msg.sender;
  }

  // 将某地址加入黑名单，只有合约部署者有权调用
  function setBlacklist(address account) onlyOwner external{
    blacklist[account] = true;
  }

  // 查看某地址是否在黑名单中
  function isBlacklist(address account) external view returns (bool) {
    return blacklist[account];
  }
}
