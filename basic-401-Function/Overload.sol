// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Overload {
  // 一个参数
  function foo(uint256 a) pure public returns(uint256){
    return a;
  }
  // 两个参数，参数数量不同
  function foo(uint256 a, address b) pure public returns(uint256, address){
    return (a,b);
  }
  // 两个参数，参数类型不同
  function foo(uint256 a, uint256 b) pure public returns(uint256, uint256){
    return (a,b);
  }
  // 两个参数，参数顺序不同
  function foo(address b, uint256 a) pure public returns(uint256, address){
    return (a,b);
  }
}