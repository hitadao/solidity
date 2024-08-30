// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionVisibility {
    // 可见性为 private，只能在合约内部调用
    function add(uint a, uint b) private pure returns(uint){
      return a + b;
    }
    // 可见性为 public，合约内部和外部均可调用
    function sub(uint a, uint b) public pure returns(uint){
      return a - b;
    }
    // 可见性为 internal，合约内部和继承合约中可以调用
    function mul(uint a, uint b) internal pure returns(uint){
      return a * b;
    }
    // 可见性为 external，只能在合约外部调用
    function div(uint a, uint b) external pure returns(uint){
      return a / b;
    }
}
