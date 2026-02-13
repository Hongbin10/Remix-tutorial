// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ParentContract：Define state variables with unspecified access permissions (default is internal)
contract ParentContract {
    // Core: If public/private/internal is not specified, the default permission is internal 
    string name = "bob"; 
    int age = 20;       


    // Verification 1: The parent contract itself can access state variable with default permission
    function getParentState() public view returns (int, string memory) {
        return (age, name);
    }


    // Define a private state varibale (for comparison, child contract cant access it)
    uint private privateNum = 100;

    // Define a public state variable (for comparison, external can access it directly)
    uint public publicNum = 200;
}


// Subcontract: Inherit from the parent contract and verify the inheritance access characteristics of internal permissions
contract ChildContract is ParentContract {

    // Verification 2: Subcontracts (derived contracts) can access state variables with the default internal permission in the parent contract
    function getChildAccessParentState() public view returns (int, string memory) {
        return (age, name); 
    }


    //  【Just comment it out; uncommenting will cause an error】Verification: Child contracts cannot access private variables of parent contracts
    // function getPrivateNum() public view returns (uint) {
    //     return privateNum; // Compilation error：Private variable is only accessible in the contract where it is declared
    // }
}
