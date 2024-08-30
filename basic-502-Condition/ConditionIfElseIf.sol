// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionIfElseIf {

  // 根据输入参数 status 的值，返回对应的数量
  function getCount(uint256 status) public pure returns(uint256) {
    if (status == 1) {
      // 如果 status 等于 1，返回 100
      return 100; 
    } else if (status == 2) {
      // 如果 status 等于 2，返回 200
      return 200;
     } else {
      // 如果 status 不等于 1 或 2，返回 0
      return 0;
   }
  }
}
