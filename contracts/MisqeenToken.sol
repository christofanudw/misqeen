pragma solidity >=0.4.22 <0.9.0;
// declare solidity version

contract MisqeenToken{
    // Declare state variables
    // Name
    string public name = "Misqeen Token";
    // Symbol
    string public symbol = "MISQN";
    // Total supply of token
    uint256 public totalSupply;
    // Balance of
    mapping(address => uint256) public balanceOf;
    // Transfer event
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // Constructor
    constructor(uint256 _initialSupply) public{
        // Assigning all initial token supply to contract deployer
        balanceOf[msg.sender] = _initialSupply;
        // Set total number of tokens
        totalSupply = _initialSupply;
    }
    // Transfer function
    function transfer(address _to, uint256 _value) public returns (bool success){
        // Exception if account doesn't have enough token
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // Emit Transfer event
        emit Transfer(msg.sender, _to, _value);
        // Return a boolean
        return true;
    }
    // Read total number of tokens 
}