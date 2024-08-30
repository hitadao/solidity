// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MutabilityView {
    uint factor = 2;  // 状态变量

    function times(uint num) public view returns(uint){
      return num * factor;  // 使用了状态变量 factor
   }
}
