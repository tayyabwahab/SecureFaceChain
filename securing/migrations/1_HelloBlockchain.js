const HelloBlockchain = artifacts.require("secureArray");

module.exports = function (deployer) {
  deployer.deploy(HelloBlockchain, "Hello Blockchain");
};