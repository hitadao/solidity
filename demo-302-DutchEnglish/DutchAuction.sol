// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DutchAuction is Ownable {
    uint constant START_PRICE = 10 ether; // 起拍价
    uint constant END_PRICE = 1 ether; // 最低价
    uint constant DURATION = 90 seconds; // 拍卖持续时间
    uint constant INTERNAL = 10 seconds; // 降价间隔时间。每隔一段时间，价格降低一次
    uint constant DEC_PER_STEP = (START_PRICE - END_PRICE) / DURATION * INTERNAL; // 每次的降价幅度
    
    uint public startTime; // 拍卖开始时间
    uint public highestBid; // 当前最高出价
    address public winner; // 竞标胜出者
   
    // 拍卖开始事件
    event AuctionStarted(uint startPrice, uint startTime);
    // 拍卖结束事件
    event AuctionEnded(address winner, uint winningBid);

    // 开始拍卖，仅合约拥有者可调用
    function startAuction() public onlyOwner {
        // 记录拍卖开始时间为当前时间戳
        startTime = block.timestamp;
        // 将胜出者地址清零
        winner = address(0);
        // 将当前最高出价清零
        highestBid = 0;
        // 触发拍卖开始事件，传入起拍价和开始时间
        emit AuctionStarted(START_PRICE, block.timestamp); 
    }

    // 竞拍出价
    function bid() public payable {
        // 确保拍卖已经开始
        require(startTime > 0, "auction not yet started"); 
        // 确保拍卖还未结束
        require(winner == address(0), "auction is over");

        // 计算当前拍卖价格
        uint currentPrice =  START_PRICE - ((block.timestamp - startTime)  / INTERNAL * DEC_PER_STEP);
        if (currentPrice < END_PRICE) {
            currentPrice = END_PRICE;
        }
        // 出价必须高于当前拍卖价格
        require(msg.value >= currentPrice, 
            "bid must be not less than the current price");

        // 更新胜出者为当前出价者
        winner = msg.sender; 
        // 更新最高出价为当前出价
        highestBid = msg.value;
        // 触发竞拍事件
        emit AuctionEnded(msg.sender, msg.value);

        //这里可以加入对竞拍成功者的任意操作
        //..... 
    }

    // 提取合约中的资金。仅合约拥有者可调用
    function claim() public onlyOwner {
        // 提取合约余额资金给合约拥有者
        payable(owner()).transfer(address(this).balance);
    }

    // 查看当前最低投标额
    function getPrice() public view returns(uint) {
        // 确保拍卖已经开始
        require(startTime > 0, "auction not yet started"); 
        // 确保拍卖还未结束
        require(winner == address(0), "auction is over");
        // 返回当期投标需要的金额
        return START_PRICE - ((block.timestamp - startTime)  / INTERNAL * DEC_PER_STEP);
    }
}