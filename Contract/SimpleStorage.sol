// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 myFavoriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function addManyPeople(
        string[] memory _names,
        uint256[] memory _favoriteNumbers
    ) public {
        require(_names.length == _favoriteNumbers.length, "Arrays must have the same length");

        for (uint256 i = 0; i < _names.length; i++) {
            listOfPeople.push(Person(_favoriteNumbers[i], _names[i]));
            nameToFavoriteNumber[_names[i]] = _favoriteNumbers[i];
        }
    }
}
