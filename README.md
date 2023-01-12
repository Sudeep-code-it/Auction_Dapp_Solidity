# Auction_Dapp_Solidity

## It is a simple auction app, where people can bid for different products.

## The owner or the deployer of the contract can set the expire date of the auction by giving input as number of days from today.![p11](https://user-images.githubusercontent.com/96487736/212152907-78bbea96-d58a-43a9-90e7-e05cf1525e60.PNG)

## Anyone can put a bid , the value of the bid must be greater than 0 and greater than the current highest bid( if the bid is less than the highest bid then it will be reverted back to bidder automatically)
![p11](https://user-images.githubusercontent.com/96487736/212154133-bfa282f7-c359-435e-85ba-5ea37833b479.PNG)
![p11](https://user-images.githubusercontent.com/96487736/212155090-c6672bb7-369b-47d0-9489-64542c974c28.PNG)

## We alos have other functions like getBid() and getHighestBid(), which returns the current accout bid ammount if any and highest bid value respectively. 
