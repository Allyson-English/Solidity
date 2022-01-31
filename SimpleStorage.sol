pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract SimpleStorage {

    // if we don't initialize a number, it gets initialized to the null value (no undefined values in solidity)

    uint256 public favoriteNumber = 5; //up to 256 bits, not positive or negative
    bool favoriteBool = true;
    string favoriteString = "String";

    // to view items in an array, pass the index of the item
    // if you want to return the entire array in one call, need seperate getter function (added below)
    string[3] public stringArray = ['A', 'B', 'C'];
    uint256[] public numberArray = [1,2,3,4];

    address rinkbyTestAddress = 0x5874Dfc7cA5bE3A8C8b102769ba42D1416Aa3E98; // note that it isn't in quotes
    bytes3 favioriteBytes = "cat"; 

    // functions can be defined inside or outside the contract (and imported)
    function store(uint256 _numWeArePassing) public {
        favoriteNumber = _numWeArePassing;
    }
    
    // for these functions to work, had to add pragma experimental ABIEncoderV2... not quite sure what that does yet
    function getStringArray() public view returns(string[3] memory) {
        return stringArray;
    }

    function getnumberArray() public view returns(uint256[] memory) {
        return numberArray;
    }
}
