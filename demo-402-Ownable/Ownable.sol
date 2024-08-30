// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * 这个合约模块提供了一个基本的访问控制机制，其中有一个帐户（拥有者）可以被授予对特定函数的独占访问权。
 * 默认情况下，拥有者帐户将是部署合约的帐户。可以使用 {transferOwnership} 后来更改它。
 * 这个模块通过继承来使用。它将提供修饰符 `onlyOwner`，可以应用于您的函数，以将它们的使用限制为拥有者。
 */
abstract contract Ownable {
    address private _owner; // 合约拥有者
    // 合约控制权转移事件
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // 初始化合约，将合约部署者设置为初始拥有者
    constructor() {
        // 将合约部署者设置为初始拥有者
        _transferOwnership(msg.sender);
    }
    // 如果由拥有者以外的任何帐户调用，则抛出异常
    modifier onlyOwner() {
        // 确保调用者是合约的拥有者
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        // 继续执行被修饰的函数
        _;
    }
    // 返回当前合约拥有者的地址
    function owner() public view virtual returns (address) {
       // 返回当前合约拥有者地址
        return _owner;
    }
    /**
     * 放弃合约的控制权。
     * 它只能由当前拥有者调用。
     * 注意：放弃所有权将使合约没有拥有者，从而禁用仅供拥有者使用的任何功能。
     */
    function renounceOwnership() public virtual onlyOwner {
        // 调用内部函数，将合约拥有权设置为零地址，从而放弃控制权
        _transferOwnership(address(0));
    }
    /**
     * 将合约的所有权转移到新帐户 newOwner。
     * 它只能由当前拥有者调用。
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        // 确保新拥有者不是零地址
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        // 将合约的所有权转移到新帐户 newOwner
        _transferOwnership(newOwner);
    }

    /**
     * 将合约的所有权转移到新帐户 newOwner。
     * 这是一个内部函数，仅运行内部或者继承合约的函数调用。
     */
    function _transferOwnership(address newOwner) internal virtual {
        // 记录当前拥有者地址
        address oldOwner = _owner;
        // 更新拥有者地址
        _owner = newOwner;
        // 触发拥有权转移事件
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}