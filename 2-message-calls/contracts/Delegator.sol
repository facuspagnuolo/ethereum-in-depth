pragma solidity ^0.4.21;

contract Delegator {
  event DelegatorLog(uint256 gas);

  address public implementation;

  function Delegator(address _implementation) public {
    require(_implementation != address(0));
    implementation = _implementation;
  }

  function () public payable {
    emit DelegatorLog(gasleft());

    address _impl = implementation;
    assembly {
      let ptr := mload(0x40)
      calldatacopy(ptr, 0, calldatasize)
      let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
    }

    emit DelegatorLog(gasleft());
  }
}
