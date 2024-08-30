// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Revert {
  // 转账函数  
  function transfer(address to, uint256 amount) public pure {
    if(to == address(0)) {
       revert("address `to` is zero"); // 回滚交易，返回错误信息
    }
    // 执行转账操作
  }
}
