// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{

    mapping (address => uint) balances;

    function sendEtherToContract() payable  external {
        balances[msg.sender] = msg.value;
    }
    function showBalnce() external view returns (uint){
        return balances[msg.sender];
    }
    function withdraw(address payable to, uint amount) external {
        require(balances[msg.sender] >= amount, "yetersiz bakiye");
        to.transfer(amount);
        balances[msg.sender] -= amount ;
    }

    // transfere benzeyen veya aynı işlevi yapan kodlar

    // Revert()
    // Send() true veya false döndürür
    // Call

    uint public receiveCount = 0;
    uint public fallbackCount = 0;
    receive() external payable {

        receiveCount +=1;
     }
     fallback() external payable {
        fallbackCount +=1;
      }

}