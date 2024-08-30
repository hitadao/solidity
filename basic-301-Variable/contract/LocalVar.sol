// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalVar {
   function sum() public pure returns(uint256){
      uint256 a = 1;  // 声明局部变量 a
      uint256 b = 2;  // 声明局部变量 b
      uint256 result = a + b; // 声明局部变量 result，并使用局部变量a, b
      return result; // 使用局部变量 result 作为返回值
   }
}