// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InternalVisibility {
  uint256 internal delta = 8; // 可见性声明为 internal

  function addDelta(uint256 num) external view returns(uint256) {
    uint256 sum = num + delta; // 函数内可以使用状态变量 delta
    return sum;
  }
}

// InheritedVisibility 继承合约 InternalVisibility
contract InheritedVisibility is InternalVisibility {
  function getDelta() external view returns(uint256) {
    return delta; // 继承合约中可以使用状态变量 delta
  }
}
