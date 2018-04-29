pragma solidity ^0.4.21;

import "./Implementation.sol";

contract Caller {
  event CallerLog(uint256 gas);

  Implementation public impl;

  function Caller() public {
    impl = new Implementation();
  }

  function () public payable {
    emit CallerLog(gasleft());
    impl.call.gas(msg.gas).value(msg.value)(msg.data);
    emit CallerLog(gasleft());
  }
}
