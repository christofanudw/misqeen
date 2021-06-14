var MisqeenICO = artifacts.require('./MisqeenICO.sol');

contract('MisqeenICO', function(accounts){
    var tokenICOInstance;
    const tokenPrice =  1e15; // in wei
    it('initializes the contract with initial values', function(){
        return MisqeenICO.deployed().then(function(instance){
            tokenICOInstance = instance;
            return tokenICOInstance.address;
        }).then(function(address){
            assert.notEqual(address, 0x0, 'contract has a valid address');
            return tokenICOInstance.tokenContract();
        }).then(function(address){
            assert.notEqual(address, 0x0, 'contract has a valid token contract address');
            return tokenICOInstance.tokenPrice();
        }).then(function(price){
            assert.equal(price, tokenPrice, 'token price is correct');
        });
    })
})