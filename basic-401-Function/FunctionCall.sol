// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionCall {
  function add(uint a, uint b) internal pure returns (uint){
    return a + b;
  }

  function mul(uint a, uint b) internal pure returns (uint){
    return a + b;
  }

  function addAndMul(uint a, uint b) public pure returns (uint, uint){
    uint sum = add(a, b); // 调用函数 add
    uint product = mul(a, b); // 调用函数 mul
    return (sum, product);
  }
}
