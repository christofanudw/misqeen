const MisqeenToken = artifacts.require("./MisqeenToken.sol");
const MisqeenICO = artifacts.require("./MisqeenICO.sol");

module.exports = function (deployer) {
  deployer.deploy(MisqeenToken, 1000000)
    .then(function(){
      return deployer.deploy(MisqeenICO, MisqeenToken.address, 1e15);
    });
  
};
