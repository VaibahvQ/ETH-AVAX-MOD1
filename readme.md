# SchoolGradingSystem Smart Contract
## Overview

This project contains a Solidity smart contract named SchoolGradingSystem that simulates a simple school grading system. It demonstrates the use of three error handling mechanisms in Solidity: require, assert, and revert. These mechanisms help ensure that conditions are met and handle errors effectively in Ethereum smart contracts.

## Purpose
The primary purpose of this smart contract is to illustrate how to use require, assert, and revert statements in Solidity within a real-life scenario. Each function showcases a different aspect of error handling within the context of managing student grades.

# require is used to validate inputs and conditions.
# assert is used to check for conditions that should always be true.
# revert is used to handle errors and revert the transaction.

## Functionality

# setGrade
Sets a grade for a student.

##
    function setGrade(string memory student, uint8 grade) public onlyOwner {
    require(bytes(student).length > 0, "Student name cannot be empty");
    require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100");
    studentGrades[student] = grade;
    emit GradeAssigned(student, grade);
    }


# getGrade
Retrieves the grade of a student.

##
    function getGrade(string memory student) public view returns (uint8) {
    require(bytes(student).length > 0, "Student name cannot be empty");
    uint8 grade = studentGrades[student];
    assert(grade <= 100); // Ensuring the grade is always valid
    return grade;
    }


# removeGrade
Removes a student's grade.

##
    function removeGrade(string memory student) public onlyOwner {
    require(bytes(student).length > 0, "Student name cannot be empty");
    require(studentGrades[student] != 0, "No grade assigned to this student");
    delete studentGrades[student];
    }


## promoteStudent
Promotes a student if they meet a minimum grade requirement.

##
    function promoteStudent(string memory student, uint8 minGrade) public onlyOwner {
    require(bytes(student).length > 0, "Student name cannot be empty");
    uint8 grade = studentGrades[student];
    if (grade < minGrade) {
        revert("Student does not meet the minimum grade requirement for promotion");
    }
    emit StudentPromoted(student);
    }


## testRevert
Demonstrates the use of revert to forcefully revert the transaction with a custom error message.

##
    function testRevert() public pure {
    revert("This is a revert statement");
    }

## Usage

- Deploy the SchoolGradingSystem contract.
- Use the setGrade function to assign grades to students.
- Use the getGrade function to retrieve grades.
- Use the removeGrade function to remove grades.
- Use the promoteStudent function to promote students if they meet the minimum grade requirement.
- Use the testRevert function to demonstrate the use of revert.
