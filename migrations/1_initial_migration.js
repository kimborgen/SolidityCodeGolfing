var Migrations = artifacts.require('./Migrations.sol')
var BrainFuck = artifacts.require('./BrainFuck.sol')
var BrainFuckDebug = artifacts.require('./BrainFuckDebug.sol')

module.exports = function (deployer) {
  deployer.deploy(Migrations)
  deployer.deploy(BrainFuck)
  deployer.deploy(BrainFuckDebug)
}
