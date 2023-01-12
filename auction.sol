// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract biddingsystem{

    mapping(address=>uint)bidderdata;
    uint highestbid;
    address highestbidder;

    uint sTime=block.timestamp;
    uint eTime;
    address owner;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyowner{
        require(msg.sender==owner,"Only owner can do this task");
        _;
    }

    function putBid() public payable{
        require(block.timestamp<=eTime,"Bid Time Over, Thank You");
        require(msg.value>0,"Bid shoulb be greater than zero");
        bidderdata[msg.sender]=bidderdata[msg.sender]+msg.value;

        if(bidderdata[msg.sender]>highestbid)
        {highestbid=bidderdata[msg.sender];
        highestbidder=msg.sender;
        }
        else
        {
            getBackTheBid(payable(msg.sender), bidderdata[msg.sender]);
        }
        
    }

    function getBid() view public returns(uint){
        return bidderdata[msg.sender];
    }

     function getHighestbid() view public returns(uint){
        return highestbid;
    }
   

    function setEndTimeInDays(uint _days) public onlyowner{
        eTime=sTime+(_days*24*60*60);
    }

    function getBackTheBid(address payable _addr,uint _val) internal
    {
    
    _addr.transfer(_val);
    }
}