const MisqeenToken = artifacts.require("./MisqeenToken.sol");

module.exports = function (deployer) {
  deployer.deploy(MisqeenToken);
};
