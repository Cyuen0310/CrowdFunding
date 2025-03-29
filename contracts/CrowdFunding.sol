// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;



// TO DO:
/*
    - create a campaign
    - withdraw fund (owner only)
    - back a campaign
    - get the total amount of campaigns
    - get the total amount of backers
    
*/

contract CrowdFunding {
    struct Campaign{
        address payable owner;
        string title;
        string description;
        uint256 target;
        uint256 duration;
        uint256 deadline;
        uint256 fundedAmount;
        uint256 numberOfBackers;
        bool isActive;
        bool isCollected;
        mapping(address => uint256) backers; // backers[address] = amount
    }

    mapping(uint256 => Campaign) public campaigns;

    uint256 public TotalCampaigns = 0;

    function createCampaign(
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _duration
    ) public returns(uint256){
        require (_target > 0,"Campaign target must be larger than 0");
        require (_duration > 0,"Campaign duration must at least be 1 day");
        
        Campaign storage campaign = campaigns[TotalCampaigns];
        campaign.owner = payable(msg.sender);
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.duration = _duration;
        campaign.deadline = block.timestamp + _duration * 1 days;
        campaign.fundedAmount = 0;
        campaign.numberOfBackers = 0;
        campaign.isActive = true;
        campaign.isCollected = false;
        TotalCampaigns++;
        return TotalCampaigns - 1;
    }

    function backCampaign(uint _id) public payable{
        uint256 fundingValue = msg.value;
        require (fundingValue > 0,"Funding value must be larger than 0");
        Campaign storage campaign = campaigns[_id];
        require (campaign.isActive == true,"Campaign is not active");
        require (campaign.deadline > block.timestamp,"Campaign has ended");
        require (campaign.fundedAmount > 0,"");
        campaign.backers[msg.sender] += fundingValue;
        campaign.fundedAmount += fundingValue;
        if (campaign.backers[msg.sender] == 0){
            campaign.numberOfBackers++;
        }
        
        
          

    }

    // function getBackers(){}

    // function getCampaigns(){}
 




    




}
