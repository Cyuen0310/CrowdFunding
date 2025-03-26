// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract crowdFunding {
    string public title;
    string public description;
    uint256 public target;
    uint256 public deadline;
    uint256 public amountCollected;
    address public initiator;
    
    constructor(
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _duration
        
    ) {
        title = _title;
        description = _description;
        target = _target;
        deadline = block.timestamp + _duration;
        amountCollected = 0;
        initiator = msg.sender;
    }

    function donate() public payable{}

    function getCurrentAmount() public view returns (uint256){}





}
