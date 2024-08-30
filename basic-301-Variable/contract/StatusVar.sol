// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatusVar {
   uint256 myStatus = 1;  // 声明状态变量

   function getStatus() public view returns(uint256) {
      return myStatus;   // 使用状态变量
   }
}