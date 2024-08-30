// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exception {
    function divide(uint256 a, uint256 b) external view returns (uint256) {
        try this.divideInternal(a, b) returns (uint256 result) {
            // 成功执行，返回计算结果
            return result;
        } catch Error(string memory errorMessage) {
            // 处理用户定义的异常
            revert(errorMessage);
        } catch {
            // 处理未预料到的异常
            revert("Unknown error occurred");
        }
    }

    function divideInternal(uint256 a, uint256 b) external pure returns (uint256) {
        if (b == 0) {
            // 抛出用户定义的异常
            revert("Division by zero");
        }
        return a / b;
    }
}
