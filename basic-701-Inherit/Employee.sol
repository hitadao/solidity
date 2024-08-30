// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Person{
  string public name;
  uint public age;
  function getSalary() public pure returns(uint){
    return 1000;
  }
}

contract Employee is Person {
}
