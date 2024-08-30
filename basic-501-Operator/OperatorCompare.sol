// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorCompare {
  int a = 10;
  int b = 20;

  function equal() public view returns(bool){ 
    return a==b; // 结果为 false
  } 
  function notEqual() public view returns(bool){ 
    return a!=b; // 结果为 true
  } 
  function greater() public view returns(bool){ 
    return a>b; // 结果为 false
  }
  function less() public view returns(bool){ 
    return a<b; // 结果为 true
  } 
  function greaterOrEqual() public view returns(bool){ 
    return a>=b;  // 结果为 false
  }
  function lessOrEqual() public view returns(bool){ 
    return a<=b;  // 结果为 true
  } 
}
