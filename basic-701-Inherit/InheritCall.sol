// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 父合约 Person
contract Person {
  function getSalary() public pure virtual returns(uint){
    return 1000;
  }
}

// 子合约 Employee
contract Employee is Person {
  function getSalary() public pure override returns(uint){
    return 3000;
  }

  function getPersonSalaryBySuper() public pure returns(uint){
    return super.getSalary(); // 使用 super 调用父合约函数
  }

  function getPersonSalaryByName() public pure returns(uint){
    return Person.getSalary(); // 使用合约名称调用父合约函数
  }
}
