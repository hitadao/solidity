// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenVesting {
  IERC20 public immutable token; // 代币合约地址
  address public immutable beneficiary; // 受益人地址
  uint256 public immutable startTime; // 起始时间
  uint256 public immutable lockTime;  // 锁定时间，单位为秒
  uint256 public releasedAmount;// 已经释放的数量

  // 释放事件
  event Released(address indexed beneficiary, 
    address indexed token, 
    uint256 releaseTime, 
    uint256 amount);
    
  // 构造函数，参数分别为代币合约地址、受益人地址和锁定时间
  constructor(IERC20 _token, address _beneficiary, uint256 _lockTime) {
    // 校验锁定时间必须大于0
    require(_lockTime > 0, "lock time should greater than 0");
        
    token = _token; 
    beneficiary = _beneficiary; 
    lockTime = _lockTime; 
    startTime = block.timestamp; // 从合约部署开始计时
  }

  // 将代币按规则释放给受益人
  function release() external {
    // 获取当前应该释放的数量
    uint256 amount = vestingCount();
    // 如果余额为0，就终止转账
    require(amount > 0, "no tokens to release");

    // 将合约中的代币转账给受益人
    token.transfer(beneficiary, amount);
    // 触发释放代币事件
    emit Released(msg.sender, address(token), block.timestamp, amount);
  } 

  // 计算当前应该释放的数量
  function vestingCount() internal view returns(uint256) {
    // 总量为当前合约余额，再加上已经释放的数量
    uint256 totalAmount = IERC20(token).balanceOf(address(this)) + releasedAmount;
    // 获取当前时间
    uint256 currentTime = block.timestamp;
    // 如果当前时间已经超过锁定期，那么当前可释放全部代币
    if(currentTime - startTime >= lockTime ) {
        return totalAmount;
    }
    // 如果在锁定期内，可释放量为总量 * 已过去时间的占比
    return totalAmount * (currentTime - startTime) / lockTime;
  }
}