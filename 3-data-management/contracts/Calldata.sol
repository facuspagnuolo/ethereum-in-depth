pragma solidity ^0.4.21;

contract Calldata {
  function tail(bytes32 text, uint256 offset) public view returns (bytes32 tail) {
    assembly {
      let ptr := mload(0x40)
      let start := add(4, offset)
      let size := sub(add(4, 32), offset)
      calldatacopy(ptr, start, size)
      tail := mload(ptr)
    }
  }
}
