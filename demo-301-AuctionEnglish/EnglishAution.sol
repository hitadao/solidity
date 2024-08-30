// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EnglishAuction is Ownable {
    uint constant START_PRICE = 1 ether; // 起拍价
    uint constant DURATION = 60 seconds; // 拍卖持续时间
    uint constant MIN_INCREMENT = 0.1 ether; // 最小竞价幅度

    uint public startTime; // 拍卖开始时间
    address public highestBidder; // 当前最高出价者
    uint public highestBid; // 当前最高出价
    address public winner; // 竞标胜出者
   
    // 拍卖开始事件
    event AuctionStarted(uint startPrice, uint startTime);
    // 拍卖结束事件
    event AuctionEnded(address winner, uint winningBid);
    // 竞拍事件
    event Bid(address bidder, uint bidAmount);
    // 退款事件
    event Refund(address bidder, uint bidAmount, bool success);

    // 开始拍卖，仅合约拥有者可调用
    function startAuction() public onlyOwner {
        // 确保拍卖还未开始
        require(startTime == 0, "auction already started"); 

        // 记录拍卖开始时间为当前时间戳
        startTime = block.timestamp; 
        // 将最高出价者清零
        highestBidder = address(0); 
        // 最高出价初始化为起拍价
        highestBid = START_PRICE;
        // 竞标胜出者清零
        winner = address(0); 
        // 触发拍卖开始事件，传入起拍价和开始时间
        emit AuctionStarted(START_PRICE, block.timestamp); 
    }

    // 竞拍出价
    function bid() public payable {
        // 确保拍卖已经开始
        require(startTime > 0, "auction not yet started"); 
        // 确保拍卖还未结束
        require(winner == address(0), "auction is over");
        // 出价必须高于当前最高出价
        require(msg.value > highestBid, 
            "bid must be greater than the current maximum bid");
        // 出价提高幅度不小于最小幅度
        require(msg.value - highestBid >= MIN_INCREMENT,
            "bid increment must be not less than minIncrement"); 
        // 确保在拍卖期间内
        require(block.timestamp < startTime + DURATION, "exceed auction time"); 

        // 退还之前最高出价者的款项
        bool sent = payable(highestBidder).send(highestBid);
        // 触发 Refund 事件，记录退款是否成功
        Refund(highestBidder, highestBid, sent);

        // 更新最高出价者为当前出价者
        highestBidder = msg.sender; 
        // 更新最高出价为当前出价
        highestBid = msg.value;
        // 触发出价事件，传入出价者和出价金额
        emit Bid(msg.sender, msg.value); 
    }

    // 结束拍卖，仅合约拥有者可调用
    function endAuction() public onlyOwner {
        // 确保拍卖已经开始
        require(startTime > 0, "auction not yet started"); 
        // 确保结束时间已到
        require(block.timestamp >= startTime + DURATION, 
            "the end time has not yet been reached"); 
        // 竞标胜出者设置为当前最高出价人
        winner = highestBidder;
        // 触发拍卖结束事件，传入最高出价者和最高出价
        emit AuctionEnded(highestBidder, highestBid); 
        // 拍卖开始时间清零
        startTime = 0;
        // 提取合约余额资金给合约拥有者
        payable(owner()).transfer(address(this).balance); 

        //这里可以加入对竞拍成功者的任意操作
        //.....
    }
}