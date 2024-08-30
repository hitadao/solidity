// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionReturn {
  // 使用 `return` 关键字指定返回值
  function add1(uint a, uint b) public pure returns (uint){
    return a + b;
  }
  // 使用返回值的参数名称指定返回值
  function add2(uint a, uint b) public pure returns (uint result){
    result = a + b;
  }
}
