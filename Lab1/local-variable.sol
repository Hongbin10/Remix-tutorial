// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalVariables {

    uint public globalNum = 10;

    function getResult() public pure returns(uint) {
        
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }

    // It can still be compiled and run, but after deployment, because this function is not restricted with read-only (view/pure), it is by default classified as a write function.
    // This function does not modify any contract state, so naturally it cannot be called.
    function getResultWithoutPure() public returns(uint) {
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result; 
    }

    function getResultWithGlobal() public view returns(uint) {
        uint result = globalNum + 5;
        return result;
    }
}