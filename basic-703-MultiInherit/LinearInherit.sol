// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractA {
    function foo() public pure virtual returns(string memory){
      return "ContractA";
    }
}

contract ContractB {
    function foo() public pure virtual returns(string memory){
      return "ContractB";
    }
}

contract ChildContract is ContractA, ContractB {
    function foo() public pure override(ContractA, ContractB) returns(string memory){
      return super.foo();
    }
}
