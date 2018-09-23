# Brainfuck compilator on a smart contract written in solidity that can be run on the Ethereum blockchain.
Yes your read rigth. 

This project was forked from the 1st Solidity Gas Golfing Contest: [g.solidity.cc](http://g.solidity.cc/), but I did not compete in this competition. 

This smart contract code is not optimized. I wrote it to refreshen my skills in solidity.

Instruction to run tests:
```
sudo npm install -g truffle
git clone https://github.com/kimborgen/brainfuck-compilator-on-blockchain.git
cd brainfuck-compilator-on-blockchain
npm install
truffle compile
truffle migrate
truffle test
```


# 
# 1st Solidity Gas Golfing Contest Description

The Solidity Gas Golfing Contest is a competition for Solidity coders to produce the most gas-efficient code they can for a series of straightforward challenges. The 1st SGGC will run from 23 May to 31 June 2018.

For more details, and entry instructions, see the competition site at [g.solidity.cc](http://g.solidity.cc/).

This repository contains boilerplate for the contracts for each of the five challenges, along with test vectors and runners to test your implementation against before submitting it.

Note that constructor code will not be run, and state will not persist between tests.

## Installation

Clone this repository and install its dependencies:

```
git clone https://github.com/arachnid/sggc.git
npm install
```

## Usage

Implement one or more of the contracts in the `contracts` directory. Run the corresponding test with `truffle test`; for instance, if you implemented Sort, run:

```
truffle test test/Sort.js
```

If all the tests pass, you can submit your entry at [g.solidity.cc](http://g.solidity.cc/) and see how it stacks up against the competition!
