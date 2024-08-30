// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // 代表候选人的结构体
    struct Candidate {
        uint id; // 候选人ID
        string name; // 候选人姓名
        uint voteCount; // 候选人获得的票数
    }

    // 存储候选人信息的数组
    Candidate[] public candidates;
    // 投票截止日期的时间戳
    uint public votingEndTime;

    // 用于标记是否投过票的映射
    mapping(address => bool) voters;
    // 记录总投票人数
    uint public totalVoters;
    
    // 合约部署者的地址
    address public owner;

    // 投票事件，记录投票人地址和候选人ID
    event VotedEvent(address 
      indexed voter, uint indexed candidateId);

    // 构造函数，初始化合约，设置投票截止日期和初始候选人
    constructor(uint _durationInMinutes) {
        // 记录合约部署者的地址
        owner = msg.sender;
        // 设置投票截止日期时间戳
        votingEndTime = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    // 添加候选人，只能通过外部调用触发
    function addCandidate(string memory name) external {
        // 只有合约部署者可以添加候选人
        require(msg.sender == owner, 
             "Only the contract deployer can add candidates");
        
        // 将候选人信息添加到数组
        candidates.push(Candidate(candidates.length, name, 0));
    }

    // 投票函数，使用本地化的提示信息
    function vote(uint candidateId) external {
        // 检查候选人是否存在
        require(candidateId < candidates.length, 
            "Invalid candidate");
        // 检查是否已经投过票
        require(!voters[msg.sender], 
            "You have already voted");
        // 检查投票是否已结束
        require(block.timestamp < votingEndTime, 
            "Voting has ended");

        // 更新候选人的票数
        candidates[candidateId].voteCount++;
        // 标记投票人已投票
        voters[msg.sender] = true;
        // 增加总投票人数
        totalVoters++;
        // 触发投票事件，记录投票人地址和候选人ID
        emit VotedEvent(msg.sender, candidateId);
    }

    // 获取特定候选人的投票数
    function getCandidateVoteCount(uint candidateId) 
         public view returns (uint) {
        // 检查候选人是否存在
        require(candidateId < candidates.length, 
            "Invalid candidate");
        
        // 返回候选人的票数
        return candidates[candidateId].voteCount;
    }

    // 获取候选人总数
    function getCandidateCount() 
        public view returns (uint) {
        // 返回候选人数组的长度
        return candidates.length;
    }

    // 检查投票是否已经结束
    function isVotingClosed() public view returns (bool) {
        // 检查当前时间是否超过投票截止日期
        return block.timestamp >= votingEndTime;
    }

    // 获取当前的候选人排名
    function getCurrentCandidateRanking() 
        public view returns (Candidate[] memory) {
        // 检查投票是否已结束
        require(isVotingClosed(), "Voting is not closed yet");

        // 复制候选人数组以进行排序
        Candidate[] memory rankedCandidates = candidates;

        // 使用冒泡排序按票数排名
        for (uint i=0; i<rankedCandidates.length-1; i++) {
            for (uint j=0; j<rankedCandidates.length-i-1; j++) {
               if (rankedCandidates[j].voteCount<rankedCandidates[j+1].voteCount) {
                    (rankedCandidates[j], rankedCandidates[j+1]) = (rankedCandidates[j+1], rankedCandidates[j]);
                }
            }
        }

        // 返回排名后的候选人数组
        return rankedCandidates;
    }
}