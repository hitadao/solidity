// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractA {
    // 合约A的功能和属性
    function fooA() public pure returns(string memory){
      return "fooA";
    }
}

contract ContractB {
    // 合约B的功能和属性
    function fooB() public pure returns(string memory){
      return "fooB";
    }
}

contract ChildContract is ContractA, ContractB {
}
