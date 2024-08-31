// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    address public owner;
    mapping(string => uint8) private studentGrades;

    event GradeAssigned(string indexed student, uint8 grade);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function setGrade(string memory student, uint8 grade) public onlyOwner {
        require(bytes(student).length > 0, "Student name cannot be empty");
        require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100");
        studentGrades[student] = grade;
        emit GradeAssigned(student, grade);
    }

    function getGrade(string memory student) public view returns (uint8) {
        require(bytes(student).length > 0, "Student name cannot be empty");
        uint8 grade = studentGrades[student];
        assert(grade <= 100); 
        return grade;
    }

    function removeGrade(string memory student) public onlyOwner {
        require(bytes(student).length > 0, "Student name cannot be empty");
        require(studentGrades[student] != 0, "No grade assigned to this student");
        delete studentGrades[student];
    }

    function testRevert() public pure {
        revert("This is a revert statement");
    }
}
