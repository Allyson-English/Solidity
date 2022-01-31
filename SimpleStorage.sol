// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract SimpleStorage {

    // if we don't initialize a number, it gets initialized to the null value (no undefined values in solidity)

    uint256 public favoriteNumber = 5; //up to 256 bits, not positive or negative
    bool favoriteBool = true;
    string favoriteString = "String";

    // to view items in an array, pass the index of the item
    // if you want to return the entire array in one call, need seperate getter function
    string[3] public stringArray = ['A', 'B', 'C'];
    uint256[] public numberArray = [1,2,3,4];

    address public rinkbyTestAddress = 0x5874Dfc7cA5bE3A8C8b102769ba42D1416Aa3E98; // note that it isn't in quotes
    bytes3 public favioriteBytes = "cat"; 

    struct customStructure {
        string Name;
        address Addr;
        uint256 Num;
    }

    customStructure[] public arrayOfCustomStructs;

    // strings need to be passed to functions as 'string memory' because they are special arrays of bytes (ie objects) so have to say how it should be stored
    function addStruct(string memory _Name, address _Addr, uint256 _Num) public {
        arrayOfCustomStructs.push(customStructure({Name: _Name, Addr: _Addr, Num: _Num}));
        nameToAddress[_Name] = _Addr;
    }

    // mapping-- take a key and returns mapped value
    mapping(string => address) public nameToAddress;


    // functions can be defined inside or outside the contract (and imported)
    function store(uint256 _numWeArePassing) public {
        favoriteNumber = _numWeArePassing;
    }

    function getStringArray() public view returns(string[3] memory) {
        return stringArray;
    }

    function getnumberArray() public view returns(uint256[] memory) {
        return numberArray;
    }

    function arrayLength() public view returns(uint256) {
        return numberArray.length;
    }


// pure functions do some type of math but they don't save state (like keeping in memory but not saving to the disk)
    function pureFunction() public view returns(uint256) {
        return favoriteNumber * 666;
    }

    function testingRelationships() public view returns(uint256) {
        uint temp = pureFunction();
        return temp/3;

    }



// visibility- external, public, internal and private (if visibility is not specified, automatically set to internal
// public functions can be called by anyone;
// external function means it cannot be called by the same contract (must be an external one)
// internal functions can only be called inside the contract
// private functions and variables are only visible inside the contract


// whenever you make a state change, you're making a transaction

    // memory keyword--
    // information can be stored in memory or storage , if its in mem its only stored during the contract call 
    // if its in storage, it is saved even after the function call 
    // when an obj is stored in mem, its only stored during execution of function or call
    // a string in solidity is not a value type but an array of bytes (technically an object) so we have to say how we'd like it to be stored


// deployed contract is here: https://rinkeby.etherscan.io/address/0x347a0d276da5ef1e7b2bb54d265bbe755242650f
}
