// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Person{
  string public name;
  uint public age;
  
  // 使用 virtual，表示函数可以被子合约覆盖
  function getSalary() public pure virtual returns(uint);
}

contract Employee is Person {
  
    // 使用 override，表示覆盖了子合约的同名函数
    function getSalary() public pure override returns(uint){
      return 3000;
  }
}
