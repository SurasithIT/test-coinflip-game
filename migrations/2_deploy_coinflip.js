const KOSCoinflip = artifacts.require("KOSCoinflip");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(KOSCoinflip, accounts[2], accounts[3]);
};
