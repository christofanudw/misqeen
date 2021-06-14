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
    // allowance state variable
    mapping(address => mapping(address => uint256)) public allowance;
    // Transfer event
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // allowance
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
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
    // Delegated Transfer
    // approves _owner to spend _value amount of token on our behalf
    function approve(address _spender, uint256 _value) public returns (bool success){
        // alllowance
        allowance[msg.sender][_spender] = _value;
        // approve event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(balanceOf[_from] >= _value);
        require(allowance[_from][msg.sender] >= _value);
        // Transfer token
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        // fire event
        emit Transfer(_from, _to, _value);
        // return
        return true;
    }
}