pragma solidity ^0.4.21;

contract Calldata {
  function () public {
    assembly {
      let ptr := mload(0x40)

      mstore(ptr, calldatasize)
      log0(ptr, 32)

      let size := sub(calldatasize, 8)
      calldatacopy(ptr, 8, calldatasize)
      log0(ptr, size)
    }
  }
}
