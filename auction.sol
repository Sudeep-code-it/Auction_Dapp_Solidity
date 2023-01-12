// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract biddingsystem{

    mapping(address=>uint)bidderdata;
    uint highestbid;
    address highestbidder;

    uint sTime=block.timestamp;
    uint eTime;

    function putBid() public payable{
        require(block.timestamp<=eTime,"Bid Time Over, Thank You");
        require(msg.value>0,"Bid shoulb be greater than zero");
        bidderdata[msg.sender]=bidderdata[msg.sender]+msg.value;
        require(bidderdata[msg.sender]>highestbid,"Your total bid is less than the highest bid");

        if(bidderdata[msg.sender]>highestbid)
        {highestbid=bidderdata[msg.sender];
        highestbidder=msg.sender;
        }
        
    }

    function getBid() view public returns(uint){
        return bidderdata[msg.sender];
    }

     function getHighestbid() view public returns(uint){
        return highestbid;
    }
   

    function setEndTimeInDays(uint _days) public{
        eTime=sTime+(_days*24*60*60);
    }

    function getBackTheBid(address payable _addr) public
    {
    require(bidderdata[_addr]!=0,"You do not have any bid");
    require(highestbidder!=_addr,"You can not get back the bid as ur the highest bidder");
    _addr.transfer(bidderdata[_addr]);
    }
}