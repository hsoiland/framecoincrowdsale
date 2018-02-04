pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/RefundableCrowdsale.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";


contract FrameCoinCrowdsaleToken is MintableToken {

  string public constant name = "Frame Coin"; // solium-disable-line uppercase
  string public constant symbol = "FRCN"; // solium-disable-line uppercase
  uint8 public constant decimals = 18; // solium-disable-line uppercase

}

contract FrameCoinCrowdsale is CappedCrowdsale, RefundableCrowdsale {

  function SampleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet) public
    CappedCrowdsale(_cap)
    FinalizableCrowdsale()
    RefundableCrowdsale(_goal)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
    //As goal needs to be met for a successful crowdsale
    //the value needs to less or equal than a cap which is limit for accepted funds
    require(_goal <= _cap);
  }

  function createTokenContract() internal returns (MintableToken) {
    return new SampleCrowdsaleToken();
  }

}