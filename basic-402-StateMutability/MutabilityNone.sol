// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MutabilityNone {
    uint factor = 2;  // 状态变量

    function setFactor(uint _factor) public {
      factor = _factor;  // 重设了状态变量 factor 的值
   }
}
