/**
 * This file is part of the 1st Solidity Gas Golfing Contest.
 *
 * This work is licensed under Creative Commons Attribution ShareAlike 3.0.
 * https://creativecommons.org/licenses/by-sa/3.0/
 */

pragma solidity 0.4.24;


/**
    @author Kim Borgen
    @dev Naive implementation of BrainFuck. No hardcore gas optimizations. The only optimization is conoctations of + and -. Developed to refresh skills in solidity.
 */
contract BrainFuck {
    /**
     * @dev Executes a BrainFuck program, as described at https://en.wikipedia.org/wiki/Brainfuck.
     *
     * Memory cells, input, and output values are all expected to be 8 bit
     * integers. Incrementing past 255 should overflow to 0, and decrementing
     * below 0 should overflow to 255.
     *
     * Programs and input streams may be of any length. The memory tape starts
     * at cell 0, and will never be moved below 0 or above 123023. No program will
     * output more than 1024 values.
     *
     * @param program The BrainFuck program.
     * @param input The program's input stream.
     * @return The program's output stream. Should be exactly the length of the
     *          number of outputs produced by the program.
     */
    function execute(bytes program, bytes input) public pure returns(bytes) {
        program = clean(program);
        bytes memory output = new bytes(512); //before 1024: 4991971 , after: 4978771
        bytes memory tape = new bytes(1024);
        uint[] memory leftSquareStack = new uint[] (32);
        // input, output, tape, leftSquareStack
        uint16[] memory ptrs = new uint16[](4);
        uint16 toInc = 0;
        for (uint i = 0; i < program.length; i++) {
            byte chr = program[i]; //inside for loop: 4991971, after: 4993595, conlucision: better inside
            if (chr == " ") {
                continue;
            } else if (chr == ",") {
                tape[ptrs[2]] = input[ptrs[0]];
                ptrs[0] += 1;
            } else if (chr == ".") {
                output[ptrs[1]] = tape[ptrs[2]];
                ptrs[1]++;
            } else if (chr == ">") {
                ptrs[2] += 1;
            } else if (chr == "<") {
                ptrs[2] -= 1; 
            } else if (chr == "+") {
                toInc = findEqual(program, i);
                tape[ptrs[2]] = byte(uint8(tape[ptrs[2]]) + toInc);
                i += toInc - 1;
            } else if (chr == "-") {
                toInc = findEqual(program, i);
                tape[ptrs[2]] = byte(uint8(tape[ptrs[2]]) - toInc);
                i += toInc - 1;
            } else if (chr == "[") {
                leftSquareStack[ptrs[3]] = i;
                ptrs[3]++;
                if (tape[ptrs[2]] == 0) {
                    for (uint j = i + 1; j < program.length; j++) {
                        if (program[j] == "]") {
                            i = j;
                            break;
                        }
                    }
                }
            } else if (chr == "]") {
                if (tape[ptrs[2]] != 0) {
                    i = leftSquareStack[ptrs[3] - 1] - 1;
                } 
                ptrs[3]--;
            }
        }
        return toExactBytes(output, ptrs[1]);
    }

    function toExactBytes(bytes out, uint16 ptr) internal pure returns(bytes) {
        bytes memory ret = new bytes(ptr);
        for (uint16 n = 0; n < ptr; n++) {
            ret[n] = out[n];
        }
        return ret;
    }

    function findEqual(bytes program, uint i) internal pure returns (uint16) { //before with uint: 4991971, after: 
        byte chr = program[i];
        uint16 ret = 1;
        for (uint m = i + 1; m < program.length; m++) {
            if (program[m] == chr) {
                ret++;
            } else {
                break;
            }
        } 
        return ret;
    }
    
    function clean(bytes program) internal pure returns(bytes) {
        for (uint a = 0; a < program.length; a++) {
            uint8 chr = uint8(program[a]);
            if (!((chr >= 43 && chr <= 46) || chr == 60 || chr == 62 || chr == 91 || chr == 93)) {
                program[a] = " ";
            }
        }
        return program;
    }
}

