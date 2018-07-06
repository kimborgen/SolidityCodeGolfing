/**
 * This file is part of the 1st Solidity Gas Golfing Contest.
 *
 * This work is licensed under Creative Commons Attribution ShareAlike 3.0.
 * https://creativecommons.org/licenses/by-sa/3.0/
 */

var BrainFuckDebug = artifacts.require('../contracts/BrainFuckDebug')
var testdata = require('../data/BrainFuck.json')

contract('BrainFuckDebug', async function (accounts) {
  var instance = await BrainFuckDebug.deployed()
  testdata.vectors.forEach(function (v, i) {
    if (i !== 2) {
      return
    }
    it('Passes test vector ' + i, async function () {
      var result = await instance.methods.sendExecute(v.input[0], v.input[1], {gas: v.gas})
      console.log(result)
      assert.equal(result, v.output[0])
    })
  })
})
