/**
 * This contract acts as a debug contract to call the real BrainFuck contract.
 */

var BrainFuckDebug = artifacts.require('../contracts/BrainFuckDebug')
var testdata = require('../data/BrainFuck.json')

contract('BrainFuckDebug', async function (accounts) {
  var instance = await BrainFuckDebug.deployed()
  testdata.vectors.forEach(function (v, i) {
    if (i !== 2) {
      return
    }
    /* uncomment this to test for a spesific test case
    it('Passes test vector ' + i, async function () {
      var result = await instance.sendExecute(v.input[0], v.input[1], {gas: v.gas})
      //console.log(result)
      //assert.equal(result, v.output[0])
    })
    */
  })
})
