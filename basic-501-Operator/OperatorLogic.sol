// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorLogic {
  bool a = true;
  bool b = false;

  function and() public view returns(bool){ 
    return a&&b; // 结果为 false
  } 
  function or() public view returns(bool){ 
    return a||b; // 结果为 true
  } 
  function not() public view returns(bool){ 
    return !a; // 结果为 false
  }
}
