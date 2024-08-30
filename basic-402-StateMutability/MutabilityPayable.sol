// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MutabilityPayable {
   // 投注函数标记为 payable，表示它可以接收以太币
   function stake(uint teamID) public payable { 
      // ......
   }
}
