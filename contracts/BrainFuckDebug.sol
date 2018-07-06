pragma solidity 0.4.24;
import "./BrainFuck.sol";

contract BrainFuckDebug {

    function sendExecute(bytes program, bytes input) public returns(bytes) {
        BrainFuck bf = new BrainFuck();
        return bf.execute(program, input);
    }
}