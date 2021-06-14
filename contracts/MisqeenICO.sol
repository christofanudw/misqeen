pragma solidity >=0.4.22 <0.9.0;
import "./MisqeenToken.sol";

contract MisqeenICO{
    // State Variables
    address admin;
    MisqeenToken public tokenContract;
    uint256 public tokenPrice;
    constructor(MisqeenToken _tokenContract, uint256 _tokenPrice) public{
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}