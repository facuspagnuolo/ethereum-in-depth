pragma solidity ^0.4.21;

contract Calldata {
  function tail(bytes32 text, uint256 from) public view returns (bytes32 tail) {
    assembly {
      let ptr := mload(0x40)
      let start := add(4, from)
      let end := add(4, 32)
      calldatacopy(ptr, start, end)
      tail := mload(ptr)
    }
  }
}
