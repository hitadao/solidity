// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionMultiReturn {
  // 多返回值
  function addAndMul(uint a, uint b) public pure returns (uint, uint){
    uint sum = a + b;
    uint product = a * b;
    return (sum, product);
  }
}
