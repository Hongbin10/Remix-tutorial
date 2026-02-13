
pragma solidity ^0.8.0;

// ParentContract：Define state variables with unspecified access permissions (default is internal)
contract ParentContract {
    // Core: If public/private/internal is not specified, the default permission is internal 
    string name = "bob"; 
    int age = 20;       

    // 验证1：父合约自身可以访问默认权限的状态变量
    // Verification 1: The parent contract itself can access state variable with default permission
    function getParentState() public view returns (int, string memory) {
        return (age, name);
    }

    // 定义一个private的状态变量（做对比，子合约无法访问)
    // Define a private state varibale (for comparison, child contract cant access it)
    uint private privateNum = 100;
    // 定义一个public的状态变量（做对比，外部可直接访问）
    // Define a public state variable (for comparison, external can access it directly)
    uint public publicNum = 200;
}

// 子合约：继承父合约，验证internal权限的继承访问特性
contract ChildContract is ParentContract {
    // 验证2：子合约（派生合约）可以访问父合约中默认internal的状态变量
    function getChildAccessParentState() public view returns (int, string memory) {
        return (age, name); // 直接调用父合约的name/age，无语法错误
    }

    // 【注释掉即可，解开会报错】验证：子合约无法访问父合约的private变量
    // function getPrivateNum() public view returns (uint) {
    //     return privateNum; // 编译报错：Private variable is only accessible in the contract where it is declared
    // }
}