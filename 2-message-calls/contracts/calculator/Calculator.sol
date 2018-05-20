pragma solidity ^0.4.21;

import "./Product.sol";
import "./Addition.sol";
import "./ResultStorage.sol";

contract Calculator is ResultStorage {
  Product internal product;
  Addition internal addition;

  function Calculator() public {
    product = new Product();
    addition = new Addition();
  }

  function add(uint256 x) public {
    bytes4 methodId = Addition(0).calculate.selector;
    require(addition.delegatecall(methodId, x));
  }

  function mul(uint256 x) public {
    bytes4 methodId = Product(0).calculate.selector;
    require(product.delegatecall(methodId, x));
  }
}
