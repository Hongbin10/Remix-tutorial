State variables

1. public: Can be accessed from inside the smart contract as well as from
the outside through a message.
2. internal: Can be accessed by the smart contract it is created and the
derived smart contracts.
3. private: Only accessible within the smart contract where they are de-
clared.

Example: State variables
pragma solidity ˆ0.8.0;
contract SV{
string name = “bob”;
int age = 20;
function stateVariables() public view returns (int, string memory){
return(age,name);
}
}
Question: What is the default accessibility of state variables, if no accessibility
keyword is given (name and age in the example)?

Internal accessibility.


