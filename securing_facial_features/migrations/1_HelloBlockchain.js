const securingArray = artifacts.require("secureArray");

module.exports = function (deployer) {
  deployer.deploy(securingArray, "Secure Array");
};