// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenLockupVesting {
    IERC20 public immutable token; // 代币合约地址
    address public immutable beneficiary; // 受益人地址
    uint256 public immutable startTime; // 起始时间
    uint256 public immutable lockTime;  // 锁定时间，单位为秒

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

    // 到达锁定期后，将代币释放给受益人
    function release() external  {
        // 判断当前时间是否到达锁定期，如果没有达到，终止执行
        require(block.timestamp >= startTime + lockTime, 
           "lock time has not yet been reached");

        // 获取当前合约的代币余额，用于释放给受益人
        uint256 amount = token.balanceOf(address(this));
        // 如果余额为0，就终止转账
        require(amount > 0, "no tokens to release");

        // 将合约中的代币转账给受益人
        token.transfer(beneficiary, amount);
        // 触发释放代币事件
        emit Released(msg.sender, address(token), block.timestamp, amount);
    }
}