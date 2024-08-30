// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 该合约使用 ERC-20 标准实现了 Wrapped Ether（WETH）代币
contract WETH is ERC20 {
    // 存款时触发的事件
    event Deposit(address indexed account, uint amount);
    // 提款时触发的事件
    event Withdrawal(address indexed account, uint amount);

    // 构造函数，初始化代币的名称和代号
    constructor() ERC20("Wrapped Ether", "WETH") {}

    // receive 函数在 ETH 直接发送到合约时被调用。
    receive() external payable {
        // 将收到的 ETH 存入合约，以获取对应数量的 WETH 代币。
        deposit();
    }

    // deposit 函数允许用户将 ETH 存入合约，并获得相应数量的 WETH 代币。
    function deposit() public payable {
        // 为发送者铸造新的 WETH 代币，数量与发送的 ETH 数量相同。
        _mint(msg.sender, msg.value);
        // 触发存款事件，记录存款的账户和金额。
        emit Deposit(msg.sender, msg.value);
    }

    // withdraw 函数允许用户提取 ETH，销毁相应数量的 WETH 代币。
    function withdraw(uint amount) public {
        // 确保发送者的 WETH 余额足够提取指定数量的 WETH。
        require(balanceOf(msg.sender) >= amount, "not enough ETH");
        // 销毁发送者的 WETH 代币，数量与提取的 WETH 数量相同。
        _burn(msg.sender, amount);
        // 将相应数量的 ETH 转给发送者，以完成提款操作。
        payable(msg.sender).transfer(amount);
        // 触发提款事件，记录提款的账户和金额。
        emit Withdrawal(msg.sender, amount);
    }
}