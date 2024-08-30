// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoopFor {

  // 累加函数 
  function sum() public pure returns(uint256) {
    uint256 result = 0; //累加结果

    for(uint256 i=1; i<=10; i++) {
      result = result + i; // 将 i 累加到 result
    }
    return result;
  }
}
