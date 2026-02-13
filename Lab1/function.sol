// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint storedData;
    function set(uint x) public {
        storedData = x;
}
    function get() public view returns (uint) {
        return storedData;
}
}


contract SolidityTest {
    function getResult(uint a, uint b) public pure returns(uint){
    uint result = a + b;
    return result;
    }

}

contract SolidityTest2 {
    uint result;
    constructor() public{
        result = 0;
    }
    function setValues(uint x) public {
        uint a = x;
        uint b = 2;
        result = a + b;
    }
    function getResult() public view returns(uint){
        return result;
    }
}