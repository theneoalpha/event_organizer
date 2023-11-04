//SPDX-License-Identifier: Unlicense
pragma solidity >=0.5.0 <0.9.0;


contract EventContract {
 struct Event{
   address organizer;
   string name;
   uint date; //0 1 2
   uint price;
   uint ticketCount;  //1 sec  0.5 sec
   uint ticketRemain;
 }


 mapping(uint=>Event) public events;  // Keep details of all the events eg. Event 1 , Event 2 etc
 mapping(address=>mapping(uint=>uint)) public tickets;
 uint public nextId;
 


 function createEvent(string memory name,uint date,uint price,uint ticketCount) external{
   require(date>block.timestamp,"You can organize event for future date");
   require(ticketCount>0,"You can organize event only if you create more than 0 tickets");


   events[nextId] = Event(msg.sender,name,date,price,ticketCount,ticketCount);
   nextId++;
 }



}
