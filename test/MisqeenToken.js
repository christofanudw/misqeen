var MisqeenToken = artifacts.require("./MisqeenToken.sol");

contract('MisqeenToken', function(accounts){
    it('sets the total supply upon deployment', function(){
        return MisqeenToken.deployed().then(function(instance){
            tokenInstance = instance;
            return tokenInstance.totalSupply();
        }).then(function(totalSupply){
            assert.equal(totalSupply.toNumber(), 1000000, 'checks if the total supply equals 1,000,000')
        });
    });
})