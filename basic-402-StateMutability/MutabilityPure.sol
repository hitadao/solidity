// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MutabilityPure {
   function sum() public pure returns(uint){
      uint a = 2;  // 局部变量 a
      uint b = 3;  // 局部变量 b
      return a + b; // 只使用了局部变量 a、b
   }
}
