// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierWithParam {
  int public counter; 

  modifier isPositive(int x) {
    // 判断 x 是否大于 0，如果大于 0，就继续执行，否则终止执行
    require(x > 0, "x has to be greater than 0"); 
     _; // 执行修饰的函数
  }

   function add(int x) external isPositive(x) {
      counter += x; 
   }
}
