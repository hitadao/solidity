// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoopDoWhile {

  // 累加函数 
  function sum() public pure returns(uint256) {
    uint256 result = 0; //累加结果
    uint256 i = 1;

    do {
      result = result + i; // 将 i 累加到 result
      i++; 
    } while(i <= 10);
    return result;
  }
}
