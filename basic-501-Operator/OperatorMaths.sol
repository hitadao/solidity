// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorMaths {
  int a = 10;
  int b = 20;

  function add() public view returns(int){ 
    return a+b; // 结果为 30
  } 
  function sub() public view returns(int){ 
    return a-b; // 结果为 -10
  } 
  function mul() public view returns(int){ 
    return a*b; // 结果为 200
  }
  function div() public view returns(int){ 
    return a/b; // 结果为 0
  } 
  function mod() public view returns(int){ 
    return a%b; // 结果为 10
  }
  function increase() public returns(int){ 
    a++;
    return a; // 结果为 11
  }
  function decrease() public returns(int){ 
    a--;
    return a; // 结果为 9
  }  
}
