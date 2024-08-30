// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionIf {

  // 转账函数 
  function transfer(uint256 amount) public pure returns(bool) {
    if (amount == 0) {
      // 如果转账金额 amount 等于 0，返回 false
      return false; 
    }
    // 如果转账金额 amount 大于 0，继续向下执行
    // ......
    return true;
  }
}
